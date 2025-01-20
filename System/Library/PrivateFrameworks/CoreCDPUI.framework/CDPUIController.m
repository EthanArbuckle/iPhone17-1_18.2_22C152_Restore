@interface CDPUIController
- (BOOL)_canShowRPD;
- (BOOL)_isQuotaServiceHost:(id)a3;
- (BOOL)_isSOSCompatibilityCFUForSingleICSC;
- (BOOL)forceInlinePresentation;
- (BOOL)performingAccountRecovery;
- (CDPUIController)init;
- (CDPUIDelegate)delegate;
- (CDPUIEDPRecoveryTokenFlowCoordinator)edpRecoveryTokenFlowCoordinator;
- (NSString)titleText;
- (id)_beginCustodianRecoveryEscapeOptionWithSupportedEscapeOfferMask:(unint64_t)a3;
- (id)_beginEDPRecoveryTokenEscapeOptionsWithSupportedEscapeOfferMask:(unint64_t)a3;
- (id)_beginPiggybackingRecoveryEscapeOptionWithSupportedEscapeOfferMask:(unint64_t)a3;
- (id)_buildQuotaRequestWithExtraChecks:(BOOL)a3 andContext:(id)a4;
- (id)_buildQuotaStorageRequestConfiguratorWithAppList:(unint64_t)a3 quotaContentSpecifiesE2EE:(BOOL)a4;
- (id)_chooseDeviceEscapeOption;
- (id)_custodianAskHelpViewControllerWithSupportedEscapeOfferMask:(unint64_t)a3;
- (id)_custodianCantReachContactEscapeOfferWithSupportedEscapeOffers:(unint64_t)a3;
- (id)_custodianCodeEntryViewControllerWithController:(id)a3 supportedEscapeOfferMask:(unint64_t)a4;
- (id)_custodianRecoveryEscapeOptionWithSupportedEscapeOfferMask:(unint64_t)a3 askHelpController:(id)a4;
- (id)_deviceLimitOfferCustodianForDevice:(id)a3 supportedEscapeOfferMask:(unint64_t)a4;
- (id)_deviceLimitOfferDeviceSelectionForDevice:(id)a3 fromViewController:(id)a4;
- (id)_deviceLimitOfferEDPRecoveryTokenForDevice:(id)a3 supportedEscapeOfferMask:(unint64_t)a4;
- (id)_deviceLimitOfferPiggybackingForDevice:(id)a3 supportedEscapeOfferMask:(unint64_t)a4;
- (id)_deviceLimitOfferRecoveryKeyAndCustodianForDevice:(id)a3 supportedEscapeOfferMask:(unint64_t)a4;
- (id)_deviceLimitOfferRecoveryKeyForDevice:(id)a3 supportedEscapeOfferMask:(unint64_t)a4;
- (id)_deviceLimitOfferSkipForDevice:(id)a3;
- (id)_enterCustodianCodeEscapeOfferWithCustodianController:(id)a3 supportedEscapeOfferMask:(unint64_t)a4;
- (id)_enterCustodianCodeEscapeOptionWithCustodianController:(id)a3 supportedEscapeOfferMask:(unint64_t)a4;
- (id)_enterCustodianCodeEscapeOptionWithCustodianController:(id)a3 supportedEscapeOfferMask:(unint64_t)a4 presentationBlock:(id)a5;
- (id)_enterSecretLaterEscapeOptionWithSecret:(unint64_t)a3;
- (id)_escapeOfferForDevice:(id)a3 withMask:(unint64_t)a4;
- (id)_escapeOfferForMultiApprovalWithMask:(unint64_t)a3;
- (id)_escapeOfferForSingleApprovalWithMask:(unint64_t)a3;
- (id)_escapeOfferMessageForDevice:(id)a3 withMask:(unint64_t)a4;
- (id)_escapeOffersForgotAllWithMask:(unint64_t)a3 presenter:(id)a4 devices:(id)a5;
- (id)_iCSCSkipOrDeleteiCloudDataEscapeOfferWithTitle:(id)a3 message:(id)a4 skipButtonTitle:(id)a5 supportedEscapeOfferMask:(unint64_t)a6 withDevice:(id)a7;
- (id)_iCloudDeleteConfirmationViewController:(id)a3;
- (id)_instructionsControllerForPlatform:(unint64_t)a3 controller:(id)a4 supportedEscapeOfferMask:(unint64_t)a5;
- (id)_localDeviceClass;
- (id)_makeGuitarfishTokenEscapeOption;
- (id)_makeRemoteApprovalCompletedEventWithContext:(id)a3 didApprove:(BOOL)a4 error:(id)a5;
- (id)_makeRemoteApprovalStartedBreadCrumbEventWithContext:(id)a3;
- (id)_makeRemoteSecretInputEventWithContext:(id)a3 device:(id)a4;
- (id)_noRecoveryFactorsBaseController;
- (id)_piggybackingCantGetToMyDevices:(id)a3 message:(id)a4 skipButtonTitle:(id)a5 supportedEscapeOfferMask:(unint64_t)a6;
- (id)_piggybackingEscapeOfferCantGetToDevicesWithSupportedEscapeOffers:(unint64_t)a3;
- (id)_piggybackingHandleNonProxError:(unint64_t)a3;
- (id)_piggybackingSendCodeEscapeOfferWithSupportedEscapeOffers:(unint64_t)a3 title:(id)a4 localizationKey:(id)a5;
- (id)_piggybackingSomethingWentWrong:(unint64_t)a3;
- (id)_piggybackingViewControllerWithSupportedEscapeOfferMask:(unint64_t)a3;
- (id)_quotaScreenRPDErrorWithUnderlyingError:(id)a3;
- (id)_recoveryKeyControllerWithContext:(id)a3 secretValidator:(id)a4 completion:(id)a5;
- (id)_recoveryKeyControllerWithContext:(id)a3 validator:(id)a4 completion:(id)a5;
- (id)_recoveryKeyEscapeOfferWithSupportedEscapeOfferMask:(unint64_t)a3;
- (id)_recoveryKeyEscapeOptionWithSupportedEscapeOfferMask:(unint64_t)a3;
- (id)_recoveryKeyEscapeOptionWithSupportedEscapeOfferMask:(unint64_t)a3 presentationBlock:(id)a4;
- (id)_recoveryKeyResetProtectedDataEscapeOfferWithSupportedEscapeOffers:(unint64_t)a3;
- (id)_recoveryMethodEscapeOptionWithSupportedEscapeOfferMask:(unint64_t)a3;
- (id)_remoteApprovalEscapeOption;
- (id)_remoteSecretControllerForDevice:(id)a3;
- (id)_singleICSCEscapeOfferWithMask:(unint64_t)a3 withController:(id)a4;
- (id)_skipOrDeleteiCloudDataEscapeOfferWithTitle:(id)a3 message:(id)a4 skipButtonTitle:(id)a5 supportedEscapeOfferMask:(unint64_t)a6;
- (id)_tryAgainLaterEscapeOption;
- (id)_waitingForApprovalEscapeOffer;
- (id)cdpRecoverySuccessFromEDPContinuationHandler;
- (id)devicePicker:(id)a3 escapeOffersForDevices:(id)a4;
- (id)recoveryKeyEntryControllerForCircleJoinWithCancel:(BOOL)a3 supportedEscapeOfferMask:(unint64_t)a4;
- (id)updateContextWithAuthResults:(id)a3;
- (void)_beginDevicePickerFlowFromEntryController:(id)a3;
- (void)_beginWaitingForApprovalFlow;
- (void)_disableUserInteractionAndStartSpinner;
- (void)_dismissPresentedViewControllerCompletion:(id)a3;
- (void)_dismissPresentedViewControllerWithReason:(id)a3 completion:(id)a4;
- (void)_enableUserInteractionAndStopSpinner;
- (void)_handleDepletedRemainingAttemptsForDevice:(id)a3 fromViewController:(id)a4 mask:(unint64_t)a5;
- (void)_handleResetActionWithCompletion:(id)a3;
- (void)_presentCustodianAttemptLimitAlert;
- (void)_presentRemoteSecretControllerWithNewestDevice:(id)a3;
- (void)_presentRootController:(id)a3 completion:(id)a4;
- (void)_presentSwiftUIRemoteSecretPromptWithDevice:(id)a3 didSelectDevice:(BOOL)a4;
- (void)_replaceViewController:(id)a3 withNewController:(id)a4;
- (void)_rpdEscapeOptionWithOffer:(id)a3;
- (void)_setResetCompletedView:(id)a3;
- (void)_setupDevicePickerController:(id)a3;
- (void)_showQuotaStorageAppListView:(id)a3;
- (void)_showQuotaStorageAppListView:(id)a3 andCompletion:(id)a4;
- (void)_showResetKeychainConfirmationAlertWithViewController:(id)a3;
- (void)_showStartRecoverySessionFailureAlert;
- (void)_showTryAgainLaterConfirmationAlertWithViewController:(id)a3;
- (void)_validateCustodianRecoveryInfo:(id)a3;
- (void)approveFromAnotherDevice:(BOOL)a3;
- (void)attemptToJoinCircleWithPiggybacking:(id)a3 mask:(unint64_t)a4;
- (void)attemptToJoinCircleWithPiggybacking:(id)a3 mask:(unint64_t)a4 validator:(id)a5;
- (void)backTappedFromRoot:(id)a3;
- (void)cancelTapped:(id)a3;
- (void)cancelledRemoteSecretEntry:(id)a3;
- (void)cdpContext:(id)a3 confirmRecoveryKeyWithValidator:(id)a4 completion:(id)a5;
- (void)cdpContext:(id)a3 createLocalSecretWithCompletion:(id)a4;
- (void)cdpContext:(id)a3 presentRecoveryKeyWithValidator:(id)a4 completion:(id)a5;
- (void)cdpContext:(id)a3 presentRemoteApprovalWithCompletion:(id)a4;
- (void)cdpContext:(id)a3 promptForAdoptionOfMultipleICSC:(id)a4;
- (void)cdpContext:(id)a3 promptForBeneficiaryAccessKeyWithCompletion:(id)a4;
- (void)cdpContext:(id)a3 promptForEDPRecoveryTokenWithValidator:(id)a4 successfulCDPRecoveryContinuationHandler:(id)a5;
- (void)cdpContext:(id)a3 promptForICSCWithIsNumeric:(BOOL)a4 numericLength:(id)a5 isRandom:(BOOL)a6 validator:(id)a7;
- (void)cdpContext:(id)a3 promptForInteractiveAuthenticationWithCompletion:(id)a4;
- (void)cdpContext:(id)a3 promptForLocalSecretWithCompletion:(id)a4;
- (void)cdpContext:(id)a3 promptForRecoveryKeyWithSecretValidator:(id)a4 completion:(id)a5;
- (void)cdpContext:(id)a3 promptForRecoveryKeyWithValidator:(id)a4 completion:(id)a5;
- (void)cdpContext:(id)a3 promptForRemoteSecretWithDevices:(id)a4 offeringRemoteApproval:(BOOL)a5 validator:(id)a6;
- (void)cdpContext:(id)a3 showError:(id)a4 withDefaultIndex:(int64_t)a5 withCompletion:(id)a6;
- (void)cdpContext:(id)a3 showResetCompletedAlertWithCompletion:(id)a4;
- (void)cdpContext:(id)a3 showResetFailedAlertWithUnderlyingError:(id)a4 completion:(id)a5;
- (void)cdpRecoveryFlowContext:(id)a3 promptForRemoteSecretWithDevices:(id)a4 validator:(id)a5;
- (void)custodianOSSelectionViewControllerWithCustodianController:(id)a3 supportedEscapeOfferMask:(unint64_t)a4 completion:(id)a5;
- (void)dealloc;
- (void)devicePicker:(id)a3 didSelectDevice:(id)a4;
- (void)dismissAndResetAccountCDPState:(id)a3 localSecret:(id)a4;
- (void)dismissRecoveryFlow:(id)a3 completion:(id)a4;
- (void)dismissRecoveryFlow:(id)a3 reason:(id)a4 completion:(id)a5;
- (void)dismissRemoteApprovalWaitingScreenWithAction:(unint64_t)a3;
- (void)exceededMaximumAttemptsForRemoteSecretEntry:(id)a3;
- (void)finishValidation:(id)a3 withError:(id)a4;
- (void)handleBackPopCompletion;
- (void)keychainSyncController:(id)a3 didFinishWithResult:(id)a4 error:(id)a5;
- (void)performAccountReset:(id)a3;
- (void)performCustodianRecovery:(id)a3;
- (void)performPiggybackingRecovery:(id)a3;
- (void)performRecoveryKeyRecovery:(id)a3;
- (void)performRemoteApproval:(id)a3;
- (void)piggybackingUserDidNotGetACode:(unint64_t)a3;
- (void)presentQuotaScreenForRequest:(id)a3 completion:(id)a4;
- (void)presentQuotaScreenWithCompletion:(id)a3;
- (void)recoveryTokenFlowCoordinatorDidSelectAccessDataLater:(id)a3;
- (void)recoveryTokenFlowCoordinatorDidSelectResetProtectedData:(id)a3;
- (void)recoveryTokenFlowCoordinatorDidSuccessfullyFinish:(id)a3;
- (void)remoteSecretEntry:(id)a3 depletedRemainingAttemptsForDevice:(id)a4;
- (void)remoteSecretEntry:(id)a3 didAcceptValidRemoteSecretForDevice:(id)a4;
- (void)remoteSecretEntryDidAcceptValidSecret;
- (void)remoteSecretEntryDidDepleteRemainingAttemptsForDevice:(id)a3;
- (void)remoteSecretEntryDidExceedMaximumAttempts;
- (void)remoteSecretEntryDidFinishValidationWithError:(id)a3;
- (void)remoteSecretEntryDidRequestAccountReset;
- (void)remoteSecretEntryDidRequestAccountResetEscapeActionForDevice:(id)a3;
- (void)remoteSecretEntryDidRequestCancellation;
- (void)remoteSecretEntryDidRequestCustodianRecovery;
- (void)remoteSecretEntryDidRequestCustodianRecoveryEscapeAction;
- (void)remoteSecretEntryDidRequestDeviceSelection;
- (void)remoteSecretEntryDidRequestDeviceSelectionEscapeAction;
- (void)remoteSecretEntryDidRequestDisableUserInteraction;
- (void)remoteSecretEntryDidRequestDisableUserInteractionAndStartSpinner;
- (void)remoteSecretEntryDidRequestEDPRecoveryTokenEscapeAction;
- (void)remoteSecretEntryDidRequestEDPRecoveryTokenRecovery;
- (void)remoteSecretEntryDidRequestEnableUserInteraction;
- (void)remoteSecretEntryDidRequestEnableUserInteractionAndStopSpinner;
- (void)remoteSecretEntryDidRequestPiggybacking;
- (void)remoteSecretEntryDidRequestPiggybackingEscapeAction;
- (void)remoteSecretEntryDidRequestRecoveryKeyEscapeAction;
- (void)remoteSecretEntryDidRequestRecoveryKeyRecovery;
- (void)remoteSecretEntryDidRequestRemoteApproval;
- (void)remoteSecretEntryDidRequestRemoteApprovalEscapeAction;
- (void)remoteSecretEntryDidRequestSkipEscapeActionForDevice:(id)a3;
- (void)remoteUIController:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5;
- (void)sendEscapeOfferSelectedEvent:(id)a3;
- (void)sendRemoteApprovalCompletedEventWithContext:(id)a3 didApprove:(BOOL)a4 error:(id)a5;
- (void)sendRemoteApprovalStartedBreadCrumbEventWithContext:(id)a3;
- (void)sendRemoteSecretInputEventWithContext:(id)a3 device:(id)a4;
- (void)setCdpRecoverySuccessFromEDPContinuationHandler:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEdpRecoveryTokenFlowCoordinator:(id)a3;
- (void)setForceInlinePresentation:(BOOL)a3;
- (void)setTitleText:(id)a3;
- (void)tryAgainLaterTapped:(id)a3;
@end

@implementation CDPUIController

- (CDPUIController)init
{
  v5.receiver = self;
  v5.super_class = (Class)CDPUIController;
  v2 = [(CDPUIController *)&v5 init];
  if (v2)
  {
    v3 = [MEMORY[0x263F34370] sharedInstance];
    [v3 fetchConfig];
  }
  return v2;
}

- (void)cancelTapped:(id)a3
{
  id v4 = a3;
  objc_super v5 = _CDPLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2187CF000, v5, OS_LOG_TYPE_DEFAULT, "Cancel was tapped in CDPUIController", buf, 2u);
  }

  recoveryKeyViewModel = self->_recoveryKeyViewModel;
  if (recoveryKeyViewModel)
  {
    v7 = [(CDPRecoveryKeyEntryViewModel *)recoveryKeyViewModel completionHandler];
    v8 = _CDPStateError();
    ((void (**)(void, void, void *))v7)[2](v7, 0, v8);
  }
  else
  {
    [(CDPUIController *)self dismissRemoteApprovalWaitingScreenWithAction:1];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __32__CDPUIController_cancelTapped___block_invoke;
    v9[3] = &unk_26433CC30;
    id v10 = v4;
    v11 = self;
    [(CDPUIController *)self _dismissPresentedViewControllerWithReason:@"com.apple.CoreCDPUI.CDPEnrollmentCancelled" completion:v9];
    v7 = (void (**)(void, void, void))v10;
  }
}

void __32__CDPUIController_cancelTapped___block_invoke(uint64_t a1)
{
  _CDPStateError();
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v2 = objc_msgSend(MEMORY[0x263F087E8], "cdp_errorWithCode:", -7213);
    uint64_t v3 = objc_msgSend(MEMORY[0x263F087E8], "cdp_errorWithCode:underlyingError:", -5307, v2);

    id v4 = (id)v3;
  }
  else
  {
    id v4 = v5;
  }
  id v6 = v4;
  [*(id *)(*(void *)(a1 + 40) + 24) cancelValidationWithError:v4];
}

- (void)tryAgainLaterTapped:(id)a3
{
  id v4 = _CDPLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2187CF000, v4, OS_LOG_TYPE_DEFAULT, "Try Again Later was tapped in CDPUIController", buf, 2u);
  }

  [(CDPUIController *)self dismissRemoteApprovalWaitingScreenWithAction:1];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __39__CDPUIController_tryAgainLaterTapped___block_invoke;
  v5[3] = &unk_26433CC58;
  v5[4] = self;
  [(CDPUIController *)self _dismissPresentedViewControllerWithReason:@"com.apple.CoreCDPUI.CDPEnrollmentCancelled" completion:v5];
}

void __39__CDPUIController_tryAgainLaterTapped___block_invoke(uint64_t a1)
{
  v1 = *(void **)(*(void *)(a1 + 32) + 24);
  _CDPStateError();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v1 cancelValidationWithError:v2];
}

- (BOOL)forceInlinePresentation
{
  return self->_forceInlinePresentation;
}

- (void)backTappedFromRoot:(id)a3
{
  id v4 = _CDPLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2187CF000, v4, OS_LOG_TYPE_DEFAULT, "Back was tapped from root view controller. Popping root view controller...", buf, 2u);
  }

  [MEMORY[0x263F829A0] _setUseCustomBackButtonAction:0];
  id v5 = [(UINavigationController *)self->_navController popViewControllerAnimated:1];
  id v6 = [(UINavigationController *)self->_navController transitionCoordinator];
  v7 = v6;
  if (v6)
  {
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __38__CDPUIController_backTappedFromRoot___block_invoke_39;
    v9[3] = &unk_26433CCA0;
    void v9[4] = self;
    [v6 animateAlongsideTransition:&__block_literal_global completion:v9];
  }
  else
  {
    v8 = _CDPLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2187CF000, v8, OS_LOG_TYPE_DEFAULT, "Finished popping root controller (no animate), cancelling validation", buf, 2u);
    }

    [(CDPUIController *)self handleBackPopCompletion];
  }
}

void __38__CDPUIController_backTappedFromRoot___block_invoke()
{
  v0 = _CDPLogSystem();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_2187CF000, v0, OS_LOG_TYPE_DEFAULT, "Animating back event...", v1, 2u);
  }
}

uint64_t __38__CDPUIController_backTappedFromRoot___block_invoke_39(uint64_t a1)
{
  id v2 = _CDPLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_2187CF000, v2, OS_LOG_TYPE_DEFAULT, "Finished popping root controller, cancelling validation", v4, 2u);
  }

  return [*(id *)(a1 + 32) handleBackPopCompletion];
}

- (void)handleBackPopCompletion
{
  if (self->_recoveryKeyViewModel)
  {
    id v4 = [(CDPRecoveryKeyEntryViewModel *)self->_recoveryKeyViewModel completionHandler];
    id v2 = _CDPStateError();
    v4[2](v4, 0, v2);
  }
  else
  {
    remoteSecretValidator = self->_remoteSecretValidator;
    _CDPStateError();
    id v4 = (void (**)(id, void, void *))objc_claimAutoreleasedReturnValue();
    -[CDPRemoteDeviceSecretValidator cancelValidationWithError:](remoteSecretValidator, "cancelValidationWithError:");
  }
}

- (void)_dismissPresentedViewControllerCompletion:(id)a3
{
  id v4 = (void (**)(void))a3;
  BOOL v5 = [(CDPUIController *)self forceInlinePresentation];
  id v6 = _CDPLogSystem();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);
  if (v5)
  {
    if (v7) {
      -[CDPUIController _dismissPresentedViewControllerCompletion:](self);
    }

    if (v4) {
      v4[2](v4);
    }
  }
  else
  {
    if (v7) {
      -[CDPUIController _dismissPresentedViewControllerCompletion:](self);
    }

    v8 = [(CDPUIBaseController *)self presentingViewController];
    [v8 dismissViewControllerAnimated:1 completion:v4];
  }
}

- (void)_presentRootController:(id)a3 completion:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = _CDPLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->super._presentingViewController);
    *(_DWORD *)buf = 138412546;
    id v20 = v6;
    __int16 v21 = 2112;
    id v22 = WeakRetained;
    _os_log_impl(&dword_2187CF000, v8, OS_LOG_TYPE_DEFAULT, "Presenting %@ onto %@", buf, 0x16u);
  }
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __53__CDPUIController__presentRootController_completion___block_invoke;
  aBlock[3] = &unk_26433CD18;
  aBlock[4] = self;
  id v10 = v6;
  id v17 = v10;
  id v11 = v7;
  id v18 = v11;
  v12 = (void (**)(void))_Block_copy(aBlock);
  id v13 = objc_loadWeakRetained((id *)&self->_delegate);
  char v14 = objc_opt_respondsToSelector();

  if (v14)
  {
    id v15 = objc_loadWeakRetained((id *)&self->_delegate);
    [v15 uiController:self preparePresentationContext:v12];
  }
  else
  {
    v12[2](v12);
  }
}

void __53__CDPUIController__presentRootController_completion___block_invoke(id *a1)
{
  uint64_t v75 = *MEMORY[0x263EF8340];
  id v2 = a1 + 5;
  uint64_t v3 = a1 + 4;
  objc_storeStrong((id *)a1[4] + 6, a1[5]);
  objc_msgSend(*v2, "setPreferredContentSize:", *MEMORY[0x263F001B0], *(double *)(MEMORY[0x263F001B0] + 8));
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if (![*v3 forceInlinePresentation] || (isKindOfClass & 1) == 0)
  {
    BOOL v5 = a1[4];
    uint64_t v6 = v5[14];
    uint64_t v7 = v5[6];
    id v8 = objc_alloc(MEMORY[0x263F824A8]);
    id v9 = a1[4];
    if (v6 == v7)
    {
      v12 = (void *)[v8 initWithBarButtonSystemItem:1 target:v9 action:sel_remoteSecretEntryDidRequestCancellation];
      id v13 = [a1[5] navigationItem];
      [v13 setLeftBarButtonItem:v12];

      id v10 = [a1[5] navigationItem];
      uint64_t v14 = [v10 leftBarButtonItem];
      id v15 = a1[4];
      id v11 = (void *)v15[13];
      v15[13] = v14;
    }
    else
    {
      id v10 = (void *)[v8 initWithBarButtonSystemItem:1 target:v9 action:sel_cancelTapped_];
      id v11 = [a1[5] navigationItem];
      [v11 setLeftBarButtonItem:v10];
    }

    [a1[5] setModalInPresentation:1];
  }
  if (![a1[4] forceInlinePresentation])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v24 = [MEMORY[0x263F82670] currentDevice];
      uint64_t v25 = [v24 userInterfaceIdiom];

      if (v25 == 1) {
        [a1[5] setModalPresentationStyle:2];
      }
      v26 = [a1[4] presentingViewController];
      id v27 = v26;
      id v28 = a1[5];
      id v29 = 0;
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v27 = objc_alloc_init(MEMORY[0x263F5FC30]);
        v30 = [a1[4] presentingViewController];
        char v31 = objc_opt_respondsToSelector();

        if (v31)
        {
          v32 = [a1[4] presentingViewController];
          v33 = [v32 rootController];
          [v27 setRootController:v33];
        }
        v34 = [a1[4] presentingViewController];
        int v35 = [v34 conformsToProtocol:&unk_26CA16208];

        if (v35)
        {
          v36 = [a1[4] presentingViewController];
          [v27 setParentController:v36];
        }
        objc_storeStrong((id *)a1[4] + 4, v27);
        [v27 showController:a1[5]];
        v37 = [MEMORY[0x263F82670] currentDevice];
        uint64_t v38 = [v37 userInterfaceIdiom];

        if (v38 == 1) {
          [a1[5] setModalPresentationStyle:2];
        }
        v39 = [a1[4] presentingViewController];
        [v39 presentViewController:v27 animated:1 completion:0];

        goto LABEL_31;
      }
      uint64_t v48 = [objc_alloc(MEMORY[0x263F829B8]) initWithRootViewController:a1[5]];
      v49 = a1[4];
      v50 = (void *)v49[4];
      v49[4] = v48;

      v51 = [MEMORY[0x263F82670] currentDevice];
      uint64_t v52 = [v51 userInterfaceIdiom];

      if (v52 == 1) {
        [*((id *)a1[4] + 4) setModalPresentationStyle:2];
      }
      v26 = [a1[4] presentingViewController];
      id v27 = v26;
      id v28 = (id)*((void *)a1[4] + 4);
      id v29 = a1[6];
    }
    [v26 presentViewController:v28 animated:1 completion:v29];
LABEL_31:

    goto LABEL_41;
  }
  uint64_t v16 = [a1[4] presentingViewController];
  id v17 = (void *)*((void *)a1[4] + 4);
  *((void *)a1[4] + 4) = v16;

  [*((id *)a1[4] + 4) setNavigationBarHidden:0];
  id v18 = [*((id *)a1[4] + 4) viewControllers];
  v19 = (void *)[v18 mutableCopy];

  id v20 = [*((id *)a1[4] + 4) topViewController];
  objc_opt_class();
  char v21 = objc_opt_isKindOfClass();

  if (v21)
  {
    id v22 = _CDPLogSystem();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
      __53__CDPUIController__presentRootController_completion___block_invoke_cold_1();
    }

    uint64_t v23 = [*((id *)a1[4] + 4) topViewController];
  }
  else
  {
    if (isKindOfClass)
    {
      v40 = [*((id *)a1[4] + 4) viewControllers];
      uint64_t v41 = [v40 count];

      if (v41)
      {
        [MEMORY[0x263F829A0] _setUseCustomBackButtonAction:1];
        id v42 = objc_alloc(MEMORY[0x263F824A8]);
        v43 = [MEMORY[0x263F343B8] builderForKey:@"GENERIC_BACK_BUTTON"];
        v44 = [v43 localizedString];
        v45 = (void *)[v42 initWithTitle:v44 style:0 target:a1[4] action:sel_backTappedFromRoot_];
        v46 = [*((id *)a1[4] + 4) topViewController];
        v47 = [v46 navigationItem];
        [v47 setBackBarButtonItem:v45];
      }
      else
      {
        v43 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:1 target:a1[4] action:sel_cancelTapped_];
        v44 = [a1[5] navigationItem];
        [v44 setLeftBarButtonItem:v43];
      }
    }
    uint64_t v23 = 0;
  }
  [v19 addObject:a1[5]];
  [v19 removeObject:v23];
  if ([*((id *)a1[4] + 7) idmsMasterKeyRecovery]) {
    double v53 = 2.0;
  }
  else {
    double v53 = 0.0;
  }
  v54 = _CDPLogSystem();
  if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(double *)((char *)&buf + 4) = v53;
    _os_log_impl(&dword_2187CF000, v54, OS_LOG_TYPE_DEFAULT, "Attempting to push with delay: %f", (uint8_t *)&buf, 0xCu);
  }

  dispatch_time_t v55 = dispatch_time(0, (uint64_t)(v53 * 1000000000.0));
  v62[0] = MEMORY[0x263EF8330];
  v62[1] = 3221225472;
  v62[2] = __53__CDPUIController__presentRootController_completion___block_invoke_53;
  v62[3] = &unk_26433CCF0;
  id v56 = a1[5];
  id v57 = a1[4];
  id v63 = v56;
  id v64 = v57;
  id v65 = v19;
  id v66 = a1[6];
  id v58 = v19;
  dispatch_after(v55, MEMORY[0x263EF83A0], v62);

LABEL_41:
  uint64_t v67 = 0;
  v68 = &v67;
  uint64_t v69 = 0x2050000000;
  v59 = (void *)getBFFStyleClass_softClass;
  uint64_t v70 = getBFFStyleClass_softClass;
  if (!getBFFStyleClass_softClass)
  {
    *(void *)&long long buf = MEMORY[0x263EF8330];
    *((void *)&buf + 1) = 3221225472;
    v72 = __getBFFStyleClass_block_invoke;
    v73 = &unk_26433D708;
    v74 = &v67;
    __getBFFStyleClass_block_invoke((uint64_t)&buf);
    v59 = (void *)v68[3];
  }
  id v60 = v59;
  _Block_object_dispose(&v67, 8);
  v61 = [v60 sharedStyle];
  [v61 applyThemeToNavigationController:*((void *)a1[4] + 4)];
}

void __53__CDPUIController__presentRootController_completion___block_invoke_53(uint64_t a1)
{
  id v2 = _CDPLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __53__CDPUIController__presentRootController_completion___block_invoke_53_cold_1();
  }

  uint64_t v3 = *(void **)(*(void *)(a1 + 40) + 32);
  id v4 = (void *)[*(id *)(a1 + 48) copy];
  [v3 setViewControllers:v4 animated:1];

  BOOL v5 = [*(id *)(*(void *)(a1 + 40) + 32) transitionCoordinator];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __53__CDPUIController__presentRootController_completion___block_invoke_54;
  v8[3] = &unk_26433CCC8;
  id v6 = *(id *)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 40);
  id v9 = v6;
  uint64_t v10 = v7;
  id v11 = *(id *)(a1 + 56);
  [v5 animateAlongsideTransition:0 completion:v8];
}

uint64_t __53__CDPUIController__presentRootController_completion___block_invoke_54(void *a1)
{
  id v2 = _CDPLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __53__CDPUIController__presentRootController_completion___block_invoke_54_cold_1();
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1[5] + 152));
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = objc_loadWeakRetained((id *)(a1[5] + 152));
    [v5 uiController:a1[5] didPresentRootViewController:a1[4]];
  }
  uint64_t result = a1[6];
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)cdpContext:(id)a3 promptForInteractiveAuthenticationWithCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    id v10 = objc_loadWeakRetained((id *)&self->_delegate);
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __79__CDPUIController_cdpContext_promptForInteractiveAuthenticationWithCompletion___block_invoke;
    v12[3] = &unk_26433CD40;
    id v13 = v6;
    uint64_t v14 = self;
    id v15 = v7;
    [v10 uiController:self prepareAlertContext:v12];
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)CDPUIController;
    [(CDPUIBaseController *)&v11 cdpContext:v6 promptForInteractiveAuthenticationWithCompletion:v7];
  }
}

id __79__CDPUIController_cdpContext_promptForInteractiveAuthenticationWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 48);
  v4.receiver = *(id *)(a1 + 40);
  v4.super_class = (Class)CDPUIController;
  return objc_msgSendSuper2(&v4, sel_cdpContext_promptForInteractiveAuthenticationWithCompletion_, v1, v2);
}

- (void)cdpContext:(id)a3 showError:(id)a4 withDefaultIndex:(int64_t)a5 withCompletion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v14 = objc_opt_respondsToSelector();

  if (v14)
  {
    id v15 = objc_loadWeakRetained((id *)&self->_delegate);
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __72__CDPUIController_cdpContext_showError_withDefaultIndex_withCompletion___block_invoke;
    v17[3] = &unk_26433CD68;
    id v18 = v10;
    id v19 = v11;
    int64_t v22 = a5;
    id v20 = self;
    id v21 = v12;
    [v15 uiController:self prepareAlertContext:v17];
  }
  else
  {
    v16.receiver = self;
    v16.super_class = (Class)CDPUIController;
    [(CDPUIBaseController *)&v16 cdpContext:v10 showError:v11 withDefaultIndex:a5 withCompletion:v12];
  }
}

id __72__CDPUIController_cdpContext_showError_withDefaultIndex_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 56);
  uint64_t v3 = *(void *)(a1 + 64);
  v6.receiver = *(id *)(a1 + 48);
  v6.super_class = (Class)CDPUIController;
  return objc_msgSendSuper2(&v6, sel_cdpContext_showError_withDefaultIndex_withCompletion_, v1, v2, v3, v4);
}

- (void)cdpContext:(id)a3 promptForICSCWithIsNumeric:(BOOL)a4 numericLength:(id)a5 isRandom:(BOOL)a6 validator:(id)a7
{
  BOOL v8 = a6;
  id v13 = a3;
  id v14 = a5;
  id v15 = a7;
  objc_storeStrong((id *)&self->_activeContext, a3);
  objc_storeStrong((id *)&self->_remoteSecretValidator, a7);
  if (v8)
  {
    objc_super v16 = objc_alloc_init(CDPSingleICSCEntryViewController);
    [(PSKeychainSyncSecurityCodeController *)v16 setMode:2];
    [(PSKeychainSyncSecurityCodeController *)v16 setSecurityCodeType:2];
    [(PSKeychainSyncViewController *)v16 setDelegate:self];
    [(CDPUIController *)self _presentRootController:v16 completion:0];
  }
  else
  {
    objc_initWeak(&location, self);
    remoteSecretValidator = self->_remoteSecretValidator;
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __90__CDPUIController_cdpContext_promptForICSCWithIsNumeric_numericLength_isRandom_validator___block_invoke;
    v18[3] = &unk_26433CD90;
    objc_copyWeak(&v21, &location);
    BOOL v22 = a4;
    id v19 = v14;
    id v20 = self;
    [(CDPRemoteDeviceSecretValidator *)remoteSecretValidator supportedEscapeOfferMaskCompletion:v18];

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }
}

void __90__CDPUIController_cdpContext_promptForICSCWithIsNumeric_numericLength_isRandom_validator___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    uint64_t v4 = [[CDPRemoteSecretEntryViewController alloc] initWithIsNumeric:*(unsigned __int8 *)(a1 + 56) numericLength:*(void *)(a1 + 32) validator:*(void *)(*(void *)(a1 + 40) + 24) delegate:WeakRetained];
    id v5 = [WeakRetained _singleICSCEscapeOfferWithMask:a2 withController:v4];
    [(CDPRemoteSecretEntryViewController *)v4 setEscapeOffer:v5];

    objc_super v6 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:&stru_26C9EBCA0 target:0 set:0 get:0 detail:0 cell:13 edit:0];
    [v6 setEditPaneClass:objc_opt_class()];
    [v6 setProperty:WeakRetained forKey:*MEMORY[0x263F60318]];
    [(DevicePINController *)v4 setSpecifier:v6];
    [WeakRetained _presentRootController:v4 completion:0];
  }
}

- (void)cdpContext:(id)a3 promptForLocalSecretWithCompletion:(id)a4
{
  v50[1] = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  objc_storeStrong((id *)&self->_activeContext, a3);
  char v9 = _CDPLogSystem();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_2187CF000, v9, OS_LOG_TYPE_DEFAULT, "Attempting to show local secret prompt", buf, 2u);
  }

  id v10 = objc_alloc_init(MEMORY[0x263F08810]);
  v49 = @"forceInlineMode";
  id v11 = objc_msgSend(NSNumber, "numberWithBool:", -[CDPUIController forceInlinePresentation](self, "forceInlinePresentation"));
  v50[0] = v11;
  id v12 = [NSDictionary dictionaryWithObjects:v50 forKeys:&v49 count:1];
  id v13 = (void *)[v12 mutableCopy];

  id v14 = [(CDPUIController *)self titleText];
  [v13 setObject:v14 forKeyedSubscript:@"title"];

  id v15 = _CDPLogSystem();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v16 = (objc_class *)objc_opt_class();
    id v17 = NSStringFromClass(v16);
    *(_DWORD *)long long buf = 138412546;
    *(void *)&uint8_t buf[4] = v17;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v13;
    _os_log_impl(&dword_2187CF000, v15, OS_LOG_TYPE_DEFAULT, "%@: userInfo: %@", buf, 0x16u);
  }
  id v18 = (void *)[v13 copy];
  [v10 setUserInfo:v18];

  id v43 = 0;
  id v19 = [MEMORY[0x263F08800] extensionWithIdentifier:@"com.apple.CoreCDPUI.localSecretPrompt" error:&v43];
  id v25 = v43;
  objc_initWeak(&location, v19);
  *(void *)long long buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x3042000000;
  v46 = __Block_byref_object_copy_;
  v47 = __Block_byref_object_dispose_;
  id v48 = 0;
  id v44 = v10;
  id v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v44 count:1];
  v38[0] = MEMORY[0x263EF8330];
  v38[1] = 3221225472;
  v38[2] = __65__CDPUIController_cdpContext_promptForLocalSecretWithCompletion___block_invoke;
  v38[3] = &unk_26433CDB8;
  v40 = buf;
  objc_copyWeak(&v41, &location);
  v38[4] = self;
  id v21 = v8;
  id v39 = v21;
  [v19 instantiateViewControllerWithInputItems:v20 connectionHandler:v38];

  v36[0] = 0;
  v36[1] = v36;
  v36[2] = 0x2020000000;
  char v37 = 0;
  v32[0] = MEMORY[0x263EF8330];
  v32[1] = 3221225472;
  v32[2] = __65__CDPUIController_cdpContext_promptForLocalSecretWithCompletion___block_invoke_190;
  v32[3] = &unk_26433CE30;
  v34 = v36;
  int v35 = buf;
  id v22 = v21;
  id v33 = v22;
  [v19 setRequestInterruptionBlock:v32];
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __65__CDPUIController_cdpContext_promptForLocalSecretWithCompletion___block_invoke_193;
  v26[3] = &unk_26433CED0;
  v30 = v36;
  id v23 = v7;
  id v27 = v23;
  id v24 = v22;
  id v28 = self;
  id v29 = v24;
  char v31 = buf;
  objc_msgSend(v19, "set_requestPostCompletionBlockWithItems:", v26);

  _Block_object_dispose(v36, 8);
  objc_destroyWeak(&v41);
  _Block_object_dispose(buf, 8);
  objc_destroyWeak(&v48);
  objc_destroyWeak(&location);
}

void __65__CDPUIController_cdpContext_promptForLocalSecretWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  objc_storeWeak((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v8);
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v11 = _CDPLogSystem();
  id v12 = v11;
  if (isKindOfClass)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138412546;
      id v17 = v8;
      __int16 v18 = 2112;
      id v19 = v9;
      _os_log_impl(&dword_2187CF000, v12, OS_LOG_TYPE_DEFAULT, "Presented a remoteUI view controller: %@ - %@", (uint8_t *)&v16, 0x16u);
    }

    id v13 = v8;
    [v13 setRequest:v7];
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    [v13 setWeakExtension:WeakRetained];

    [*(id *)(a1 + 32) _presentRootController:v13 completion:0];
  }
  else
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      __65__CDPUIController_cdpContext_promptForLocalSecretWithCompletion___block_invoke_cold_1();
    }

    uint64_t v15 = *(void *)(a1 + 40);
    objc_msgSend(MEMORY[0x263F087E8], "cdp_errorWithCode:", 5906);
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void, id))(v15 + 16))(v15, 0, v13);
  }
}

void __65__CDPUIController_cdpContext_promptForLocalSecretWithCompletion___block_invoke_190(uint64_t a1)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __65__CDPUIController_cdpContext_promptForLocalSecretWithCompletion___block_invoke_2;
  block[3] = &unk_26433CE08;
  uint64_t v5 = *(void *)(a1 + 48);
  long long v2 = *(_OWORD *)(a1 + 32);
  id v1 = (id)v2;
  long long v4 = v2;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __65__CDPUIController_cdpContext_promptForLocalSecretWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 40) + 8);
  if (*(unsigned char *)(v1 + 24))
  {
    long long v2 = _CDPLogSystem();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      __65__CDPUIController_cdpContext_promptForLocalSecretWithCompletion___block_invoke_2_cold_2();
    }
  }
  else
  {
    *(unsigned char *)(v1 + 24) = 1;
    long long v4 = _CDPLogSystem();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __65__CDPUIController_cdpContext_promptForLocalSecretWithCompletion___block_invoke_2_cold_1();
    }

    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40));
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __65__CDPUIController_cdpContext_promptForLocalSecretWithCompletion___block_invoke_191;
    v6[3] = &unk_26433CDE0;
    id v7 = *(id *)(a1 + 32);
    [WeakRetained dismissViewControllerAnimated:1 completion:v6];

    long long v2 = v7;
  }
}

void __65__CDPUIController_cdpContext_promptForLocalSecretWithCompletion___block_invoke_191(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  _CDPStateError();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

void __65__CDPUIController_cdpContext_promptForLocalSecretWithCompletion___block_invoke_193(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __65__CDPUIController_cdpContext_promptForLocalSecretWithCompletion___block_invoke_2_194;
  v7[3] = &unk_26433CEA8;
  uint64_t v12 = *(void *)(a1 + 56);
  id v8 = v4;
  id v9 = *(id *)(a1 + 32);
  id v5 = *(id *)(a1 + 48);
  uint64_t v10 = *(void *)(a1 + 40);
  id v11 = v5;
  uint64_t v13 = *(void *)(a1 + 64);
  id v6 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v7);
}

void __65__CDPUIController_cdpContext_promptForLocalSecretWithCompletion___block_invoke_2_194(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 64) + 8);
  if (*(unsigned char *)(v1 + 24))
  {
    id v2 = _CDPLogSystem();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      __65__CDPUIController_cdpContext_promptForLocalSecretWithCompletion___block_invoke_2_194_cold_1();
    }
  }
  else
  {
    *(unsigned char *)(v1 + 24) = 1;
    if ([*(id *)(a1 + 32) count])
    {
      id v4 = _CDPLogSystem();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_2187CF000, v4, OS_LOG_TYPE_DEFAULT, "Local secret prompt came back with data", buf, 2u);
      }
    }
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 3221225472;
    aBlock[2] = __65__CDPUIController_cdpContext_promptForLocalSecretWithCompletion___block_invoke_195;
    aBlock[3] = &unk_26433CE58;
    id v17 = *(id *)(a1 + 40);
    id v18 = *(id *)(a1 + 56);
    id v5 = (void (**)(void *, void *, uint64_t))_Block_copy(aBlock);
    id v6 = [*(id *)(a1 + 32) firstObject];
    if ([*(id *)(a1 + 48) forceInlinePresentation]
      || ([*(id *)(a1 + 48) forceInlinePresentation] & 1) == 0
      && ([*(id *)(a1 + 48) titleText],
          id v7 = objc_claimAutoreleasedReturnValue(),
          v7,
          v7))
    {
      id v8 = [v6 userInfo];
      id v9 = [v8 objectForKeyedSubscript:@"localSecret"];
      uint64_t v10 = [v6 userInfo];
      id v11 = [v10 objectForKeyedSubscript:@"secretType"];
      v5[2](v5, v9, [v11 integerValue]);
    }
    else
    {
      id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40));
      v13[0] = MEMORY[0x263EF8330];
      v13[1] = 3221225472;
      v13[2] = __65__CDPUIController_cdpContext_promptForLocalSecretWithCompletion___block_invoke_2_204;
      v13[3] = &unk_26433CE80;
      uint64_t v15 = v5;
      id v14 = v6;
      [WeakRetained dismissViewControllerAnimated:1 completion:v13];

      id v8 = v15;
    }

    id v2 = v17;
  }
}

void __65__CDPUIController_cdpContext_promptForLocalSecretWithCompletion___block_invoke_195(uint64_t a1, void *a2, uint64_t a3)
{
  id v10 = a2;
  if (v10)
  {
    id v5 = (void *)[objc_alloc(MEMORY[0x263F343B0]) initWithValidatedSecret:v10 secretType:a3];
    id v6 = v5;
    if (*(void *)(a1 + 32))
    {
      id v7 = [v5 validatedSecret];
      [*(id *)(a1 + 32) setCachedLocalSecret:v7];

      objc_msgSend(*(id *)(a1 + 32), "setCachedLocalSecretType:", objc_msgSend(v6, "secretType"));
    }
    id v8 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  else
  {
    uint64_t v9 = *(void *)(a1 + 40);
    id v6 = _CDPStateError();
    id v8 = *(void (**)(void))(v9 + 16);
  }
  v8();
}

void __65__CDPUIController_cdpContext_promptForLocalSecretWithCompletion___block_invoke_2_204(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  id v6 = [*(id *)(a1 + 32) userInfo];
  uint64_t v3 = [v6 objectForKeyedSubscript:@"localSecret"];
  id v4 = [*(id *)(a1 + 32) userInfo];
  id v5 = [v4 objectForKeyedSubscript:@"secretType"];
  (*(void (**)(uint64_t, void *, uint64_t))(v2 + 16))(v2, v3, [v5 integerValue]);
}

- (void)cdpContext:(id)a3 presentRemoteApprovalWithCompletion:(id)a4
{
  id v6 = (CDPContext *)a3;
  id v7 = a4;
  activeContext = self->_activeContext;
  self->_activeContext = v6;
  uint64_t v9 = v6;

  id v10 = [[CDPWaitingApprovalViewController alloc] initWithEscapeOffer:0];
  objc_storeStrong((id *)&self->_rootViewController, v10);
  [(CDPUIController *)self sendRemoteApprovalStartedBreadCrumbEventWithContext:v9];
  rootViewController = self->_rootViewController;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __66__CDPUIController_cdpContext_presentRemoteApprovalWithCompletion___block_invoke;
  v14[3] = &unk_26433CEF8;
  uint64_t v15 = v10;
  id v16 = v7;
  id v12 = v7;
  uint64_t v13 = v10;
  [(CDPUIController *)self _presentRootController:rootViewController completion:v14];
}

uint64_t __66__CDPUIController_cdpContext_presentRemoteApprovalWithCompletion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setRemoteApprovalCompletion:*(void *)(a1 + 40)];
}

- (void)dismissRemoteApprovalWaitingScreenWithAction:(unint64_t)a3
{
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = self->_rootViewController;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;
  if (a3 == 1)
  {
    [(UIViewController *)v5 cancelRemoteApproval];
  }
  else if (a3 == 2)
  {
    [(UIViewController *)v5 remoteApprovalSucceeded];
  }
  [(CDPUIController *)self _dismissPresentedViewControllerCompletion:0];
}

- (void)sendRemoteApprovalStartedBreadCrumbEventWithContext:(id)a3
{
  id v4 = [(CDPUIController *)self _makeRemoteApprovalStartedBreadCrumbEventWithContext:a3];
  uint64_t v3 = [MEMORY[0x263F34338] rtcAnalyticsReporter];
  [v3 sendEvent:v4];
}

- (id)_makeRemoteApprovalStartedBreadCrumbEventWithContext:(id)a3
{
  return (id)[MEMORY[0x263F202A8] analyticsEventWithContext:a3 eventName:*MEMORY[0x263F34718] category:*MEMORY[0x263F34830]];
}

- (void)sendRemoteApprovalCompletedEventWithContext:(id)a3 didApprove:(BOOL)a4 error:(id)a5
{
  id v6 = [(CDPUIController *)self _makeRemoteApprovalCompletedEventWithContext:a3 didApprove:a4 error:a5];
  id v5 = [MEMORY[0x263F34338] rtcAnalyticsReporter];
  [v5 sendEvent:v6];
}

- (id)_makeRemoteApprovalCompletedEventWithContext:(id)a3 didApprove:(BOOL)a4 error:(id)a5
{
  BOOL v5 = a4;
  id v7 = (void *)MEMORY[0x263F202A8];
  uint64_t v8 = *MEMORY[0x263F34710];
  uint64_t v9 = *MEMORY[0x263F34830];
  id v10 = a5;
  id v11 = [v7 analyticsEventWithContext:a3 eventName:v8 category:v9];
  id v12 = v11;
  if (v5) {
    uint64_t v13 = MEMORY[0x263EFFA88];
  }
  else {
    uint64_t v13 = MEMORY[0x263EFFA80];
  }
  [v11 setObject:v13 forKeyedSubscript:*MEMORY[0x263F34558]];
  [v12 populateUnderlyingErrorsStartingWithRootError:v10];

  return v12;
}

- (void)cdpContext:(id)a3 presentRecoveryKeyWithValidator:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [[CDPRecoveryKeyEntryViewModel alloc] initWithContext:v8 validator:v9 mode:1];
  id v12 = [[CDPRecoveryKeyEntryViewController alloc] initWithRecoveryContext:v11 cdpContext:self->_activeContext];
  objc_storeStrong((id *)&self->_recoveryKeyViewModel, v11);
  objc_initWeak(&location, self);
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __73__CDPUIController_cdpContext_presentRecoveryKeyWithValidator_completion___block_invoke;
  v16[3] = &unk_26433CF48;
  objc_copyWeak(&v20, &location);
  id v13 = v8;
  id v17 = v13;
  id v14 = v9;
  id v18 = v14;
  id v15 = v10;
  id v19 = v15;
  [(CDPRecoveryKeyEntryViewModel *)v11 setCompletionHandler:v16];
  [(CDPUIController *)self _presentRootController:v12 completion:0];

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);
}

void __73__CDPUIController_cdpContext_presentRecoveryKeyWithValidator_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v7 = WeakRetained;
  if (WeakRetained)
  {
    if (a2)
    {
      [WeakRetained cdpContext:*(void *)(a1 + 32) confirmRecoveryKeyWithValidator:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
    }
    else
    {
      v8[0] = MEMORY[0x263EF8330];
      v8[1] = 3221225472;
      v8[2] = __73__CDPUIController_cdpContext_presentRecoveryKeyWithValidator_completion___block_invoke_2;
      v8[3] = &unk_26433CF20;
      id v10 = *(id *)(a1 + 48);
      char v11 = 0;
      id v9 = v5;
      [v7 _dismissPresentedViewControllerCompletion:v8];
    }
  }
}

uint64_t __73__CDPUIController_cdpContext_presentRecoveryKeyWithValidator_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

- (void)cdpContext:(id)a3 confirmRecoveryKeyWithValidator:(id)a4 completion:(id)a5
{
  id v6 = [(CDPUIController *)self _recoveryKeyControllerWithContext:a3 validator:a4 completion:a5];
  [(UINavigationController *)self->_navController pushViewController:v6 animated:1];
}

- (void)cdpContext:(id)a3 promptForRecoveryKeyWithValidator:(id)a4 completion:(id)a5
{
  id v6 = [(CDPUIController *)self _recoveryKeyControllerWithContext:a3 validator:a4 completion:a5];
  [(CDPUIController *)self _presentRootController:v6 completion:0];
}

- (void)cdpContext:(id)a3 promptForRecoveryKeyWithSecretValidator:(id)a4 completion:(id)a5
{
  id v6 = [(CDPUIController *)self _recoveryKeyControllerWithContext:a3 secretValidator:a4 completion:a5];
  [(CDPUIController *)self _presentRootController:v6 completion:0];
}

- (id)_recoveryKeyControllerWithContext:(id)a3 validator:(id)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  objc_storeStrong((id *)&self->_activeContext, a3);
  id v11 = a4;
  id v12 = [[CDPRecoveryKeyEntryViewModel alloc] initWithContext:v9 validator:v11 mode:2];

  if (!self->_recoveryKeyViewModel) {
    objc_storeStrong((id *)&self->_recoveryKeyViewModel, v12);
  }
  id v13 = [[CDPRecoveryKeyEntryViewController alloc] initWithRecoveryContext:v12 cdpContext:self->_activeContext];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __74__CDPUIController__recoveryKeyControllerWithContext_validator_completion___block_invoke;
  v16[3] = &unk_26433CF70;
  void v16[4] = self;
  id v17 = v10;
  id v14 = v10;
  [(CDPRecoveryKeyEntryViewModel *)v12 setCompletionHandler:v16];

  return v13;
}

void __74__CDPUIController__recoveryKeyControllerWithContext_validator_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = _CDPLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315138;
    id v15 = "-[CDPUIController _recoveryKeyControllerWithContext:validator:completion:]_block_invoke";
    _os_log_impl(&dword_2187CF000, v6, OS_LOG_TYPE_DEFAULT, "%s: Recovery key accepted valid key", buf, 0xCu);
  }

  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __74__CDPUIController__recoveryKeyControllerWithContext_validator_completion___block_invoke_211;
  v10[3] = &unk_26433CF20;
  id v7 = *(void **)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  char v13 = a2;
  id v11 = v5;
  id v12 = v8;
  id v9 = v5;
  [v7 _dismissPresentedViewControllerCompletion:v10];
}

uint64_t __74__CDPUIController__recoveryKeyControllerWithContext_validator_completion___block_invoke_211(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

- (id)_recoveryKeyControllerWithContext:(id)a3 secretValidator:(id)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  objc_storeStrong((id *)&self->_activeContext, a3);
  id v11 = a4;
  id v12 = [[CDPRecoveryKeyEntryViewModel alloc] initWithContext:v9 validator:v11];

  if (!self->_recoveryKeyViewModel) {
    objc_storeStrong((id *)&self->_recoveryKeyViewModel, v12);
  }
  char v13 = [[CDPRecoveryKeyEntryViewController alloc] initWithRecoveryContext:v12 cdpContext:self->_activeContext];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __80__CDPUIController__recoveryKeyControllerWithContext_secretValidator_completion___block_invoke;
  v16[3] = &unk_26433CF70;
  void v16[4] = self;
  id v17 = v10;
  id v14 = v10;
  [(CDPRecoveryKeyEntryViewModel *)v12 setCompletionHandler:v16];

  return v13;
}

void __80__CDPUIController__recoveryKeyControllerWithContext_secretValidator_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = _CDPLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315138;
    id v15 = "-[CDPUIController _recoveryKeyControllerWithContext:secretValidator:completion:]_block_invoke";
    _os_log_impl(&dword_2187CF000, v6, OS_LOG_TYPE_DEFAULT, "%s: Recovery key accepted", buf, 0xCu);
  }

  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __80__CDPUIController__recoveryKeyControllerWithContext_secretValidator_completion___block_invoke_212;
  v10[3] = &unk_26433CF20;
  id v7 = *(void **)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  char v13 = a2;
  id v11 = v5;
  id v12 = v8;
  id v9 = v5;
  [v7 _dismissPresentedViewControllerCompletion:v10];
}

uint64_t __80__CDPUIController__recoveryKeyControllerWithContext_secretValidator_completion___block_invoke_212(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

- (void)_presentSwiftUIRemoteSecretPromptWithDevice:(id)a3 didSelectDevice:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  objc_initWeak(&location, self);
  id v18 = v6;
  BOOL v17 = [(CDPUIController *)self _canShowRPD];
  if (v4) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }
  activeContext = self->_activeContext;
  remoteSecretValidator = self->_remoteSecretValidator;
  devices = self->_devices;
  id v9 = [(CDPUIBaseController *)self presentingViewController];
  BOOL v10 = [(CDPUIController *)self performingAccountRecovery];
  BOOL offeringRemoteApproval = self->_offeringRemoteApproval;
  BOOL isWalrusEnabled = self->_isWalrusEnabled;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __79__CDPUIController__presentSwiftUIRemoteSecretPromptWithDevice_didSelectDevice___block_invoke;
  v19[3] = &unk_26433CF98;
  objc_copyWeak(&v21, &location);
  v19[4] = self;
  BOOL v22 = v4;
  id v13 = v18;
  id v20 = v13;
  BYTE2(v14) = isWalrusEnabled;
  BYTE1(v14) = v17;
  LOBYTE(v14) = offeringRemoteApproval;
  +[CDPStateSwiftUIProvider makeSwiftUIViewForRemoteSecretDuringSignInCdpContext:validator:devices:presentingViewController:performingAccountRecovery:delegate:offeringRemoteApproval:canShowRPD:isADPEnabled:selectedDevice:completionHandler:](CDPStateSwiftUIProvider, "makeSwiftUIViewForRemoteSecretDuringSignInCdpContext:validator:devices:presentingViewController:performingAccountRecovery:delegate:offeringRemoteApproval:canShowRPD:isADPEnabled:selectedDevice:completionHandler:", activeContext, remoteSecretValidator, devices, v9, v10, self, v14, v7, v19);

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);
}

void __79__CDPUIController__presentSwiftUIRemoteSecretPromptWithDevice_didSelectDevice___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 112), a2);
  if (v4)
  {
    [WeakRetained remoteSecretEntryDidRequestDisableUserInteraction];
    id v6 = [*(id *)(*(void *)(a1 + 32) + 112) navigationItem];
    [v6 setAccessibilityIdentifier:@"remote-secret-entry-view"];

    if (*(unsigned char *)(a1 + 56))
    {
      [WeakRetained[4] pushViewController:v4 animated:1];
      [WeakRetained sendRemoteSecretInputEventWithContext:WeakRetained[7] device:*(void *)(a1 + 40)];
    }
    else
    {
      v8[0] = MEMORY[0x263EF8330];
      v8[1] = 3221225472;
      v8[2] = __79__CDPUIController__presentSwiftUIRemoteSecretPromptWithDevice_didSelectDevice___block_invoke_214;
      v8[3] = &unk_26433CC30;
      id v9 = WeakRetained;
      id v10 = *(id *)(a1 + 40);
      [v9 _presentRootController:v4 completion:v8];
    }
  }
  else
  {
    id v7 = _CDPLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __79__CDPUIController__presentSwiftUIRemoteSecretPromptWithDevice_didSelectDevice___block_invoke_cold_1();
    }
  }
}

uint64_t __79__CDPUIController__presentSwiftUIRemoteSecretPromptWithDevice_didSelectDevice___block_invoke_214(uint64_t a1)
{
  return [*(id *)(a1 + 32) sendRemoteSecretInputEventWithContext:*(void *)(*(void *)(a1 + 32) + 56) device:*(void *)(a1 + 40)];
}

- (void)cdpContext:(id)a3 promptForRemoteSecretWithDevices:(id)a4 offeringRemoteApproval:(BOOL)a5 validator:(id)a6
{
  id v23 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = [v11 firstObject];
  objc_storeStrong((id *)&self->_activeContext, a3);
  objc_storeStrong((id *)&self->_remoteSecretValidator, a6);
  objc_storeStrong((id *)&self->_devices, a4);
  self->_BOOL offeringRemoteApproval = a5;
  id v14 = objc_alloc_init(MEMORY[0x263F343E0]);
  [v14 setContext:v23];
  [v14 setIsWalrusEnabled:self->_isWalrusEnabled];
  [v14 setRpdProbationDuration:self->_rpdProbationDuration];
  if (!self->_ledger)
  {
    id v21 = objc_alloc(MEMORY[0x263F349D0]);
    uint64_t v20 = [v12 supportedEscapeOfferMask];
    id v15 = [MEMORY[0x263F343A8] sharedInstance];
    uint64_t v16 = [v15 hasLocalSecret];
    [MEMORY[0x263F34328] sharedInstance];
    BOOL v17 = v22 = v12;
    id v18 = (CDPRPDLedger *)objc_msgSend(v21, "initWithExpectedEscapeOffers:recoveryFlowContext:deviceHasPasscode:probationChecker:deviceIsVM:isICDPEnabled:", v20, v14, v16, v17, objc_msgSend(MEMORY[0x263F34400], "isVirtualMachine"), objc_msgSend(v23, "isICDPEnabledFromNetwork"));
    ledger = self->_ledger;
    self->_ledger = v18;

    id v12 = v22;
  }
  if ([MEMORY[0x263F34400] isICSCHarmonizationEnabled]
    && [(NSArray *)self->_devices count])
  {
    [(CDPUIController *)self _presentSwiftUIRemoteSecretPromptWithDevice:v13 didSelectDevice:0];
  }
  else
  {
    [(CDPUIController *)self _presentRemoteSecretControllerWithNewestDevice:v13];
    [(CDPUIController *)self sendRemoteSecretInputEventWithContext:v23 device:v13];
  }
}

- (void)sendRemoteSecretInputEventWithContext:(id)a3 device:(id)a4
{
  id v5 = [(CDPUIController *)self _makeRemoteSecretInputEventWithContext:a3 device:a4];
  id v4 = [MEMORY[0x263F34338] rtcAnalyticsReporter];
  [v4 sendEvent:v5];
}

- (id)_makeRemoteSecretInputEventWithContext:(id)a3 device:(id)a4
{
  id v5 = (void *)MEMORY[0x263F202A8];
  uint64_t v6 = *MEMORY[0x263F34720];
  uint64_t v7 = *MEMORY[0x263F34830];
  id v8 = a4;
  id v9 = [v5 analyticsEventWithContext:a3 eventName:v6 category:v7];
  id v10 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v8, "remainingAttempts"));
  [v9 setObject:v10 forKeyedSubscript:*MEMORY[0x263F34708]];

  id v11 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v8, "hasNumericSecret"));
  [v9 setObject:v11 forKeyedSubscript:*MEMORY[0x263F34650]];

  id v12 = [v8 numericSecretLength];
  [v9 setObject:v12 forKeyedSubscript:*MEMORY[0x263F34690]];

  id v13 = NSNumber;
  uint64_t v14 = [v8 isCurrentDevice];

  id v15 = [v13 numberWithBool:v14];
  [v9 setObject:v15 forKeyedSubscript:*MEMORY[0x263F34660]];

  return v9;
}

- (void)cdpRecoveryFlowContext:(id)a3 promptForRemoteSecretWithDevices:(id)a4 validator:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  self->_BOOL isWalrusEnabled = [v10 isWalrusEnabled];
  [v10 rpdProbationDuration];
  self->_rpdProbationDuration = v11;
  id v13 = [v10 context];
  uint64_t v12 = [v10 hasPeersForRemoteApproval];

  [(CDPUIController *)self cdpContext:v13 promptForRemoteSecretWithDevices:v9 offeringRemoteApproval:v12 validator:v8];
}

- (void)cdpContext:(id)a3 promptForBeneficiaryAccessKeyWithCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [CDPUIInheritanceUIProviderImpl alloc];
  id v9 = [(CDPUIBaseController *)self presentingViewController];
  id v10 = [(CDPUIInheritanceUIProviderImpl *)v8 initWithPresentingViewController:v9];
  inheritanceUIProvider = self->_inheritanceUIProvider;
  self->_inheritanceUIProvider = v10;

  id v12 = objc_alloc(MEMORY[0x263F291F8]);
  id v13 = [v6 beneficiaryIdentifier];
  uint64_t v14 = (void *)[v12 initWithBeneficiairyIdentifier:v13];

  id v15 = [v6 beneficiaryWrappedKeyData];
  [v14 setWrappedKeyData:v15];

  objc_initWeak(&location, self);
  uint64_t v16 = self->_inheritanceUIProvider;
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __74__CDPUIController_cdpContext_promptForBeneficiaryAccessKeyWithCompletion___block_invoke;
  v18[3] = &unk_26433CFC0;
  objc_copyWeak(&v20, &location);
  id v17 = v7;
  id v19 = v17;
  [(CDPUIInheritanceUIProvider *)v16 promptForAccessCodeForAccessKey:v14 completion:v18];

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);
}

void __74__CDPUIController_cdpContext_promptForBeneficiaryAccessKeyWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v7 = WeakRetained;
  if (WeakRetained)
  {
    id v8 = (void *)*((void *)WeakRetained + 11);
    *((void *)WeakRetained + 11) = 0;

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (id)_remoteSecretControllerForDevice:(id)a3
{
  id v4 = a3;
  id v5 = [[CDPRemoteSecretEntryViewController alloc] initWithDevice:v4 validator:self->_remoteSecretValidator delegate:self];

  id v6 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:&stru_26C9EBCA0 target:0 set:0 get:0 detail:0 cell:13 edit:0];
  [v6 setEditPaneClass:objc_opt_class()];
  [v6 setProperty:self forKey:*MEMORY[0x263F60318]];
  [(DevicePINController *)v5 setSpecifier:v6];

  return v5;
}

- (void)_presentRemoteSecretControllerWithNewestDevice:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  remoteSecretValidator = self->_remoteSecretValidator;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __66__CDPUIController__presentRemoteSecretControllerWithNewestDevice___block_invoke;
  v7[3] = &unk_26433CFE8;
  objc_copyWeak(&v10, &location);
  id v6 = v4;
  id v8 = v6;
  id v9 = self;
  [(CDPRemoteDeviceSecretValidator *)remoteSecretValidator supportedEscapeOfferMaskCompletion:v7];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __66__CDPUIController__presentRemoteSecretControllerWithNewestDevice___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    if (!WeakRetained[17])
    {
      id v6 = _CDPLogSystem();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
        __66__CDPUIController__presentRemoteSecretControllerWithNewestDevice___block_invoke_cold_2(v6, v7, v8, v9, v10, v11, v12, v13);
      }
    }
    if (*(void *)(a1 + 32))
    {
      uint64_t v14 = objc_msgSend(v5, "_remoteSecretControllerForNewestDevice:");
      id v15 = [v5 _escapeOfferForDevice:*(void *)(a1 + 32) withMask:a2];
      [v14 setEscapeOffer:v15];
      uint64_t v16 = v5;
      id v17 = v14;
LABEL_8:
      [v16 _presentRootController:v17 completion:0];

LABEL_21:
      goto LABEL_22;
    }
    if ((a2 & 0x80) != 0)
    {
      uint64_t v14 = [v5 _piggybackingViewControllerWithSupportedEscapeOfferMask:a2];
      [v5 _presentRootController:v14 completion:0];
      id v21 = (void *)v5[17];
      if (!v21) {
        goto LABEL_21;
      }
      uint64_t v22 = 128;
    }
    else if ((a2 & 0x20) != 0)
    {
      uint64_t v14 = [v5 recoveryKeyEntryControllerForCircleJoinWithCancel:1 supportedEscapeOfferMask:a2];
      [v5 _presentRootController:v14 completion:0];
      id v21 = (void *)v5[17];
      uint64_t v22 = 32;
    }
    else
    {
      if ((a2 & 0x40) == 0)
      {
        id v18 = _CDPLogSystem();
        id v19 = v18;
        if ((a2 & 0x100) == 0)
        {
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
            __66__CDPUIController__presentRemoteSecretControllerWithNewestDevice___block_invoke_cold_1();
          }

          id v20 = *(void **)(*(void *)(a1 + 40) + 24);
          uint64_t v14 = _CDPStateError();
          [v20 cancelValidationWithError:v14];
          goto LABEL_21;
        }
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)id v25 = 0;
          _os_log_impl(&dword_2187CF000, v19, OS_LOG_TYPE_DEFAULT, "End of CDP recovery factors, falling back to EDP state repair", v25, 2u);
        }

        id v23 = [[CDPUIEDPRecoveryTokenFlowCoordinator alloc] initWithValidator:v5[3] rpdLedger:v5[17] cdpContext:v5[7] showCancel:1 delegate:v5];
        [v5 setEdpRecoveryTokenFlowCoordinator:v23];

        id v24 = [v5 edpRecoveryTokenFlowCoordinator];
        [v24 setEnteredAfterFailedCDPRecovery:1];

        uint64_t v14 = [v5 edpRecoveryTokenFlowCoordinator];
        id v15 = [v14 firstViewController];
        uint64_t v16 = v5;
        id v17 = v15;
        goto LABEL_8;
      }
      uint64_t v14 = [v5 _custodianAskHelpViewControllerWithSupportedEscapeOfferMask:a2];
      [v5 _presentRootController:v14 completion:0];
      id v21 = (void *)v5[17];
      uint64_t v22 = 64;
    }
    [v21 insert:v22];
    goto LABEL_21;
  }
LABEL_22:
}

- (void)cdpContext:(id)a3 promptForAdoptionOfMultipleICSC:(id)a4
{
  id v5 = a4;
  id v6 = (void *)MEMORY[0x263F82400];
  uint64_t v7 = CDPLocalizedString();
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __62__CDPUIController_cdpContext_promptForAdoptionOfMultipleICSC___block_invoke;
  v16[3] = &unk_26433D010;
  id v8 = v5;
  id v17 = v8;
  uint64_t v9 = [v6 actionWithTitle:v7 style:0 handler:v16];

  uint64_t v10 = (void *)MEMORY[0x263F82418];
  uint64_t v11 = CDPLocalizedString();
  uint64_t v12 = CDPLocalizedString();
  uint64_t v13 = [v10 alertControllerWithTitle:v11 message:v12 preferredStyle:1];

  [v13 addAction:v9];
  uint64_t v14 = _CDPLogSystem();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
    -[CDPUIController cdpContext:promptForAdoptionOfMultipleICSC:](self, v14);
  }

  id v15 = [(CDPUIBaseController *)self presentingViewController];
  [v15 presentViewController:v13 animated:1 completion:0];
}

uint64_t __62__CDPUIController_cdpContext_promptForAdoptionOfMultipleICSC___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, void))(result + 16))(result, 1, 0);
  }
  return result;
}

- (void)approveFromAnotherDevice:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = _CDPLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 67109120;
    BOOL v17 = v3;
    _os_log_impl(&dword_2187CF000, v5, OS_LOG_TYPE_DEFAULT, "Trying to approve from another device, with cancel support: %{BOOL}d", buf, 8u);
  }

  id v6 = [CDPWaitingApprovalViewController alloc];
  uint64_t v7 = [(CDPUIController *)self _escapeOfferForMultiApprovalWithMask:[(CDPRemoteDeviceSecretValidator *)self->_remoteSecretValidator supportedEscapeOfferMask]];
  id v8 = [(CDPWaitingApprovalViewController *)v6 initWithEscapeOffer:v7];

  if (v3)
  {
    uint64_t v9 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:1 target:self action:sel_cancelRemoteApprovalTapped_];
    uint64_t v10 = [(CDPWaitingApprovalViewController *)v8 navigationItem];
    [v10 setLeftBarButtonItem:v9];
  }
  uint64_t v11 = _CDPLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_2187CF000, v11, OS_LOG_TYPE_DEFAULT, "Starting remote approval flow", buf, 2u);
  }

  [(UINavigationController *)self->_navController pushViewController:v8 animated:1];
  [(CDPUIController *)self sendRemoteApprovalStartedBreadCrumbEventWithContext:self->_activeContext];
  remoteSecretValidator = self->_remoteSecretValidator;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __44__CDPUIController_approveFromAnotherDevice___block_invoke;
  v14[3] = &unk_26433D038;
  void v14[4] = self;
  id v15 = v8;
  uint64_t v13 = v8;
  [(CDPRemoteDeviceSecretValidator *)remoteSecretValidator approveFromAnotherDeviceWithCompletion:v14];
}

uint64_t __44__CDPUIController_approveFromAnotherDevice___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v3 = a2;
  uint64_t result = [*(id *)(a1 + 32) sendRemoteApprovalCompletedEventWithContext:*(void *)(*(void *)(a1 + 32) + 56) didApprove:a2 error:a3];
  if (v3)
  {
    [*(id *)(a1 + 40) remoteApprovalSucceeded];
    id v6 = *(void **)(a1 + 32);
    return [v6 _dismissPresentedViewControllerCompletion:0];
  }
  return result;
}

- (void)devicePicker:(id)a3 didSelectDevice:(id)a4
{
  id v7 = a4;
  if ([MEMORY[0x263F34400] isICSCHarmonizationEnabled])
  {
    [(CDPUIController *)self _presentSwiftUIRemoteSecretPromptWithDevice:v7 didSelectDevice:1];
  }
  else
  {
    id v5 = [(CDPUIController *)self _remoteSecretControllerForDevice:v7];
    [v5 setHidesCancelButton:1];
    id v6 = [(CDPUIController *)self _escapeOfferForDevice:v7 withMask:[(CDPRemoteDeviceSecretValidator *)self->_remoteSecretValidator supportedEscapeOfferMask]];
    [v5 setEscapeOffer:v6];

    [(UINavigationController *)self->_navController pushViewController:v5 animated:1];
  }
}

- (id)devicePicker:(id)a3 escapeOffersForDevices:(id)a4
{
  remoteSecretValidator = self->_remoteSecretValidator;
  id v7 = a4;
  id v8 = a3;
  uint64_t v9 = [(CDPUIController *)self _escapeOffersForgotAllWithMask:[(CDPRemoteDeviceSecretValidator *)remoteSecretValidator supportedEscapeOfferMask] presenter:v8 devices:v7];

  return v9;
}

- (void)remoteSecretEntry:(id)a3 didAcceptValidRemoteSecretForDevice:(id)a4
{
  if (![(CDPUIController *)self forceInlinePresentation])
  {
    [(CDPUIController *)self _dismissPresentedViewControllerCompletion:0];
  }
}

- (void)cancelledRemoteSecretEntry:(id)a3
{
  if (self->_rootViewController == a3)
  {
    [(CDPRemoteDeviceSecretValidator *)self->_remoteSecretValidator cancelApproveFromAnotherDevice];
    if (![(CDPUIController *)self forceInlinePresentation]) {
      [(CDPUIController *)self _dismissPresentedViewControllerCompletion:0];
    }
    remoteSecretValidator = self->_remoteSecretValidator;
    _CDPStateError();
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    [(CDPRemoteDeviceSecretValidator *)remoteSecretValidator cancelValidationWithError:v5];
  }
}

- (void)performRecoveryKeyRecovery:(id)a3
{
  id v4 = a3;
  remoteSecretValidator = self->_remoteSecretValidator;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __46__CDPUIController_performRecoveryKeyRecovery___block_invoke;
  v7[3] = &unk_26433D088;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(CDPRemoteDeviceSecretValidator *)remoteSecretValidator supportedEscapeOfferMaskCompletion:v7];
}

void __46__CDPUIController_performRecoveryKeyRecovery___block_invoke(uint64_t a1, uint64_t a2)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __46__CDPUIController_performRecoveryKeyRecovery___block_invoke_2;
  block[3] = &unk_26433D060;
  uint64_t v2 = *(void **)(a1 + 40);
  void block[4] = *(void *)(a1 + 32);
  uint64_t v5 = a2;
  id v4 = v2;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __46__CDPUIController_performRecoveryKeyRecovery___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) recoveryKeyEntryControllerForCircleJoinWithCancel:1 supportedEscapeOfferMask:*(void *)(a1 + 48)];
  [*(id *)(a1 + 32) _replaceViewController:*(void *)(a1 + 40) withNewController:v2];
  [*(id *)(*(void *)(a1 + 32) + 136) insert:32];
}

- (void)performCustodianRecovery:(id)a3
{
  id v4 = a3;
  uint64_t v5 = _CDPLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_2187CF000, v5, OS_LOG_TYPE_DEFAULT, "User elected to start Custodian Flow, Showing OS picker", buf, 2u);
  }

  remoteSecretValidator = self->_remoteSecretValidator;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __44__CDPUIController_performCustodianRecovery___block_invoke;
  v8[3] = &unk_26433D088;
  void v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [(CDPRemoteDeviceSecretValidator *)remoteSecretValidator supportedEscapeOfferMaskCompletion:v8];
}

void __44__CDPUIController_performCustodianRecovery___block_invoke(uint64_t a1, uint64_t a2)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __44__CDPUIController_performCustodianRecovery___block_invoke_2;
  block[3] = &unk_26433D060;
  id v2 = *(void **)(a1 + 40);
  void block[4] = *(void *)(a1 + 32);
  uint64_t v5 = a2;
  id v4 = v2;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __44__CDPUIController_performCustodianRecovery___block_invoke_2(uint64_t a1)
{
  id v2 = (void *)[objc_alloc(MEMORY[0x263F34358]) initWithContext:*(void *)(*(void *)(a1 + 32) + 56)];
  int v3 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __44__CDPUIController_performCustodianRecovery___block_invoke_3;
  v5[3] = &unk_26433D0B0;
  v5[4] = v3;
  uint64_t v4 = *(void *)(a1 + 48);
  id v6 = *(id *)(a1 + 40);
  [v3 custodianOSSelectionViewControllerWithCustodianController:v2 supportedEscapeOfferMask:v4 completion:v5];
}

uint64_t __44__CDPUIController_performCustodianRecovery___block_invoke_3(uint64_t result, uint64_t a2)
{
  if (a2)
  {
    uint64_t v2 = result;
    [*(id *)(result + 32) _replaceViewController:*(void *)(result + 40) withNewController:a2];
    int v3 = *(void **)(*(void *)(v2 + 32) + 136);
    return [v3 insert:64];
  }
  return result;
}

- (void)performPiggybackingRecovery:(id)a3
{
  id v4 = a3;
  remoteSecretValidator = self->_remoteSecretValidator;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __47__CDPUIController_performPiggybackingRecovery___block_invoke;
  v7[3] = &unk_26433D088;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(CDPRemoteDeviceSecretValidator *)remoteSecretValidator supportedEscapeOfferMaskCompletion:v7];
}

void __47__CDPUIController_performPiggybackingRecovery___block_invoke(uint64_t a1, uint64_t a2)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __47__CDPUIController_performPiggybackingRecovery___block_invoke_2;
  block[3] = &unk_26433D060;
  uint64_t v2 = *(void **)(a1 + 40);
  void block[4] = *(void *)(a1 + 32);
  uint64_t v5 = a2;
  id v4 = v2;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __47__CDPUIController_performPiggybackingRecovery___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _piggybackingViewControllerWithSupportedEscapeOfferMask:*(void *)(a1 + 48)];
  [*(id *)(a1 + 32) _replaceViewController:*(void *)(a1 + 40) withNewController:v2];
  [*(id *)(*(void *)(a1 + 32) + 136) insert:128];
}

- (void)performRemoteApproval:(id)a3
{
}

- (void)performAccountReset:(id)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __39__CDPUIController_performAccountReset___block_invoke;
  v3[3] = &unk_26433CC58;
  v3[4] = self;
  [(CDPUIController *)self dismissRecoveryFlow:a3 reason:@"com.apple.CoreCDPUI.CDPEnrollmentCompleted" completion:v3];
}

uint64_t __39__CDPUIController_performAccountReset___block_invoke(uint64_t a1)
{
  id v2 = _CDPLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v14 = 0;
    _os_log_impl(&dword_2187CF000, v2, OS_LOG_TYPE_DEFAULT, "UI dismissed, resetting account state", v14, 2u);
  }

  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 136);
  if (!v4)
  {
    uint64_t v5 = _CDPLogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      __39__CDPUIController_performAccountReset___block_invoke_cold_1(v5, v6, v7, v8, v9, v10, v11, v12);
    }

    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = *(void **)(v3 + 136);
  }
  return objc_msgSend(*(id *)(v3 + 24), "resetAccountCDPStateWithEscapeOptionsOffered:", objc_msgSend(v4, "escapeOffersPresented"));
}

- (void)finishValidation:(id)a3 withError:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __46__CDPUIController_finishValidation_withError___block_invoke;
  v8[3] = &unk_26433CC30;
  void v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  [(CDPUIController *)self dismissRecoveryFlow:a3 reason:@"com.apple.CoreCDPUI.CDPEnrollmentCancelled" completion:v8];
}

uint64_t __46__CDPUIController_finishValidation_withError___block_invoke(uint64_t a1)
{
  id v2 = _CDPLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_2187CF000, v2, OS_LOG_TYPE_DEFAULT, "UI dismissed, cancelling validation", v4, 2u);
  }

  return [*(id *)(*(void *)(a1 + 32) + 24) cancelValidationWithError:*(void *)(a1 + 40)];
}

- (void)dismissRecoveryFlow:(id)a3 completion:(id)a4
{
}

- (void)dismissRecoveryFlow:(id)a3 reason:(id)a4 completion:(id)a5
{
}

- (void)exceededMaximumAttemptsForRemoteSecretEntry:(id)a3
{
}

- (BOOL)performingAccountRecovery
{
  return 0;
}

- (void)remoteSecretEntry:(id)a3 depletedRemainingAttemptsForDevice:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(NSArray *)self->_devices aaf_arrayByRemovingObject:v7];
  devices = self->_devices;
  self->_devices = v8;

  objc_initWeak(&location, self);
  remoteSecretValidator = self->_remoteSecretValidator;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __72__CDPUIController_remoteSecretEntry_depletedRemainingAttemptsForDevice___block_invoke;
  v13[3] = &unk_26433CFE8;
  objc_copyWeak(&v16, &location);
  id v11 = v7;
  id v14 = v11;
  id v12 = v6;
  id v15 = v12;
  [(CDPRemoteDeviceSecretValidator *)remoteSecretValidator supportedEscapeOfferMaskCompletion:v13];

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

void __72__CDPUIController_remoteSecretEntry_depletedRemainingAttemptsForDevice___block_invoke(id *a1, void *a2)
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __72__CDPUIController_remoteSecretEntry_depletedRemainingAttemptsForDevice___block_invoke_2;
  v4[3] = &unk_26433D0D8;
  objc_copyWeak(v7, a1 + 6);
  id v5 = a1[4];
  id v6 = a1[5];
  v7[1] = a2;
  dispatch_async(MEMORY[0x263EF83A0], v4);

  objc_destroyWeak(v7);
}

void __72__CDPUIController_remoteSecretEntry_depletedRemainingAttemptsForDevice___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained _handleDepletedRemainingAttemptsForDevice:*(void *)(a1 + 32) fromViewController:*(void *)(a1 + 40) mask:*(void *)(a1 + 56)];
    id WeakRetained = v3;
  }
}

- (void)_handleDepletedRemainingAttemptsForDevice:(id)a3 fromViewController:(id)a4 mask:(unint64_t)a5
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  if ([(NSArray *)self->_devices count])
  {
    uint64_t v10 = _CDPLogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_2187CF000, v10, OS_LOG_TYPE_DEFAULT, "Device limit reached, but other devices are available, show device selection screen", buf, 2u);
    }

    uint64_t v11 = [(CDPUIController *)self _deviceLimitOfferDeviceSelectionForDevice:v8 fromViewController:v9];
    goto LABEL_18;
  }
  if ((a5 & 0x80) != 0)
  {
    uint64_t v11 = [(CDPUIController *)self _deviceLimitOfferPiggybackingForDevice:v8 supportedEscapeOfferMask:a5];
    goto LABEL_18;
  }
  if ((a5 & 0x20) != 0)
  {
    int v12 = [MEMORY[0x263F34400] isICSCHarmonizationEnabled];
    if ((a5 & 0x40) != 0 && v12)
    {
      uint64_t v11 = [(CDPUIController *)self _deviceLimitOfferRecoveryKeyAndCustodianForDevice:v8 supportedEscapeOfferMask:a5];
    }
    else
    {
      uint64_t v11 = [(CDPUIController *)self _deviceLimitOfferRecoveryKeyForDevice:v8 supportedEscapeOfferMask:a5];
    }
    goto LABEL_18;
  }
  if ((a5 & 0x40) != 0)
  {
    uint64_t v11 = [(CDPUIController *)self _deviceLimitOfferCustodianForDevice:v8 supportedEscapeOfferMask:a5];
    goto LABEL_18;
  }
  if ((a5 & 0x100) != 0)
  {
    uint64_t v11 = [(CDPUIController *)self _deviceLimitOfferEDPRecoveryTokenForDevice:v8 supportedEscapeOfferMask:a5];
    goto LABEL_18;
  }
  if ((a5 & 8) == 0)
  {
    uint64_t v11 = [(CDPUIController *)self _deviceLimitOfferSkipForDevice:v8];
LABEL_18:
    uint64_t v13 = (void *)v11;
    goto LABEL_19;
  }
  id v14 = [MEMORY[0x263F343B8] builderForKey:@"REMOTE_SECRET_ENTRY_INCORRECT_TITLE"];
  id v15 = objc_msgSend(v14, "addSecretType:", objc_msgSend(v8, "localSecretType"));
  uint64_t v42 = [v15 localizedString];

  int v16 = [MEMORY[0x263F34400] isICSCHarmonizationEnabled];
  BOOL v17 = NSString;
  if (v16) {
    uint64_t v18 = @"REMOTE_SECRET_ENTRY_HARD_LIMIT_ALERT_SUBTITLE_NO_RECOVERY_RPD";
  }
  else {
    uint64_t v18 = @"REMOTE_SECRET_RECOVERY_HARD_LIMIT_LAST_DEVICE_RESET";
  }
  id v19 = [MEMORY[0x263F343B8] builderForKey:v18];
  id v20 = objc_msgSend(v19, "addSecretType:", objc_msgSend(v8, "localSecretType"));
  id v21 = [v20 localizedString];
  uint64_t v22 = [v8 localizedName];
  id v23 = [v17 stringWithValidatedFormat:v21, @"%@", 0, v22 validFormatSpecifiers error];

  if ([MEMORY[0x263F34400] isICSCHarmonizationEnabled])
  {
    uint64_t v13 = [(CDPUIController *)self _iCSCSkipOrDeleteiCloudDataEscapeOfferWithTitle:v42 message:v23 skipButtonTitle:&stru_26C9EBCA0 supportedEscapeOfferMask:a5 withDevice:v8];
    id v24 = [MEMORY[0x263F343B8] builderForKey:@"WALRUS_ALERT_BUTTON_TITLE_DELETE_ICLOUD_DATA" inTable:@"Localizable-Walrus"];
    id v25 = [v24 localizedString];
    v26 = [v13 escapeOptions];
    id v27 = [v26 firstObject];
    [v27 setTitle:v25];

    if ([MEMORY[0x263F34400] shouldCentralizeRPDFlow])
    {
      ledger = self->_ledger;
      if (!ledger)
      {
        id v29 = _CDPLogSystem();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT)) {
          -[CDPUIController _handleDepletedRemainingAttemptsForDevice:fromViewController:mask:](v29, v30, v31, v32, v33, v34, v35, v36);
        }

        ledger = self->_ledger;
      }
      if (([(CDPRPDLedger *)ledger canOfferRPD] & 1) == 0)
      {
        char v37 = _CDPLogSystem();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v38 = [(CDPRPDLedger *)self->_ledger rpdBlockingError];
          *(_DWORD *)long long buf = 138412290;
          id v44 = v38;
          _os_log_impl(&dword_2187CF000, v37, OS_LOG_TYPE_DEFAULT, "Cannot offer RPD. Reason: %@", buf, 0xCu);
        }
        uint64_t v39 = [(CDPUIController *)self _deviceLimitOfferSkipForDevice:v8];

        uint64_t v13 = (void *)v39;
      }
    }
    v40 = (void *)v42;
  }
  else
  {
    id v41 = CDPLocalizedString();
    v40 = (void *)v42;
    uint64_t v13 = [(CDPUIController *)self _skipOrDeleteiCloudDataEscapeOfferWithTitle:v42 message:v23 skipButtonTitle:v41 supportedEscapeOfferMask:a5];
  }
LABEL_19:
  [v13 setPresentingViewController:self->_navController];
  [v13 handleEscapeAction:self];
}

- (void)_beginDevicePickerFlowFromEntryController:(id)a3
{
  id v4 = (UIViewController *)a3;
  id v5 = _CDPLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_2187CF000, v5, OS_LOG_TYPE_DEFAULT, "Trying another device", buf, 2u);
  }

  id v6 = [MEMORY[0x263F202A8] analyticsEventWithContext:self->_activeContext eventName:*MEMORY[0x263F34548] category:*MEMORY[0x263F34830]];
  id v7 = [MEMORY[0x263F34338] rtcAnalyticsReporter];
  [v7 sendEvent:v6];

  if (self->_rootViewController == v4)
  {
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __61__CDPUIController__beginDevicePickerFlowFromEntryController___block_invoke;
    v9[3] = &unk_26433D100;
    void v9[4] = self;
    uint64_t v10 = v4;
    [(CDPUIController *)self _setupDevicePickerController:v9];
  }
  else
  {
    [(CDPDevicePickerViewController *)self->_devicePicker setDevices:self->_devices];
    id v8 = [(UINavigationController *)self->_navController popViewControllerAnimated:1];
  }
}

uint64_t __61__CDPUIController__beginDevicePickerFlowFromEntryController___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _replaceViewController:*(void *)(a1 + 40) withNewController:a2];
}

- (void)_replaceViewController:(id)a3 withNewController:(id)a4
{
  id v13 = a4;
  navController = self->_navController;
  id v7 = (UIViewController *)a3;
  id v8 = [(UINavigationController *)navController viewControllers];
  id v9 = (void *)[v8 mutableCopy];

  objc_msgSend(v9, "replaceObjectAtIndex:withObject:", objc_msgSend(v9, "indexOfObject:", v7), v13);
  rootViewController = self->_rootViewController;

  if (rootViewController == v7)
  {
    uint64_t v11 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:1 target:self action:sel_cancelTapped_];
    int v12 = [v13 navigationItem];
    [v12 setLeftBarButtonItem:v11];
  }
  [(UINavigationController *)self->_navController setViewControllers:v9 animated:1];
}

- (id)_escapeOfferForDevice:(id)a3 withMask:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [[CDPRemoteValidationEscapeOffer alloc] initWithCDPContext:self->_activeContext];
  id v8 = [MEMORY[0x263F343B8] builderForKey:@"REMOTE_SECRET_ENTRY_FORGOT_HATCH"];
  id v9 = [v6 modelClass];
  uint64_t v10 = [v8 addDeviceClass:v9];
  uint64_t v11 = objc_msgSend(v10, "addSecretType:", objc_msgSend(v6, "localSecretType"));
  int v12 = [v11 localizedString];
  [(CDPRemoteValidationEscapeOffer *)v7 setEscapeOfferName:v12];

  id v13 = [MEMORY[0x263F343B8] builderForKey:@"REMOTE_SECRET_ENTRY_FORGOT_TITLE"];
  id v14 = objc_msgSend(v13, "addSecretType:", objc_msgSend(v6, "localSecretType"));
  id v15 = [v14 localizedString];
  [(CDPRemoteValidationEscapeOffer *)v7 setTitle:v15];

  int v16 = [(CDPUIController *)self _escapeOfferMessageForDevice:v6 withMask:a4];
  [(CDPRemoteValidationEscapeOffer *)v7 setMessage:v16];

  if ([(CDPUIController *)self _isSOSCompatibilityCFUForSingleICSC])
  {
    BOOL v17 = CDPLocalizedString();
    [(CDPRemoteValidationEscapeOffer *)v7 setTitle:v17];

    uint64_t v18 = NSString;
    id v19 = [MEMORY[0x263F343B8] builderForKey:@"REMOTE_SECRET_ENTRY_SOS_SINGLE_ICSC_ESCAPE_OFFER_MESSAGE"];
    id v20 = objc_msgSend(v19, "addSecretType:", objc_msgSend(v6, "localSecretType"));
    id v21 = [v20 localizedString];
    uint64_t v22 = [v6 localizedName];
    id v23 = [v18 stringWithValidatedFormat:v21, @"%@", 0, v22 validFormatSpecifiers error];
    [(CDPRemoteValidationEscapeOffer *)v7 setMessage:v23];
  }
  if ((a4 & 2) != 0 && [(NSArray *)self->_devices count] >= 2)
  {
    id v24 = [(CDPUIController *)self _chooseDeviceEscapeOption];
LABEL_18:
    uint64_t v33 = v24;
    [v24 setStyle:4];
LABEL_19:
    [(CDPRemoteValidationEscapeOffer *)v7 addEscapeOptionsObject:v33];

    goto LABEL_20;
  }
  if ((a4 & 0x80) != 0)
  {
    id v24 = [(CDPUIController *)self _beginPiggybackingRecoveryEscapeOptionWithSupportedEscapeOfferMask:a4];
    goto LABEL_18;
  }
  if ((a4 & 0x20) != 0)
  {
    id v24 = [(CDPUIController *)self _recoveryKeyEscapeOptionWithSupportedEscapeOfferMask:a4];
    goto LABEL_18;
  }
  if ((a4 & 0x40) != 0)
  {
    id v24 = [(CDPUIController *)self _beginCustodianRecoveryEscapeOptionWithSupportedEscapeOfferMask:a4];
    goto LABEL_18;
  }
  if ((a4 & 0x100) != 0)
  {
    id v24 = [(CDPUIController *)self _beginEDPRecoveryTokenEscapeOptionsWithSupportedEscapeOfferMask:a4];
    goto LABEL_18;
  }
  if ((a4 & 4) != 0 && self->_offeringRemoteApproval)
  {
    NSUInteger v25 = [(NSArray *)self->_devices count];
    v26 = NSString;
    if (v25 == 1)
    {
      id v27 = [MEMORY[0x263F343B8] builderForKey:@"REMOTE_SECRET_ENTRY_SOS_SINGLE_ICSC_ESCAPE_OFFER_MESSAGE_REMOTE_APPROVAL"];
      id v28 = objc_msgSend(v27, "addSecretType:", objc_msgSend(v6, "localSecretType"));
      id v29 = [v28 localizedString];
      uint64_t v30 = [v6 localizedName];
      uint64_t v31 = [v26 stringWithValidatedFormat:v29, @"%@", 0, v30 validFormatSpecifiers error];
      [(CDPRemoteValidationEscapeOffer *)v7 setMessage:v31];

      uint64_t v32 = [(CDPUIController *)self _remoteApprovalEscapeOption];
      [(CDPRemoteValidationEscapeOffer *)v7 addEscapeOptionsObject:v32];
    }
    else
    {
      uint64_t v52 = [MEMORY[0x263F343B8] builderForKey:@"REMOTE_SECRET_ENTRY_SOS_MULTI_ICSC_ESCAPE_OFFER_MESSAGE_CHOOSE_DEVICE"];
      double v53 = objc_msgSend(v52, "addSecretType:", objc_msgSend(v6, "localSecretType"));
      v54 = [v53 localizedString];
      dispatch_time_t v55 = [v6 localizedName];
      id v56 = [v26 stringWithValidatedFormat:v54, @"%@", 0, v55 validFormatSpecifiers error];
      [(CDPRemoteValidationEscapeOffer *)v7 setMessage:v56];

      uint64_t v32 = _CDPLogSystem();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG)) {
        -[CDPUIController _escapeOfferForDevice:withMask:]();
      }
    }

    uint64_t v33 = +[CDPEscapeOption cancelOption];
    goto LABEL_19;
  }
  if ((a4 & 0x18) != 0)
  {
    uint64_t v40 = [(NSArray *)self->_devices prevailingLocalSecretType];
    id v41 = [MEMORY[0x263F343B8] builderForKey:@"DATA_RECOVERY_DEVICE_SELECTION_SKIP_TITLE"];
    uint64_t v42 = [v41 addSecretType:v40];
    id v58 = [v42 localizedString];

    id v43 = [MEMORY[0x263F343B8] builderForKey:@"DATA_RECOVERY_DEVICE_SELECTION_SKIP_MESSAGE"];
    id v44 = [v43 addSecretType:v40];
    id v57 = [v44 localizedString];

    uint64_t v45 = CDPLocalizedString();
    v46 = [(CDPUIController *)self _skipOrDeleteiCloudDataEscapeOfferWithTitle:v58 message:v57 skipButtonTitle:v45 supportedEscapeOfferMask:a4];

    v47 = [MEMORY[0x263F343B8] builderForKey:@"REMOTE_SECRET_ENTRY_FORGOT_HATCH"];
    id v48 = [v6 modelClass];
    v49 = [v47 addDeviceClass:v48];
    v50 = objc_msgSend(v49, "addSecretType:", objc_msgSend(v6, "localSecretType"));
    v51 = [v50 localizedString];
    [(CDPRemoteValidationEscapeOffer *)v46 setEscapeOfferName:v51];

    id v7 = v46;
  }
LABEL_20:
  uint64_t v34 = [(CDPRemoteValidationEscapeOffer *)v7 escapeOptions];
  uint64_t v35 = [v34 count];

  if (v35)
  {
    if (self->_isWalrusEnabled)
    {
LABEL_26:
      uint64_t v38 = v7;
      goto LABEL_27;
    }
    uint64_t v36 = [(CDPContext *)self->_activeContext telemetryDeviceSessionID];
    [(CDPRemoteValidationEscapeOffer *)v7 setDeviceSessionID:v36];

    char v37 = [(CDPContext *)self->_activeContext telemetryFlowID];
    [(CDPRemoteValidationEscapeOffer *)v7 setFlowID:v37];
LABEL_25:

    goto LABEL_26;
  }
  if ([(CDPUIController *)self _isSOSCompatibilityCFUForSingleICSC])
  {
    char v37 = +[CDPEscapeOption okOption];
    [(CDPRemoteValidationEscapeOffer *)v7 addEscapeOptionsObject:v37];
    goto LABEL_25;
  }
  uint64_t v38 = 0;
LABEL_27:

  return v38;
}

- (BOOL)_isSOSCompatibilityCFUForSingleICSC
{
  return [(CDPContext *)self->_activeContext keychainSyncSystem] == 1
      && [(NSArray *)self->_devices count] < 2;
}

- (void)sendEscapeOfferSelectedEvent:(id)a3
{
  id v3 = (void *)MEMORY[0x263F202A8];
  activeContext = self->_activeContext;
  uint64_t v5 = *MEMORY[0x263F34600];
  uint64_t v6 = *MEMORY[0x263F34830];
  id v7 = a3;
  id v9 = [v3 analyticsEventWithContext:activeContext eventName:v5 category:v6];
  [v9 setObject:v7 forKeyedSubscript:*MEMORY[0x263F345F8]];

  id v8 = [MEMORY[0x263F34338] rtcAnalyticsReporter];
  [v8 sendEvent:v9];
}

- (id)_chooseDeviceEscapeOption
{
  objc_initWeak(&location, self);
  id v2 = objc_alloc_init(CDPEscapeOption);
  id v3 = CDPLocalizedString();
  [(CDPEscapeOption *)v2 setTitle:v3];

  [(CDPEscapeOption *)v2 setTitleLocalizationKey:@"REMOTE_SECRET_ENTRY_FORGOT_CODE_DIALOG_CHOOSE_DEVICE"];
  [(CDPEscapeOption *)v2 setTitleTelemetryKey:*MEMORY[0x263F34890]];
  uint64_t v5 = MEMORY[0x263EF8330];
  uint64_t v6 = 3221225472;
  id v7 = __44__CDPUIController__chooseDeviceEscapeOption__block_invoke;
  id v8 = &unk_26433D150;
  objc_copyWeak(&v9, &location);
  [(CDPEscapeOption *)v2 setEscapeAction:&v5];
  -[CDPEscapeOption setStyle:](v2, "setStyle:", 3, v5, v6, v7, v8);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

  return v2;
}

void __44__CDPUIController__chooseDeviceEscapeOption__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained sendEscapeOfferSelectedEvent:*MEMORY[0x263F34890]];
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __44__CDPUIController__chooseDeviceEscapeOption__block_invoke_2;
    v3[3] = &unk_26433D128;
    v3[4] = v2;
    [v2 _setupDevicePickerController:v3];
  }
}

uint64_t __44__CDPUIController__chooseDeviceEscapeOption__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(a1 + 32) + 32) pushViewController:a2 animated:1];
}

- (id)_escapeOfferMessageForDevice:(id)a3 withMask:(unint64_t)a4
{
  id v5 = a3;
  uint64_t v6 = [(NSArray *)self->_devices prevailingLocalSecretType];
  if (objc_msgSend(MEMORY[0x263F34350], "isSubsetOfContextTypeSignIn:", -[CDPContext type](self->_activeContext, "type")))
  {
    id v7 = objc_alloc_init(MEMORY[0x263F34408]);
    id v25 = 0;
    uint64_t v8 = [v7 walrusStatus:&v25];
    id v9 = v25;
    uint64_t v10 = v9;
    if (v8 == 1)
    {
      int v11 = [(CDPContext *)self->_activeContext isAttemptingBackupRestore];
      int v12 = NSString;
      if (v11)
      {
        id v13 = [MEMORY[0x263F343B8] builderForKey:@"REMOTE_SECRET_ENTRY_FORGOT_CODE_DIALOG_MESSAGE_WALRUS_BUDDY_BACKUP" inTable:@"Localizable-Walrus"];
        id v14 = objc_msgSend(v13, "addSecretType:", objc_msgSend(v5, "localSecretType"));
        id v15 = [v5 modelClass];
        int v16 = [v14 addDeviceClass:v15];
        BOOL v17 = [v16 localizedString];
        uint64_t v18 = [v5 localizedName];
        id v19 = [v12 stringWithValidatedFormat:v17, @"%@", 0, v18 validFormatSpecifiers error];
      }
      else
      {
        id v13 = [MEMORY[0x263F343B8] builderForKey:@"REMOTE_SECRET_ENTRY_FORGOT_CODE_DIALOG_MESSAGE_WALRUS_SIGNIN" inTable:@"Localizable-Walrus"];
        id v14 = objc_msgSend(v13, "addSecretType:", objc_msgSend(v5, "localSecretType"));
        id v15 = [v14 localizedString];
        int v16 = [v5 localizedName];
        id v19 = [v12 stringWithValidatedFormat:v15, @"%@", 0, v16 validFormatSpecifiers error];
      }

      goto LABEL_14;
    }
  }
  if ([(NSArray *)self->_devices count] == 1)
  {
    int v20 = objc_msgSend(MEMORY[0x263F34350], "isSubsetOfContextTypeRepair:", -[CDPContext type](self->_activeContext, "type"));
    id v21 = NSString;
    if (v20) {
      uint64_t v22 = @"REMOTE_SECRET_ENTRY_FORGOT_CODE_DIALOG_MESSAGE_RESET";
    }
    else {
      uint64_t v22 = @"REMOTE_SECRET_ENTRY_FORGOT_CODE_DIALOG_MESSAGE";
    }
    id v7 = [MEMORY[0x263F343B8] builderForKey:v22];
    uint64_t v10 = objc_msgSend(v7, "addSecretType:", objc_msgSend(v5, "localSecretType"));
    id v13 = [v10 localizedString];
    id v14 = [v5 localizedName];
    id v19 = [v21 stringWithValidatedFormat:v13, @"%@", 0, v14 validFormatSpecifiers error];
    goto LABEL_15;
  }
  id v23 = NSString;
  id v7 = [MEMORY[0x263F343B8] builderForKey:@"REMOTE_SECRET_ENTRY_FORGOT_CODE_DIALOG_MESSAGE_ANOTHER_DEVICE"];
  uint64_t v10 = objc_msgSend(v7, "addSecretType:", objc_msgSend(v5, "localSecretType"));
  id v13 = [v10 addSecretType:v6];
  id v14 = [v13 localizedString];
  id v15 = [v5 localizedName];
  id v19 = [v23 stringWithValidatedFormat:v14, @"%@", 0, v15 validFormatSpecifiers error];
LABEL_14:

LABEL_15:

  return v19;
}

- (id)_tryAgainLaterEscapeOption
{
  id v3 = objc_alloc_init(CDPEscapeOption);
  if (([MEMORY[0x263F34400] isICSCHarmonizationEnabled] & 1) == 0) {
    [(CDPEscapeOption *)v3 setStyle:1];
  }
  id v4 = CDPLocalizedString();
  [(CDPEscapeOption *)v3 setTitle:v4];

  [(CDPEscapeOption *)v3 setTitleLocalizationKey:@"REMOTE_SECRET_RECOVERY_LIMIT_TRY_AGAIN_LATER"];
  [(CDPEscapeOption *)v3 setTitleTelemetryKey:*MEMORY[0x263F34948]];
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __45__CDPUIController__tryAgainLaterEscapeOption__block_invoke;
  v6[3] = &unk_26433D178;
  objc_copyWeak(&v7, &location);
  void v6[4] = self;
  [(CDPEscapeOption *)v3 setEscapeAction:v6];
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);

  return v3;
}

void __45__CDPUIController__tryAgainLaterEscapeOption__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained tryAgainLaterTapped:*(void *)(a1 + 32)];
}

- (id)_deviceLimitOfferDeviceSelectionForDevice:(id)a3 fromViewController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [[CDPRemoteValidationEscapeOffer alloc] initWithCDPContext:self->_activeContext];
  id v9 = [MEMORY[0x263F343B8] builderForKey:@"REMOTE_SECRET_ENTRY_INCORRECT_TITLE"];
  uint64_t v10 = objc_msgSend(v9, "addSecretType:", objc_msgSend(v6, "localSecretType"));
  int v11 = [v10 localizedString];
  [(CDPRemoteValidationEscapeOffer *)v8 setTitle:v11];

  if ([MEMORY[0x263F34400] isICSCHarmonizationEnabled])
  {
    int v12 = [(CDPContext *)self->_activeContext idmsRecovery];
    id v13 = NSString;
    id v14 = (void *)MEMORY[0x263F343B8];
    if (v12) {
      id v15 = @"RECOVERY_REMOTE_SECRET_ENTRY_HARD_LIMIT_ALERT_SUBTITLE_OTHER_ICSC";
    }
    else {
      id v15 = @"REMOTE_SECRET_ENTRY_HARD_LIMIT_ALERT_SUBTITLE_OTHER_ICSC";
    }
  }
  else
  {
    id v13 = NSString;
    id v14 = (void *)MEMORY[0x263F343B8];
    id v15 = @"REMOTE_SECRET_RECOVERY_HARD_LIMIT_CHOOSE_DEVICE";
  }
  int v16 = [v14 builderForKey:v15];
  BOOL v17 = objc_msgSend(v16, "addSecretType:", objc_msgSend(v6, "localSecretType"));
  uint64_t v18 = [v17 localizedString];
  id v19 = [v6 localizedName];
  int v20 = [v13 stringWithValidatedFormat:v18, @"%@", 0, v19 validFormatSpecifiers error];
  [(CDPRemoteValidationEscapeOffer *)v8 setMessage:v20];

  objc_initWeak(&location, self);
  id v21 = objc_alloc_init(CDPEscapeOption);
  uint64_t v22 = CDPLocalizedString();
  [(CDPEscapeOption *)v21 setTitle:v22];

  [(CDPEscapeOption *)v21 setStyle:3];
  [(CDPEscapeOption *)v21 setTitleTelemetryKey:*MEMORY[0x263F34890]];
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __80__CDPUIController__deviceLimitOfferDeviceSelectionForDevice_fromViewController___block_invoke;
  v26[3] = &unk_26433D178;
  objc_copyWeak(&v28, &location);
  id v23 = v7;
  id v27 = v23;
  [(CDPEscapeOption *)v21 setEscapeAction:v26];
  [(CDPRemoteValidationEscapeOffer *)v8 addEscapeOptionsObject:v21];
  id v24 = [(CDPUIController *)self _tryAgainLaterEscapeOption];
  [(CDPRemoteValidationEscapeOffer *)v8 addEscapeOptionsObject:v24];

  objc_destroyWeak(&v28);
  objc_destroyWeak(&location);

  return v8;
}

void __80__CDPUIController__deviceLimitOfferDeviceSelectionForDevice_fromViewController___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _beginDevicePickerFlowFromEntryController:*(void *)(a1 + 32)];
}

- (id)_deviceLimitOfferPiggybackingForDevice:(id)a3 supportedEscapeOfferMask:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [[CDPRemoteValidationEscapeOffer alloc] initWithCDPContext:self->_activeContext];
  uint64_t v8 = [MEMORY[0x263F343B8] builderForKey:@"REMOTE_SECRET_ENTRY_INCORRECT_TITLE"];
  id v9 = objc_msgSend(v8, "addSecretType:", objc_msgSend(v6, "localSecretType"));
  uint64_t v10 = [v9 localizedString];
  [(CDPRemoteValidationEscapeOffer *)v7 setTitle:v10];

  int v11 = [MEMORY[0x263F34400] isICSCHarmonizationEnabled];
  int v12 = NSString;
  if (v11)
  {
    id v13 = [MEMORY[0x263F343B8] builderForKey:@"REMOTE_SECRET_ENTRY_HARD_LIMIT_ALERT_SUBTITLE_TRUSTED_DEVICES"];
    id v14 = objc_msgSend(v13, "addSecretType:", objc_msgSend(v6, "localSecretType"));
    id v15 = [v14 localizedString];
    int v16 = [v6 localizedName];
    BOOL v17 = [v12 stringWithValidatedFormat:v15, @"%@", 0, v16 validFormatSpecifiers error];
    [(CDPRemoteValidationEscapeOffer *)v7 setMessage:v17];
  }
  else
  {
    id v13 = [MEMORY[0x263F343B8] builderForKey:@"PIGGYBACKING_RECOVERY_HELP_PROMPT_MESSAGE"];
    id v14 = objc_msgSend(v13, "addSecretType:", objc_msgSend(v6, "localSecretType"));
    id v15 = [v14 localizedString];
    int v16 = [v6 localizedName];
    BOOL v17 = [v6 localizedName];
    uint64_t v18 = [v12 stringWithValidatedFormat:v15, @"%@%@", 0, v16, v17 validFormatSpecifiers error];
    [(CDPRemoteValidationEscapeOffer *)v7 setMessage:v18];
  }
  id v19 = [(CDPUIController *)self _beginPiggybackingRecoveryEscapeOptionWithSupportedEscapeOfferMask:a4];
  [v19 setStyle:3];
  if ([MEMORY[0x263F34400] isICSCHarmonizationEnabled])
  {
    int v20 = [MEMORY[0x263F343B8] builderForKey:@"REMOTE_SECRET_ENTRY_ALERT_PIGGYBACKING"];
    id v21 = [v20 localizedString];
    [v19 setTitle:v21];

    [v19 setTitleLocalizationKey:@"REMOTE_SECRET_ENTRY_ALERT_PIGGYBACKING"];
  }
  [(CDPRemoteValidationEscapeOffer *)v7 addEscapeOptionsObject:v19];
  uint64_t v22 = [(CDPUIController *)self _tryAgainLaterEscapeOption];
  [(CDPRemoteValidationEscapeOffer *)v7 addEscapeOptionsObject:v22];

  return v7;
}

- (id)_deviceLimitOfferRecoveryKeyForDevice:(id)a3 supportedEscapeOfferMask:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [[CDPRemoteValidationEscapeOffer alloc] initWithCDPContext:self->_activeContext];
  uint64_t v8 = [MEMORY[0x263F343B8] builderForKey:@"REMOTE_SECRET_ENTRY_INCORRECT_TITLE"];
  id v9 = objc_msgSend(v8, "addSecretType:", objc_msgSend(v6, "localSecretType"));
  uint64_t v10 = [v9 localizedString];
  [(CDPRemoteValidationEscapeOffer *)v7 setTitle:v10];

  int v11 = [(CDPUIController *)self _recoveryKeyEscapeOptionWithSupportedEscapeOfferMask:a4];
  if ([MEMORY[0x263F34400] isICSCHarmonizationEnabled])
  {
    int v12 = [(CDPContext *)self->_activeContext idmsRecovery];
    id v13 = NSString;
    if (v12) {
      id v14 = @"RECOVERY_REMOTE_SECRET_ENTRY_HARD_LIMIT_ALERT_SUBTITLE_RK";
    }
    else {
      id v14 = @"REMOTE_SECRET_ENTRY_HARD_LIMIT_ALERT_SUBTITLE_RK";
    }
    id v21 = [MEMORY[0x263F343B8] builderForKey:v14];
    uint64_t v22 = objc_msgSend(v21, "addSecretType:", objc_msgSend(v6, "localSecretType"));
    id v23 = [v22 localizedString];
    id v24 = [v6 localizedName];
    id v25 = [v13 stringWithValidatedFormat:v23, @"%@", 0, v24 validFormatSpecifiers error];
    [(CDPRemoteValidationEscapeOffer *)v7 setMessage:v25];

    [v11 setStyle:3];
  }
  else
  {
    id v15 = NSString;
    int v16 = [MEMORY[0x263F343B8] builderForKey:@"REMOTE_SECRET_RECOVERY_HARD_LIMIT_LAST_DEVICE_RECOVERY_KEY"];
    BOOL v17 = objc_msgSend(v16, "addSecretType:", objc_msgSend(v6, "localSecretType"));
    uint64_t v18 = [v17 localizedString];
    id v19 = [v6 localizedName];
    int v20 = [v15 stringWithValidatedFormat:v18, @"%@", 0, v19 validFormatSpecifiers error];
    [(CDPRemoteValidationEscapeOffer *)v7 setMessage:v20];
  }
  [(CDPRemoteValidationEscapeOffer *)v7 addEscapeOptionsObject:v11];
  v26 = [(CDPUIController *)self _tryAgainLaterEscapeOption];
  [(CDPRemoteValidationEscapeOffer *)v7 addEscapeOptionsObject:v26];

  return v7;
}

- (id)_deviceLimitOfferCustodianForDevice:(id)a3 supportedEscapeOfferMask:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [[CDPRemoteValidationEscapeOffer alloc] initWithCDPContext:self->_activeContext];
  uint64_t v8 = [MEMORY[0x263F343B8] builderForKey:@"REMOTE_SECRET_ENTRY_INCORRECT_TITLE"];
  id v9 = objc_msgSend(v8, "addSecretType:", objc_msgSend(v6, "localSecretType"));
  uint64_t v10 = [v9 localizedString];
  [(CDPRemoteValidationEscapeOffer *)v7 setTitle:v10];

  int v11 = [(CDPUIController *)self _beginCustodianRecoveryEscapeOptionWithSupportedEscapeOfferMask:a4];
  if ([MEMORY[0x263F34400] isICSCHarmonizationEnabled])
  {
    int v12 = [(CDPContext *)self->_activeContext idmsRecovery];
    id v13 = NSString;
    if (v12) {
      id v14 = @"RECOVERY_REMOTE_SECRET_ENTRY_HARD_LIMIT_ALERT_SUBTITLE_RC";
    }
    else {
      id v14 = @"REMOTE_SECRET_ENTRY_HARD_LIMIT_ALERT_SUBTITLE_RC";
    }
    id v21 = [MEMORY[0x263F343B8] builderForKey:v14];
    uint64_t v22 = objc_msgSend(v21, "addSecretType:", objc_msgSend(v6, "localSecretType"));
    id v23 = [v22 localizedString];
    id v24 = [v6 localizedName];
    id v25 = [v13 stringWithValidatedFormat:v23, @"%@", 0, v24 validFormatSpecifiers error];
    [(CDPRemoteValidationEscapeOffer *)v7 setMessage:v25];

    [v11 setStyle:3];
  }
  else
  {
    id v15 = NSString;
    int v16 = [MEMORY[0x263F343B8] builderForKey:@"REMOTE_SECRET_RECOVERY_HARD_LIMIT_LAST_DEVICE_CUSTODIAN"];
    BOOL v17 = objc_msgSend(v16, "addSecretType:", objc_msgSend(v6, "localSecretType"));
    uint64_t v18 = [v17 localizedString];
    id v19 = [v6 localizedName];
    int v20 = [v15 stringWithValidatedFormat:v18, @"%@", 0, v19 validFormatSpecifiers error];
    [(CDPRemoteValidationEscapeOffer *)v7 setMessage:v20];
  }
  [(CDPRemoteValidationEscapeOffer *)v7 addEscapeOptionsObject:v11];
  v26 = [(CDPUIController *)self _tryAgainLaterEscapeOption];
  [(CDPRemoteValidationEscapeOffer *)v7 addEscapeOptionsObject:v26];

  return v7;
}

- (id)_deviceLimitOfferRecoveryKeyAndCustodianForDevice:(id)a3 supportedEscapeOfferMask:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [[CDPRemoteValidationEscapeOffer alloc] initWithCDPContext:self->_activeContext];
  uint64_t v8 = [MEMORY[0x263F343B8] builderForKey:@"REMOTE_SECRET_ENTRY_INCORRECT_TITLE"];
  id v9 = objc_msgSend(v8, "addSecretType:", objc_msgSend(v6, "localSecretType"));
  uint64_t v10 = [v9 localizedString];
  [(CDPRemoteValidationEscapeOffer *)v7 setTitle:v10];

  int v11 = [(CDPContext *)self->_activeContext idmsRecovery];
  int v12 = NSString;
  if (v11) {
    id v13 = @"RECOVERY_REMOTE_SECRET_ENTRY_HARD_LIMIT_ALERT_SUBTITLE_RK_AND_RC";
  }
  else {
    id v13 = @"REMOTE_SECRET_ENTRY_HARD_LIMIT_ALERT_SUBTITLE_RK_AND_RC";
  }
  id v14 = [MEMORY[0x263F343B8] builderForKey:v13];
  id v15 = objc_msgSend(v14, "addSecretType:", objc_msgSend(v6, "localSecretType"));
  int v16 = [v15 localizedString];
  BOOL v17 = [v6 localizedName];
  uint64_t v18 = [v12 stringWithValidatedFormat:v16, @"%@", 0, v17 validFormatSpecifiers error];
  [(CDPRemoteValidationEscapeOffer *)v7 setMessage:v18];

  id v19 = [(CDPUIController *)self _recoveryMethodEscapeOptionWithSupportedEscapeOfferMask:a4];
  [v19 setStyle:3];
  [(CDPRemoteValidationEscapeOffer *)v7 addEscapeOptionsObject:v19];
  int v20 = [(CDPUIController *)self _tryAgainLaterEscapeOption];
  [(CDPRemoteValidationEscapeOffer *)v7 addEscapeOptionsObject:v20];

  return v7;
}

- (id)_deviceLimitOfferEDPRecoveryTokenForDevice:(id)a3 supportedEscapeOfferMask:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [[CDPRemoteValidationEscapeOffer alloc] initWithCDPContext:self->_activeContext];
  uint64_t v8 = [MEMORY[0x263F343B8] builderForKey:@"REMOTE_SECRET_ENTRY_INCORRECT_TITLE"];
  id v9 = objc_msgSend(v8, "addSecretType:", objc_msgSend(v6, "localSecretType"));
  uint64_t v10 = [v9 localizedString];
  [(CDPRemoteValidationEscapeOffer *)v7 setTitle:v10];

  int v11 = [(CDPUIController *)self _beginEDPRecoveryTokenEscapeOptionsWithSupportedEscapeOfferMask:a4];
  int v12 = NSString;
  id v13 = [MEMORY[0x263F343B8] builderForKey:@"REMOTE_SECRET_ENTRY_HARD_LIMIT_ALERT_SUBTITLE_EDP_RECOVERY_TOKEN" inTable:@"Localizable-EDP"];
  id v14 = objc_msgSend(v13, "addSecretType:", objc_msgSend(v6, "localSecretType"));
  id v15 = [v14 localizedString];
  int v16 = [v6 localizedName];

  BOOL v17 = [v12 stringWithValidatedFormat:v15, @"%@", 0, v16 validFormatSpecifiers error];
  [(CDPRemoteValidationEscapeOffer *)v7 setMessage:v17];

  [(CDPRemoteValidationEscapeOffer *)v7 addEscapeOptionsObject:v11];
  uint64_t v18 = [(CDPUIController *)self _tryAgainLaterEscapeOption];
  [(CDPRemoteValidationEscapeOffer *)v7 addEscapeOptionsObject:v18];

  return v7;
}

- (id)_deviceLimitOfferSkipForDevice:(id)a3
{
  id v4 = a3;
  id v5 = [[CDPRemoteValidationEscapeOffer alloc] initWithCDPContext:self->_activeContext];
  id v6 = [MEMORY[0x263F343B8] builderForKey:@"REMOTE_SECRET_ENTRY_INCORRECT_TITLE"];
  id v7 = objc_msgSend(v6, "addSecretType:", objc_msgSend(v4, "localSecretType"));
  uint64_t v8 = [v7 localizedString];
  [(CDPRemoteValidationEscapeOffer *)v5 setTitle:v8];

  id v9 = [(CDPUIController *)self _tryAgainLaterEscapeOption];
  int v10 = [MEMORY[0x263F34400] isICSCHarmonizationEnabled];
  int v11 = NSString;
  if (v10)
  {
    int v12 = [MEMORY[0x263F343B8] builderForKey:@"REMOTE_SECRET_ENTRY_HARD_LIMIT_ALERT_SUBTITLE_NO_RECOVERY_METHOD"];
    id v13 = objc_msgSend(v12, "addSecretType:", objc_msgSend(v4, "localSecretType"));
    id v14 = [v13 localizedString];
    id v15 = [v4 localizedName];
    int v16 = [v11 stringWithValidatedFormat:v14, @"%@", 0, v15 validFormatSpecifiers error];
    [(CDPRemoteValidationEscapeOffer *)v5 setMessage:v16];

    [v9 setStyle:3];
  }
  else
  {
    BOOL v17 = [MEMORY[0x263F343B8] builderForKey:@"REMOTE_SECRET_RECOVERY_HARD_LIMIT_LAST_DEVICE_SKIP"];
    uint64_t v18 = objc_msgSend(v17, "addSecretType:", objc_msgSend(v4, "localSecretType"));
    id v19 = [v18 localizedString];
    int v20 = [v4 localizedName];
    id v21 = [v11 stringWithValidatedFormat:v19, @"%@", 0, v20 validFormatSpecifiers error];
    [(CDPRemoteValidationEscapeOffer *)v5 setMessage:v21];
  }
  objc_initWeak(&location, self);
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __50__CDPUIController__deviceLimitOfferSkipForDevice___block_invoke;
  v23[3] = &unk_26433D150;
  objc_copyWeak(&v24, &location);
  [v9 setEscapeAction:v23];
  [(CDPRemoteValidationEscapeOffer *)v5 addEscapeOptionsObject:v9];
  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);

  return v5;
}

void __50__CDPUIController__deviceLimitOfferSkipForDevice___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained tryAgainLaterTapped:WeakRetained];
}

- (id)_escapeOfferForMultiApprovalWithMask:(unint64_t)a3
{
  id v5 = [(CDPUIController *)self _waitingForApprovalEscapeOffer];
  if (objc_msgSend(MEMORY[0x263F34350], "isSubsetOfContextTypeRepair:", -[CDPContext type](self->_activeContext, "type")))id v6 = @"WAITING_APPROVAL_RESET_DIALOG_MESSAGE_REPAIR"; {
  else
  }
    id v6 = @"WAITING_APPROVAL_RESET_DIALOG_MESSAGE";
  id v7 = [MEMORY[0x263F343B8] builderForKey:v6];
  uint64_t v8 = [(CDPUIController *)self _localDeviceClass];
  id v9 = [v7 addDeviceClass:v8];
  int v10 = [v9 localizedString];
  [v5 setMessage:v10];

  if ((a3 & 0x10) != 0)
  {
    int v16 = [(CDPUIController *)self _enterSecretLaterEscapeOptionWithSecret:1];
    BOOL v17 = [MEMORY[0x263F343B8] builderForKey:@"WAITING_APPROVAL_RESET_DIALOG_BUTTON_LATER"];
    uint64_t v18 = [v17 localizedString];
    [v16 setTitle:v18];

    [v16 setStyle:3];
    [v5 addEscapeOptionsObject:v16];

    if ((a3 & 8) == 0)
    {
LABEL_6:
      if ((a3 & 0x40) == 0) {
        goto LABEL_8;
      }
      goto LABEL_7;
    }
  }
  else if ((a3 & 8) == 0)
  {
    goto LABEL_6;
  }
  uint64_t v19 = [(NSArray *)self->_devices prevailingLocalSecretType];
  int v20 = [MEMORY[0x263F343B8] builderForKey:@"DATA_RECOVERY_DEVICE_SELECTION_SKIP_TITLE"];
  id v21 = [v20 addSecretType:v19];
  uint64_t v22 = [v21 localizedString];

  id v23 = [MEMORY[0x263F343B8] builderForKey:@"DATA_RECOVERY_DEVICE_SELECTION_SKIP_MESSAGE"];
  id v24 = [v23 addSecretType:v19];
  id v25 = [v24 localizedString];

  v26 = CDPLocalizedString();
  uint64_t v27 = [(CDPUIController *)self _skipOrDeleteiCloudDataEscapeOfferWithTitle:v22 message:v25 skipButtonTitle:v26 supportedEscapeOfferMask:a3];

  id v5 = (void *)v27;
  if ((a3 & 0x40) != 0)
  {
LABEL_7:
    int v11 = [(CDPUIController *)self _beginCustodianRecoveryEscapeOptionWithSupportedEscapeOfferMask:a3];
    [v5 addEscapeOptionsObject:v11];
  }
LABEL_8:
  int v12 = [v5 escapeOptions];
  uint64_t v13 = [v12 count];

  if (v13)
  {
    id v14 = +[CDPEscapeOption cancelOption];
    [v5 addEscapeOptionsObject:v14];

    id v15 = v5;
  }
  else
  {
    id v15 = 0;
  }

  return v15;
}

- (id)_escapeOfferForSingleApprovalWithMask:(unint64_t)a3
{
  if ((a3 & 8) != 0)
  {
    uint64_t v6 = [(NSArray *)self->_devices prevailingLocalSecretType];
    id v7 = [MEMORY[0x263F343B8] builderForKey:@"DATA_RECOVERY_DEVICE_SELECTION_SKIP_TITLE"];
    uint64_t v8 = [v7 addSecretType:v6];
    id v9 = [v8 localizedString];

    int v10 = [MEMORY[0x263F343B8] builderForKey:@"DATA_RECOVERY_DEVICE_SELECTION_SKIP_MESSAGE"];
    int v11 = [v10 addSecretType:v6];
    int v12 = [v11 localizedString];

    uint64_t v13 = CDPLocalizedString();
    id v4 = [(CDPUIController *)self _skipOrDeleteiCloudDataEscapeOfferWithTitle:v9 message:v12 skipButtonTitle:v13 supportedEscapeOfferMask:a3];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (void)dismissAndResetAccountCDPState:(id)a3 localSecret:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __62__CDPUIController_dismissAndResetAccountCDPState_localSecret___block_invoke;
  v11[3] = &unk_26433D1A0;
  v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v8 = v7;
  id v9 = v6;
  int v10 = self;
  [(CDPUIController *)v10 _dismissPresentedViewControllerWithReason:@"com.apple.CoreCDPUI.CDPEnrollmentCompleted" completion:v11];
}

uint64_t __62__CDPUIController_dismissAndResetAccountCDPState_localSecret___block_invoke(uint64_t a1)
{
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [*(id *)(*(void *)(a1 + 32) + 48) escapeOfferSelectedWithOption:*(void *)(a1 + 40)];
  }
  [*(id *)(a1 + 32) sendEscapeOfferSelectedEvent:*MEMORY[0x263F34918]];
  uint64_t v2 = *(void *)(a1 + 48);
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 24);
  uint64_t v5 = [*(id *)(v3 + 136) escapeOffersPresented];
  if (v2)
  {
    uint64_t v6 = *(void *)(a1 + 48);
    return [v4 resetAccountCDPStateWithEscapeOptionsOffered:v5 andSetSecret:v6];
  }
  else
  {
    return [v4 resetAccountCDPStateWithEscapeOptionsOffered:v5];
  }
}

- (id)_beginPiggybackingRecoveryEscapeOptionWithSupportedEscapeOfferMask:(unint64_t)a3
{
  objc_initWeak(&location, self);
  uint64_t v5 = objc_alloc_init(CDPEscapeOption);
  uint64_t v6 = [MEMORY[0x263F343B8] builderForKey:@"DATA_RECOVERY_PROX_PIGGYBACKING_DIALOG"];
  id v7 = [v6 localizedString];
  [(CDPEscapeOption *)v5 setTitle:v7];

  [(CDPEscapeOption *)v5 setTitleLocalizationKey:@"DATA_RECOVERY_PROX_PIGGYBACKING_DIALOG"];
  [(CDPEscapeOption *)v5 setTitleTelemetryKey:*MEMORY[0x263F348B0]];
  [(CDPEscapeOption *)v5 setStyle:4];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __86__CDPUIController__beginPiggybackingRecoveryEscapeOptionWithSupportedEscapeOfferMask___block_invoke;
  v9[3] = &unk_26433D1C8;
  objc_copyWeak(v10, &location);
  void v9[4] = self;
  v10[1] = (id)a3;
  [(CDPEscapeOption *)v5 setEscapeAction:v9];
  objc_destroyWeak(v10);
  objc_destroyWeak(&location);

  return v5;
}

void __86__CDPUIController__beginPiggybackingRecoveryEscapeOptionWithSupportedEscapeOfferMask___block_invoke(uint64_t a1)
{
  uint64_t v2 = _CDPLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v14[0] = 0;
    _os_log_impl(&dword_2187CF000, v2, OS_LOG_TYPE_DEFAULT, "User elected to start piggybacking flow", (uint8_t *)v14, 2u);
  }

  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    [*(id *)(a1 + 32) sendEscapeOfferSelectedEvent:*MEMORY[0x263F348B0]];
    id v4 = [*(id *)(a1 + 32) _piggybackingViewControllerWithSupportedEscapeOfferMask:*(void *)(a1 + 48)];
    [WeakRetained[4] pushViewController:v4 animated:1];
    id v5 = WeakRetained[17];
    if (v5)
    {
      [v5 insert:128];
    }
    else
    {
      uint64_t v6 = _CDPLogSystem();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
        __86__CDPUIController__beginPiggybackingRecoveryEscapeOptionWithSupportedEscapeOfferMask___block_invoke_cold_1(v6, v7, v8, v9, v10, v11, v12, v13);
      }
    }
  }
}

- (id)updateContextWithAuthResults:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x263F34350];
  id v5 = a3;
  uint64_t v6 = (void *)[[v4 alloc] initWithAuthenticationResults:v5];

  objc_msgSend(v6, "set_alwaysCreateEscrowRecord:", -[CDPContext _alwaysCreateEscrowRecord](self->_activeContext, "_alwaysCreateEscrowRecord"));
  objc_msgSend(v6, "setType:", -[CDPContext type](self->_activeContext, "type"));
  objc_msgSend(v6, "setSosCompatibilityType:", -[CDPContext sosCompatibilityType](self->_activeContext, "sosCompatibilityType"));
  objc_msgSend(v6, "setKeychainSyncSystem:", -[CDPContext keychainSyncSystem](self->_activeContext, "keychainSyncSystem"));
  objc_msgSend(v6, "setIsSOSCFUFlow:", -[CDPContext isSOSCFUFlow](self->_activeContext, "isSOSCFUFlow"));
  uint64_t v7 = [(CDPContext *)self->_activeContext telemetryFlowID];
  [v6 setTelemetryFlowID:v7];

  uint64_t v8 = [(CDPContext *)self->_activeContext telemetryDeviceSessionID];
  [v6 setTelemetryDeviceSessionID:v8];

  uint64_t v9 = [(CDPContext *)self->_activeContext password];
  uint64_t v10 = [(CDPContext *)self->_activeContext oldPassword];
  [v6 setNewPassword:v9 oldPassword:v10];

  uint64_t v11 = [(CDPContext *)self->_activeContext cachedLocalSecret];
  [v6 setCachedLocalSecret:v11];

  objc_msgSend(v6, "setCachedLocalSecretType:", -[CDPContext cachedLocalSecretType](self->_activeContext, "cachedLocalSecretType"));
  uint64_t v12 = [(CDPContext *)self->_activeContext sharingChannel];
  [v6 setSharingChannel:v12];

  return v6;
}

- (void)piggybackingUserDidNotGetACode:(unint64_t)a3
{
  objc_initWeak(&location, self);
  id v5 = [[CDPRemoteValidationEscapeOffer alloc] initWithCDPContext:self->_activeContext];
  uint64_t v6 = [MEMORY[0x263F343B8] builderForKey:@"DATA_RECOVERY_PROX_PIGGYBACKING_DID_NOT_GET_CODE_MESSAGE"];
  uint64_t v7 = [v6 localizedString];
  [(CDPRemoteValidationEscapeOffer *)v5 setMessage:v7];

  uint64_t v8 = [MEMORY[0x263F343B8] builderForKey:@"DATA_RECOVERY_PROX_PIGGYBACKING_DID_NOT_GET_CODE_TITLE"];
  uint64_t v9 = [v8 localizedString];
  [(CDPRemoteValidationEscapeOffer *)v5 setTitle:v9];

  uint64_t v10 = CDPLocalizedString();
  uint64_t v11 = [(CDPUIController *)self _piggybackingSendCodeEscapeOfferWithSupportedEscapeOffers:a3 title:v10 localizationKey:@"DATA_RECOVERY_PROX_PIGGYBACKING_RESEND_CODE_TO_MY_DEVICES_TITLE"];

  [(CDPRemoteValidationEscapeOffer *)v5 addEscapeOptionsObject:v11];
  uint64_t v12 = objc_alloc_init(CDPEscapeOption);
  uint64_t v13 = CDPLocalizedString();
  [(CDPEscapeOption *)v12 setTitle:v13];

  [(CDPEscapeOption *)v12 setTitleLocalizationKey:@"DATA_RECOVERY_PROX_PIGGYBACKING_CANT_GET_TO_MY_DEVICES_TITLE"];
  [(CDPEscapeOption *)v12 setStyle:4];
  [(CDPEscapeOption *)v12 setTitleTelemetryKey:*MEMORY[0x263F34860]];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __50__CDPUIController_piggybackingUserDidNotGetACode___block_invoke;
  v20[3] = &unk_26433D1C8;
  objc_copyWeak(v21, &location);
  v20[4] = self;
  v21[1] = (id)a3;
  [(CDPEscapeOption *)v12 setEscapeAction:v20];
  [(CDPRemoteValidationEscapeOffer *)v5 addEscapeOptionsObject:v12];
  id v14 = +[CDPEscapeOption cancelOption];
  [(CDPRemoteValidationEscapeOffer *)v5 addEscapeOptionsObject:v14];

  id v15 = [(UINavigationController *)self->_navController topViewController];
  [(CDPRemoteValidationEscapeOffer *)v5 setPresentingViewController:v15];

  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __50__CDPUIController_piggybackingUserDidNotGetACode___block_invoke_2;
  v17[3] = &unk_26433CC30;
  uint64_t v18 = v5;
  uint64_t v19 = self;
  int v16 = v5;
  dispatch_async(MEMORY[0x263EF83A0], v17);

  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
}

void __50__CDPUIController_piggybackingUserDidNotGetACode___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [*(id *)(a1 + 32) sendEscapeOfferSelectedEvent:*MEMORY[0x263F34860]];
  uint64_t v3 = _CDPLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    __50__CDPUIController_piggybackingUserDidNotGetACode___block_invoke_cold_1();
  }

  id v4 = [*(id *)(a1 + 32) _piggybackingEscapeOfferCantGetToDevicesWithSupportedEscapeOffers:*(void *)(a1 + 48)];
  id v5 = [*(id *)(*(void *)(a1 + 32) + 32) topViewController];
  [v4 setPresentingViewController:v5];

  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  id v7[2] = __50__CDPUIController_piggybackingUserDidNotGetACode___block_invoke_391;
  v7[3] = &unk_26433CC30;
  id v8 = v4;
  id v9 = WeakRetained;
  id v6 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v7);
}

uint64_t __50__CDPUIController_piggybackingUserDidNotGetACode___block_invoke_391(uint64_t a1)
{
  return [*(id *)(a1 + 32) handleEscapeAction:*(void *)(a1 + 40)];
}

uint64_t __50__CDPUIController_piggybackingUserDidNotGetACode___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) handleEscapeAction:*(void *)(a1 + 40)];
}

- (id)_piggybackingSendCodeEscapeOfferWithSupportedEscapeOffers:(unint64_t)a3 title:(id)a4 localizationKey:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  objc_initWeak(&location, self);
  uint64_t v10 = objc_alloc_init(CDPEscapeOption);
  [(CDPEscapeOption *)v10 setTitle:v8];
  [(CDPEscapeOption *)v10 setTitleLocalizationKey:v9];
  [(CDPEscapeOption *)v10 setTitleTelemetryKey:*MEMORY[0x263F34928]];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __99__CDPUIController__piggybackingSendCodeEscapeOfferWithSupportedEscapeOffers_title_localizationKey___block_invoke;
  v12[3] = &unk_26433D240;
  void v12[4] = self;
  objc_copyWeak(v13, &location);
  v13[1] = (id)a3;
  [(CDPEscapeOption *)v10 setEscapeAction:v12];
  objc_destroyWeak(v13);
  objc_destroyWeak(&location);

  return v10;
}

void __99__CDPUIController__piggybackingSendCodeEscapeOfferWithSupportedEscapeOffers_title_localizationKey___block_invoke(uint64_t a1)
{
  uint64_t v2 = _CDPLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_2187CF000, v2, OS_LOG_TYPE_DEFAULT, "User elected to send code, starting piggybacking based data recovery", buf, 2u);
  }

  [*(id *)(a1 + 32) sendEscapeOfferSelectedEvent:*MEMORY[0x263F34928]];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(v4 + 56);
    id v6 = [*(id *)(v4 + 32) topViewController];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __99__CDPUIController__piggybackingSendCodeEscapeOfferWithSupportedEscapeOffers_title_localizationKey___block_invoke_393;
    v9[3] = &unk_26433D218;
    uint64_t v7 = *(void *)(a1 + 48);
    uint64_t v8 = *(void *)(a1 + 32);
    void v9[4] = WeakRetained;
    void v9[5] = v8;
    v9[6] = v7;
    +[CDPUIAuthenticationHelper proxAuthenticationForContext:v5 viewController:v6 withCompletion:v9];
  }
}

void __99__CDPUIController__piggybackingSendCodeEscapeOfferWithSupportedEscapeOffers_title_localizationKey___block_invoke_393(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = *(id *)(a1 + 32);
  uint64_t v7 = v6;
  if (!a2 || v5)
  {
    id v9 = _CDPLogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __99__CDPUIController__piggybackingSendCodeEscapeOfferWithSupportedEscapeOffers_title_localizationKey___block_invoke_393_cold_1();
    }

    if ([v5 code] == -7035)
    {
      [v7 piggybackingUserDidNotGetACode:*(void *)(a1 + 48)];
    }
    else if ([v5 code] != -7064 && objc_msgSend(v5, "code") != -7003)
    {
      v13[0] = MEMORY[0x263EF8330];
      v13[1] = 3221225472;
      id v13[2] = __99__CDPUIController__piggybackingSendCodeEscapeOfferWithSupportedEscapeOffers_title_localizationKey___block_invoke_394;
      v13[3] = &unk_26433D060;
      id v14 = v5;
      id v15 = v7;
      uint64_t v16 = *(void *)(a1 + 48);
      dispatch_async(MEMORY[0x263EF83A0], v13);
    }
  }
  else
  {
    uint64_t v8 = [v6 updateContextWithAuthResults:a2];
    if ([v8 isPiggybackingRecovery])
    {
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __99__CDPUIController__piggybackingSendCodeEscapeOfferWithSupportedEscapeOffers_title_localizationKey___block_invoke_395;
      block[3] = &unk_26433CC58;
      void block[4] = *(void *)(a1 + 40);
      dispatch_async(MEMORY[0x263EF83A0], block);
      [v7 attemptToJoinCircleWithPiggybacking:v8 mask:*(void *)(a1 + 48)];
    }
    else
    {
      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 3221225472;
      v11[2] = __99__CDPUIController__piggybackingSendCodeEscapeOfferWithSupportedEscapeOffers_title_localizationKey___block_invoke_397;
      v11[3] = &unk_26433D1F0;
      uint64_t v10 = *(void *)(a1 + 48);
      v11[4] = v7;
      void v11[5] = v10;
      dispatch_async(MEMORY[0x263EF83A0], v11);
    }
  }
}

void __99__CDPUIController__piggybackingSendCodeEscapeOfferWithSupportedEscapeOffers_title_localizationKey___block_invoke_394(uint64_t a1)
{
  uint64_t v2 = _CDPLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __99__CDPUIController__piggybackingSendCodeEscapeOfferWithSupportedEscapeOffers_title_localizationKey___block_invoke_394_cold_1();
  }

  uint64_t v3 = [*(id *)(a1 + 40) _piggybackingSomethingWentWrong:*(void *)(a1 + 48)];
  [v3 handleEscapeAction:*(void *)(a1 + 40)];
}

void __99__CDPUIController__piggybackingSendCodeEscapeOfferWithSupportedEscapeOffers_title_localizationKey___block_invoke_395(uint64_t a1)
{
  objc_opt_class();
  id v2 = [*(id *)(*(void *)(a1 + 32) + 32) topViewController];
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  if (v3)
  {
    uint64_t v4 = _CDPLogSystem();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      __99__CDPUIController__piggybackingSendCodeEscapeOfferWithSupportedEscapeOffers_title_localizationKey___block_invoke_395_cold_1();
    }

    [v3 startSpinning];
  }
}

void __99__CDPUIController__piggybackingSendCodeEscapeOfferWithSupportedEscapeOffers_title_localizationKey___block_invoke_397(uint64_t a1)
{
  id v2 = _CDPLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __99__CDPUIController__piggybackingSendCodeEscapeOfferWithSupportedEscapeOffers_title_localizationKey___block_invoke_397_cold_1();
  }

  id v3 = [*(id *)(a1 + 32) _piggybackingHandleNonProxError:*(void *)(a1 + 40)];
  uint64_t v4 = [*(id *)(*(void *)(a1 + 32) + 32) topViewController];
  [v3 setPresentingViewController:v4];

  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  id v7[2] = __99__CDPUIController__piggybackingSendCodeEscapeOfferWithSupportedEscapeOffers_title_localizationKey___block_invoke_398;
  v7[3] = &unk_26433CC30;
  uint64_t v5 = *(void *)(a1 + 32);
  id v8 = v3;
  uint64_t v9 = v5;
  id v6 = v3;
  dispatch_async(MEMORY[0x263EF83A0], v7);
}

uint64_t __99__CDPUIController__piggybackingSendCodeEscapeOfferWithSupportedEscapeOffers_title_localizationKey___block_invoke_398(uint64_t a1)
{
  id v2 = _CDPLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __99__CDPUIController__piggybackingSendCodeEscapeOfferWithSupportedEscapeOffers_title_localizationKey___block_invoke_398_cold_1();
  }

  return [*(id *)(a1 + 32) handleEscapeAction:*(void *)(a1 + 40)];
}

- (id)_piggybackingHandleNonProxError:(unint64_t)a3
{
  uint64_t v5 = [[CDPRemoteValidationEscapeOffer alloc] initWithCDPContext:self->_activeContext];
  id v6 = [MEMORY[0x263F343B8] builderForKey:@"DATA_RECOVERY_PROX_PIGGYBACKING_NON_PROX_ERROR_MESSAGE"];
  uint64_t v7 = [v6 localizedString];
  [(CDPRemoteValidationEscapeOffer *)v5 setMessage:v7];

  id v8 = [MEMORY[0x263F343B8] builderForKey:@"DATA_RECOVERY_PROX_PIGGYBACKING_NON_PROX_ERROR_TITLE"];
  uint64_t v9 = [v8 localizedString];
  [(CDPRemoteValidationEscapeOffer *)v5 setTitle:v9];

  uint64_t v10 = CDPLocalizedString();
  uint64_t v11 = [(CDPUIController *)self _piggybackingSendCodeEscapeOfferWithSupportedEscapeOffers:a3 title:v10 localizationKey:@"DATA_RECOVERY_PROX_PIGGYBACKING_NON_PROX_ERROR_SEND_NEW_CODE_TITLE"];

  [(CDPRemoteValidationEscapeOffer *)v5 addEscapeOptionsObject:v11];
  uint64_t v12 = objc_alloc_init(CDPEscapeOption);
  uint64_t v13 = CDPLocalizedString();
  [(CDPEscapeOption *)v12 setTitle:v13];

  [(CDPEscapeOption *)v12 setTitleLocalizationKey:@"DATA_RECOVERY_PROX_PIGGYBACKING_CANT_GET_TO_MY_DEVICES_TITLE"];
  [(CDPEscapeOption *)v12 setStyle:4];
  [(CDPEscapeOption *)v12 setTitleTelemetryKey:*MEMORY[0x263F34860]];
  objc_initWeak(&location, self);
  uint64_t v15 = MEMORY[0x263EF8330];
  uint64_t v16 = 3221225472;
  BOOL v17 = __51__CDPUIController__piggybackingHandleNonProxError___block_invoke;
  uint64_t v18 = &unk_26433D1C8;
  objc_copyWeak(v20, &location);
  uint64_t v19 = self;
  v20[1] = (id)a3;
  [(CDPEscapeOption *)v12 setEscapeAction:&v15];
  -[CDPRemoteValidationEscapeOffer addEscapeOptionsObject:](v5, "addEscapeOptionsObject:", v12, v15, v16, v17, v18);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);

  return v5;
}

void __51__CDPUIController__piggybackingHandleNonProxError___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  [*(id *)(a1 + 32) sendEscapeOfferSelectedEvent:*MEMORY[0x263F34860]];
  id v3 = _CDPLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    __50__CDPUIController_piggybackingUserDidNotGetACode___block_invoke_cold_1();
  }

  uint64_t v4 = [WeakRetained _piggybackingEscapeOfferCantGetToDevicesWithSupportedEscapeOffers:*(void *)(a1 + 48)];
  uint64_t v5 = [WeakRetained[4] topViewController];
  [v4 setPresentingViewController:v5];

  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __51__CDPUIController__piggybackingHandleNonProxError___block_invoke_409;
  v8[3] = &unk_26433CC30;
  id v9 = v4;
  uint64_t v10 = WeakRetained;
  id v6 = WeakRetained;
  id v7 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v8);
}

uint64_t __51__CDPUIController__piggybackingHandleNonProxError___block_invoke_409(uint64_t a1)
{
  return [*(id *)(a1 + 32) handleEscapeAction:*(void *)(a1 + 40)];
}

- (void)attemptToJoinCircleWithPiggybacking:(id)a3 mask:(unint64_t)a4 validator:(id)a5
{
  objc_storeStrong((id *)&self->_remoteSecretValidator, a5);
  id v8 = a3;
  [(CDPUIController *)self attemptToJoinCircleWithPiggybacking:v8 mask:a4];
}

- (void)attemptToJoinCircleWithPiggybacking:(id)a3 mask:(unint64_t)a4
{
  id v6 = a3;
  objc_initWeak(&location, self);
  remoteSecretValidator = self->_remoteSecretValidator;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __60__CDPUIController_attemptToJoinCircleWithPiggybacking_mask___block_invoke;
  v8[3] = &unk_26433D268;
  objc_copyWeak(v9, &location);
  void v8[4] = self;
  v9[1] = (id)a4;
  [(CDPRemoteDeviceSecretValidator *)remoteSecretValidator attemptToJoinCircleWithPiggybacking:v6 withCompletion:v8];
  objc_destroyWeak(v9);
  objc_destroyWeak(&location);
}

void __60__CDPUIController_attemptToJoinCircleWithPiggybacking_mask___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __60__CDPUIController_attemptToJoinCircleWithPiggybacking_mask___block_invoke_2;
  block[3] = &unk_26433CC30;
  void block[4] = *(void *)(a1 + 32);
  id v7 = v5;
  id v18 = v7;
  dispatch_async(MEMORY[0x263EF83A0], block);
  if (a2)
  {
    id v8 = _CDPLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_2187CF000, v8, OS_LOG_TYPE_DEFAULT, "Piggybacking succeeded, safe to dismiss the view", buf, 2u);
    }

    [WeakRetained _dismissPresentedViewControllerCompletion:0];
  }
  else
  {
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __60__CDPUIController_attemptToJoinCircleWithPiggybacking_mask___block_invoke_410;
    v12[3] = &unk_26433D060;
    id v9 = v7;
    uint64_t v10 = *(void *)(a1 + 32);
    id v13 = v9;
    uint64_t v14 = v10;
    uint64_t v15 = *(void *)(a1 + 48);
    uint64_t v11 = (void *)MEMORY[0x263EF83A0];
    dispatch_async(MEMORY[0x263EF83A0], v12);
  }
}

void __60__CDPUIController_attemptToJoinCircleWithPiggybacking_mask___block_invoke_2(uint64_t a1)
{
  objc_opt_class();
  id v2 = [*(id *)(*(void *)(a1 + 32) + 32) topViewController];
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  if (v3)
  {
    uint64_t v4 = _CDPLogSystem();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      __60__CDPUIController_attemptToJoinCircleWithPiggybacking_mask___block_invoke_2_cold_1();
    }

    [v3 stopSpinning];
  }
}

void __60__CDPUIController_attemptToJoinCircleWithPiggybacking_mask___block_invoke_410(uint64_t a1)
{
  id v2 = _CDPLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __60__CDPUIController_attemptToJoinCircleWithPiggybacking_mask___block_invoke_410_cold_1();
  }

  id v3 = [*(id *)(a1 + 40) _piggybackingSomethingWentWrong:*(void *)(a1 + 48)];
  [v3 handleEscapeAction:*(void *)(a1 + 40)];
}

- (id)_piggybackingCantGetToMyDevices:(id)a3 message:(id)a4 skipButtonTitle:(id)a5 supportedEscapeOfferMask:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if ((a6 & 0x20) != 0)
  {
    id v13 = [[CDPRemoteValidationEscapeOffer alloc] initWithCDPContext:self->_activeContext];
    uint64_t v14 = [(CDPUIController *)self _recoveryKeyEscapeOptionWithSupportedEscapeOfferMask:a6];
LABEL_9:
    uint64_t v15 = v14;
    [v14 setStyle:4];
    [(CDPRemoteValidationEscapeOffer *)v13 addEscapeOptionsObject:v15];

    goto LABEL_10;
  }
  if ((a6 & 0x40) != 0)
  {
    id v13 = [[CDPRemoteValidationEscapeOffer alloc] initWithCDPContext:self->_activeContext];
    uint64_t v14 = [(CDPUIController *)self _beginCustodianRecoveryEscapeOptionWithSupportedEscapeOfferMask:a6];
    goto LABEL_9;
  }
  if ((a6 & 0x100) != 0)
  {
    id v13 = [[CDPRemoteValidationEscapeOffer alloc] initWithCDPContext:self->_activeContext];
    uint64_t v14 = [(CDPUIController *)self _beginEDPRecoveryTokenEscapeOptionsWithSupportedEscapeOfferMask:a6];
    goto LABEL_9;
  }
  if ((a6 & 8) != 0)
  {
    id v13 = [(CDPUIController *)self _skipOrDeleteiCloudDataEscapeOfferWithTitle:v10 message:v11 skipButtonTitle:v12 supportedEscapeOfferMask:a6];
  }
  else
  {
    id v13 = 0;
  }
LABEL_10:

  return v13;
}

- (id)_piggybackingEscapeOfferCantGetToDevicesWithSupportedEscapeOffers:(unint64_t)a3
{
  id v5 = CDPLocalizedString();
  id v6 = CDPLocalizedString();
  id v7 = CDPLocalizedString();
  id v8 = [(CDPUIController *)self _piggybackingCantGetToMyDevices:v5 message:v6 skipButtonTitle:v7 supportedEscapeOfferMask:a3];

  return v8;
}

- (id)_piggybackingViewControllerWithSupportedEscapeOfferMask:(unint64_t)a3
{
  id v5 = objc_alloc_init(CDPUIPiggybackingViewModel);
  [(CDPUIPiggybackingViewModel *)v5 setIconName:@"piggybacking_prox"];
  id v6 = CDPLocalizedString();
  [(CDPUIPiggybackingViewModel *)v5 setTitle:v6];

  id v7 = CDPLocalizedString();
  [(CDPUIPiggybackingViewModel *)v5 setMessage:v7];

  id v8 = CDPLocalizedString();
  id v9 = [(CDPUIController *)self _piggybackingSendCodeEscapeOfferWithSupportedEscapeOffers:a3 title:v8 localizationKey:@"DATA_RECOVERY_PROX_PIGGYBACKING_SEND_CODE_BUTTON_TITLE"];

  [(CDPUIPiggybackingViewModel *)v5 setSendCodeOption:v9];
  id v10 = [(CDPUIController *)self _piggybackingEscapeOfferCantGetToDevicesWithSupportedEscapeOffers:a3];
  id v11 = CDPLocalizedString();
  [v10 setEscapeOfferName:v11];

  [v10 setTitleTelemetryKey:*MEMORY[0x263F34860]];
  [(CDPUIPiggybackingViewModel *)v5 setCantGetToDeviceOption:v10];
  id v12 = [[CDPUIPiggybackingViewController alloc] initWithViewModel:v5 cdpContext:self->_activeContext];
  [v10 setPresentingViewController:v12];

  return v12;
}

- (id)_piggybackingSomethingWentWrong:(unint64_t)a3
{
  char v5 = ~(_BYTE)a3;
  id v6 = [[CDPRemoteValidationEscapeOffer alloc] initWithCDPContext:self->_activeContext];
  id v7 = CDPLocalizedString();
  [(CDPRemoteValidationEscapeOffer *)v6 setTitle:v7];

  id v8 = CDPLocalizedString();
  id v9 = [(CDPUIController *)self _piggybackingSendCodeEscapeOfferWithSupportedEscapeOffers:a3 title:v8 localizationKey:@"DATA_RECOVERY_PROX_PIGGYBACKING_SEND_NEW_CODE_BUTTON_TITLE"];

  [(CDPRemoteValidationEscapeOffer *)v6 addEscapeOptionsObject:v9];
  if ((v5 & 0x60) != 0)
  {
    if ((a3 & 0x20) != 0)
    {
      uint64_t v15 = CDPLocalizedString();
      [(CDPRemoteValidationEscapeOffer *)v6 setMessage:v15];

      id v11 = [(CDPUIController *)self _recoveryKeyEscapeOptionWithSupportedEscapeOfferMask:a3];
      goto LABEL_8;
    }
    if ((a3 & 0x40) == 0) {
      goto LABEL_9;
    }
    id v13 = CDPLocalizedString();
    [(CDPRemoteValidationEscapeOffer *)v6 setMessage:v13];

    id v11 = [(CDPUIController *)self _beginCustodianRecoveryEscapeOptionWithSupportedEscapeOfferMask:a3];
    id v12 = @"DATA_RECOVERY_PROX_PIGGYBACKING_USE_CUSTODIAN_RECOVERY_TITLE";
  }
  else
  {
    id v10 = CDPLocalizedString();
    [(CDPRemoteValidationEscapeOffer *)v6 setMessage:v10];

    id v11 = [(CDPUIController *)self _recoveryKeyEscapeOptionWithSupportedEscapeOfferMask:a3];
    id v12 = @"DATA_RECOVERY_PROX_PIGGYBACKING_USE_RECOVERY_METHOD_TITLE";
  }
  uint64_t v14 = CDPLocalizedString();
  [v11 setTitle:v14];

  [v11 setTitleLocalizationKey:v12];
LABEL_8:
  [v11 setStyle:4];
  [(CDPRemoteValidationEscapeOffer *)v6 addEscapeOptionsObject:v11];

LABEL_9:
  if ((a3 & 0x100) != 0)
  {
    BOOL v17 = CDPLocalizedStringInTable();
    [(CDPRemoteValidationEscapeOffer *)v6 setMessage:v17];

    uint64_t v16 = [(CDPUIController *)self _beginEDPRecoveryTokenEscapeOptionsWithSupportedEscapeOfferMask:a3];
    id v18 = CDPLocalizedStringInTable();
    [v16 setTitle:v18];

    [v16 setTitleLocalizationKey:@"USE_RECOVERY_TOKEN_BUTTON_TITLE"];
    [v16 setStyle:4];
    [(CDPRemoteValidationEscapeOffer *)v6 addEscapeOptionsObject:v16];
  }
  else
  {
    uint64_t v16 = CDPLocalizedString();
    [(CDPRemoteValidationEscapeOffer *)v6 setMessage:v16];
  }

  uint64_t v19 = [(CDPUIController *)self _tryAgainLaterEscapeOption];
  [(CDPRemoteValidationEscapeOffer *)v6 addEscapeOptionsObject:v19];

  int v20 = [(UINavigationController *)self->_navController topViewController];
  [(CDPRemoteValidationEscapeOffer *)v6 setPresentingViewController:v20];

  return v6;
}

- (id)_beginEDPRecoveryTokenEscapeOptionsWithSupportedEscapeOfferMask:(unint64_t)a3
{
  objc_initWeak(&location, self);
  id v3 = objc_alloc_init(CDPEscapeOption);
  uint64_t v4 = CDPLocalizedStringInTable();
  [(CDPEscapeOption *)v3 setTitle:v4];

  [(CDPEscapeOption *)v3 setTitleLocalizationKey:@"USE_RECOVERY_TOKEN_BUTTON_TITLE"];
  [(CDPEscapeOption *)v3 setStyle:4];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __83__CDPUIController__beginEDPRecoveryTokenEscapeOptionsWithSupportedEscapeOfferMask___block_invoke;
  v6[3] = &unk_26433D150;
  objc_copyWeak(&v7, &location);
  [(CDPEscapeOption *)v3 setEscapeAction:v6];
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);

  return v3;
}

void __83__CDPUIController__beginEDPRecoveryTokenEscapeOptionsWithSupportedEscapeOfferMask___block_invoke(uint64_t a1)
{
  id v2 = _CDPLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v9 = 0;
    _os_log_impl(&dword_2187CF000, v2, OS_LOG_TYPE_DEFAULT, "EDP user elected to start the recovery token entry Flow, Showing Use Recovery token View", v9, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v4 = [[CDPUIEDPRecoveryTokenFlowCoordinator alloc] initWithValidator:WeakRetained[3] rpdLedger:WeakRetained[17] cdpContext:WeakRetained[7] showCancel:0 delegate:WeakRetained];
    [WeakRetained setEdpRecoveryTokenFlowCoordinator:v4];

    char v5 = [WeakRetained edpRecoveryTokenFlowCoordinator];
    [v5 setEnteredAfterFailedCDPRecovery:1];

    id v6 = (void *)WeakRetained[4];
    id v7 = [WeakRetained edpRecoveryTokenFlowCoordinator];
    id v8 = [v7 firstViewController];
    [v6 pushViewController:v8 animated:1];
  }
}

- (id)_beginCustodianRecoveryEscapeOptionWithSupportedEscapeOfferMask:(unint64_t)a3
{
  objc_initWeak(&location, self);
  char v5 = objc_alloc_init(CDPEscapeOption);
  if ([MEMORY[0x263F34400] isICSCHarmonizationEnabled])
  {
    id v6 = [MEMORY[0x263F343B8] builderForKey:@"REMOTE_SECRET_ENTRY_ALERT_USE_RECOVERY_CONTACT"];
    id v7 = [v6 localizedString];
    [(CDPEscapeOption *)v5 setTitle:v7];
    id v8 = @"REMOTE_SECRET_ENTRY_ALERT_USE_RECOVERY_CONTACT";
  }
  else
  {
    id v6 = [MEMORY[0x263F343B8] builderForKey:@"REMOTE_SECRET_ENTRY_FORGOT_CODE_DIALOG_CUSTODIAN"];
    id v7 = [v6 localizedString];
    [(CDPEscapeOption *)v5 setTitle:v7];
    id v8 = @"REMOTE_SECRET_ENTRY_FORGOT_CODE_DIALOG_CUSTODIAN";
  }

  [(CDPEscapeOption *)v5 setTitleLocalizationKey:v8];
  [(CDPEscapeOption *)v5 setTitleTelemetryKey:*MEMORY[0x263F348B8]];
  [(CDPEscapeOption *)v5 setStyle:4];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  id v10[2] = __83__CDPUIController__beginCustodianRecoveryEscapeOptionWithSupportedEscapeOfferMask___block_invoke;
  v10[3] = &unk_26433D1C8;
  objc_copyWeak(v11, &location);
  void v10[4] = self;
  v11[1] = (id)a3;
  [(CDPEscapeOption *)v5 setEscapeAction:v10];
  objc_destroyWeak(v11);
  objc_destroyWeak(&location);

  return v5;
}

void __83__CDPUIController__beginCustodianRecoveryEscapeOptionWithSupportedEscapeOfferMask___block_invoke(uint64_t a1)
{
  id v2 = _CDPLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v14[0] = 0;
    _os_log_impl(&dword_2187CF000, v2, OS_LOG_TYPE_DEFAULT, "Walrus User elected to start Custodian Flow, Showing Ask Help Now View", (uint8_t *)v14, 2u);
  }

  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v4 = [*(id *)(a1 + 32) _custodianAskHelpViewControllerWithSupportedEscapeOfferMask:*(void *)(a1 + 48)];
    [WeakRetained[4] pushViewController:v4 animated:1];
    id v5 = WeakRetained[17];
    if (v5)
    {
      [v5 insert:64];
    }
    else
    {
      id v6 = _CDPLogSystem();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
        __83__CDPUIController__beginCustodianRecoveryEscapeOptionWithSupportedEscapeOfferMask___block_invoke_cold_1(v6, v7, v8, v9, v10, v11, v12, v13);
      }
    }
  }
}

- (id)_custodianCantReachContactEscapeOfferWithSupportedEscapeOffers:(unint64_t)a3
{
  id v5 = CDPLocalizedString();
  id v6 = CDPLocalizedString();
  uint64_t v7 = CDPLocalizedString();
  if ([MEMORY[0x263F34400] isGuitarfishEnabled]
    && (uint64_t v8 = [(CDPContext *)self->_activeContext edpState], (a3 & 0x100) != 0)
    && v8 == 2)
  {
    uint64_t v9 = _CDPLogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[CDPUIController _custodianCantReachContactEscapeOfferWithSupportedEscapeOffers:](v9, v10, v11, v12, v13, v14, v15, v16);
    }

    BOOL v17 = [[CDPRemoteValidationEscapeOffer alloc] initWithCDPContext:self->_activeContext];
    [(CDPRemoteValidationEscapeOffer *)v17 setTitle:v5];
    [(CDPRemoteValidationEscapeOffer *)v17 setMessage:v6];
    id v18 = [(CDPUIController *)self _makeGuitarfishTokenEscapeOption];
    [(CDPRemoteValidationEscapeOffer *)v17 addEscapeOptionsObject:v18];
  }
  else
  {
    uint64_t v19 = _CDPLogSystem();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
      -[CDPUIController _custodianCantReachContactEscapeOfferWithSupportedEscapeOffers:](v19, v20, v21, v22, v23, v24, v25, v26);
    }

    BOOL v17 = [(CDPUIController *)self _skipOrDeleteiCloudDataEscapeOfferWithTitle:v5 message:v6 skipButtonTitle:v7 supportedEscapeOfferMask:a3];
  }

  return v17;
}

- (id)_custodianAskHelpViewControllerWithSupportedEscapeOfferMask:(unint64_t)a3
{
  id v5 = objc_alloc_init(CDPUICustodianAskHelpViewModel);
  [(CDPUICustodianAskHelpViewModel *)v5 setIconName:@"recovery_contact"];
  id v6 = [MEMORY[0x263F343B8] builderForKey:@"GET_HELP_FROM_RC_VIEW_TITLE" inTable:@"Localizable-Walrus"];
  uint64_t v7 = [v6 localizedString];
  [(CDPUICustodianAskHelpViewModel *)v5 setTitle:v7];

  uint64_t v8 = [MEMORY[0x263F343B8] builderForKey:@"GET_HELP_FROM_RC_VIEW_MESSAGE" inTable:@"Localizable-Walrus"];
  uint64_t v9 = [v8 localizedString];
  [(CDPUICustodianAskHelpViewModel *)v5 setMessage:v9];

  uint64_t v10 = [[CDPUICustodianAskHelpViewController alloc] initWithViewModel:v5 cdpContext:self->_activeContext];
  uint64_t v11 = [(CDPUIController *)self _custodianRecoveryEscapeOptionWithSupportedEscapeOfferMask:a3 askHelpController:v10];
  uint64_t v12 = [MEMORY[0x263F343B8] builderForKey:@"GET_HELP_NOW_BUTTON_TITLE" inTable:@"Localizable-Walrus"];
  uint64_t v13 = [v12 localizedString];
  [v11 setTitle:v13];

  [v11 setTitleLocalizationKey:@"GET_HELP_NOW_BUTTON_TITLE"];
  [(CDPUICustodianAskHelpViewModel *)v5 setGetHelpNowOption:v11];
  uint64_t v14 = [(CDPUIController *)self _custodianCantReachContactEscapeOfferWithSupportedEscapeOffers:a3];
  uint64_t v15 = [MEMORY[0x263F343B8] builderForKey:@"WALRUS_BUTTON_TITLE_DONT_ASK_FOR_HELP" inTable:@"Localizable-Walrus"];
  uint64_t v16 = [v15 localizedString];
  [v14 setEscapeOfferName:v16];

  [(CDPUICustodianAskHelpViewModel *)v5 setDontAskForHelpOption:v14];
  uint64_t v17 = *MEMORY[0x263F348D8];
  id v18 = [(CDPUICustodianAskHelpViewModel *)v5 dontAskForHelpOption];
  [v18 setTitleTelemetryKey:v17];

  [v14 setPresentingViewController:v10];

  return v10;
}

- (id)_custodianRecoveryEscapeOptionWithSupportedEscapeOfferMask:(unint64_t)a3 askHelpController:(id)a4
{
  id v6 = a4;
  objc_initWeak(&location, self);
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x263F34358]) initWithContext:self->_activeContext];
  uint64_t v8 = objc_alloc_init(CDPEscapeOption);
  uint64_t v9 = [MEMORY[0x263F343B8] builderForKey:@"REMOTE_SECRET_ENTRY_FORGOT_CODE_DIALOG_CUSTODIAN"];
  uint64_t v10 = [v9 localizedString];
  [(CDPEscapeOption *)v8 setTitle:v10];

  [(CDPEscapeOption *)v8 setTitleTelemetryKey:*MEMORY[0x263F348B8]];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __96__CDPUIController__custodianRecoveryEscapeOptionWithSupportedEscapeOfferMask_askHelpController___block_invoke;
  v14[3] = &unk_26433D0D8;
  objc_copyWeak(v17, &location);
  id v11 = v6;
  id v15 = v11;
  id v12 = v7;
  id v16 = v12;
  v17[1] = (id)a3;
  [(CDPEscapeOption *)v8 setEscapeAction:v14];

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);

  return v8;
}

void __96__CDPUIController__custodianRecoveryEscapeOptionWithSupportedEscapeOfferMask_askHelpController___block_invoke(uint64_t a1)
{
  id v2 = _CDPLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_2187CF000, v2, OS_LOG_TYPE_DEFAULT, "User elected to start Custodian Flow, Showing OS picker", buf, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    uint64_t v4 = [*(id *)(a1 + 32) buttonTray];
    [v4 showButtonsBusy];

    [WeakRetained sendEscapeOfferSelectedEvent:*MEMORY[0x263F348B8]];
    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t v6 = *(void *)(a1 + 56);
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    id v7[2] = __96__CDPUIController__custodianRecoveryEscapeOptionWithSupportedEscapeOfferMask_askHelpController___block_invoke_492;
    v7[3] = &unk_26433D290;
    objc_copyWeak(&v9, (id *)(a1 + 48));
    id v8 = *(id *)(a1 + 32);
    [WeakRetained custodianOSSelectionViewControllerWithCustodianController:v5 supportedEscapeOfferMask:v6 completion:v7];

    objc_destroyWeak(&v9);
  }
}

void __96__CDPUIController__custodianRecoveryEscapeOptionWithSupportedEscapeOfferMask_askHelpController___block_invoke_492(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v5 = WeakRetained;
  if (WeakRetained)
  {
    if (v3)
    {
      [WeakRetained[4] pushViewController:v3 animated:1];
    }
    else
    {
      uint64_t v7 = _CDPLogSystem();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v8[0] = 0;
        _os_log_impl(&dword_2187CF000, v7, OS_LOG_TYPE_DEFAULT, "OS instruction view is not created", (uint8_t *)v8, 2u);
      }
    }
    uint64_t v6 = [*(id *)(a1 + 32) buttonTray];
    [v6 showButtonsAvailable];
  }
  else
  {
    uint64_t v6 = _CDPLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      __96__CDPUIController__custodianRecoveryEscapeOptionWithSupportedEscapeOfferMask_askHelpController___block_invoke_492_cold_1();
    }
  }
}

- (void)custodianOSSelectionViewControllerWithCustodianController:(id)a3 supportedEscapeOfferMask:(unint64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = objc_alloc_init(CDPUICustodianOSSelectionViewModel);
  id v11 = [MEMORY[0x263F343B8] builderForKey:@"CUSTODIAN_RECOVERY_OS_PICKER_TITLE"];
  id v12 = [v11 localizedString];
  [(CDPUICustodianOSSelectionViewModel *)v10 setTitle:v12];

  uint64_t v13 = [MEMORY[0x263F343B8] builderForKey:@"CUSTODIAN_RECOVERY_OS_PICKER_SUBTITLE"];
  uint64_t v14 = [v13 localizedString];
  [(CDPUICustodianOSSelectionViewModel *)v10 setMessage:v14];

  id v15 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v16 = [MEMORY[0x263F827E8] imageNamed:@"recovery_contact" inBundle:v15];
  [(CDPUICustodianOSSelectionViewModel *)v10 setIcon:v16];

  [(CDPUICustodianOSSelectionViewModel *)v10 setTableViewStyle:2];
  objc_initWeak(&location, self);
  uint64_t v17 = _CDPLogSystem();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_2187CF000, v17, OS_LOG_TYPE_DEFAULT, "Starting a new recovery recovery session...", buf, 2u);
  }

  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  id v21[2] = __113__CDPUIController_custodianOSSelectionViewControllerWithCustodianController_supportedEscapeOfferMask_completion___block_invoke;
  v21[3] = &unk_26433D308;
  objc_copyWeak(v25, &location);
  id v18 = v9;
  id v24 = v18;
  v21[4] = self;
  id v19 = v8;
  id v22 = v19;
  v25[1] = (id)a4;
  uint64_t v20 = v10;
  uint64_t v23 = v20;
  [v19 startRecoverySessionWithCompletion:v21];

  objc_destroyWeak(v25);
  objc_destroyWeak(&location);
}

void __113__CDPUIController_custodianOSSelectionViewControllerWithCustodianController_supportedEscapeOfferMask_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = _CDPLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412546;
    id v24 = v5;
    __int16 v25 = 2112;
    id v26 = v6;
    _os_log_impl(&dword_2187CF000, v7, OS_LOG_TYPE_DEFAULT, "Custodian recovery session started with sessionID: %@, error: %@", buf, 0x16u);
  }

  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __113__CDPUIController_custodianOSSelectionViewControllerWithCustodianController_supportedEscapeOfferMask_completion___block_invoke_502;
  v15[3] = &unk_26433D2E0;
  id v16 = v6;
  id v17 = v5;
  id v8 = v5;
  id v9 = v6;
  objc_copyWeak(v22, (id *)(a1 + 64));
  id v10 = *(id *)(a1 + 56);
  uint64_t v11 = *(void *)(a1 + 32);
  id v12 = *(void **)(a1 + 40);
  id v21 = v10;
  uint64_t v18 = v11;
  id v13 = v12;
  uint64_t v14 = *(void **)(a1 + 72);
  id v19 = v13;
  v22[1] = v14;
  id v20 = *(id *)(a1 + 48);
  dispatch_async(MEMORY[0x263EF83A0], v15);

  objc_destroyWeak(v22);
}

void __113__CDPUIController_custodianOSSelectionViewControllerWithCustodianController_supportedEscapeOfferMask_completion___block_invoke_502(uint64_t a1)
{
  v44[3] = *MEMORY[0x263EF8340];
  if (*(void *)(a1 + 32) || ![*(id *)(a1 + 40) length])
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
    [WeakRetained _showStartRecoverySessionFailureAlert];

    uint64_t v3 = *(void *)(a1 + 72);
    if (v3)
    {
      uint64_t v4 = *(void (**)(void))(v3 + 16);
      v4();
    }
  }
  else
  {
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 3221225472;
    aBlock[2] = __113__CDPUIController_custodianOSSelectionViewControllerWithCustodianController_supportedEscapeOfferMask_completion___block_invoke_2;
    aBlock[3] = &unk_26433D2B8;
    objc_copyWeak(v42, (id *)(a1 + 80));
    id v5 = *(void **)(a1 + 56);
    void aBlock[4] = *(void *)(a1 + 48);
    id v6 = v5;
    uint64_t v7 = *(void **)(a1 + 88);
    id v41 = v6;
    v42[1] = v7;
    id v8 = _Block_copy(aBlock);
    id v9 = objc_alloc_init(CDPEscapeOption);
    [(CDPEscapeOption *)v9 setStyle:0];
    [(CDPEscapeOption *)v9 setTitleLocalizationKey:@"CUSTODIAN_RECOVERY_OS_PICKER_INSTRUCTIONS_FOR_CONTACT"];
    id v10 = (void *)MEMORY[0x263F343B8];
    uint64_t v11 = [(CDPEscapeOption *)v9 titleLocalizationKey];
    id v12 = [v10 builderForKey:v11];
    id v13 = [v12 localizedString];
    [(CDPEscapeOption *)v9 setTitle:v13];

    uint64_t v14 = objc_alloc_init(CDPEscapeOption);
    [(CDPEscapeOption *)v14 setTitleLocalizationKey:@"CUSTODIAN_RECOVERY_OS_PICKER_DEVICE_IOS"];
    id v15 = (void *)MEMORY[0x263F343B8];
    id v16 = [(CDPEscapeOption *)v14 titleLocalizationKey];
    id v17 = [v15 builderForKey:v16];
    uint64_t v18 = [v17 localizedString];
    [(CDPEscapeOption *)v14 setTitle:v18];

    [(CDPEscapeOption *)v14 setTitleTelemetryKey:*MEMORY[0x263F348E0]];
    v38[0] = MEMORY[0x263EF8330];
    v38[1] = 3221225472;
    v38[2] = __113__CDPUIController_custodianOSSelectionViewControllerWithCustodianController_supportedEscapeOfferMask_completion___block_invoke_509;
    v38[3] = &unk_26433CDE0;
    id v19 = v8;
    id v39 = v19;
    [(CDPEscapeOption *)v14 setEscapeAction:v38];
    id v20 = objc_alloc_init(CDPEscapeOption);
    [(CDPEscapeOption *)v20 setTitleLocalizationKey:@"CUSTODIAN_RECOVERY_OS_PICKER_DEVICE_MAC"];
    id v21 = (void *)MEMORY[0x263F343B8];
    id v22 = [(CDPEscapeOption *)v20 titleLocalizationKey];
    uint64_t v23 = [v21 builderForKey:v22];
    id v24 = [v23 localizedString];
    [(CDPEscapeOption *)v20 setTitle:v24];

    [(CDPEscapeOption *)v20 setTitleTelemetryKey:*MEMORY[0x263F348E8]];
    v36[0] = MEMORY[0x263EF8330];
    v36[1] = 3221225472;
    v36[2] = __113__CDPUIController_custodianOSSelectionViewControllerWithCustodianController_supportedEscapeOfferMask_completion___block_invoke_2_513;
    void v36[3] = &unk_26433CDE0;
    id v25 = v19;
    id v37 = v25;
    [(CDPEscapeOption *)v20 setEscapeAction:v36];
    v44[0] = v9;
    v44[1] = v14;
    v44[2] = v20;
    id v26 = [MEMORY[0x263EFF8C0] arrayWithObjects:v44 count:3];
    [*(id *)(a1 + 64) setOptions:v26];

    uint64_t v27 = [*(id *)(a1 + 48) _enterCustodianCodeEscapeOfferWithCustodianController:*(void *)(a1 + 56) supportedEscapeOfferMask:*(void *)(a1 + 88)];
    id v28 = [MEMORY[0x263F343B8] builderForKey:@"CUSTODIAN_RECOVERY_OS_PICKER_HAVE_RECOVERY_CODE"];
    id v29 = [v28 localizedString];
    [v27 setTitle:v29];

    [v27 setTitleTelemetryKey:*MEMORY[0x263F348C8]];
    uint64_t v30 = [*(id *)(a1 + 48) _custodianCantReachContactEscapeOfferWithSupportedEscapeOffers:*(void *)(a1 + 88)];
    uint64_t v31 = [MEMORY[0x263F343B8] builderForKey:@"CUSTODIAN_RECOVERY_OS_PICKER_ESCAPE_TITLE"];
    uint64_t v32 = [v31 localizedString];
    [v30 setEscapeOfferName:v32];

    [v30 setTitleTelemetryKey:*MEMORY[0x263F348F8]];
    v43[0] = v27;
    v43[1] = v30;
    uint64_t v33 = [MEMORY[0x263EFF8C0] arrayWithObjects:v43 count:2];
    [*(id *)(a1 + 64) setEscapeOffers:v33];

    uint64_t v34 = [[CDPUICustodianOSSelectionViewController alloc] initWithViewModel:*(void *)(a1 + 64) cdpContext:*(void *)(*(void *)(a1 + 48) + 56)];
    [v30 setPresentingViewController:v34];
    uint64_t v35 = *(void *)(a1 + 72);
    if (v35) {
      (*(void (**)(uint64_t, CDPUICustodianOSSelectionViewController *))(v35 + 16))(v35, v34);
    }

    objc_destroyWeak(v42);
  }
}

void __113__CDPUIController_custodianOSSelectionViewControllerWithCustodianController_supportedEscapeOfferMask_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  id v5 = _CDPLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl(&dword_2187CF000, v5, OS_LOG_TYPE_DEFAULT, "Initializing custodian recovery session with Apple Account", v7, 2u);
  }

  id v6 = [*(id *)(a1 + 32) _instructionsControllerForPlatform:a2 controller:*(void *)(a1 + 40) supportedEscapeOfferMask:*(void *)(a1 + 56)];
  [WeakRetained[4] pushViewController:v6 animated:1];
}

uint64_t __113__CDPUIController_custodianOSSelectionViewControllerWithCustodianController_supportedEscapeOfferMask_completion___block_invoke_509(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __113__CDPUIController_custodianOSSelectionViewControllerWithCustodianController_supportedEscapeOfferMask_completion___block_invoke_2_513(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_showStartRecoverySessionFailureAlert
{
  uint64_t v3 = (void *)MEMORY[0x263F82400];
  uint64_t v4 = CDPLocalizedString();
  id v9 = [v3 actionWithTitle:v4 style:1 handler:0];

  id v5 = (void *)MEMORY[0x263F82418];
  id v6 = CDPLocalizedString();
  uint64_t v7 = CDPLocalizedString();
  id v8 = [v5 alertControllerWithTitle:v6 message:v7 preferredStyle:1];

  [v8 addAction:v9];
  [(UINavigationController *)self->_navController presentViewController:v8 animated:1 completion:0];
}

- (id)_instructionsControllerForPlatform:(unint64_t)a3 controller:(id)a4 supportedEscapeOfferMask:(unint64_t)a5
{
  id v8 = a4;
  id v9 = objc_alloc_init(CDPUICustodianInstructionsViewModel);
  id v10 = [MEMORY[0x263F343B8] builderForKey:@"CUSTODIAN_INSTRUCTIONS_TITLE"];
  uint64_t v11 = [v10 localizedString];
  [(CDPUICustodianInstructionsViewModel *)v9 setTitle:v11];

  id v12 = [MEMORY[0x263F343B8] builderForKey:@"CUSTODIAN_INSTRUCTIONS_SUBTITLE"];
  id v13 = [v12 localizedString];
  [(CDPUICustodianInstructionsViewModel *)v9 setSubtitle:v13];

  uint64_t v14 = [MEMORY[0x263F343B8] builderForKey:&stru_26C9EBCA0];
  id v15 = [v14 localizedString];
  [(CDPUICustodianInstructionsViewModel *)v9 setFooterText:v15];

  id v16 = [MEMORY[0x263F34328] sharedInstance];
  id v17 = [v16 primaryAccountFullName];

  if (a3 != 2)
  {
    if (a3 != 1) {
      goto LABEL_10;
    }
    uint64_t v18 = [MEMORY[0x263F343B8] builderForKey:@"CUSTODIAN_INSTRUCTIONS_OS_DETAIL_IOS"];
    id v19 = [v18 localizedString];
    [(CDPUICustodianInstructionsViewModel *)v9 setInstructionHeader:v19];

    id v20 = NSString;
    CDPLocalizedString();
    id v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
    id v22 = [v20 stringWithValidatedFormat:v21, @"%@", 0, v17 validFormatSpecifiers error];
    [(CDPUICustodianInstructionsViewModel *)v9 setInstructions:v22];

    goto LABEL_9;
  }
  uint64_t v23 = [MEMORY[0x263F343B8] builderForKey:@"CUSTODIAN_INSTRUCTIONS_OS_DETAIL_MAC"];
  id v24 = [v23 localizedString];
  [(CDPUICustodianInstructionsViewModel *)v9 setInstructionHeader:v24];

  id v25 = NSString;
  id v21 = @"CUSTODIAN_INSTRUCTIONS_OS_INSTRUCTION_MAC";
  if (([@"CUSTODIAN_INSTRUCTIONS_OS_INSTRUCTION_MAC" containsString:@"REBRAND"] & 1) != 0
    || !_os_feature_enabled_impl())
  {
    int v26 = 0;
  }
  else
  {
    id v21 = [@"CUSTODIAN_INSTRUCTIONS_OS_INSTRUCTION_MAC" stringByAppendingString:@"_REBRAND"];
    int v26 = 1;
  }
  uint64_t v27 = CDPLocalizedString();
  id v28 = [v25 stringWithValidatedFormat:v27, @"%@", 0, v17 validFormatSpecifiers error];
  [(CDPUICustodianInstructionsViewModel *)v9 setInstructions:v28];

  if (v26) {
LABEL_9:
  }

LABEL_10:
  id v29 = [MEMORY[0x263F343B8] builderForKey:@"CUSTODIAN_INSTRUCTIONS_FOOTER"];
  uint64_t v30 = [v29 localizedString];
  [(CDPUICustodianInstructionsViewModel *)v9 setFooterText:v30];

  uint64_t v31 = [(CDPUIController *)self _custodianCantReachContactEscapeOfferWithSupportedEscapeOffers:a5];
  uint64_t v32 = [MEMORY[0x263F343B8] builderForKey:@"CUSTODIAN_INSTRUCTIONS_ESCAPE_TITLE"];
  uint64_t v33 = [v32 localizedString];
  [v31 setEscapeOfferName:v33];

  [(CDPUICustodianInstructionsViewModel *)v9 setEscapeOffer:v31];
  uint64_t v34 = objc_alloc_init(CDPEscapeOption);
  uint64_t v35 = [MEMORY[0x263F343B8] builderForKey:@"CUSTODIAN_INSTRUCTIONS_CONTINUE_TITLE"];
  uint64_t v36 = [v35 localizedString];
  [(CDPEscapeOption *)v34 setTitle:v36];

  objc_initWeak(&location, self);
  v40[0] = MEMORY[0x263EF8330];
  v40[1] = 3221225472;
  v40[2] = __90__CDPUIController__instructionsControllerForPlatform_controller_supportedEscapeOfferMask___block_invoke;
  v40[3] = &unk_26433D0D8;
  objc_copyWeak(v42, &location);
  v40[4] = self;
  id v37 = v8;
  id v41 = v37;
  v42[1] = (id)a5;
  [(CDPEscapeOption *)v34 setEscapeAction:v40];
  [(CDPUICustodianInstructionsViewModel *)v9 setContinueOption:v34];
  uint64_t v38 = [[CDPUICustodianInstructionsViewController alloc] initWithViewModel:v9];
  [v31 setPresentingViewController:v38];

  objc_destroyWeak(v42);
  objc_destroyWeak(&location);

  return v38;
}

void __90__CDPUIController__instructionsControllerForPlatform_controller_supportedEscapeOfferMask___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  id v2 = [*(id *)(a1 + 32) _custodianCodeEntryViewControllerWithController:*(void *)(a1 + 40) supportedEscapeOfferMask:*(void *)(a1 + 56)];
  [WeakRetained[4] pushViewController:v2 animated:1];
}

- (id)_custodianCodeEntryViewControllerWithController:(id)a3 supportedEscapeOfferMask:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v7 = objc_alloc_init(CDPUICodeEntryViewModel);
  id v8 = [MEMORY[0x263F343B8] builderForKey:@"CUSTODIAN_RECOVERY_CODE_PROMPT_TITLE"];
  id v9 = [v8 localizedString];
  [(CDPUICodeEntryViewModel *)v7 setPromptTitle:v9];

  id v10 = [MEMORY[0x263F343B8] builderForKey:@"CUSTODIAN_RECOVERY_CODE_PROMPT_MESSAGE"];
  uint64_t v11 = [v10 localizedString];
  [(CDPUICodeEntryViewModel *)v7 setPromptMessage:v11];

  id v12 = [(CDPUIController *)self _custodianCantReachContactEscapeOfferWithSupportedEscapeOffers:a4];
  id v13 = [MEMORY[0x263F343B8] builderForKey:@"CUSTODIAN_RECOVERY_CODE_PROMPT_ESCAPE_TITLE"];
  uint64_t v14 = [v13 localizedString];
  [v12 setTitle:v14];

  [v12 setTitleTelemetryKey:*MEMORY[0x263F348D0]];
  [(CDPUICodeEntryViewModel *)v7 setEscapeOffer:v12];
  objc_initWeak(&location, self);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __92__CDPUIController__custodianCodeEntryViewControllerWithController_supportedEscapeOfferMask___block_invoke;
  v18[3] = &unk_26433D358;
  id v15 = v6;
  id v19 = v15;
  objc_copyWeak(&v20, &location);
  [(CDPUICodeEntryViewModel *)v7 setCodeEnteredAction:v18];
  id v16 = [[CDPUICustodianCodeEntryViewController alloc] initWithViewModel:v7 cdpContext:self->_activeContext];
  [v12 setPresentingViewController:v16];
  objc_destroyWeak(&v20);

  objc_destroyWeak(&location);

  return v16;
}

uint64_t __92__CDPUIController__custodianCodeEntryViewControllerWithController_supportedEscapeOfferMask___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = _CDPLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __92__CDPUIController__custodianCodeEntryViewControllerWithController_supportedEscapeOfferMask___block_invoke_cold_1();
  }

  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  id v6 = *(void **)(a1 + 32);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  id v10[2] = __92__CDPUIController__custodianCodeEntryViewControllerWithController_supportedEscapeOfferMask___block_invoke_578;
  v10[3] = &unk_26433D330;
  objc_copyWeak(&v13, (id *)(a1 + 40));
  id v12 = &v14;
  uint64_t v7 = v5;
  uint64_t v11 = v7;
  [v6 validateRecoveryCode:v3 withCompletion:v10];
  dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
  uint64_t v8 = *((unsigned __int8 *)v15 + 24);

  objc_destroyWeak(&v13);
  _Block_object_dispose(&v14, 8);

  return v8;
}

void __92__CDPUIController__custodianCodeEntryViewControllerWithController_supportedEscapeOfferMask___block_invoke_578(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (v6)
  {
    uint64_t v8 = _CDPLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __92__CDPUIController__custodianCodeEntryViewControllerWithController_supportedEscapeOfferMask___block_invoke_578_cold_1();
    }

    if ((objc_msgSend(v6, "aa_isAACustodianRecoveryErrorWithCode:", -9002) & 1) == 0)
    {
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __92__CDPUIController__custodianCodeEntryViewControllerWithController_supportedEscapeOfferMask___block_invoke_579;
      block[3] = &unk_26433CC58;
      void block[4] = WeakRetained;
      dispatch_async(MEMORY[0x263EF83A0], block);
    }
  }
  else if (v5)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    id v9[2] = __92__CDPUIController__custodianCodeEntryViewControllerWithController_supportedEscapeOfferMask___block_invoke_580;
    v9[3] = &unk_26433CC30;
    id v10 = v5;
    id v11 = WeakRetained;
    dispatch_async(MEMORY[0x263EF83A0], v9);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t __92__CDPUIController__custodianCodeEntryViewControllerWithController_supportedEscapeOfferMask___block_invoke_579(uint64_t a1)
{
  id v2 = _CDPLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __92__CDPUIController__custodianCodeEntryViewControllerWithController_supportedEscapeOfferMask___block_invoke_579_cold_1();
  }

  return [*(id *)(a1 + 32) _presentCustodianAttemptLimitAlert];
}

uint64_t __92__CDPUIController__custodianCodeEntryViewControllerWithController_supportedEscapeOfferMask___block_invoke_580(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v2 = _CDPLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138412290;
    uint64_t v6 = v3;
    _os_log_impl(&dword_2187CF000, v2, OS_LOG_TYPE_DEFAULT, "Custodian Recovery Code Attempt: Code validation success! Custodian with recoveryInfo: %@", (uint8_t *)&v5, 0xCu);
  }

  return [*(id *)(a1 + 40) _validateCustodianRecoveryInfo:*(void *)(a1 + 32)];
}

- (void)_validateCustodianRecoveryInfo:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  remoteSecretValidator = self->_remoteSecretValidator;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __50__CDPUIController__validateCustodianRecoveryInfo___block_invoke;
  v6[3] = &unk_26433D380;
  objc_copyWeak(&v7, &location);
  [(CDPRemoteDeviceSecretValidator *)remoteSecretValidator validateCustodianRecoveryInfo:v4 withCompletion:v6];
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __50__CDPUIController__validateCustodianRecoveryInfo___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v7 = _CDPLogSystem();
  uint64_t v8 = v7;
  if (a2)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v9 = 0;
      _os_log_impl(&dword_2187CF000, v8, OS_LOG_TYPE_DEFAULT, "Custodian recovery info validated, safe to dismiss the view", v9, 2u);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    __50__CDPUIController__validateCustodianRecoveryInfo___block_invoke_cold_1();
  }

  [WeakRetained _dismissPresentedViewControllerCompletion:0];
}

- (void)_presentCustodianAttemptLimitAlert
{
  uint64_t v3 = (void *)MEMORY[0x263F82418];
  id v4 = [MEMORY[0x263F343B8] builderForKey:@"CUSTODIAN_RECOVERY_MACOS_DEPLETED_ATTEMPTS_TITLE"];
  id v5 = [v4 localizedString];
  uint64_t v6 = [MEMORY[0x263F343B8] builderForKey:@"CUSTODIAN_RECOVERY_MACOS_DEPLETED_ATTEMPTS_MESSAGE"];
  id v7 = [v6 localizedString];
  uint64_t v8 = [v3 alertControllerWithTitle:v5 message:v7 preferredStyle:1];

  id v9 = (void *)MEMORY[0x263F82400];
  id v10 = [MEMORY[0x263F343B8] builderForKey:@"GENERIC_ERROR_DEFAULT_BUTTON"];
  id v11 = [v10 localizedString];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __53__CDPUIController__presentCustodianAttemptLimitAlert__block_invoke;
  v14[3] = &unk_26433D3A8;
  void v14[4] = self;
  id v12 = [v9 actionWithTitle:v11 style:0 handler:v14];

  [v8 addAction:v12];
  id v13 = [(CDPUIBaseController *)self presentingViewController];
  [v13 presentViewController:v8 animated:1 completion:0];
}

void __53__CDPUIController__presentCustodianAttemptLimitAlert__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(*(void *)(a1 + 32) + 24);
  objc_msgSend(MEMORY[0x263F087E8], "cdp_errorWithCode:", -5206);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v1 cancelValidationWithError:v2];
}

- (id)_recoveryKeyEscapeOfferWithSupportedEscapeOfferMask:(unint64_t)a3
{
  id v5 = [[CDPRemoteValidationEscapeOffer alloc] initWithCDPContext:self->_activeContext];
  uint64_t v6 = [(CDPUIController *)self _recoveryKeyEscapeOptionWithSupportedEscapeOfferMask:a3];
  [v6 setStyle:4];
  id v7 = [v6 title];
  [(CDPRemoteValidationEscapeOffer *)v5 setEscapeOfferName:v7];

  [(CDPRemoteValidationEscapeOffer *)v5 addEscapeOptionsObject:v6];

  return v5;
}

- (id)_recoveryMethodEscapeOptionWithSupportedEscapeOfferMask:(unint64_t)a3
{
  uint64_t v3 = [(CDPUIController *)self _recoveryKeyEscapeOptionWithSupportedEscapeOfferMask:a3];
  [v3 setStyle:4];
  id v4 = [MEMORY[0x263F343B8] builderForKey:@"REMOTE_SECRET_ENTRY_ALERT_USE_RECOVERY_METHOD"];
  id v5 = [v4 localizedString];
  [v3 setTitle:v5];

  [v3 setTitleTelemetryKey:@"REMOTE_SECRET_ENTRY_ALERT_USE_RECOVERY_METHOD"];

  return v3;
}

- (id)_recoveryKeyEscapeOptionWithSupportedEscapeOfferMask:(unint64_t)a3
{
  objc_initWeak(&location, self);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  id v7[2] = __72__CDPUIController__recoveryKeyEscapeOptionWithSupportedEscapeOfferMask___block_invoke;
  v7[3] = &unk_26433D3D0;
  objc_copyWeak(&v8, &location);
  void v7[4] = self;
  id v5 = [(CDPUIController *)self _recoveryKeyEscapeOptionWithSupportedEscapeOfferMask:a3 presentationBlock:v7];
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

  return v5;
}

void __72__CDPUIController__recoveryKeyEscapeOptionWithSupportedEscapeOfferMask___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = (id *)objc_loadWeakRetained(v3);
  [WeakRetained[4] pushViewController:v4 animated:1];

  if (!WeakRetained[17])
  {
    uint64_t v6 = _CDPLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      __72__CDPUIController__recoveryKeyEscapeOptionWithSupportedEscapeOfferMask___block_invoke_cold_1(v6, v7, v8, v9, v10, v11, v12, v13);
    }
  }
  [*(id *)(*(void *)(a1 + 32) + 136) insert:32];
}

- (id)_enterCustodianCodeEscapeOfferWithCustodianController:(id)a3 supportedEscapeOfferMask:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v7 = [[CDPRemoteValidationEscapeOffer alloc] initWithCDPContext:self->_activeContext];
  uint64_t v8 = [(CDPUIController *)self _enterCustodianCodeEscapeOptionWithCustodianController:v6 supportedEscapeOfferMask:a4];

  [v8 setStyle:4];
  uint64_t v9 = [v8 title];
  [(CDPRemoteValidationEscapeOffer *)v7 setEscapeOfferName:v9];

  [(CDPRemoteValidationEscapeOffer *)v7 addEscapeOptionsObject:v8];

  return v7;
}

- (id)_enterCustodianCodeEscapeOptionWithCustodianController:(id)a3 supportedEscapeOfferMask:(unint64_t)a4
{
  id v6 = a3;
  objc_initWeak(&location, self);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  id v9[2] = __99__CDPUIController__enterCustodianCodeEscapeOptionWithCustodianController_supportedEscapeOfferMask___block_invoke;
  v9[3] = &unk_26433D3F8;
  objc_copyWeak(&v10, &location);
  uint64_t v7 = [(CDPUIController *)self _enterCustodianCodeEscapeOptionWithCustodianController:v6 supportedEscapeOfferMask:a4 presentationBlock:v9];
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

  return v7;
}

void __99__CDPUIController__enterCustodianCodeEscapeOptionWithCustodianController_supportedEscapeOfferMask___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained[4] pushViewController:v5 animated:1];
  }
}

- (id)_enterCustodianCodeEscapeOptionWithCustodianController:(id)a3 supportedEscapeOfferMask:(unint64_t)a4 presentationBlock:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  objc_initWeak(&location, self);
  id v10 = objc_alloc_init(CDPEscapeOption);
  uint64_t v11 = [MEMORY[0x263F343B8] builderForKey:@"CUSTODIAN_RECOVERY_CODE_PROMPT_TITLE"];
  uint64_t v12 = [v11 localizedString];
  [(CDPEscapeOption *)v10 setTitle:v12];

  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __117__CDPUIController__enterCustodianCodeEscapeOptionWithCustodianController_supportedEscapeOfferMask_presentationBlock___block_invoke;
  v16[3] = &unk_26433D420;
  objc_copyWeak(v19, &location);
  id v13 = v8;
  id v17 = v13;
  v19[1] = (id)a4;
  id v14 = v9;
  id v18 = v14;
  [(CDPEscapeOption *)v10 setEscapeAction:v16];

  objc_destroyWeak(v19);
  objc_destroyWeak(&location);

  return v10;
}

void __117__CDPUIController__enterCustodianCodeEscapeOptionWithCustodianController_supportedEscapeOfferMask_presentationBlock___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = [WeakRetained _custodianCodeEntryViewControllerWithController:*(void *)(a1 + 32) supportedEscapeOfferMask:*(void *)(a1 + 56)];
    id v5 = _CDPLogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl(&dword_2187CF000, v5, OS_LOG_TYPE_DEFAULT, "Initializing custodian code entry controller", v6, 2u);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (id)_recoveryKeyEscapeOptionWithSupportedEscapeOfferMask:(unint64_t)a3 presentationBlock:(id)a4
{
  id v6 = a4;
  objc_initWeak(&location, self);
  uint64_t v7 = objc_alloc_init(CDPEscapeOption);
  id v8 = [MEMORY[0x263F343B8] builderForKey:@"REMOTE_SECRET_ENTRY_FORGOT_CODE_DIALOG_RK"];
  id v9 = [v8 localizedString];
  [(CDPEscapeOption *)v7 setTitle:v9];

  [(CDPEscapeOption *)v7 setTitleLocalizationKey:@"REMOTE_SECRET_ENTRY_FORGOT_CODE_DIALOG_RK"];
  [(CDPEscapeOption *)v7 setTitleTelemetryKey:*MEMORY[0x263F34910]];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __90__CDPUIController__recoveryKeyEscapeOptionWithSupportedEscapeOfferMask_presentationBlock___block_invoke;
  v12[3] = &unk_26433D420;
  objc_copyWeak(v14, &location);
  void v12[4] = self;
  v14[1] = (id)a3;
  id v10 = v6;
  id v13 = v10;
  [(CDPEscapeOption *)v7 setEscapeAction:v12];

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);

  return v7;
}

void __90__CDPUIController__recoveryKeyEscapeOptionWithSupportedEscapeOfferMask_presentationBlock___block_invoke(uint64_t a1)
{
  id v2 = _CDPLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_2187CF000, v2, OS_LOG_TYPE_DEFAULT, "User elected to start RK flow, prompting to confirm", v6, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained sendEscapeOfferSelectedEvent:*MEMORY[0x263F34910]];
    id v5 = [*(id *)(a1 + 32) recoveryKeyEntryControllerForCircleJoinWithCancel:0 supportedEscapeOfferMask:*(void *)(a1 + 56)];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (id)_recoveryKeyResetProtectedDataEscapeOfferWithSupportedEscapeOffers:(unint64_t)a3
{
  id v5 = CDPLocalizedString();
  id v6 = CDPLocalizedString();
  uint64_t v7 = CDPLocalizedString();
  id v8 = [(CDPUIController *)self _skipOrDeleteiCloudDataEscapeOfferWithTitle:v5 message:v6 skipButtonTitle:v7 supportedEscapeOfferMask:a3];

  return v8;
}

- (id)recoveryKeyEntryControllerForCircleJoinWithCancel:(BOOL)a3 supportedEscapeOfferMask:(unint64_t)a4
{
  BOOL v5 = a3;
  uint64_t v7 = [[CDPRecoveryKeyEntryViewModel alloc] initWithContext:self->_activeContext validator:self->_remoteSecretValidator];
  [(CDPRecoveryKeyEntryViewModel *)v7 setIsWalrusEnabled:self->_isWalrusEnabled];
  if ((a4 & 0x40) != 0)
  {
    id v8 = [(CDPUIController *)self _beginCustodianRecoveryEscapeOptionWithSupportedEscapeOfferMask:a4];
    [(CDPRecoveryKeyEntryViewModel *)v7 setCustodianRecoveryEscapeOption:v8];
  }
  if ((a4 & 0x100) != 0)
  {
    id v9 = [(CDPUIController *)self _beginEDPRecoveryTokenEscapeOptionsWithSupportedEscapeOfferMask:a4];
    [(CDPRecoveryKeyEntryViewModel *)v7 setEdpRecoveryTokenEscapeOption:v9];
  }
  id v10 = [(CDPUIController *)self _recoveryKeyResetProtectedDataEscapeOfferWithSupportedEscapeOffers:a4];
  [(CDPRecoveryKeyEntryViewModel *)v7 setDeleteiCloudDataEscapeOffer:v10];
  [(CDPRecoveryKeyEntryViewModel *)v7 setShouldSuppressCancelButton:!v5];
  uint64_t v11 = [[CDPRecoveryKeyEntryViewController alloc] initWithRecoveryContext:v7 cdpContext:self->_activeContext];
  [v10 setPresentingViewController:v11];
  objc_initWeak(&location, self);
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  id v14[2] = __94__CDPUIController_recoveryKeyEntryControllerForCircleJoinWithCancel_supportedEscapeOfferMask___block_invoke;
  v14[3] = &unk_26433D448;
  objc_copyWeak(v16, &location);
  void v14[4] = self;
  v16[1] = (id)a4;
  id v12 = v10;
  id v15 = v12;
  [(CDPRecoveryKeyEntryViewModel *)v7 setCompletionHandler:v14];

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);

  return v11;
}

void __94__CDPUIController_recoveryKeyEntryControllerForCircleJoinWithCancel_supportedEscapeOfferMask___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v7 = _CDPLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __94__CDPUIController_recoveryKeyEntryControllerForCircleJoinWithCancel_supportedEscapeOfferMask___block_invoke_cold_1(a2, (uint64_t)v5, v7);
  }

  if (objc_msgSend(v5, "cdp_isCDPErrorWithCode:", -5218))
  {
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __94__CDPUIController_recoveryKeyEntryControllerForCircleJoinWithCancel_supportedEscapeOfferMask___block_invoke_607;
    v18[3] = &unk_26433D1F0;
    uint64_t v8 = *(void *)(a1 + 56);
    void v18[4] = *(void *)(a1 + 32);
    v18[5] = v8;
    id v9 = MEMORY[0x263EF83A0];
    id v10 = v18;
LABEL_7:
    dispatch_async(v9, v10);
    goto LABEL_8;
  }
  if (objc_msgSend(v5, "cdp_isCDPErrorWithCode:", -7206))
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __94__CDPUIController_recoveryKeyEntryControllerForCircleJoinWithCancel_supportedEscapeOfferMask___block_invoke_608;
    block[3] = &unk_26433CC30;
    uint64_t v11 = *(void *)(a1 + 32);
    void block[4] = WeakRetained;
    void block[5] = v11;
    id v9 = MEMORY[0x263EF83A0];
    id v10 = block;
    goto LABEL_7;
  }
  if (objc_msgSend(v5, "cdp_isCDPErrorWithCode:", -5215))
  {
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    id v14[2] = __94__CDPUIController_recoveryKeyEntryControllerForCircleJoinWithCancel_supportedEscapeOfferMask___block_invoke_2;
    v14[3] = &unk_26433CC30;
    id v12 = *(id *)(a1 + 40);
    uint64_t v13 = *(void *)(a1 + 32);
    id v15 = v12;
    uint64_t v16 = v13;
    dispatch_async(MEMORY[0x263EF83A0], v14);
  }
LABEL_8:
}

void __94__CDPUIController_recoveryKeyEntryControllerForCircleJoinWithCancel_supportedEscapeOfferMask___block_invoke_607(uint64_t a1)
{
  [*(id *)(a1 + 32) sendEscapeOfferSelectedEvent:*MEMORY[0x263F348B8]];
  id v2 = [*(id *)(a1 + 32) _custodianAskHelpViewControllerWithSupportedEscapeOfferMask:*(void *)(a1 + 40)];
  [*(id *)(*(void *)(a1 + 32) + 32) pushViewController:v2 animated:1];
  uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 136);
  if (!v3)
  {
    id v4 = _CDPLogSystem();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      __94__CDPUIController_recoveryKeyEntryControllerForCircleJoinWithCancel_supportedEscapeOfferMask___block_invoke_607_cold_1(v4, v5, v6, v7, v8, v9, v10, v11);
    }

    uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 136);
  }
  [v3 insert:64];
}

void __94__CDPUIController_recoveryKeyEntryControllerForCircleJoinWithCancel_supportedEscapeOfferMask___block_invoke_608(uint64_t a1)
{
  id v2 = -[CDPUIEDPRecoveryTokenFlowCoordinator initWithValidator:rpdLedger:cdpContext:showCancel:delegate:]([CDPUIEDPRecoveryTokenFlowCoordinator alloc], "initWithValidator:rpdLedger:cdpContext:showCancel:delegate:", *(void *)(*(void *)(a1 + 32) + 24), *(void *)(*(void *)(a1 + 32) + 136), *(void *)(*(void *)(a1 + 32) + 56), 0);
  [*(id *)(a1 + 32) setEdpRecoveryTokenFlowCoordinator:v2];

  uint64_t v3 = [*(id *)(a1 + 32) edpRecoveryTokenFlowCoordinator];
  [v3 setEnteredAfterFailedCDPRecovery:1];

  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void **)(*(void *)(a1 + 40) + 32);
  id v7 = [v4 edpRecoveryTokenFlowCoordinator];
  uint64_t v6 = [v7 firstViewController];
  [v5 pushViewController:v6 animated:1];
}

uint64_t __94__CDPUIController_recoveryKeyEntryControllerForCircleJoinWithCancel_supportedEscapeOfferMask___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) handleEscapeAction:*(void *)(a1 + 40)];
}

- (void)_dismissPresentedViewControllerWithReason:(id)a3 completion:(id)a4
{
}

- (id)_enterSecretLaterEscapeOptionWithSecret:(unint64_t)a3
{
  objc_initWeak(&location, self);
  id v4 = objc_alloc_init(CDPEscapeOption);
  uint64_t v5 = [MEMORY[0x263F343B8] builderForKey:@"REMOTE_SECRET_ENTRY_FORGOT_CODE_DIALOG_LATER"];
  uint64_t v6 = [v5 addSecretType:a3];
  id v7 = [v6 localizedString];
  [(CDPEscapeOption *)v4 setTitle:v7];

  [(CDPEscapeOption *)v4 setTitleLocalizationKey:@"REMOTE_SECRET_ENTRY_FORGOT_CODE_DIALOG_LATER"];
  [(CDPEscapeOption *)v4 setTitleTelemetryKey:*MEMORY[0x263F34898]];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  id v9[2] = __59__CDPUIController__enterSecretLaterEscapeOptionWithSecret___block_invoke;
  v9[3] = &unk_26433D150;
  objc_copyWeak(&v10, &location);
  [(CDPEscapeOption *)v4 setEscapeAction:v9];
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

  return v4;
}

void __59__CDPUIController__enterSecretLaterEscapeOptionWithSecret___block_invoke(uint64_t a1)
{
  id v2 = _CDPLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_2187CF000, v2, OS_LOG_TYPE_DEFAULT, "User elected to skip CDP flow", buf, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained sendEscapeOfferSelectedEvent:*MEMORY[0x263F34898]];
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __59__CDPUIController__enterSecretLaterEscapeOptionWithSecret___block_invoke_612;
    v5[3] = &unk_26433CC58;
    v5[4] = v4;
    [v4 _dismissPresentedViewControllerWithReason:@"com.apple.CoreCDPUI.CDPEnrollmentCompleted" completion:v5];
  }
}

void __59__CDPUIController__enterSecretLaterEscapeOptionWithSecret___block_invoke_612(uint64_t a1)
{
  uint64_t v1 = *(void **)(*(void *)(a1 + 32) + 24);
  _CDPStateError();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v1 cancelValidationWithError:v2];
}

- (id)_waitingForApprovalEscapeOffer
{
  uint64_t v3 = [[CDPRemoteValidationEscapeOffer alloc] initWithCDPContext:self->_activeContext];
  id v4 = [MEMORY[0x263F343B8] builderForKey:@"WAITING_APPROVAL_ESCAPE_TITLE"];
  uint64_t v5 = [(CDPUIController *)self _localDeviceClass];
  uint64_t v6 = [v4 addDeviceClass:v5];
  id v7 = [v6 localizedString];
  [(CDPRemoteValidationEscapeOffer *)v3 setEscapeOfferName:v7];

  return v3;
}

- (id)_localDeviceClass
{
  id v2 = [MEMORY[0x263F343A8] sharedInstance];
  uint64_t v3 = [v2 deviceClass];

  return v3;
}

- (id)_singleICSCEscapeOfferWithMask:(unint64_t)a3 withController:(id)a4
{
  id v6 = a4;
  id v7 = [[CDPRemoteValidationEscapeOffer alloc] initWithCDPContext:self->_activeContext];
  uint64_t v8 = CDPLocalizedString();
  [(CDPRemoteValidationEscapeOffer *)v7 setEscapeOfferName:v8];

  uint64_t v9 = CDPLocalizedString();
  [(CDPRemoteValidationEscapeOffer *)v7 setTitle:v9];

  id v10 = CDPLocalizedString();
  [(CDPRemoteValidationEscapeOffer *)v7 setMessage:v10];

  objc_initWeak(&location, self);
  if ((a3 & 4) != 0)
  {
    uint64_t v11 = objc_alloc_init(CDPEscapeOption);
    id v12 = CDPLocalizedString();
    [(CDPEscapeOption *)v11 setTitle:v12];

    [(CDPEscapeOption *)v11 setTitleTelemetryKey:*MEMORY[0x263F34840]];
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    id v25[2] = __65__CDPUIController__singleICSCEscapeOfferWithMask_withController___block_invoke;
    v25[3] = &unk_26433D150;
    objc_copyWeak(&v26, &location);
    [(CDPEscapeOption *)v11 setEscapeAction:v25];
    [(CDPRemoteValidationEscapeOffer *)v7 addEscapeOptionsObject:v11];
    objc_destroyWeak(&v26);
  }
  if ((a3 & 0x40) != 0)
  {
    uint64_t v13 = [(CDPUIController *)self _beginCustodianRecoveryEscapeOptionWithSupportedEscapeOfferMask:a3];
    [(CDPRemoteValidationEscapeOffer *)v7 addEscapeOptionsObject:v13];
  }
  if ((a3 & 0x100) != 0)
  {
    id v14 = [(CDPUIController *)self _beginEDPRecoveryTokenEscapeOptionsWithSupportedEscapeOfferMask:a3];
    [(CDPRemoteValidationEscapeOffer *)v7 addEscapeOptionsObject:v14];
  }
  if ((a3 & 8) != 0)
  {
    id v15 = objc_alloc_init(CDPEscapeOption);
    uint64_t v16 = CDPLocalizedString();
    [(CDPEscapeOption *)v15 setTitle:v16];

    [(CDPEscapeOption *)v15 setTitleTelemetryKey:*MEMORY[0x263F34918]];
    uint64_t v19 = MEMORY[0x263EF8330];
    uint64_t v20 = 3221225472;
    id v21 = __65__CDPUIController__singleICSCEscapeOfferWithMask_withController___block_invoke_2;
    id v22 = &unk_26433D178;
    objc_copyWeak(&v24, &location);
    id v23 = v6;
    [(CDPEscapeOption *)v15 setEscapeAction:&v19];
    -[CDPRemoteValidationEscapeOffer addEscapeOptionsObject:](v7, "addEscapeOptionsObject:", v15, v19, v20, v21, v22);

    objc_destroyWeak(&v24);
  }
  id v17 = +[CDPEscapeOption cancelOption];
  [(CDPRemoteValidationEscapeOffer *)v7 addEscapeOptionsObject:v17];

  objc_destroyWeak(&location);

  return v7;
}

void __65__CDPUIController__singleICSCEscapeOfferWithMask_withController___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _beginWaitingForApprovalFlow];
}

void __65__CDPUIController__singleICSCEscapeOfferWithMask_withController___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _showResetKeychainConfirmationAlertWithViewController:*(void *)(a1 + 32)];
}

- (id)_escapeOffersForgotAllWithMask:(unint64_t)a3 presenter:(id)a4 devices:(id)a5
{
  id v49 = a4;
  id v7 = (void *)MEMORY[0x263EFF980];
  id v8 = a5;
  uint64_t v50 = [v7 array];
  uint64_t v9 = [[CDPRemoteValidationEscapeOffer alloc] initWithCDPContext:self->_activeContext];
  uint64_t v10 = [v8 prevailingLocalSecretType];

  uint64_t v11 = [MEMORY[0x263F343B8] builderForKey:@"DEVICE_PICKER_FORGOT_CODE_DIALOG_TITLE"];
  id v12 = [v11 addSecretType:v10];
  uint64_t v13 = [v12 localizedString];

  id v14 = (void *)v13;
  if (objc_msgSend(MEMORY[0x263F34350], "isSubsetOfContextTypeRepair:", -[CDPContext type](self->_activeContext, "type")))
  {
    id v15 = [MEMORY[0x263F343B8] builderForKey:@"REMOTE_SECRET_ENTRY_FORGOT_CODE_DIALOG_MESSAGE_FORGOT_ALL_RESET"];
    uint64_t v16 = [v15 addSecretType:v10];
    id v17 = [(CDPUIController *)self _localDeviceClass];
    id v18 = [v16 addDeviceClass:v17];
    uint64_t v19 = [v18 localizedString];
  }
  else
  {
    id v15 = [MEMORY[0x263F343B8] builderForKey:@"REMOTE_SECRET_ENTRY_FORGOT_CODE_DIALOG_MESSAGE_FORGOT_ALL"];
    uint64_t v16 = [v15 addSecretType:v10];
    uint64_t v19 = [v16 localizedString];
  }

  uint64_t v20 = [MEMORY[0x263F343B8] builderForKey:@"WALRUS_DEVICE_PICKER_FORGOT_ALL" inTable:@"Localizable-Walrus"];
  id v21 = [v20 addSecretType:v10];
  id v22 = [v21 localizedString];
  [(CDPRemoteValidationEscapeOffer *)v9 setEscapeOfferName:v22];

  id v23 = v14;
  [(CDPRemoteValidationEscapeOffer *)v9 setTitle:v14];
  [(CDPRemoteValidationEscapeOffer *)v9 setMessage:v19];
  if ([(CDPContext *)self->_activeContext keychainSyncSystem] == 1)
  {
    if ((a3 & 4) == 0 || !self->_offeringRemoteApproval)
    {
      id v39 = CDPLocalizedString();
      [(CDPRemoteValidationEscapeOffer *)v9 setTitle:v39];

      uint64_t v40 = [MEMORY[0x263F343B8] builderForKey:@"REMOTE_SECRET_ENTRY_SOS_MULTI_ICSC_ESCAPE_OFFER_MESSAGE"];
      id v41 = [v40 addSecretType:v10];
      uint64_t v42 = [v41 localizedString];
      [(CDPRemoteValidationEscapeOffer *)v9 setMessage:v42];

      uint64_t v27 = +[CDPEscapeOption okOption];
      goto LABEL_17;
    }
    id v24 = [MEMORY[0x263F343B8] builderForKey:@"REMOTE_SECRET_ENTRY_SOS_MULTI_ICSC_ESCAPE_OFFER_MESSAGE_REMOTE_APPROVAL"];
    id v25 = [v24 addSecretType:v10];
    id v26 = [v25 localizedString];
    [(CDPRemoteValidationEscapeOffer *)v9 setMessage:v26];

LABEL_8:
    uint64_t v27 = +[CDPEscapeOption cancelOption];
LABEL_17:
    uint64_t v30 = (void *)v27;
LABEL_23:
    [(CDPRemoteValidationEscapeOffer *)v9 addEscapeOptionsObject:v30];
    goto LABEL_24;
  }
  if ((a3 & 0x80) != 0)
  {
    id v43 = [(CDPUIController *)self _beginPiggybackingRecoveryEscapeOptionWithSupportedEscapeOfferMask:a3];
LABEL_22:
    uint64_t v30 = v43;
    [v43 setStyle:4];
    goto LABEL_23;
  }
  if ((a3 & 0x20) != 0)
  {
    id v43 = [(CDPUIController *)self _recoveryKeyEscapeOptionWithSupportedEscapeOfferMask:a3];
    goto LABEL_22;
  }
  if ((a3 & 0x40) != 0)
  {
    id v43 = [(CDPUIController *)self _beginCustodianRecoveryEscapeOptionWithSupportedEscapeOfferMask:a3];
    goto LABEL_22;
  }
  if ((a3 & 0x100) != 0)
  {
    id v43 = [(CDPUIController *)self _beginEDPRecoveryTokenEscapeOptionsWithSupportedEscapeOfferMask:a3];
    goto LABEL_22;
  }
  if ((a3 & 4) != 0)
  {
    id v24 = [(CDPUIController *)self _remoteApprovalEscapeOption];
    [(CDPRemoteValidationEscapeOffer *)v9 addEscapeOptionsObject:v24];
    goto LABEL_8;
  }
  if ((a3 & 0x18) != 0)
  {
    id v28 = [MEMORY[0x263F343B8] builderForKey:@"DATA_RECOVERY_DEVICE_SELECTION_SKIP_TITLE"];
    id v29 = [v28 addSecretType:v10];
    uint64_t v30 = [v29 localizedString];

    uint64_t v31 = [MEMORY[0x263F343B8] builderForKey:@"DATA_RECOVERY_DEVICE_SELECTION_SKIP_MESSAGE"];
    uint64_t v32 = [v31 addSecretType:v10];
    uint64_t v33 = [v32 localizedString];

    uint64_t v34 = CDPLocalizedString();
    uint64_t v35 = [(CDPUIController *)self _skipOrDeleteiCloudDataEscapeOfferWithTitle:v30 message:v33 skipButtonTitle:v34 supportedEscapeOfferMask:a3];

    uint64_t v36 = [MEMORY[0x263F343B8] builderForKey:@"WALRUS_DEVICE_PICKER_FORGOT_ALL" inTable:@"Localizable-Walrus"];
    id v37 = [v36 addSecretType:v10];
    uint64_t v38 = [v37 localizedString];
    [(CDPRemoteValidationEscapeOffer *)v35 setEscapeOfferName:v38];

    id v23 = v14;
    uint64_t v9 = v35;
LABEL_24:
    uint64_t v45 = v49;
    id v44 = (void *)v50;

    goto LABEL_25;
  }
  uint64_t v45 = v49;
  id v44 = (void *)v50;
LABEL_25:
  [v44 addObject:v9];
  v52[0] = MEMORY[0x263EF8330];
  v52[1] = 3221225472;
  v52[2] = __68__CDPUIController__escapeOffersForgotAllWithMask_presenter_devices___block_invoke;
  v52[3] = &unk_26433D470;
  id v53 = v45;
  id v46 = v45;
  [v44 enumerateObjectsUsingBlock:v52];
  v47 = (void *)[v44 copy];

  return v47;
}

uint64_t __68__CDPUIController__escapeOffersForgotAllWithMask_presenter_devices___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setPresentingViewController:*(void *)(a1 + 32)];
}

- (id)_remoteApprovalEscapeOption
{
  objc_initWeak(&location, self);
  id v2 = objc_alloc_init(CDPEscapeOption);
  uint64_t v3 = CDPLocalizedString();
  [(CDPEscapeOption *)v2 setTitle:v3];

  [(CDPEscapeOption *)v2 setTitleLocalizationKey:@"DEVICE_PICKER_FORGOT_CODE_DIALOG_USE_OTHER_DEVICE"];
  [(CDPEscapeOption *)v2 setTitleTelemetryKey:*MEMORY[0x263F34840]];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __46__CDPUIController__remoteApprovalEscapeOption__block_invoke;
  v5[3] = &unk_26433D150;
  objc_copyWeak(&v6, &location);
  [(CDPEscapeOption *)v2 setEscapeAction:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);

  return v2;
}

void __46__CDPUIController__remoteApprovalEscapeOption__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained sendEscapeOfferSelectedEvent:*MEMORY[0x263F34840]];
    [v2 approveFromAnotherDevice:0];
    id WeakRetained = v2;
  }
}

- (void)_setupDevicePickerController:(id)a3
{
  uint64_t v9 = (void (**)(id, CDPDevicePickerViewController *))a3;
  id v4 = [MEMORY[0x263F202A8] analyticsEventWithContext:self->_activeContext eventName:*MEMORY[0x263F34548] category:*MEMORY[0x263F34830]];
  [(CDPRPDLedger *)self->_ledger insert:2];
  if (self->_isWalrusEnabled) {
    uint64_t v5 = 2;
  }
  else {
    uint64_t v5 = 1;
  }
  id v6 = [[CDPDevicePickerViewController alloc] initWithDevices:self->_devices delegate:self tableViewStyle:v5];
  devicePicker = self->_devicePicker;
  self->_devicePicker = v6;

  id v8 = [MEMORY[0x263F34338] rtcAnalyticsReporter];
  [v8 sendEvent:v4];

  if (v9) {
    v9[2](v9, self->_devicePicker);
  }
}

- (void)_showResetKeychainConfirmationAlertWithViewController:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x263F82400];
  id v6 = CDPLocalizedString();
  id v7 = [v5 actionWithTitle:v6 style:1 handler:0];

  id v8 = (void *)MEMORY[0x263F82400];
  uint64_t v9 = CDPLocalizedString();
  uint64_t v16 = MEMORY[0x263EF8330];
  uint64_t v17 = 3221225472;
  id v18 = __73__CDPUIController__showResetKeychainConfirmationAlertWithViewController___block_invoke;
  uint64_t v19 = &unk_26433D498;
  id v20 = v4;
  id v21 = self;
  id v10 = v4;
  uint64_t v11 = [v8 actionWithTitle:v9 style:0 handler:&v16];

  id v12 = (void *)MEMORY[0x263F82418];
  uint64_t v13 = CDPLocalizedString();
  id v14 = CDPLocalizedString();
  id v15 = objc_msgSend(v12, "alertControllerWithTitle:message:preferredStyle:", v13, v14, 1, v16, v17, v18, v19);

  [v15 addAction:v7];
  [v15 addAction:v11];
  [(UINavigationController *)self->_navController presentViewController:v15 animated:1 completion:0];
}

uint64_t __73__CDPUIController__showResetKeychainConfirmationAlertWithViewController___block_invoke(uint64_t a1)
{
  id v2 = _CDPLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v14 = 0;
    _os_log_impl(&dword_2187CF000, v2, OS_LOG_TYPE_DEFAULT, "User request keychain reset during iCSC entry challenge", v14, 2u);
  }

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [*(id *)(a1 + 32) disableUserInteractionAndStartSpinner];
  }
  [*(id *)(a1 + 40) _dismissPresentedViewControllerWithReason:@"com.apple.CoreCDPUI.CDPEnrollmentCompleted" completion:0];
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = *(void **)(v3 + 136);
  if (!v4)
  {
    uint64_t v5 = _CDPLogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      __73__CDPUIController__showResetKeychainConfirmationAlertWithViewController___block_invoke_cold_1(v5, v6, v7, v8, v9, v10, v11, v12);
    }

    uint64_t v3 = *(void *)(a1 + 40);
    id v4 = *(void **)(v3 + 136);
  }
  return objc_msgSend(*(id *)(v3 + 24), "resetAccountCDPStateWithEscapeOptionsOffered:", objc_msgSend(v4, "escapeOffersPresented"));
}

- (void)_showTryAgainLaterConfirmationAlertWithViewController:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  uint64_t v5 = (void *)MEMORY[0x263F82400];
  uint64_t v6 = CDPLocalizedString();
  uint64_t v7 = [v5 actionWithTitle:v6 style:1 handler:0];

  uint64_t v8 = (void *)MEMORY[0x263F82400];
  uint64_t v9 = CDPLocalizedString();
  uint64_t v15 = MEMORY[0x263EF8330];
  uint64_t v16 = 3221225472;
  uint64_t v17 = __73__CDPUIController__showTryAgainLaterConfirmationAlertWithViewController___block_invoke;
  id v18 = &unk_26433D4C0;
  objc_copyWeak(&v19, &location);
  uint64_t v10 = [v8 actionWithTitle:v9 style:0 handler:&v15];

  uint64_t v11 = (void *)MEMORY[0x263F82418];
  uint64_t v12 = CDPLocalizedString();
  uint64_t v13 = CDPLocalizedString();
  id v14 = objc_msgSend(v11, "alertControllerWithTitle:message:preferredStyle:", v12, v13, 1, v15, v16, v17, v18);

  [v14 addAction:v10];
  [v14 addAction:v7];
  [(UINavigationController *)self->_navController presentViewController:v14 animated:1 completion:0];

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

void __73__CDPUIController__showTryAgainLaterConfirmationAlertWithViewController___block_invoke(uint64_t a1)
{
  id v2 = _CDPLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __73__CDPUIController__showTryAgainLaterConfirmationAlertWithViewController___block_invoke_cold_1();
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained sendEscapeOfferSelectedEvent:*MEMORY[0x263F34948]];
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __73__CDPUIController__showTryAgainLaterConfirmationAlertWithViewController___block_invoke_670;
    v5[3] = &unk_26433CC58;
    void v5[4] = v4;
    [v4 _dismissPresentedViewControllerWithReason:@"com.apple.CoreCDPUI.CDPEnrollmentCompleted" completion:v5];
  }
}

void __73__CDPUIController__showTryAgainLaterConfirmationAlertWithViewController___block_invoke_670(uint64_t a1)
{
  uint64_t v1 = *(void **)(*(void *)(a1 + 32) + 24);
  _CDPStateError();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v1 cancelValidationWithError:v2];
}

- (void)keychainSyncController:(id)a3 didFinishWithResult:(id)a4 error:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = v7;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v10 = [v8 objectForKey:@"securityCode"];
    [v9 disableUserInteractionAndStartSpinner];
    remoteSecretValidator = self->_remoteSecretValidator;
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    id v16[2] = __68__CDPUIController_keychainSyncController_didFinishWithResult_error___block_invoke;
    v16[3] = &unk_26433D510;
    id v17 = v9;
    id v18 = self;
    [(CDPRemoteDeviceSecretValidator *)remoteSecretValidator validateSecret:v10 devices:0 type:0 withCompletion:v16];
  }
  else if ([v8 isEqualToString:@"resetKeychain"])
  {
    uint64_t v12 = _CDPLogSystem();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_2187CF000, v12, OS_LOG_TYPE_DEFAULT, "User request keychain reset during iCSC entry challenge", buf, 2u);
    }

    [(CDPUIController *)self _dismissPresentedViewControllerCompletion:0];
    [(CDPRemoteDeviceSecretValidator *)self->_remoteSecretValidator resetAccountCDPStateWithEscapeOptionsOffered:[(CDPRPDLedger *)self->_ledger escapeOffersPresented]];
  }
  else if ([v8 isEqualToString:@"approveFromOtherDevice"])
  {
    uint64_t v13 = _CDPLogSystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      -[CDPUIController keychainSyncController:didFinishWithResult:error:]();
    }

    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __68__CDPUIController_keychainSyncController_didFinishWithResult_error___block_invoke_691;
    block[3] = &unk_26433CC58;
    void block[4] = self;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

void __68__CDPUIController_keychainSyncController_didFinishWithResult_error___block_invoke(uint64_t a1, int a2, char a3)
{
  [*(id *)(a1 + 32) enableUserInteractionAndStopSpinner];
  if (a2)
  {
    uint64_t v6 = _CDPLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      __68__CDPUIController_keychainSyncController_didFinishWithResult_error___block_invoke_cold_1();
    }

    [*(id *)(a1 + 40) _dismissPresentedViewControllerCompletion:0];
  }
  else
  {
    id v7 = (void *)MEMORY[0x263F82418];
    id v8 = CDPLocalizedString();
    id v9 = CDPLocalizedString();
    uint64_t v10 = [v7 alertControllerWithTitle:v8 message:v9 preferredStyle:1];

    uint64_t v11 = (void *)MEMORY[0x263F82400];
    uint64_t v12 = CDPLocalizedString();
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    id v16[2] = __68__CDPUIController_keychainSyncController_didFinishWithResult_error___block_invoke_689;
    v16[3] = &unk_26433D4E8;
    char v19 = a3;
    id v13 = *(id *)(a1 + 32);
    uint64_t v14 = *(void *)(a1 + 40);
    id v17 = v13;
    uint64_t v18 = v14;
    uint64_t v15 = [v11 actionWithTitle:v12 style:0 handler:v16];
    [v10 addAction:v15];

    [*(id *)(*(void *)(a1 + 40) + 32) presentViewController:v10 animated:1 completion:0];
  }
}

uint64_t __68__CDPUIController_keychainSyncController_didFinishWithResult_error___block_invoke_689(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 48)) {
    return [*(id *)(a1 + 32) setTextEntryText:&stru_26C9EBCA0];
  }
  else {
    return [*(id *)(a1 + 40) _dismissPresentedViewControllerCompletion:0];
  }
}

uint64_t __68__CDPUIController_keychainSyncController_didFinishWithResult_error___block_invoke_691(uint64_t a1)
{
  return [*(id *)(a1 + 32) _beginWaitingForApprovalFlow];
}

- (void)_beginWaitingForApprovalFlow
{
  uint64_t v3 = [CDPWaitingApprovalViewController alloc];
  id v4 = [(CDPUIController *)self _escapeOfferForSingleApprovalWithMask:[(CDPRemoteDeviceSecretValidator *)self->_remoteSecretValidator supportedEscapeOfferMask]];
  uint64_t v5 = [(CDPWaitingApprovalViewController *)v3 initWithEscapeOffer:v4];

  [(UINavigationController *)self->_navController pushViewController:v5 animated:1];
  [(CDPUIController *)self sendRemoteApprovalStartedBreadCrumbEventWithContext:self->_activeContext];
  remoteSecretValidator = self->_remoteSecretValidator;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __47__CDPUIController__beginWaitingForApprovalFlow__block_invoke;
  v8[3] = &unk_26433D038;
  void v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  [(CDPRemoteDeviceSecretValidator *)remoteSecretValidator approveFromAnotherDeviceWithCompletion:v8];
}

uint64_t __47__CDPUIController__beginWaitingForApprovalFlow__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v3 = a2;
  uint64_t result = [*(id *)(a1 + 32) sendRemoteApprovalCompletedEventWithContext:*(void *)(*(void *)(a1 + 32) + 56) didApprove:a2 error:a3];
  if (v3)
  {
    [*(id *)(a1 + 40) remoteApprovalSucceeded];
    uint64_t v6 = *(void **)(a1 + 32);
    return [v6 _dismissPresentedViewControllerCompletion:0];
  }
  return result;
}

- (void)cdpContext:(id)a3 createLocalSecretWithCompletion:(id)a4
{
  id v14 = a4;
  uint64_t v5 = [MEMORY[0x263F343A8] sharedInstance];
  int v6 = [v5 hasLocalSecret];

  if (v6)
  {
    id v7 = v14;
    if (!v14) {
      goto LABEL_6;
    }
    id v8 = _CDPStateError();
    (*((void (**)(id, void, void *))v14 + 2))(v14, 0, v8);
  }
  else
  {
    id v8 = [(CDPUIController *)self _noRecoveryFactorsBaseController];
    id v9 = [CDPUIDeviceToDeviceEncryptionFlowContext alloc];
    uint64_t v10 = [MEMORY[0x263F34328] sharedInstance];
    uint64_t v11 = [v10 primaryAccountAltDSID];
    uint64_t v12 = [(CDPUIDeviceToDeviceEncryptionFlowContext *)v9 initWithAltDSID:v11];

    [(CDPUIDeviceToDeviceEncryptionFlowContext *)v12 setPresentingViewController:v8];
    [(CDPUIDeviceToDeviceEncryptionFlowContext *)v12 setForceInlinePresentation:1];
    [(CDPUIDeviceToDeviceEncryptionFlowContext *)v12 setShouldSuppressPasscodeCreationCancelPrompt:1];
    id v13 = [[CDPUIDeviceToDeviceEncryptionHelper alloc] initWithContext:v12];
    [(CDPUIDeviceToDeviceEncryptionHelper *)v13 _configureNavigationController];
    [(CDPUIDeviceToDeviceEncryptionHelper *)v13 _createLocalSecretForContext:v12 completion:v14];
  }
  id v7 = v14;
LABEL_6:
}

- (id)_noRecoveryFactorsBaseController
{
  navController = self->_navController;
  if (navController)
  {
    int v3 = navController;
  }
  else
  {
    p_presentingViewController = &self->super._presentingViewController;
    id WeakRetained = objc_loadWeakRetained((id *)&self->super._presentingViewController);
    int v6 = [WeakRetained presentedViewController];
    id v7 = (UINavigationController *)objc_loadWeakRetained((id *)p_presentingViewController);
    int v3 = v7;
    if (v6)
    {
      uint64_t v8 = [(UINavigationController *)v7 presentedViewController];

      int v3 = (UINavigationController *)v8;
    }
  }

  return v3;
}

- (id)_makeGuitarfishTokenEscapeOption
{
  int v3 = objc_alloc_init(CDPEscapeOption);
  id v4 = CDPLocalizedStringInTable();
  [(CDPEscapeOption *)v3 setTitle:v4];

  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __51__CDPUIController__makeGuitarfishTokenEscapeOption__block_invoke;
  v6[3] = &unk_26433D150;
  objc_copyWeak(&v7, &location);
  [(CDPEscapeOption *)v3 setEscapeAction:v6];
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);

  return v3;
}

void __51__CDPUIController__makeGuitarfishTokenEscapeOption__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = _CDPLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __51__CDPUIController__makeGuitarfishTokenEscapeOption__block_invoke_cold_2(v2, v3, v4, v5, v6, v7, v8, v9);
  }

  if (WeakRetained)
  {
    uint64_t v10 = [[CDPUIEDPRecoveryTokenFlowCoordinator alloc] initWithValidator:WeakRetained[3] rpdLedger:WeakRetained[17] cdpContext:WeakRetained[7] showCancel:0 delegate:WeakRetained];
    [WeakRetained setEdpRecoveryTokenFlowCoordinator:v10];

    uint64_t v11 = [WeakRetained edpRecoveryTokenFlowCoordinator];
    [v11 setEnteredAfterFailedCDPRecovery:1];

    uint64_t v12 = (void *)WeakRetained[4];
    id v13 = [WeakRetained edpRecoveryTokenFlowCoordinator];
    id v14 = [v13 firstViewController];
    [v12 pushViewController:v14 animated:1];
  }
  else
  {
    id v13 = _CDPLogSystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      __51__CDPUIController__makeGuitarfishTokenEscapeOption__block_invoke_cold_1();
    }
  }
}

- (id)_skipOrDeleteiCloudDataEscapeOfferWithTitle:(id)a3 message:(id)a4 skipButtonTitle:(id)a5 supportedEscapeOfferMask:(unint64_t)a6
{
  char v6 = a6;
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = [[CDPRemoteValidationEscapeOffer alloc] initWithCDPContext:self->_activeContext];
  [(CDPRemoteValidationEscapeOffer *)v13 setTitle:v10];
  [(CDPRemoteValidationEscapeOffer *)v13 setMessage:v11];
  objc_initWeak(&location, self);
  id v14 = objc_alloc_init(CDPEscapeOption);
  [(CDPEscapeOption *)v14 setTitle:v12];
  [(CDPEscapeOption *)v14 setTitleTelemetryKey:*MEMORY[0x263F34948]];
  v36[0] = MEMORY[0x263EF8330];
  v36[1] = 3221225472;
  v36[2] = __112__CDPUIController__skipOrDeleteiCloudDataEscapeOfferWithTitle_message_skipButtonTitle_supportedEscapeOfferMask___block_invoke;
  void v36[3] = &unk_26433D150;
  objc_copyWeak(&v37, &location);
  [(CDPEscapeOption *)v14 setEscapeAction:v36];
  [(CDPRemoteValidationEscapeOffer *)v13 addEscapeOptionsObject:v14];
  if ((v6 & 8) != 0)
  {
    id v28 = [(CDPUIController *)self _buildQuotaRequestWithExtraChecks:0 andContext:self->_activeContext];
    int v15 = [v28 isUrlAvailable];
    uint64_t v16 = objc_alloc_init(CDPEscapeOption);
    if (v15)
    {
      id v17 = _CDPLogSystem();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v18 = [v28 urlString];
        -[CDPUIController _skipOrDeleteiCloudDataEscapeOfferWithTitle:message:skipButtonTitle:supportedEscapeOfferMask:](v18, buf, v17);
      }

      char v19 = [MEMORY[0x263F343B8] builderForKey:@"WALRUS_ALERT_BUTTON_TITLE_MORE_INFORMATION" inTable:@"Localizable-Walrus"];
      id v20 = [v19 localizedString];
      [(CDPEscapeOption *)v16 setTitle:v20];

      [(CDPEscapeOption *)v16 setStyle:0];
      [(CDPEscapeOption *)v16 setTitleTelemetryKey:*MEMORY[0x263F34920]];
      v33[0] = MEMORY[0x263EF8330];
      v33[1] = 3221225472;
      v33[2] = __112__CDPUIController__skipOrDeleteiCloudDataEscapeOfferWithTitle_message_skipButtonTitle_supportedEscapeOfferMask___block_invoke_698;
      v33[3] = &unk_26433D178;
      id v21 = &v35;
      objc_copyWeak(&v35, &location);
      id v34 = v28;
      [(CDPEscapeOption *)v16 setEscapeAction:v33];
    }
    else
    {
      id v22 = _CDPLogSystem();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
        -[CDPUIController _skipOrDeleteiCloudDataEscapeOfferWithTitle:message:skipButtonTitle:supportedEscapeOfferMask:]();
      }

      id v23 = [MEMORY[0x263F343B8] builderForKey:@"WALRUS_ALERT_BUTTON_TITLE_DELETE_ICLOUD_DATA" inTable:@"Localizable-Walrus"];
      id v24 = [v23 localizedString];
      [(CDPEscapeOption *)v16 setTitle:v24];

      [(CDPEscapeOption *)v16 setStyle:2];
      [(CDPEscapeOption *)v16 setTitleTelemetryKey:*MEMORY[0x263F34918]];
      v31[0] = MEMORY[0x263EF8330];
      v31[1] = 3221225472;
      v31[2] = __112__CDPUIController__skipOrDeleteiCloudDataEscapeOfferWithTitle_message_skipButtonTitle_supportedEscapeOfferMask___block_invoke_699;
      v31[3] = &unk_26433D178;
      id v21 = &v32;
      objc_copyWeak(&v32, &location);
      v31[4] = self;
      [(CDPEscapeOption *)v16 setEscapeAction:v31];
    }
    objc_destroyWeak(v21);
    if ([MEMORY[0x263F34400] shouldCentralizeRPDFlow])
    {
      v30[0] = MEMORY[0x263EF8330];
      v30[1] = 3221225472;
      v30[2] = __112__CDPUIController__skipOrDeleteiCloudDataEscapeOfferWithTitle_message_skipButtonTitle_supportedEscapeOfferMask___block_invoke_710;
      v30[3] = &unk_26433D538;
      v30[4] = self;
      [(CDPEscapeOption *)v16 setCanShowEscapeOption:v30];
    }
    else if (self->_isWalrusEnabled)
    {
      v29[0] = MEMORY[0x263EF8330];
      v29[1] = 3221225472;
      v29[2] = __112__CDPUIController__skipOrDeleteiCloudDataEscapeOfferWithTitle_message_skipButtonTitle_supportedEscapeOfferMask___block_invoke_712;
      v29[3] = &unk_26433D538;
      v29[4] = self;
      [(CDPEscapeOption *)v16 setCanShowEscapeOption:v29];
    }
    [(CDPRemoteValidationEscapeOffer *)v13 addEscapeOptionsObject:v16];
  }
  id v25 = +[CDPEscapeOption cancelOption];
  [(CDPRemoteValidationEscapeOffer *)v13 addEscapeOptionsObject:v25];

  id v26 = [(UINavigationController *)self->_navController topViewController];
  [(CDPRemoteValidationEscapeOffer *)v13 setPresentingViewController:v26];

  objc_destroyWeak(&v37);
  objc_destroyWeak(&location);

  return v13;
}

void __112__CDPUIController__skipOrDeleteiCloudDataEscapeOfferWithTitle_message_skipButtonTitle_supportedEscapeOfferMask___block_invoke(uint64_t a1)
{
  id v2 = _CDPLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __73__CDPUIController__showTryAgainLaterConfirmationAlertWithViewController___block_invoke_cold_1();
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v4 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained sendEscapeOfferSelectedEvent:*MEMORY[0x263F34948]];
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __112__CDPUIController__skipOrDeleteiCloudDataEscapeOfferWithTitle_message_skipButtonTitle_supportedEscapeOfferMask___block_invoke_694;
    v5[3] = &unk_26433CC58;
    void v5[4] = v4;
    [v4 _dismissPresentedViewControllerWithReason:@"com.apple.CoreCDPUI.CDPEnrollmentCompleted" completion:v5];
  }
}

void __112__CDPUIController__skipOrDeleteiCloudDataEscapeOfferWithTitle_message_skipButtonTitle_supportedEscapeOfferMask___block_invoke_694(uint64_t a1)
{
  uint64_t v1 = *(void **)(*(void *)(a1 + 32) + 24);
  _CDPStateError();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v1 cancelValidationWithError:v2];
}

void __112__CDPUIController__skipOrDeleteiCloudDataEscapeOfferWithTitle_message_skipButtonTitle_supportedEscapeOfferMask___block_invoke_698(uint64_t a1)
{
  id v2 = _CDPLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __112__CDPUIController__skipOrDeleteiCloudDataEscapeOfferWithTitle_message_skipButtonTitle_supportedEscapeOfferMask___block_invoke_698_cold_1();
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained sendEscapeOfferSelectedEvent:*MEMORY[0x263F34918]];
  [WeakRetained _showQuotaStorageAppListView:*(void *)(a1 + 32)];
}

void __112__CDPUIController__skipOrDeleteiCloudDataEscapeOfferWithTitle_message_skipButtonTitle_supportedEscapeOfferMask___block_invoke_699(uint64_t a1)
{
  id v2 = _CDPLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __112__CDPUIController__skipOrDeleteiCloudDataEscapeOfferWithTitle_message_skipButtonTitle_supportedEscapeOfferMask___block_invoke_699_cold_1();
  }

  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v4 = (void *)MEMORY[0x263F82418];
  uint64_t v5 = [MEMORY[0x263F343B8] builderForKey:@"WALRUS_STORAGE_LIST_UNAVAILABLE_CONFIRMATION_ALERT_TITLE" inTable:@"Localizable-Walrus"];
  char v6 = [v5 localizedString];
  uint64_t v7 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v8 = [v7 userInterfaceIdiom];

  uint64_t v9 = [v4 alertControllerWithTitle:v6 message:0 preferredStyle:(v8 & 0xFFFFFFFFFFFFFFFBLL) == 1];

  id v10 = (void *)MEMORY[0x263F82400];
  id v11 = [MEMORY[0x263F343B8] builderForKey:@"WALRUS_STORAGE_LIST_UNAVAILABLE_CONFIRMATION_DELETE_BUTTON_TITLE" inTable:@"Localizable-Walrus"];
  id v12 = [v11 localizedString];
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  id v21[2] = __112__CDPUIController__skipOrDeleteiCloudDataEscapeOfferWithTitle_message_skipButtonTitle_supportedEscapeOfferMask___block_invoke_706;
  v21[3] = &unk_26433D4C0;
  objc_copyWeak(&v22, (id *)(a1 + 40));
  id v13 = [v10 actionWithTitle:v12 style:2 handler:v21];

  id v14 = objc_alloc_init(MEMORY[0x263EFF980]);
  [v9 addAction:v13];
  [v14 addObject:*MEMORY[0x263F34918]];
  int v15 = (void *)MEMORY[0x263F82400];
  uint64_t v16 = CDPLocalizedString();
  id v17 = [v15 actionWithTitle:v16 style:1 handler:0];
  [v9 addAction:v17];

  uint64_t v18 = [MEMORY[0x263F202A8] analyticsEventWithContext:*(void *)(*(void *)(a1 + 32) + 56) eventName:*MEMORY[0x263F345F0] category:*MEMORY[0x263F34830]];
  [v14 addObject:*MEMORY[0x263F34858]];
  char v19 = objc_msgSend(v14, "aaf_arrayAsCommaSeperatedString");
  [v18 setObject:v19 forKeyedSubscript:*MEMORY[0x263F345E8]];

  id v20 = [MEMORY[0x263F34338] rtcAnalyticsReporter];
  [v20 sendEvent:v18];

  [WeakRetained[4] presentViewController:v9 animated:1 completion:0];
  objc_destroyWeak(&v22);
}

void __112__CDPUIController__skipOrDeleteiCloudDataEscapeOfferWithTitle_message_skipButtonTitle_supportedEscapeOfferMask___block_invoke_706(uint64_t a1)
{
  id v2 = _CDPLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __112__CDPUIController__skipOrDeleteiCloudDataEscapeOfferWithTitle_message_skipButtonTitle_supportedEscapeOfferMask___block_invoke_706_cold_1();
  }

  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained sendEscapeOfferSelectedEvent:*MEMORY[0x263F34918]];
  objc_msgSend(WeakRetained[3], "resetAccountCDPStateWithEscapeOptionsOffered:", objc_msgSend(WeakRetained[17], "escapeOffersPresented"));
}

uint64_t __112__CDPUIController__skipOrDeleteiCloudDataEscapeOfferWithTitle_message_skipButtonTitle_supportedEscapeOfferMask___block_invoke_710(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v2 = *(void **)(*(void *)(a1 + 32) + 136);
  if (!v2)
  {
    uint64_t v3 = _CDPLogSystem();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
      __112__CDPUIController__skipOrDeleteiCloudDataEscapeOfferWithTitle_message_skipButtonTitle_supportedEscapeOfferMask___block_invoke_710_cold_1(v3, v4, v5, v6, v7, v8, v9, v10);
    }

    id v2 = *(void **)(*(void *)(a1 + 32) + 136);
  }
  uint64_t v11 = [v2 canOfferRPD];
  if ((v11 & 1) == 0)
  {
    id v12 = _CDPLogSystem();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = [*(id *)(*(void *)(a1 + 32) + 136) rpdBlockingError];
      int v15 = 138412290;
      uint64_t v16 = v13;
      _os_log_impl(&dword_2187CF000, v12, OS_LOG_TYPE_DEFAULT, "Cannot offer RPD. Reason: %@", (uint8_t *)&v15, 0xCu);
    }
  }
  return v11;
}

uint64_t __112__CDPUIController__skipOrDeleteiCloudDataEscapeOfferWithTitle_message_skipButtonTitle_supportedEscapeOfferMask___block_invoke_712(uint64_t a1)
{
  if ([*(id *)(*(void *)(a1 + 32) + 16) count]) {
    id v2 = (double *)MEMORY[0x263F349A0];
  }
  else {
    id v2 = (double *)(*(void *)(a1 + 32) + 72);
  }
  double v3 = *v2;
  uint64_t v4 = [MEMORY[0x263F34328] sharedInstance];
  uint64_t v5 = [v4 rpdProbationIsInEffectForDuration:*(void *)(*(void *)(a1 + 32) + 56) context:v3];

  return v5;
}

- (void)_rpdEscapeOptionWithOffer:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_initWeak(&location, self);
  uint64_t v5 = [(CDPUIController *)self _buildQuotaRequestWithExtraChecks:0 andContext:self->_activeContext];
  int v6 = [v5 isUrlAvailable];
  uint64_t v7 = objc_alloc_init(CDPEscapeOption);
  if (v6)
  {
    uint64_t v8 = _CDPLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v9 = [v5 urlString];
      -[CDPUIController _skipOrDeleteiCloudDataEscapeOfferWithTitle:message:skipButtonTitle:supportedEscapeOfferMask:](v9, buf, v8);
    }

    uint64_t v10 = [MEMORY[0x263F343B8] builderForKey:@"REMOTE_SECRET_ENTRY_ALERT_MORE_OPTIONS"];
    uint64_t v11 = [v10 localizedString];
    [(CDPEscapeOption *)v7 setTitle:v11];

    [(CDPEscapeOption *)v7 setStyle:0];
    [(CDPEscapeOption *)v7 setTitleTelemetryKey:*MEMORY[0x263F34920]];
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __45__CDPUIController__rpdEscapeOptionWithOffer___block_invoke;
    v23[3] = &unk_26433D178;
    id v12 = &v25;
    objc_copyWeak(&v25, &location);
    id v24 = v5;
    [(CDPEscapeOption *)v7 setEscapeAction:v23];
  }
  else
  {
    id v13 = _CDPLogSystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      -[CDPUIController _skipOrDeleteiCloudDataEscapeOfferWithTitle:message:skipButtonTitle:supportedEscapeOfferMask:]();
    }

    id v14 = [MEMORY[0x263F343B8] builderForKey:@"REMOTE_SECRET_ENTRY_ALERT_MORE_OPTIONS"];
    int v15 = [v14 localizedString];
    [(CDPEscapeOption *)v7 setTitle:v15];

    [(CDPEscapeOption *)v7 setStyle:0];
    [(CDPEscapeOption *)v7 setTitleTelemetryKey:*MEMORY[0x263F34918]];
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    id v21[2] = __45__CDPUIController__rpdEscapeOptionWithOffer___block_invoke_716;
    v21[3] = &unk_26433D150;
    id v12 = &v22;
    objc_copyWeak(&v22, &location);
    [(CDPEscapeOption *)v7 setEscapeAction:v21];
  }
  objc_destroyWeak(v12);
  uint64_t v16 = +[CDPEscapeOption cancelOption];
  [v16 setStyle:0];
  if ([MEMORY[0x263F34400] shouldCentralizeRPDFlow])
  {
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    id v20[2] = __45__CDPUIController__rpdEscapeOptionWithOffer___block_invoke_718;
    v20[3] = &unk_26433D538;
    v20[4] = self;
    [(CDPEscapeOption *)v7 setCanShowEscapeOption:v20];
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    id v19[2] = __45__CDPUIController__rpdEscapeOptionWithOffer___block_invoke_719;
    v19[3] = &unk_26433D538;
    v19[4] = self;
    [v16 setCanShowEscapeOption:v19];
  }
  else if (self->_isWalrusEnabled)
  {
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __45__CDPUIController__rpdEscapeOptionWithOffer___block_invoke_720;
    v18[3] = &unk_26433D538;
    void v18[4] = self;
    [(CDPEscapeOption *)v7 setCanShowEscapeOption:v18];
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    id v17[2] = __45__CDPUIController__rpdEscapeOptionWithOffer___block_invoke_2;
    v17[3] = &unk_26433D538;
    void v17[4] = self;
    [v16 setCanShowEscapeOption:v17];
  }
  [v4 addEscapeOptionsObject:v7];
  [v4 addEscapeOptionsObject:v16];

  objc_destroyWeak(&location);
}

void __45__CDPUIController__rpdEscapeOptionWithOffer___block_invoke(uint64_t a1)
{
  id v2 = _CDPLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __112__CDPUIController__skipOrDeleteiCloudDataEscapeOfferWithTitle_message_skipButtonTitle_supportedEscapeOfferMask___block_invoke_698_cold_1();
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained sendEscapeOfferSelectedEvent:*MEMORY[0x263F34918]];
  [WeakRetained _showQuotaStorageAppListView:*(void *)(a1 + 32)];
}

void __45__CDPUIController__rpdEscapeOptionWithOffer___block_invoke_716(uint64_t a1)
{
  id v2 = _CDPLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __112__CDPUIController__skipOrDeleteiCloudDataEscapeOfferWithTitle_message_skipButtonTitle_supportedEscapeOfferMask___block_invoke_699_cold_1();
  }

  double v3 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v5 = (void *)MEMORY[0x263F82418];
  int v6 = [MEMORY[0x263F343B8] builderForKey:@"WALRUS_STORAGE_LIST_UNAVAILABLE_CONFIRMATION_ALERT_TITLE" inTable:@"Localizable-Walrus"];
  uint64_t v7 = [v6 localizedString];
  uint64_t v8 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v9 = [v8 userInterfaceIdiom];

  uint64_t v10 = [v5 alertControllerWithTitle:v7 message:0 preferredStyle:(v9 & 0xFFFFFFFFFFFFFFFBLL) == 1];

  uint64_t v11 = (void *)MEMORY[0x263F82400];
  id v12 = [MEMORY[0x263F343B8] builderForKey:@"WALRUS_STORAGE_LIST_UNAVAILABLE_CONFIRMATION_DELETE_BUTTON_TITLE" inTable:@"Localizable-Walrus"];
  id v13 = [v12 localizedString];
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  id v22[2] = __45__CDPUIController__rpdEscapeOptionWithOffer___block_invoke_717;
  v22[3] = &unk_26433D4C0;
  objc_copyWeak(&v23, v3);
  id v14 = [v11 actionWithTitle:v13 style:2 handler:v22];

  id v15 = objc_alloc_init(MEMORY[0x263EFF980]);
  [v10 addAction:v14];
  [v15 addObject:*MEMORY[0x263F34918]];
  uint64_t v16 = (void *)MEMORY[0x263F82400];
  uint64_t v17 = CDPLocalizedString();
  uint64_t v18 = [v16 actionWithTitle:v17 style:1 handler:0];
  [v10 addAction:v18];

  char v19 = [MEMORY[0x263F202A8] analyticsEventWithContext:*((void *)WeakRetained + 7) eventName:*MEMORY[0x263F345F0] category:*MEMORY[0x263F34830]];
  [v15 addObject:*MEMORY[0x263F34858]];
  id v20 = objc_msgSend(v15, "aaf_arrayAsCommaSeperatedString");
  [v19 setObject:v20 forKeyedSubscript:*MEMORY[0x263F345E8]];

  id v21 = [MEMORY[0x263F34338] rtcAnalyticsReporter];
  [v21 sendEvent:v19];

  [*((id *)WeakRetained + 4) presentViewController:v10 animated:1 completion:0];
  objc_destroyWeak(&v23);
}

void __45__CDPUIController__rpdEscapeOptionWithOffer___block_invoke_717(uint64_t a1)
{
  id v2 = _CDPLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __112__CDPUIController__skipOrDeleteiCloudDataEscapeOfferWithTitle_message_skipButtonTitle_supportedEscapeOfferMask___block_invoke_706_cold_1();
  }

  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained sendEscapeOfferSelectedEvent:*MEMORY[0x263F34918]];
  objc_msgSend(WeakRetained[3], "resetAccountCDPStateWithEscapeOptionsOffered:", objc_msgSend(WeakRetained[17], "escapeOffersPresented"));
}

uint64_t __45__CDPUIController__rpdEscapeOptionWithOffer___block_invoke_718(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v2 = *(void **)(*(void *)(a1 + 32) + 136);
  if (!v2)
  {
    double v3 = _CDPLogSystem();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
      __45__CDPUIController__rpdEscapeOptionWithOffer___block_invoke_718_cold_1(v3, v4, v5, v6, v7, v8, v9, v10);
    }

    id v2 = *(void **)(*(void *)(a1 + 32) + 136);
  }
  uint64_t v11 = [v2 canOfferRPD];
  if ((v11 & 1) == 0)
  {
    id v12 = _CDPLogSystem();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = [*(id *)(*(void *)(a1 + 32) + 136) rpdBlockingError];
      int v15 = 138412290;
      uint64_t v16 = v13;
      _os_log_impl(&dword_2187CF000, v12, OS_LOG_TYPE_DEFAULT, "Cannot offer RPD. Reason: %@", (uint8_t *)&v15, 0xCu);
    }
  }
  return v11;
}

uint64_t __45__CDPUIController__rpdEscapeOptionWithOffer___block_invoke_719(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v2 = *(void **)(*(void *)(a1 + 32) + 136);
  if (!v2)
  {
    double v3 = _CDPLogSystem();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
      __45__CDPUIController__rpdEscapeOptionWithOffer___block_invoke_718_cold_1(v3, v4, v5, v6, v7, v8, v9, v10);
    }

    id v2 = *(void **)(*(void *)(a1 + 32) + 136);
  }
  uint64_t v11 = [v2 canOfferRPD];
  if ((v11 & 1) == 0)
  {
    id v12 = _CDPLogSystem();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = [*(id *)(*(void *)(a1 + 32) + 136) rpdBlockingError];
      int v15 = 138412290;
      uint64_t v16 = v13;
      _os_log_impl(&dword_2187CF000, v12, OS_LOG_TYPE_DEFAULT, "Cannot offer RPD. Reason: %@", (uint8_t *)&v15, 0xCu);
    }
  }
  return v11;
}

uint64_t __45__CDPUIController__rpdEscapeOptionWithOffer___block_invoke_720(uint64_t a1)
{
  id v2 = [MEMORY[0x263F34328] sharedInstance];
  uint64_t v3 = [v2 rpdProbationIsInEffectForDuration:*(void *)(*(void *)(a1 + 32) + 56) context:*(double *)(*(void *)(a1 + 32) + 72)];

  return v3;
}

uint64_t __45__CDPUIController__rpdEscapeOptionWithOffer___block_invoke_2(uint64_t a1)
{
  id v2 = [MEMORY[0x263F34328] sharedInstance];
  uint64_t v3 = [v2 rpdProbationIsInEffectForDuration:*(void *)(*(void *)(a1 + 32) + 56) context:*(double *)(*(void *)(a1 + 32) + 72)];

  return v3;
}

- (id)_iCSCSkipOrDeleteiCloudDataEscapeOfferWithTitle:(id)a3 message:(id)a4 skipButtonTitle:(id)a5 supportedEscapeOfferMask:(unint64_t)a6 withDevice:(id)a7
{
  char v8 = a6;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  uint64_t v16 = [[CDPRemoteValidationEscapeOffer alloc] initWithCDPContext:self->_activeContext];
  [(CDPRemoteValidationEscapeOffer *)v16 setTitle:v12];
  [(CDPRemoteValidationEscapeOffer *)v16 setMessage:v13];
  objc_initWeak(&location, self);
  if ([v14 length])
  {
    uint64_t v17 = objc_alloc_init(CDPEscapeOption);
    [(CDPEscapeOption *)v17 setTitle:v14];
    [(CDPEscapeOption *)v17 setTitleTelemetryKey:*MEMORY[0x263F34948]];
    uint64_t v20 = MEMORY[0x263EF8330];
    uint64_t v21 = 3221225472;
    id v22 = __127__CDPUIController__iCSCSkipOrDeleteiCloudDataEscapeOfferWithTitle_message_skipButtonTitle_supportedEscapeOfferMask_withDevice___block_invoke;
    id v23 = &unk_26433D150;
    objc_copyWeak(&v24, &location);
    [(CDPEscapeOption *)v17 setEscapeAction:&v20];
    -[CDPRemoteValidationEscapeOffer addEscapeOptionsObject:](v16, "addEscapeOptionsObject:", v17, v20, v21, v22, v23);
    objc_destroyWeak(&v24);
  }
  if ((v8 & 8) != 0) {
    [(CDPUIController *)self _rpdEscapeOptionWithOffer:v16];
  }
  uint64_t v18 = [(UINavigationController *)self->_navController topViewController];
  [(CDPRemoteValidationEscapeOffer *)v16 setPresentingViewController:v18];

  objc_destroyWeak(&location);

  return v16;
}

void __127__CDPUIController__iCSCSkipOrDeleteiCloudDataEscapeOfferWithTitle_message_skipButtonTitle_supportedEscapeOfferMask_withDevice___block_invoke(uint64_t a1)
{
  id v2 = _CDPLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __73__CDPUIController__showTryAgainLaterConfirmationAlertWithViewController___block_invoke_cold_1();
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained sendEscapeOfferSelectedEvent:*MEMORY[0x263F34948]];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __127__CDPUIController__iCSCSkipOrDeleteiCloudDataEscapeOfferWithTitle_message_skipButtonTitle_supportedEscapeOfferMask_withDevice___block_invoke_721;
  v5[3] = &unk_26433CC58;
  id v6 = WeakRetained;
  id v4 = WeakRetained;
  [v4 _dismissPresentedViewControllerWithReason:@"com.apple.CoreCDPUI.CDPEnrollmentCompleted" completion:v5];
}

void __127__CDPUIController__iCSCSkipOrDeleteiCloudDataEscapeOfferWithTitle_message_skipButtonTitle_supportedEscapeOfferMask_withDevice___block_invoke_721(uint64_t a1)
{
  uint64_t v1 = *(void **)(*(void *)(a1 + 32) + 24);
  _CDPStateError();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v1 cancelValidationWithError:v2];
}

- (void)cdpContext:(id)a3 showResetCompletedAlertWithCompletion:(id)a4
{
  v11[1] = *MEMORY[0x263EF8340];
  uint64_t v5 = [(CDPUIController *)self _iCloudDeleteConfirmationViewController:a4];
  [(CDPUIController *)self _setResetCompletedView:v5];
  [(CDPUIController *)self _enableUserInteractionAndStopSpinner];
  navController = self->_navController;
  uint64_t v7 = _CDPLogSystem();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  if (navController)
  {
    if (v8) {
      -[CDPUIController cdpContext:showResetCompletedAlertWithCompletion:]();
    }

    uint64_t v9 = self->_navController;
    v11[0] = v5;
    uint64_t v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:1];
    [(UINavigationController *)v9 setViewControllers:v10 animated:1];
  }
  else
  {
    if (v8) {
      -[CDPUIController cdpContext:showResetCompletedAlertWithCompletion:]();
    }

    uint64_t v10 = [(CDPUIController *)self _noRecoveryFactorsBaseController];
    [v10 presentViewController:v5 animated:1 completion:0];
  }
}

- (void)_setResetCompletedView:(id)a3
{
}

- (void)cdpContext:(id)a3 showResetFailedAlertWithUnderlyingError:(id)a4 completion:(id)a5
{
  v20[1] = *MEMORY[0x263EF8340];
  id v7 = a5;
  id v8 = a4;
  uint64_t v9 = (void *)[MEMORY[0x263EFFA78] mutableCopy];
  uint64_t v10 = CDPLocalizedString();
  [v9 setObject:v10 forKeyedSubscript:*MEMORY[0x263F08320]];

  uint64_t v11 = CDPLocalizedString();
  [v9 setObject:v11 forKeyedSubscript:*MEMORY[0x263F08338]];

  id v12 = [MEMORY[0x263F343B8] builderForKey:@"GENERIC_ERROR_DEFAULT_BUTTON"];
  id v13 = [v12 localizedString];
  v20[0] = v13;
  id v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:1];
  [v9 setObject:v14 forKeyedSubscript:*MEMORY[0x263F08340]];

  [v9 setObject:v8 forKeyedSubscript:*MEMORY[0x263F08608]];
  id v15 = _CDPStateError();
  activeContext = self->_activeContext;
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __81__CDPUIController_cdpContext_showResetFailedAlertWithUnderlyingError_completion___block_invoke;
  v18[3] = &unk_26433D560;
  id v19 = v7;
  id v17 = v7;
  [(CDPUIController *)self cdpContext:activeContext showError:v15 withDefaultIndex:0 withCompletion:v18];
}

uint64_t __81__CDPUIController_cdpContext_showResetFailedAlertWithUnderlyingError_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, void))(result + 16))(result, 1, 0);
  }
  return result;
}

- (void)cdpContext:(id)a3 promptForEDPRecoveryTokenWithValidator:(id)a4 successfulCDPRecoveryContinuationHandler:(id)a5
{
  id v25 = a3;
  id v9 = a4;
  objc_storeStrong((id *)&self->_activeContext, a3);
  id v10 = a5;
  objc_storeStrong((id *)&self->_remoteSecretValidator, a4);
  uint64_t v11 = _Block_copy(v10);

  id cdpRecoverySuccessFromEDPContinuationHandler = self->_cdpRecoverySuccessFromEDPContinuationHandler;
  self->_id cdpRecoverySuccessFromEDPContinuationHandler = v11;

  if (!self->_ledger)
  {
    id v13 = objc_alloc_init(MEMORY[0x263F343E0]);
    [v13 setContext:v25];
    [v13 setIsWalrusEnabled:0];
    [v13 setRpdProbationDuration:self->_rpdProbationDuration];
    id v14 = objc_alloc(MEMORY[0x263F349D0]);
    uint64_t v15 = [v9 supportedEscapeOfferMask];
    uint64_t v16 = [MEMORY[0x263F343A8] sharedInstance];
    uint64_t v17 = [v16 hasLocalSecret];
    uint64_t v18 = [MEMORY[0x263F34328] sharedInstance];
    id v19 = (CDPRPDLedger *)objc_msgSend(v14, "initWithExpectedEscapeOffers:recoveryFlowContext:deviceHasPasscode:probationChecker:deviceIsVM:isICDPEnabled:", v15, v13, v17, v18, objc_msgSend(MEMORY[0x263F34400], "isVirtualMachine"), objc_msgSend(v25, "isICDPEnabledFromNetwork"));
    ledger = self->_ledger;
    self->_ledger = v19;
  }
  uint64_t v21 = (void *)[objc_alloc(MEMORY[0x263F343C0]) initWithContext:v25];
  if ([v21 isManateeAvailable:0]) {
    [(CDPRPDLedger *)self->_ledger satisfyManateeRequirementsForEDPRPD];
  }
  id v22 = [[CDPUIEDPRecoveryTokenFlowCoordinator alloc] initWithValidator:v9 rpdLedger:self->_ledger cdpContext:v25 showCancel:1 delegate:self];
  [(CDPUIController *)self setEdpRecoveryTokenFlowCoordinator:v22];

  id v23 = [(CDPUIController *)self edpRecoveryTokenFlowCoordinator];
  id v24 = [v23 firstViewController];
  [(CDPUIController *)self _presentRootController:v24 completion:0];
}

- (void)_showQuotaStorageAppListView:(id)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __48__CDPUIController__showQuotaStorageAppListView___block_invoke;
  v3[3] = &unk_26433D588;
  v3[4] = self;
  [(CDPUIController *)self _showQuotaStorageAppListView:a3 andCompletion:v3];
}

void __48__CDPUIController__showQuotaStorageAppListView___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v6 = a3;
  uint64_t v5 = *(id **)(a1 + 32);
  if (a2) {
    objc_msgSend(v5[3], "resetAccountCDPStateWithEscapeOptionsOffered:andSetSecret:", objc_msgSend(v5[17], "escapeOffersPresented"), v6);
  }
  else {
    [v5 cancelTapped:*(void *)(a1 + 32)];
  }
}

- (void)_showQuotaStorageAppListView:(id)a3 andCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 urlRequest];
  id v9 = _CDPLogSystem();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    -[CDPUIController _showQuotaStorageAppListView:andCompletion:](v8, v9);
  }

  id v10 = (RemoteUIController *)objc_alloc_init(MEMORY[0x263F637E8]);
  storageAppListRemoteUIController = self->_storageAppListRemoteUIController;
  self->_storageAppListRemoteUIController = v10;

  [self->_storageAppListRemoteUIController setDelegate:self];
  id v12 = self->_storageAppListRemoteUIController;
  id v13 = [(CDPUIController *)self _noRecoveryFactorsBaseController];
  [(RemoteUIController *)v12 setHostViewController:v13];

  objc_initWeak(&location, self);
  id v14 = self->_storageAppListRemoteUIController;
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  void v20[2] = __62__CDPUIController__showQuotaStorageAppListView_andCompletion___block_invoke_744;
  v20[3] = &unk_26433D5D0;
  objc_copyWeak(&v22, &location);
  id v15 = v7;
  id v21 = v15;
  id v16 = (id)[(RemoteUIController *)v14 setHandlerForElementsMatching:&__block_literal_global_734 handler:v20];
  uint64_t v17 = self->_storageAppListRemoteUIController;
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __62__CDPUIController__showQuotaStorageAppListView_andCompletion___block_invoke_746;
  v18[3] = &unk_26433D620;
  objc_copyWeak(&v19, &location);
  void v18[4] = self;
  [(RemoteUIController *)v17 loadRequest:v8 completion:v18];
  objc_destroyWeak(&v19);

  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);
}

uint64_t __62__CDPUIController__showQuotaStorageAppListView_andCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v2 = a2;
  uint64_t v3 = [v2 attributes];
  id v4 = [v3 objectForKeyedSubscript:@"action"];

  if ([@"dismiss" isEqualToString:v4]) {
    uint64_t v5 = 1;
  }
  else {
    uint64_t v5 = [@"user_wants:cdp_reset" isEqualToString:v4];
  }
  id v6 = _CDPLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    id v8 = [v2 attributes];
    v9[0] = 67109634;
    v9[1] = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v4;
    __int16 v12 = 2112;
    id v13 = v8;
    _os_log_debug_impl(&dword_2187CF000, v6, OS_LOG_TYPE_DEBUG, "iCSS Quota: Elements matches: %{BOOL}d, action = %@, all attributes %@", (uint8_t *)v9, 0x1Cu);
  }
  return v5;
}

void __62__CDPUIController__showQuotaStorageAppListView_andCompletion___block_invoke_744(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  id v8 = _CDPLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    __62__CDPUIController__showQuotaStorageAppListView_andCompletion___block_invoke_744_cold_4();
  }

  id v9 = [v7 objectForKeyedSubscript:@"action"];
  if ([@"dismiss" isEqualToString:v9])
  {
    __int16 v10 = _CDPLogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      __62__CDPUIController__showQuotaStorageAppListView_andCompletion___block_invoke_744_cold_1();
    }

    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    if (WeakRetained) {
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    }
  }
  else
  {
    int v12 = [@"user_wants:cdp_reset" isEqualToString:v9];
    id WeakRetained = _CDPLogSystem();
    BOOL v13 = os_log_type_enabled(WeakRetained, OS_LOG_TYPE_DEBUG);
    if (v12)
    {
      if (v13) {
        __62__CDPUIController__showQuotaStorageAppListView_andCompletion___block_invoke_744_cold_2();
      }

      uint64_t v14 = objc_loadWeakRetained((id *)(a1 + 40));
      id WeakRetained = v14;
      if (v14)
      {
        [v14 _disableUserInteractionAndStartSpinner];
        [WeakRetained _handleResetActionWithCompletion:*(void *)(a1 + 32)];
      }
    }
    else if (v13)
    {
      __62__CDPUIController__showQuotaStorageAppListView_andCompletion___block_invoke_744_cold_3();
    }
  }
}

void __62__CDPUIController__showQuotaStorageAppListView_andCompletion___block_invoke_746(uint64_t a1, char a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = _CDPLogSystem();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v7)
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_2187CF000, v6, OS_LOG_TYPE_DEFAULT, "iCSS Quota: Successfully loaded storageAppList remote UI!", buf, 2u);
    }
  }
  else
  {
    if (v7)
    {
      *(_DWORD *)long long buf = 138412290;
      id v16 = v5;
      _os_log_impl(&dword_2187CF000, v6, OS_LOG_TYPE_DEFAULT, "iCSS Quota: Unable to load storageAppList remote UI: %@", buf, 0xCu);
    }

    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    id v6 = WeakRetained;
    if (WeakRetained)
    {
      id v9 = [WeakRetained _quotaScreenRPDErrorWithUnderlyingError:v5];
      uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 56);
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __62__CDPUIController__showQuotaStorageAppListView_andCompletion___block_invoke_747;
      v12[3] = &unk_26433D5F8;
      id v6 = v6;
      BOOL v13 = v6;
      id v14 = v9;
      id v11 = v9;
      [v6 cdpContext:v10 showError:v11 withCompletion:v12];
    }
  }
}

uint64_t __62__CDPUIController__showQuotaStorageAppListView_andCompletion___block_invoke_747(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) cancelValidationWithError:*(void *)(a1 + 40)];
}

- (void)_handleResetActionWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x263F34328];
  id v6 = [(CDPContext *)self->_activeContext dsid];
  BOOL v7 = [v6 stringValue];
  LODWORD(v5) = [v5 isICDPEnabledForDSID:v7];

  if (v5
    && ([MEMORY[0x263F343A8] sharedInstance],
        id v8 = objc_claimAutoreleasedReturnValue(),
        char v9 = [v8 hasLocalSecret],
        v8,
        (v9 & 1) == 0))
  {
    activeContext = self->_activeContext;
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    void v11[2] = __52__CDPUIController__handleResetActionWithCompletion___block_invoke;
    v11[3] = &unk_26433D648;
    id v12 = v4;
    [(CDPUIController *)self cdpContext:activeContext createLocalSecretWithCompletion:v11];
  }
  else
  {
    (*((void (**)(id, uint64_t, void))v4 + 2))(v4, 1, 0);
  }
}

void __52__CDPUIController__handleResetActionWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  BOOL v7 = _CDPLogSystem();
  id v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v10 = 0;
      _os_log_impl(&dword_2187CF000, v8, OS_LOG_TYPE_DEFAULT, "Created local secret successfully in CDPUIController", v10, 2u);
    }

    char v9 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __52__CDPUIController__handleResetActionWithCompletion___block_invoke_cold_1();
    }

    char v9 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  v9();
}

- (id)_quotaScreenRPDErrorWithUnderlyingError:(id)a3
{
  v12[1] = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = (void *)[MEMORY[0x263EFFA78] mutableCopy];
  id v5 = CDPLocalizedString();
  [v4 setObject:v5 forKeyedSubscript:*MEMORY[0x263F08320]];

  id v6 = CDPLocalizedString();
  [v4 setObject:v6 forKeyedSubscript:*MEMORY[0x263F08338]];

  BOOL v7 = [MEMORY[0x263F343B8] builderForKey:@"GENERIC_ERROR_DEFAULT_BUTTON"];
  id v8 = [v7 localizedString];
  v12[0] = v8;
  char v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:1];
  [v4 setObject:v9 forKeyedSubscript:*MEMORY[0x263F08340]];

  [v4 setObject:v3 forKeyedSubscript:*MEMORY[0x263F08608]];
  uint64_t v10 = _CDPStateError();

  return v10;
}

- (void)_disableUserInteractionAndStartSpinner
{
  id v3 = [MEMORY[0x263F5FBF8] sharedSpinnerManager];
  id v4 = [(UINavigationController *)self->_navController topViewController];
  id v5 = [v4 navigationItem];
  [v3 startAnimatingInNavItem:v5 forIdentifier:@"cdpuicontroller" hideBackButton:1];

  id v7 = [(UINavigationController *)self->_navController topViewController];
  id v6 = [v7 view];
  [v6 setUserInteractionEnabled:0];
}

- (void)_enableUserInteractionAndStopSpinner
{
  id v2 = [(UINavigationController *)self->_navController topViewController];
  id v3 = [v2 view];
  [v3 setUserInteractionEnabled:1];

  id v4 = [MEMORY[0x263F5FBF8] sharedSpinnerManager];
  [v4 stopAnimatingForIdentifier:@"cdpuicontroller"];
}

- (id)_iCloudDeleteConfirmationViewController:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(CDPUIInfoViewModel);
  id v6 = [MEMORY[0x263F343B8] builderForKey:@"WALRUS_ICLOUD_DELETED_CONFIRM_VIEW_TITLE" inTable:@"Localizable-Walrus"];
  id v7 = [v6 localizedString];
  [(CDPUIInfoViewModel *)v5 setTitle:v7];

  id v8 = [MEMORY[0x263F343B8] builderForKey:@"WALRUS_ICLOUD_DELETED_CONFIRM_VIEW_MESSAGE" inTable:@"Localizable-Walrus"];
  char v9 = [v8 localizedString];
  [(CDPUIInfoViewModel *)v5 setMessage:v9];

  objc_initWeak(&location, self);
  uint64_t v10 = objc_alloc_init(CDPEscapeOption);
  id v11 = [MEMORY[0x263F343B8] builderForKey:@"WALRUS_ICLOUD_DELETED_CONFIRM_DONE_BUTTON_TITLE" inTable:@"Localizable-Walrus"];
  id v12 = [v11 localizedString];
  [(CDPEscapeOption *)v10 setTitle:v12];

  [(CDPEscapeOption *)v10 setTitleTelemetryKey:*MEMORY[0x263F34878]];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  id v16[2] = __59__CDPUIController__iCloudDeleteConfirmationViewController___block_invoke;
  v16[3] = &unk_26433D670;
  objc_copyWeak(&v18, &location);
  id v13 = v4;
  id v17 = v13;
  [(CDPEscapeOption *)v10 setEscapeAction:v16];
  [(CDPUIInfoViewModel *)v5 setOption1:v10];
  id v14 = [[CDPUIInfoViewController alloc] initWithViewModel:v5];

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);

  return v14;
}

void __59__CDPUIController__iCloudDeleteConfirmationViewController___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = _CDPLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_2187CF000, v3, OS_LOG_TYPE_DEFAULT, "iCSS Quota: Done", buf, 2u);
  }

  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __59__CDPUIController__iCloudDeleteConfirmationViewController___block_invoke_763;
  v4[3] = &unk_26433CDE0;
  id v5 = *(id *)(a1 + 32);
  [WeakRetained _dismissPresentedViewControllerWithReason:@"com.apple.CoreCDPUI.CDPEnrollmentCompleted" completion:v4];
}

uint64_t __59__CDPUIController__iCloudDeleteConfirmationViewController___block_invoke_763(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)_buildQuotaRequestWithExtraChecks:(BOOL)a3 andContext:(id)a4
{
  id v6 = a4;
  if (!a3)
  {
    BOOL v10 = !self->_isWalrusEnabled;
    uint64_t v11 = 2 * self->_isWalrusEnabled;
    id v12 = [CDPQuotaStorageAppListRequest alloc];
    id v13 = [MEMORY[0x263F34328] sharedInstance];
    id v14 = [v13 primaryAppleAccount];
    id v15 = [(CDPQuotaStorageAppListRequest *)v12 initWithAccount:v14 appList:v11 contentSpecifiesE2EE:v10];

    goto LABEL_18;
  }
  id v7 = (void *)[objc_alloc(MEMORY[0x263F343C0]) initWithContext:v6];
  int v8 = [v7 isManateeAvailable:0];
  if ([v6 isHSA2Account])
  {
    if (v8)
    {
      char v9 = _CDPLogSystem();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        -[CDPUIController _buildQuotaRequestWithExtraChecks:andContext:]();
      }
    }
    else
    {
      int v16 = [v6 is2FAFAUserFromNetwork];
      char v9 = _CDPLogSystem();
      BOOL v17 = os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG);
      if (!v16)
      {
        if (v17) {
          -[CDPUIController _buildQuotaRequestWithExtraChecks:andContext:].cold.4();
        }
        uint64_t v18 = 2;
        goto LABEL_13;
      }
      if (v17) {
        -[CDPUIController _buildQuotaRequestWithExtraChecks:andContext:]();
      }
    }
  }
  else
  {
    char v9 = _CDPLogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[CDPUIController _buildQuotaRequestWithExtraChecks:andContext:].cold.5();
    }
  }
  uint64_t v18 = 1;
LABEL_13:

  id v19 = [(CDPUIController *)self _buildQuotaStorageRequestConfiguratorWithAppList:v18 quotaContentSpecifiesE2EE:0];
  id v23 = 0;
  id v15 = [v19 quotaRequest:&v23];
  id v20 = v23;
  if (v20)
  {
    id v21 = _CDPLogSystem();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      -[CDPUIController _buildQuotaRequestWithExtraChecks:andContext:]((uint64_t)v20, v18, v21);
    }
  }
LABEL_18:

  return v15;
}

- (id)_buildQuotaStorageRequestConfiguratorWithAppList:(unint64_t)a3 quotaContentSpecifiesE2EE:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = [CDPQuotaStorageRequestConfigurator alloc];
  id v7 = [MEMORY[0x263F34328] sharedInstance];
  int v8 = [v7 primaryAppleAccount];
  char v9 = [(CDPQuotaStorageRequestConfigurator *)v6 initWithAccount:v8 appList:a3 contentSpecifiesE2EE:v4];

  return v9;
}

- (void)remoteUIController:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5
{
  id v6 = (objc_class *)MEMORY[0x263F202D0];
  id v7 = (void (**)(id, uint64_t, void))a5;
  id v8 = a4;
  id v10 = objc_alloc_init(v6);
  uint64_t v9 = [v10 validateCertificateTrustWithChallenge:v8 type:0];

  v7[2](v7, v9, 0);
}

- (BOOL)_isQuotaServiceHost:(id)a3
{
  id v3 = a3;
  BOOL v4 = ([v3 isEqualToString:@"quota.icloud.com"] & 1) != 0
    || [v3 rangeOfString:@"p\\d{2}-quota.icloud.com" options:1024] != 0x7FFFFFFFFFFFFFFFLL;

  return v4;
}

- (BOOL)_canShowRPD
{
  if ([MEMORY[0x263F34400] shouldCentralizeRPDFlow])
  {
    ledger = self->_ledger;
    return [(CDPRPDLedger *)ledger canOfferRPD];
  }
  else
  {
    id v5 = [MEMORY[0x263F34328] sharedInstance];
    char v6 = [v5 rpdProbationIsInEffectForDuration:self->_activeContext context:self->_rpdProbationDuration];

    return v6;
  }
}

- (void)remoteSecretEntryDidAcceptValidSecret
{
  id v3 = _CDPLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v4 = 0;
    _os_log_impl(&dword_2187CF000, v3, OS_LOG_TYPE_DEFAULT, "Remote secret entry accepted valid secret", v4, 2u);
  }

  if (![(CDPUIController *)self forceInlinePresentation]) {
    [(CDPUIController *)self _dismissPresentedViewControllerCompletion:0];
  }
}

- (void)remoteSecretEntryDidRequestCancellation
{
  if (self->_rootViewController)
  {
    [(CDPRemoteDeviceSecretValidator *)self->_remoteSecretValidator cancelApproveFromAnotherDevice];
    if (![(CDPUIController *)self forceInlinePresentation]) {
      [(CDPUIController *)self _dismissPresentedViewControllerCompletion:0];
    }
    remoteSecretValidator = self->_remoteSecretValidator;
    _CDPStateError();
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    [(CDPRemoteDeviceSecretValidator *)remoteSecretValidator cancelValidationWithError:v4];
  }
}

- (void)remoteSecretEntryDidExceedMaximumAttempts
{
  if (self->_rootViewController) {
    [(CDPUIController *)self _dismissPresentedViewControllerWithReason:0 completion:&__block_literal_global_775];
  }
}

void __60__CDPUIController_remoteSecretEntryDidExceedMaximumAttempts__block_invoke()
{
  v0 = _CDPLogSystem();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v1 = 0;
    _os_log_impl(&dword_2187CF000, v0, OS_LOG_TYPE_DEFAULT, "UI dismissed", v1, 2u);
  }
}

- (void)remoteSecretEntryDidDepleteRemainingAttemptsForDevice:(id)a3
{
}

- (void)remoteSecretEntryDidRequestRecoveryKeyRecovery
{
}

- (void)remoteSecretEntryDidRequestCustodianRecovery
{
}

- (void)remoteSecretEntryDidRequestRemoteApproval
{
}

- (void)remoteSecretEntryDidRequestEDPRecoveryTokenRecovery
{
  id v3 = _CDPLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_2187CF000, v3, OS_LOG_TYPE_DEFAULT, "User elected to start EDP Recovery Token Flow. Showing Intro screen", buf, 2u);
  }

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __70__CDPUIController_remoteSecretEntryDidRequestEDPRecoveryTokenRecovery__block_invoke;
  block[3] = &unk_26433CC58;
  void block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __70__CDPUIController_remoteSecretEntryDidRequestEDPRecoveryTokenRecovery__block_invoke(uint64_t a1)
{
  id v2 = -[CDPUIEDPRecoveryTokenFlowCoordinator initWithValidator:rpdLedger:cdpContext:showCancel:delegate:]([CDPUIEDPRecoveryTokenFlowCoordinator alloc], "initWithValidator:rpdLedger:cdpContext:showCancel:delegate:", *(void *)(*(void *)(a1 + 32) + 24), *(void *)(*(void *)(a1 + 32) + 136), *(void *)(*(void *)(a1 + 32) + 56), 1);
  [*(id *)(a1 + 32) setEdpRecoveryTokenFlowCoordinator:v2];

  id v3 = [*(id *)(a1 + 32) edpRecoveryTokenFlowCoordinator];
  [v3 setEnteredAfterFailedCDPRecovery:1];

  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = v4[14];
  id v7 = [v4 edpRecoveryTokenFlowCoordinator];
  char v6 = [v7 firstViewController];
  [v4 _replaceViewController:v5 withNewController:v6];
}

- (void)remoteSecretEntryDidRequestAccountReset
{
  if (self->_rootViewController)
  {
    v2[0] = MEMORY[0x263EF8330];
    v2[1] = 3221225472;
    v2[2] = __58__CDPUIController_remoteSecretEntryDidRequestAccountReset__block_invoke;
    v2[3] = &unk_26433CC58;
    v2[4] = self;
    [(CDPUIController *)self _dismissPresentedViewControllerWithReason:0 completion:v2];
  }
}

uint64_t __58__CDPUIController_remoteSecretEntryDidRequestAccountReset__block_invoke(uint64_t a1)
{
  id v2 = _CDPLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_2187CF000, v2, OS_LOG_TYPE_DEFAULT, "UI dismissed, resetting account state", v4, 2u);
  }

  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "resetAccountCDPStateWithEscapeOptionsOffered:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 136), "escapeOffersPresented"));
}

- (void)remoteSecretEntryDidRequestDeviceSelection
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __61__CDPUIController_remoteSecretEntryDidRequestDeviceSelection__block_invoke;
  v2[3] = &unk_26433D128;
  v2[4] = self;
  [(CDPUIController *)self _setupDevicePickerController:v2];
}

uint64_t __61__CDPUIController_remoteSecretEntryDidRequestDeviceSelection__block_invoke(uint64_t a1, uint64_t a2)
{
  [*(id *)(*(void *)(a1 + 32) + 32) pushViewController:a2 animated:1];
  id v3 = *(void **)(*(void *)(a1 + 32) + 136);

  return [v3 insert:2];
}

- (void)remoteSecretEntryDidFinishValidationWithError:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (self->_rootViewController)
  {
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __65__CDPUIController_remoteSecretEntryDidFinishValidationWithError___block_invoke;
    v6[3] = &unk_26433CC30;
    void v6[4] = self;
    id v7 = v4;
    [(CDPUIController *)self _dismissPresentedViewControllerWithReason:0 completion:v6];
  }
}

uint64_t __65__CDPUIController_remoteSecretEntryDidFinishValidationWithError___block_invoke(uint64_t a1)
{
  id v2 = _CDPLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_2187CF000, v2, OS_LOG_TYPE_DEFAULT, "UI dismissed, cancelling validation", v4, 2u);
  }

  return [*(id *)(*(void *)(a1 + 32) + 24) cancelValidationWithError:*(void *)(a1 + 40)];
}

- (void)remoteSecretEntryDidRequestPiggybacking
{
}

- (void)remoteSecretEntryDidRequestRecoveryKeyEscapeAction
{
  id v3 = [(CDPUIController *)self recoveryKeyEntryControllerForCircleJoinWithCancel:0 supportedEscapeOfferMask:[(CDPRemoteDeviceSecretValidator *)self->_remoteSecretValidator supportedEscapeOfferMask]];
  [(UINavigationController *)self->_navController pushViewController:v3 animated:1];
  [(CDPRPDLedger *)self->_ledger insert:32];
}

- (void)remoteSecretEntryDidRequestCustodianRecoveryEscapeAction
{
  id v3 = [(CDPUIController *)self _custodianAskHelpViewControllerWithSupportedEscapeOfferMask:[(CDPRemoteDeviceSecretValidator *)self->_remoteSecretValidator supportedEscapeOfferMask]];
  [(UINavigationController *)self->_navController pushViewController:v3 animated:1];
  [(CDPRPDLedger *)self->_ledger insert:64];
}

- (void)remoteSecretEntryDidRequestEDPRecoveryTokenEscapeAction
{
  id v3 = [[CDPUIEDPRecoveryTokenFlowCoordinator alloc] initWithValidator:self->_remoteSecretValidator rpdLedger:self->_ledger cdpContext:self->_activeContext showCancel:0 delegate:self];
  [(CDPUIController *)self setEdpRecoveryTokenFlowCoordinator:v3];

  id v4 = [(CDPUIController *)self edpRecoveryTokenFlowCoordinator];
  [v4 setEnteredAfterFailedCDPRecovery:1];

  navController = self->_navController;
  id v7 = [(CDPUIController *)self edpRecoveryTokenFlowCoordinator];
  char v6 = [v7 firstViewController];
  [(UINavigationController *)navController pushViewController:v6 animated:1];
}

- (void)remoteSecretEntryDidRequestRemoteApprovalEscapeAction
{
}

- (void)remoteSecretEntryDidRequestAccountResetEscapeActionForDevice:(id)a3
{
  remoteSecretValidator = self->_remoteSecretValidator;
  id v5 = a3;
  uint64_t v6 = [(CDPRemoteDeviceSecretValidator *)remoteSecretValidator supportedEscapeOfferMask];
  id v7 = [MEMORY[0x263F343B8] builderForKey:@"REMOTE_SECRET_ENTRY_FORGOT_HATCH"];
  id v8 = [v5 modelClass];
  uint64_t v9 = [v7 addDeviceClass:v8];
  id v10 = objc_msgSend(v9, "addSecretType:", objc_msgSend(v5, "localSecretType"));
  id v25 = [v10 localizedString];

  uint64_t v11 = NSString;
  id v12 = [MEMORY[0x263F343B8] builderForKey:@"REMOTE_SECRET_ENTRY_DONT_KNOW_ALERT_SUBTITLE_NO_RECOVERY_METHOD"];
  id v13 = objc_msgSend(v12, "addSecretType:", objc_msgSend(v5, "localSecretType"));
  id v14 = [v13 localizedString];
  id v15 = [v5 localizedName];
  int v16 = [v11 stringWithValidatedFormat:v14, @"%@", 0, v15 validFormatSpecifiers error];

  BOOL v17 = CDPLocalizedString();
  uint64_t v18 = [(CDPUIController *)self _iCSCSkipOrDeleteiCloudDataEscapeOfferWithTitle:v25 message:v16 skipButtonTitle:v17 supportedEscapeOfferMask:v6 withDevice:v5];
  id v19 = [MEMORY[0x263F343B8] builderForKey:@"REMOTE_SECRET_ENTRY_FORGOT_HATCH"];
  id v20 = [v5 modelClass];
  id v21 = [v19 addDeviceClass:v20];
  uint64_t v22 = [v5 localSecretType];

  id v23 = [v21 addSecretType:v22];
  id v24 = [v23 localizedString];
  [v18 setEscapeOfferName:v24];

  [v18 setPresentingViewController:self->_navController];
  [v18 handleEscapeAction:self];
}

- (void)remoteSecretEntryDidRequestDeviceSelectionEscapeAction
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __73__CDPUIController_remoteSecretEntryDidRequestDeviceSelectionEscapeAction__block_invoke;
  v2[3] = &unk_26433D128;
  v2[4] = self;
  [(CDPUIController *)self _setupDevicePickerController:v2];
}

uint64_t __73__CDPUIController_remoteSecretEntryDidRequestDeviceSelectionEscapeAction__block_invoke(uint64_t a1, uint64_t a2)
{
  [*(id *)(*(void *)(a1 + 32) + 32) pushViewController:a2 animated:1];
  id v3 = *(void **)(*(void *)(a1 + 32) + 136);

  return [v3 insert:2];
}

- (void)remoteSecretEntryDidRequestSkipEscapeActionForDevice:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x263F343B8] builderForKey:@"REMOTE_SECRET_ENTRY_FORGOT_HATCH"];
  uint64_t v6 = [v4 modelClass];
  id v7 = [v5 addDeviceClass:v6];
  id v8 = objc_msgSend(v7, "addSecretType:", objc_msgSend(v4, "localSecretType"));
  uint64_t v9 = [v8 localizedString];

  id v10 = NSString;
  uint64_t v11 = [MEMORY[0x263F343B8] builderForKey:@"REMOTE_SECRET_ENTRY_DONT_KNOW_ALERT_SUBTITLE_NO_RECOVERY_METHOD"];
  id v12 = objc_msgSend(v11, "addSecretType:", objc_msgSend(v4, "localSecretType"));
  id v13 = [v12 localizedString];
  id v14 = [v4 localizedName];
  uint64_t v15 = [v10 stringWithValidatedFormat:v13, @"%@", 0, v14 validFormatSpecifiers error];

  uint64_t v16 = CDPLocalizedString();
  BOOL v17 = [[CDPRemoteValidationEscapeOffer alloc] initWithCDPContext:self->_activeContext];
  [(CDPRemoteValidationEscapeOffer *)v17 setTitle:v9];
  uint64_t v27 = (void *)v15;
  [(CDPRemoteValidationEscapeOffer *)v17 setMessage:v15];
  uint64_t v28 = self;
  objc_initWeak(&location, self);
  uint64_t v18 = objc_alloc_init(CDPEscapeOption);
  [(CDPEscapeOption *)v18 setStyle:3];
  [(CDPEscapeOption *)v18 setTitle:v16];
  [(CDPEscapeOption *)v18 setTitleTelemetryKey:*MEMORY[0x263F34948]];
  id v26 = (void *)v16;
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __72__CDPUIController_remoteSecretEntryDidRequestSkipEscapeActionForDevice___block_invoke;
  v29[3] = &unk_26433D150;
  objc_copyWeak(&v30, &location);
  [(CDPEscapeOption *)v18 setEscapeAction:v29];
  id v25 = (void *)v9;
  [(CDPRemoteValidationEscapeOffer *)v17 addEscapeOptionsObject:v18];
  id v19 = +[CDPEscapeOption cancelOption];
  [v19 setStyle:0];
  [(CDPRemoteValidationEscapeOffer *)v17 addEscapeOptionsObject:v19];
  id v20 = [MEMORY[0x263F343B8] builderForKey:@"REMOTE_SECRET_ENTRY_FORGOT_HATCH"];
  id v21 = [v4 modelClass];
  uint64_t v22 = [v20 addDeviceClass:v21];
  id v23 = objc_msgSend(v22, "addSecretType:", objc_msgSend(v4, "localSecretType"));
  id v24 = [v23 localizedString];
  [(CDPRemoteValidationEscapeOffer *)v17 setEscapeOfferName:v24];

  [(CDPRemoteValidationEscapeOffer *)v17 setPresentingViewController:v28->_navController];
  [(CDPRemoteValidationEscapeOffer *)v17 handleEscapeAction:v28];

  objc_destroyWeak(&v30);
  objc_destroyWeak(&location);
}

void __72__CDPUIController_remoteSecretEntryDidRequestSkipEscapeActionForDevice___block_invoke(uint64_t a1)
{
  id v2 = _CDPLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __73__CDPUIController__showTryAgainLaterConfirmationAlertWithViewController___block_invoke_cold_1();
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained sendEscapeOfferSelectedEvent:*MEMORY[0x263F34948]];
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __72__CDPUIController_remoteSecretEntryDidRequestSkipEscapeActionForDevice___block_invoke_779;
    v5[3] = &unk_26433CC58;
    id v6 = v4;
    [v6 _dismissPresentedViewControllerWithReason:@"com.apple.CoreCDPUI.CDPEnrollmentCompleted" completion:v5];
  }
}

void __72__CDPUIController_remoteSecretEntryDidRequestSkipEscapeActionForDevice___block_invoke_779(uint64_t a1)
{
  uint64_t v1 = *(void **)(*(void *)(a1 + 32) + 24);
  _CDPStateError();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v1 cancelValidationWithError:v2];
}

- (void)remoteSecretEntryDidRequestPiggybackingEscapeAction
{
  id v3 = [(CDPUIController *)self _piggybackingViewControllerWithSupportedEscapeOfferMask:[(CDPRemoteDeviceSecretValidator *)self->_remoteSecretValidator supportedEscapeOfferMask]];
  [(UINavigationController *)self->_navController pushViewController:v3 animated:1];
  [(CDPRPDLedger *)self->_ledger insert:128];
}

- (void)remoteSecretEntryDidRequestDisableUserInteractionAndStartSpinner
{
  if (self->_hostingController)
  {
    id v3 = [MEMORY[0x263F5FBF8] sharedSpinnerManager];
    id v4 = [(UIViewController *)self->_hostingController navigationItem];
    [v3 startAnimatingInNavItem:v4 forIdentifier:@"remoteSecretValidator" hideBackButton:1];

    id v5 = [(UIViewController *)self->_hostingController view];
    [v5 setUserInteractionEnabled:0];

    cancelButtonForSwiftUIHostingController = self->_cancelButtonForSwiftUIHostingController;
    [(UIBarButtonItem *)cancelButtonForSwiftUIHostingController setEnabled:0];
  }
}

- (void)remoteSecretEntryDidRequestEnableUserInteractionAndStopSpinner
{
  hostingController = self->_hostingController;
  if (hostingController)
  {
    id v4 = [(UIViewController *)hostingController view];
    [v4 setUserInteractionEnabled:1];

    [(UIBarButtonItem *)self->_cancelButtonForSwiftUIHostingController setEnabled:1];
    id v5 = [MEMORY[0x263F5FBF8] sharedSpinnerManager];
    [v5 stopAnimatingForIdentifier:@"remoteSecretValidator"];

    doneButtonForSwiftUIHostingController = self->_doneButtonForSwiftUIHostingController;
    if (doneButtonForSwiftUIHostingController)
    {
      id v7 = [(UIViewController *)self->_hostingController navigationItem];
      [v7 setRightBarButtonItem:doneButtonForSwiftUIHostingController];

      id v8 = self->_doneButtonForSwiftUIHostingController;
      [(UIBarButtonItem *)v8 setEnabled:0];
    }
  }
}

- (void)remoteSecretEntryDidRequestDisableUserInteraction
{
  hostingController = self->_hostingController;
  if (hostingController)
  {
    id v4 = [(UIViewController *)hostingController navigationItem];
    id v5 = [v4 rightBarButtonItem];
    doneButtonForSwiftUIHostingController = self->_doneButtonForSwiftUIHostingController;
    self->_doneButtonForSwiftUIHostingController = v5;

    id v7 = self->_doneButtonForSwiftUIHostingController;
    [(UIBarButtonItem *)v7 setEnabled:0];
  }
}

- (void)remoteSecretEntryDidRequestEnableUserInteraction
{
  if (self->_hostingController)
  {
    doneButtonForSwiftUIHostingController = self->_doneButtonForSwiftUIHostingController;
    if (doneButtonForSwiftUIHostingController) {
      [(UIBarButtonItem *)doneButtonForSwiftUIHostingController setEnabled:1];
    }
  }
}

- (void)presentQuotaScreenWithCompletion:(id)a3
{
  activeContext = self->_activeContext;
  id v5 = a3;
  id v6 = [(CDPUIController *)self _buildQuotaRequestWithExtraChecks:0 andContext:activeContext];
  [(CDPUIController *)self presentQuotaScreenForRequest:v6 completion:v5];
}

- (void)presentQuotaScreenForRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(CDPUIController *)self _enableUserInteractionAndStopSpinner];
  if ([v6 isUrlAvailable])
  {
    [(CDPUIController *)self _showQuotaStorageAppListView:v6 andCompletion:v7];
  }
  else
  {
    id v8 = objc_initWeak(&location, self);
    uint64_t v9 = (void *)MEMORY[0x263F82418];
    id v10 = [MEMORY[0x263F343B8] builderForKey:@"WALRUS_STORAGE_LIST_UNAVAILABLE_CONFIRMATION_ALERT_TITLE" inTable:@"Localizable-Walrus"];
    uint64_t v11 = [v10 localizedString];
    id v12 = [MEMORY[0x263F82670] currentDevice];
    uint64_t v13 = [v12 userInterfaceIdiom];

    id v14 = [v9 alertControllerWithTitle:v11 message:0 preferredStyle:(v13 & 0xFFFFFFFFFFFFFFFBLL) == 1];

    uint64_t v15 = (void *)MEMORY[0x263F82400];
    uint64_t v16 = [MEMORY[0x263F343B8] builderForKey:@"WALRUS_STORAGE_LIST_UNAVAILABLE_CONFIRMATION_DELETE_BUTTON_TITLE" inTable:@"Localizable-Walrus"];
    BOOL v17 = [v16 localizedString];
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __59__CDPUIController_presentQuotaScreenForRequest_completion___block_invoke;
    v23[3] = &unk_26433D6B8;
    uint64_t v18 = self;
    id v24 = v18;
    id v25 = v7;
    id v19 = [v15 actionWithTitle:v17 style:2 handler:v23];

    [v14 addAction:v19];
    id v20 = (void *)MEMORY[0x263F82400];
    id v21 = CDPLocalizedString();
    uint64_t v22 = [v20 actionWithTitle:v21 style:1 handler:0];
    [v14 addAction:v22];

    [(UINavigationController *)v18->_navController presentViewController:v14 animated:1 completion:0];
    objc_destroyWeak(&location);
  }
}

uint64_t __59__CDPUIController_presentQuotaScreenForRequest_completion___block_invoke(uint64_t a1)
{
  id v2 = _CDPLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __112__CDPUIController__skipOrDeleteiCloudDataEscapeOfferWithTitle_message_skipButtonTitle_supportedEscapeOfferMask___block_invoke_706_cold_1();
  }

  return [*(id *)(a1 + 32) _handleResetActionWithCompletion:*(void *)(a1 + 40)];
}

- (void)recoveryTokenFlowCoordinatorDidSuccessfullyFinish:(id)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = _CDPLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v28 = 136315394;
    id v29 = "-[CDPUIController recoveryTokenFlowCoordinatorDidSuccessfullyFinish:]";
    __int16 v30 = 1024;
    int v31 = 3710;
    _os_log_impl(&dword_2187CF000, v5, OS_LOG_TYPE_DEFAULT, "%s (%d) called", (uint8_t *)&v28, 0x12u);
  }

  [(CDPUIController *)self _dismissPresentedViewControllerCompletion:0];
  int v6 = [v4 enteredAfterFailedCDPRecovery];

  if (v6)
  {
    id v7 = _CDPLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      -[CDPUIController recoveryTokenFlowCoordinatorDidSuccessfullyFinish:](v7, v8, v9, v10, v11, v12, v13, v14);
    }

    remoteSecretValidator = self->_remoteSecretValidator;
    objc_msgSend(MEMORY[0x263F087E8], "cdp_errorWithCode:", -5308);
    uint64_t v16 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    [(CDPRemoteDeviceSecretValidator *)remoteSecretValidator cancelValidationWithError:v16];
    goto LABEL_14;
  }
  int v17 = [(CDPContext *)self->_activeContext isProxSignIn];
  uint64_t v18 = _CDPLogSystem();
  BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG);
  if (v17)
  {
    if (v19) {
      -[CDPUIController recoveryTokenFlowCoordinatorDidSuccessfullyFinish:](v18, v20, v21, v22, v23, v24, v25, v26);
    }
  }
  else if (v19)
  {
    -[CDPUIController recoveryTokenFlowCoordinatorDidSuccessfullyFinish:](v18, v20, v21, v22, v23, v24, v25, v26);
  }

  uint64_t v27 = [(CDPUIController *)self cdpRecoverySuccessFromEDPContinuationHandler];

  if (v27)
  {
    uint64_t v16 = [(CDPUIController *)self cdpRecoverySuccessFromEDPContinuationHandler];
    v16[2]();
LABEL_14:
  }
}

- (void)recoveryTokenFlowCoordinatorDidSelectAccessDataLater:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = _CDPLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    uint64_t v8 = "-[CDPUIController recoveryTokenFlowCoordinatorDidSelectAccessDataLater:]";
    __int16 v9 = 1024;
    int v10 = 3746;
    _os_log_impl(&dword_2187CF000, v4, OS_LOG_TYPE_DEFAULT, "%s (%d) called", (uint8_t *)&v7, 0x12u);
  }

  id v5 = objc_msgSend(MEMORY[0x263F087E8], "cdp_errorWithCode:", -7213);
  int v6 = objc_msgSend(MEMORY[0x263F087E8], "cdp_errorWithCode:underlyingError:", -5308, v5);
  [(CDPRemoteDeviceSecretValidator *)self->_remoteSecretValidator cancelValidationWithError:v6];
}

- (void)recoveryTokenFlowCoordinatorDidSelectResetProtectedData:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = _CDPLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315394;
    uint64_t v12 = "-[CDPUIController recoveryTokenFlowCoordinatorDidSelectResetProtectedData:]";
    __int16 v13 = 1024;
    int v14 = 3753;
    _os_log_impl(&dword_2187CF000, v5, OS_LOG_TYPE_DEFAULT, "%s (%d) called", buf, 0x12u);
  }

  int v6 = [(CDPUIController *)self _buildQuotaRequestWithExtraChecks:1 andContext:self->_activeContext];
  objc_initWeak((id *)buf, self);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __75__CDPUIController_recoveryTokenFlowCoordinatorDidSelectResetProtectedData___block_invoke;
  v8[3] = &unk_26433D6E0;
  objc_copyWeak(&v10, (id *)buf);
  id v7 = v4;
  id v9 = v7;
  [(CDPUIController *)self presentQuotaScreenForRequest:v6 completion:v8];

  objc_destroyWeak(&v10);
  objc_destroyWeak((id *)buf);
}

void __75__CDPUIController_recoveryTokenFlowCoordinatorDidSelectResetProtectedData___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v7 = _CDPLogSystem();
  uint64_t v8 = v7;
  if (WeakRetained)
  {
    BOOL v9 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    if (a2)
    {
      if (v9)
      {
        int v19 = 136315138;
        uint64_t v20 = "-[CDPUIController recoveryTokenFlowCoordinatorDidSelectResetProtectedData:]_block_invoke";
        _os_log_impl(&dword_2187CF000, v8, OS_LOG_TYPE_DEFAULT, "%s: User confirmed RPD, resetting account CDP state", (uint8_t *)&v19, 0xCu);
      }

      id v10 = (void *)*((void *)WeakRetained + 17);
      if (!v10)
      {
        uint64_t v11 = _CDPLogSystem();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
          __75__CDPUIController_recoveryTokenFlowCoordinatorDidSelectResetProtectedData___block_invoke_cold_2(v11, v12, v13, v14, v15, v16, v17, v18);
        }

        id v10 = (void *)*((void *)WeakRetained + 17);
      }
      objc_msgSend(*((id *)WeakRetained + 3), "resetAccountCDPStateWithEscapeOptionsOffered:andSetSecret:", objc_msgSend(v10, "escapeOffersPresented"), v5);
    }
    else
    {
      if (v9)
      {
        int v19 = 136315138;
        uint64_t v20 = "-[CDPUIController recoveryTokenFlowCoordinatorDidSelectResetProtectedData:]_block_invoke";
        _os_log_impl(&dword_2187CF000, v8, OS_LOG_TYPE_DEFAULT, "%s: User chose not to RPD after all.", (uint8_t *)&v19, 0xCu);
      }

      [WeakRetained cancelTapped:*(void *)(a1 + 32)];
    }
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __75__CDPUIController_recoveryTokenFlowCoordinatorDidSelectResetProtectedData___block_invoke_cold_1();
    }
  }
}

- (void)dealloc
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2187CF000, v0, v1, "CDPUIController going away...", v2, v3, v4, v5, v6);
}

- (CDPUIDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CDPUIDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void)setForceInlinePresentation:(BOOL)a3
{
  self->_forceInlinePresentation = a3;
}

- (CDPUIEDPRecoveryTokenFlowCoordinator)edpRecoveryTokenFlowCoordinator
{
  return self->_edpRecoveryTokenFlowCoordinator;
}

- (void)setEdpRecoveryTokenFlowCoordinator:(id)a3
{
}

- (id)cdpRecoverySuccessFromEDPContinuationHandler
{
  return self->_cdpRecoverySuccessFromEDPContinuationHandler;
}

- (void)setCdpRecoverySuccessFromEDPContinuationHandler:(id)a3
{
}

- (NSString)titleText
{
  return self->_titleText;
}

- (void)setTitleText:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleText, 0);
  objc_storeStrong(&self->_cdpRecoverySuccessFromEDPContinuationHandler, 0);
  objc_storeStrong((id *)&self->_edpRecoveryTokenFlowCoordinator, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_ledger, 0);
  objc_storeStrong((id *)&self->_recoveryKeyViewModel, 0);
  objc_storeStrong((id *)&self->_resetCompletedView, 0);
  objc_storeStrong((id *)&self->_hostingController, 0);
  objc_storeStrong((id *)&self->_cancelButtonForSwiftUIHostingController, 0);
  objc_storeStrong((id *)&self->_doneButtonForSwiftUIHostingController, 0);
  objc_storeStrong((id *)&self->_inheritanceUIProvider, 0);
  objc_storeStrong((id *)&self->_storageAppListRemoteUIController, 0);
  objc_storeStrong((id *)&self->_activeContext, 0);
  objc_storeStrong((id *)&self->_rootViewController, 0);
  objc_storeStrong((id *)&self->_devicePicker, 0);
  objc_storeStrong((id *)&self->_navController, 0);
  objc_storeStrong((id *)&self->_remoteSecretValidator, 0);

  objc_storeStrong((id *)&self->_devices, 0);
}

- (void)_dismissPresentedViewControllerCompletion:(void *)a1 .cold.1(void *a1)
{
  uint64_t v2 = [a1 presentingViewController];
  uint64_t v3 = [a1 presentingViewController];
  uint64_t v4 = [v3 presentedViewController];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_10(&dword_2187CF000, v5, v6, "Inline mode detected, skipping dismissal  (presenting=%@ root=%@ presented=%@)", v7, v8, v9, v10, v11);
}

- (void)_dismissPresentedViewControllerCompletion:(void *)a1 .cold.2(void *a1)
{
  uint64_t v2 = [a1 presentingViewController];
  uint64_t v3 = [a1 presentingViewController];
  uint64_t v4 = [v3 presentedViewController];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_10(&dword_2187CF000, v5, v6, "Dismissing presented view controller (presenting=%@ root=%@ presented=%@)", v7, v8, v9, v10, v11);
}

void __53__CDPUIController__presentRootController_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2187CF000, v0, v1, "Need to remove the local secret view controller from the nav stack", v2, v3, v4, v5, v6);
}

void __53__CDPUIController__presentRootController_completion___block_invoke_53_cold_1()
{
  OUTLINED_FUNCTION_9(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_2(&dword_2187CF000, v0, v1, "Pushing root controller %@...", v2, v3, v4, v5, v6);
}

void __53__CDPUIController__presentRootController_completion___block_invoke_54_cold_1()
{
  OUTLINED_FUNCTION_9(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_2(&dword_2187CF000, v0, v1, "Finished pushing root controller %@", v2, v3, v4, v5, v6);
}

void __65__CDPUIController_cdpContext_promptForLocalSecretWithCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5(&dword_2187CF000, v0, v1, "Remote view controller (%@) has unexpected type.", v2, v3, v4, v5, v6);
}

void __65__CDPUIController_cdpContext_promptForLocalSecretWithCompletion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4(&dword_2187CF000, v0, v1, "UI Service interrupted", v2, v3, v4, v5, v6);
}

void __65__CDPUIController_cdpContext_promptForLocalSecretWithCompletion___block_invoke_2_cold_2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4(&dword_2187CF000, v0, v1, "Suppressing ui service interruption as we are already done", v2, v3, v4, v5, v6);
}

void __65__CDPUIController_cdpContext_promptForLocalSecretWithCompletion___block_invoke_2_194_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4(&dword_2187CF000, v0, v1, "Completion block called after we already finished", v2, v3, v4, v5, v6);
}

void __79__CDPUIController__presentSwiftUIRemoteSecretPromptWithDevice_didSelectDevice___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4(&dword_2187CF000, v0, v1, "UIHostingController for remote secret entry is nil.", v2, v3, v4, v5, v6);
}

void __66__CDPUIController__presentRemoteSecretControllerWithNewestDevice___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4(&dword_2187CF000, v0, v1, "asked to present remote secret controller with no device", v2, v3, v4, v5, v6);
}

void __66__CDPUIController__presentRemoteSecretControllerWithNewestDevice___block_invoke_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)cdpContext:(void *)a1 promptForAdoptionOfMultipleICSC:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a1 presentingViewController];
  OUTLINED_FUNCTION_6();
  _os_log_debug_impl(&dword_2187CF000, a2, OS_LOG_TYPE_DEBUG, "Presenting multiple-ICSC adoption dialog using presenting view controller %@", v4, 0xCu);
}

void __39__CDPUIController_performAccountReset___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_handleDepletedRemainingAttemptsForDevice:(uint64_t)a3 fromViewController:(uint64_t)a4 mask:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_escapeOfferForDevice:withMask:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2187CF000, v0, v1, "Do not add Remote approval when multiple options are available", v2, v3, v4, v5, v6);
}

void __86__CDPUIController__beginPiggybackingRecoveryEscapeOptionWithSupportedEscapeOfferMask___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __50__CDPUIController_piggybackingUserDidNotGetACode___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2187CF000, v0, v1, "User tapped Can't Get to My Device - Offering other recovery options.", v2, v3, v4, v5, v6);
}

void __99__CDPUIController__piggybackingSendCodeEscapeOfferWithSupportedEscapeOffers_title_localizationKey___block_invoke_393_cold_1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5(&dword_2187CF000, v0, v1, "Prox Piggybacking: Received an error %@", v2, v3, v4, v5, v6);
}

void __99__CDPUIController__piggybackingSendCodeEscapeOfferWithSupportedEscapeOffers_title_localizationKey___block_invoke_394_cold_1()
{
  OUTLINED_FUNCTION_9(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5(&dword_2187CF000, v0, v1, "Received error %@ while recovering data using proximity based piggybacking", v2, v3, v4, v5, v6);
}

void __99__CDPUIController__piggybackingSendCodeEscapeOfferWithSupportedEscapeOffers_title_localizationKey___block_invoke_395_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2187CF000, v0, v1, "Starting spinner while attempting CDP join", v2, v3, v4, v5, v6);
}

void __99__CDPUIController__piggybackingSendCodeEscapeOfferWithSupportedEscapeOffers_title_localizationKey___block_invoke_397_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4(&dword_2187CF000, v0, v1, "Piggybacking channel information missing in authResults", v2, v3, v4, v5, v6);
}

void __99__CDPUIController__piggybackingSendCodeEscapeOfferWithSupportedEscapeOffers_title_localizationKey___block_invoke_398_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2187CF000, v0, v1, "Piggybacking - NonProx Handling", v2, v3, v4, v5, v6);
}

void __60__CDPUIController_attemptToJoinCircleWithPiggybacking_mask___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_2(&dword_2187CF000, v0, v1, "Stopping spinner: Attempting circle join completed with error %@", v2, v3, v4, v5, v6);
}

void __60__CDPUIController_attemptToJoinCircleWithPiggybacking_mask___block_invoke_410_cold_1()
{
  OUTLINED_FUNCTION_9(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5(&dword_2187CF000, v0, v1, "Piggybacking failed to get into circle with error: %@", v2, v3, v4, v5, v6);
}

void __83__CDPUIController__beginCustodianRecoveryEscapeOptionWithSupportedEscapeOfferMask___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_custodianCantReachContactEscapeOfferWithSupportedEscapeOffers:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_custodianCantReachContactEscapeOfferWithSupportedEscapeOffers:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __96__CDPUIController__custodianRecoveryEscapeOptionWithSupportedEscapeOfferMask_askHelpController___block_invoke_492_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2187CF000, v0, v1, "UI controller deallocated, so not moving user to os instruction screen", v2, v3, v4, v5, v6);
}

void __92__CDPUIController__custodianCodeEntryViewControllerWithController_supportedEscapeOfferMask___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2(&dword_2187CF000, v0, v1, "Custodian Recovery Code Attempt: Code Entered: %@", v2, v3, v4, v5, v6);
}

void __92__CDPUIController__custodianCodeEntryViewControllerWithController_supportedEscapeOfferMask___block_invoke_578_cold_1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5(&dword_2187CF000, v0, v1, "Custodian Recovery Code Attempt: Code validation failed: %@", v2, v3, v4, v5, v6);
}

void __92__CDPUIController__custodianCodeEntryViewControllerWithController_supportedEscapeOfferMask___block_invoke_579_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4(&dword_2187CF000, v0, v1, "Custodian Recovery Code Attempt: Failed with unrecoverable error, bailing...", v2, v3, v4, v5, v6);
}

void __50__CDPUIController__validateCustodianRecoveryInfo___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5(&dword_2187CF000, v0, v1, "Custodian recovery info failed validation with error: %@", v2, v3, v4, v5, v6);
}

void __72__CDPUIController__recoveryKeyEscapeOptionWithSupportedEscapeOfferMask___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __94__CDPUIController_recoveryKeyEntryControllerForCircleJoinWithCancel_supportedEscapeOfferMask___block_invoke_cold_1(char a1, uint64_t a2, os_log_t log)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  int v3 = 136315650;
  uint64_t v4 = "-[CDPUIController recoveryKeyEntryControllerForCircleJoinWithCancel:supportedEscapeOfferMask:]_block_invoke";
  __int16 v5 = 1024;
  int v6 = a1 & 1;
  __int16 v7 = 2112;
  uint64_t v8 = a2;
  _os_log_debug_impl(&dword_2187CF000, log, OS_LOG_TYPE_DEBUG, "%s: Received completion with success=%{BOOL}d, error=%@", (uint8_t *)&v3, 0x1Cu);
}

void __94__CDPUIController_recoveryKeyEntryControllerForCircleJoinWithCancel_supportedEscapeOfferMask___block_invoke_607_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __73__CDPUIController__showResetKeychainConfirmationAlertWithViewController___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __73__CDPUIController__showTryAgainLaterConfirmationAlertWithViewController___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2187CF000, v0, v1, "User tapped Try Again Later - skipping CDP enrollment for now.", v2, v3, v4, v5, v6);
}

- (void)keychainSyncController:didFinishWithResult:error:.cold.1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_2(&dword_2187CF000, v0, v1, "PEER APPROVAL - Popping view controller from %@", v2, v3, v4, v5, v6);
}

void __68__CDPUIController_keychainSyncController_didFinishWithResult_error___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_2(&dword_2187CF000, v0, v1, "Dismissing root view controller %@ after successful ICSC entry", v2, v3, v4, v5, v6);
}

void __51__CDPUIController__makeGuitarfishTokenEscapeOption__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4(&dword_2187CF000, v0, v1, "CDPUIController was deallocated. Could not push EDP escape action", v2, v3, v4, v5, v6);
}

void __51__CDPUIController__makeGuitarfishTokenEscapeOption__block_invoke_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_skipOrDeleteiCloudDataEscapeOfferWithTitle:(os_log_t)log message:skipButtonTitle:supportedEscapeOfferMask:.cold.1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)long long buf = 138412290;
  *(void *)(buf + 4) = a1;
  _os_log_debug_impl(&dword_2187CF000, log, OS_LOG_TYPE_DEBUG, "iCSS Quota: Storage App List View url: %@", buf, 0xCu);
}

- (void)_skipOrDeleteiCloudDataEscapeOfferWithTitle:message:skipButtonTitle:supportedEscapeOfferMask:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2187CF000, v0, v1, "iCSS Quota: Storage App List View url unavailable", v2, v3, v4, v5, v6);
}

void __112__CDPUIController__skipOrDeleteiCloudDataEscapeOfferWithTitle_message_skipButtonTitle_supportedEscapeOfferMask___block_invoke_698_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2187CF000, v0, v1, "User tapped More Information (Leads to reset protected data)", v2, v3, v4, v5, v6);
}

void __112__CDPUIController__skipOrDeleteiCloudDataEscapeOfferWithTitle_message_skipButtonTitle_supportedEscapeOfferMask___block_invoke_699_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2187CF000, v0, v1, "User tapped Delete iCloud Data (Leads to reset protected data). Showing backup alert in place of Server UI alert.", v2, v3, v4, v5, v6);
}

void __112__CDPUIController__skipOrDeleteiCloudDataEscapeOfferWithTitle_message_skipButtonTitle_supportedEscapeOfferMask___block_invoke_706_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2187CF000, v0, v1, "Resetting Protected Data...", v2, v3, v4, v5, v6);
}

void __112__CDPUIController__skipOrDeleteiCloudDataEscapeOfferWithTitle_message_skipButtonTitle_supportedEscapeOfferMask___block_invoke_710_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __45__CDPUIController__rpdEscapeOptionWithOffer___block_invoke_718_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)cdpContext:showResetCompletedAlertWithCompletion:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2187CF000, v0, v1, "Displaying reset success screen from presentingViewController", v2, v3, v4, v5, v6);
}

- (void)cdpContext:showResetCompletedAlertWithCompletion:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2187CF000, v0, v1, "Displaying reset success screen from navController", v2, v3, v4, v5, v6);
}

- (void)_showQuotaStorageAppListView:(void *)a1 andCompletion:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v4 = [a1 debugDescription];
  uint64_t v5 = [a1 allHTTPHeaderFields];
  uint8_t v6 = [v5 debugDescription];
  int v7 = 138412546;
  uint64_t v8 = v4;
  __int16 v9 = 2112;
  uint64_t v10 = v6;
  _os_log_debug_impl(&dword_2187CF000, a2, OS_LOG_TYPE_DEBUG, "iCSS Quota: StorageAppList Request: %@ Headers: %@", (uint8_t *)&v7, 0x16u);
}

void __62__CDPUIController__showQuotaStorageAppListView_andCompletion___block_invoke_744_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2187CF000, v0, v1, "iCSS Quota: action = dismiss", v2, v3, v4, v5, v6);
}

void __62__CDPUIController__showQuotaStorageAppListView_andCompletion___block_invoke_744_cold_2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2187CF000, v0, v1, "iCSS Quota: action = user_wants:cdp_reset. Resetting Protected Data...", v2, v3, v4, v5, v6);
}

void __62__CDPUIController__showQuotaStorageAppListView_andCompletion___block_invoke_744_cold_3()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_6();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_debug_impl(&dword_2187CF000, v1, OS_LOG_TYPE_DEBUG, "iCSS Quota: no handler for matched action: %@ from attributes: %@", v2, 0x16u);
}

void __62__CDPUIController__showQuotaStorageAppListView_andCompletion___block_invoke_744_cold_4()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2(&dword_2187CF000, v0, v1, "iCSS Quota: Action handler for attributes: %@", v2, v3, v4, v5, v6);
}

void __52__CDPUIController__handleResetActionWithCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5(&dword_2187CF000, v0, v1, "Failed to create local secret with error: %@", v2, v3, v4, v5, v6);
}

- (void)_buildQuotaRequestWithExtraChecks:(os_log_t)log andContext:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  int v3 = 134218498;
  uint64_t v4 = a2;
  __int16 v5 = 1024;
  int v6 = 0;
  __int16 v7 = 2112;
  uint64_t v8 = a1;
  _os_log_error_impl(&dword_2187CF000, log, OS_LOG_TYPE_ERROR, "Failed to create quota request for appList: %lu, specifyE2EE = %{BOOL}d. Error: %@", (uint8_t *)&v3, 0x1Cu);
}

- (void)_buildQuotaRequestWithExtraChecks:andContext:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2187CF000, v0, v1, "Manatee is available. Presenting the Stringray only list with body content type for PCS data...", v2, v3, v4, v5, v6);
}

- (void)_buildQuotaRequestWithExtraChecks:andContext:.cold.3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2187CF000, v0, v1, "iCDP Disabled for HSA2 account, 2FAFA user", v2, v3, v4, v5, v6);
}

- (void)_buildQuotaRequestWithExtraChecks:andContext:.cold.4()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2187CF000, v0, v1, "Both Manatee and DBR are broken. Presenting all apps with body content type for PCS data...", v2, v3, v4, v5, v6);
}

- (void)_buildQuotaRequestWithExtraChecks:andContext:.cold.5()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2187CF000, v0, v1, "SA User. Presenting the Stringray only list with body content type for PCS data...", v2, v3, v4, v5, v6);
}

- (void)recoveryTokenFlowCoordinatorDidSuccessfullyFinish:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_2187CF000, a1, a3, "%s: Cancelling validation to return control back to state machine.", a5, a6, a7, a8, 2u);
}

- (void)recoveryTokenFlowCoordinatorDidSuccessfullyFinish:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)recoveryTokenFlowCoordinatorDidSuccessfullyFinish:(uint64_t)a3 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __75__CDPUIController_recoveryTokenFlowCoordinatorDidSelectResetProtectedData___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4(&dword_2187CF000, v0, v1, "CDPUIController was not retained after presenting quota screen", v2, v3, v4, v5, v6);
}

void __75__CDPUIController_recoveryTokenFlowCoordinatorDidSelectResetProtectedData___block_invoke_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end