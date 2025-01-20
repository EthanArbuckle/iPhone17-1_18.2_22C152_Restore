@interface CDPUIDeviceToDeviceEncryptionHelper
+ (id)_newLegacyFlowContext;
+ (id)_newLegacyFlowContextForAltDSID:(id)a3;
+ (id)_newLegacyFlowContextWithContext:(id)a3;
- (BOOL)_hasLocalSecret;
- (BOOL)_hasManatee;
- (BOOL)_inCircle;
- (CDPLocalSecretFollowUpProvider)followUpProvider;
- (CDPUIDeviceToDeviceEncryptionFlowContext)context;
- (CDPUIDeviceToDeviceEncryptionHelper)initWithContext:(id)a3;
- (CDPUIDeviceToDeviceEncryptionHelper)initWithPresentingViewController:(id)a3;
- (CDPUIDeviceToDeviceEncryptionHelperDelegate)delegate;
- (UIViewController)presentingViewController;
- (id)_authenticationContextForFlowContext:(id)a3;
- (id)_authenticationController;
- (id)_cdpErrorWithUnderlyingError:(id)a3;
- (id)_inAppAuthenticationContextForFlowContext:(id)a3;
- (id)_navigationController;
- (id)_newSpinnerViewController;
- (id)_newUpgradeUIProvider;
- (id)_presentingNavigationController;
- (id)_presentingViewController;
- (id)_repairContextForFlowContext:(id)a3 withAuthenticationResults:(id)a4;
- (id)_stateControllerForFlowContext:(id)a3 withAuthenticationResults:(id)a4;
- (id)_stateControllerWithRepairContext:(id)a3;
- (void)_beginUpgradeFlowWithContext:(id)a3 completion:(id)a4;
- (void)_configureNavigationController;
- (void)_configurePresentingViewControllerForModalPresentation;
- (void)_continueAuthenticatedUpgradeFlowWithContext:(id)a3 authenticationResults:(id)a4 completion:(id)a5;
- (void)_continueUpgradeFlowWithContext:(id)a3 completion:(id)a4;
- (void)_createLocalSecretForContext:(id)a3 completion:(id)a4;
- (void)_determineEscrowRepairUpgradeEligibilityForContext:(id)a3 completion:(id)a4;
- (void)_determineManateeUpgradeEligibilityForContext:(id)a3 completion:(id)a4;
- (void)_determineSecurityUpgradeEligibilityForContext:(id)a3 completion:(id)a4;
- (void)_determineUpgradeEligibilityForContext:(id)a3 completion:(id)a4;
- (void)_dismissNavigationControllerWithCompletion:(id)a3;
- (void)_legacyRequestPermissionToContinueFlowWithCompletion:(id)a3;
- (void)_performAuthenticatedRepairFlowWithContext:(id)a3 stateController:(id)a4 completion:(id)a5;
- (void)_postBiometricFollowUp;
- (void)_presentIneligibilityAlertForFlowContext:(id)a3 completion:(id)a4;
- (void)_presentSpinnerViewControllerWithCompletion:(id)a3;
- (void)_requestPermissionToCreatePasscodeForFlowContext:(id)a3 completion:(id)a4;
- (void)_validateLocalSecretForContext:(id)a3 withStateController:(id)a4 completion:(id)a5;
- (void)dealloc;
- (void)localSecretValidationCanCancelWithViewController:(id)a3 completion:(id)a4;
- (void)performDeviceToDeviceEncryptionStateRepairForContext:(id)a3 withCompletion:(id)a4;
- (void)performDeviceToDeviceEncryptionStateRepairWithCompletion:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFollowUpProvider:(id)a3;
@end

@implementation CDPUIDeviceToDeviceEncryptionHelper

- (CDPUIDeviceToDeviceEncryptionHelper)initWithContext:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CDPUIDeviceToDeviceEncryptionHelper;
  v6 = [(CDPUIDeviceToDeviceEncryptionHelper *)&v15 init];
  if (v6)
  {
    v7 = (AKAppleIDAuthenticationController *)objc_alloc_init(MEMORY[0x263F29118]);
    authenticationController = v6->_authenticationController;
    v6->_authenticationController = v7;

    objc_storeStrong((id *)&v6->_context, a3);
    if ([MEMORY[0x263F34400] canEnableMultiUserManatee])
    {
      id v9 = objc_alloc(MEMORY[0x263F349C0]);
      v10 = [v5 altDSID];
      uint64_t v11 = [v9 initWithAltDSID:v10];
      followUpProvider = v6->_followUpProvider;
      v6->_followUpProvider = (CDPLocalSecretFollowUpProvider *)v11;
    }
    else
    {
      v13 = (CDPLocalSecretFollowUpProvider *)objc_alloc_init(MEMORY[0x263F349C0]);
      v10 = v6->_followUpProvider;
      v6->_followUpProvider = v13;
    }
  }
  return v6;
}

- (CDPUIDeviceToDeviceEncryptionHelper)initWithPresentingViewController:(id)a3
{
  id v4 = a3;
  id v5 = +[CDPUIDeviceToDeviceEncryptionHelper _newLegacyFlowContext];
  v6 = [(CDPUIDeviceToDeviceEncryptionHelper *)self initWithContext:v5];

  if (v6) {
    objc_storeWeak((id *)&v6->_presentingViewController, v4);
  }

  return v6;
}

- (void)dealloc
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_6();
  _os_log_debug_impl(&dword_2187CF000, v0, OS_LOG_TYPE_DEBUG, "CDPUIDeviceToDeviceEncryptionHelper (%p) deallocated", v1, 0xCu);
}

- (void)performDeviceToDeviceEncryptionStateRepairWithCompletion:(id)a3
{
  id v4 = a3;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __96__CDPUIDeviceToDeviceEncryptionHelper_performDeviceToDeviceEncryptionStateRepairWithCompletion___block_invoke;
  aBlock[3] = &unk_26433D808;
  id v5 = v4;
  aBlock[4] = self;
  id v14 = v5;
  v6 = _Block_copy(aBlock);
  v7 = _os_activity_create(&dword_2187CF000, "cdp/perform-device-to-device-encryption-state-repair", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  v8 = [(CDPUIDeviceToDeviceEncryptionHelper *)self context];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __96__CDPUIDeviceToDeviceEncryptionHelper_performDeviceToDeviceEncryptionStateRepairWithCompletion___block_invoke_3;
  v10[3] = &unk_26433CF70;
  v10[4] = self;
  id v9 = v6;
  id v11 = v9;
  [(CDPUIDeviceToDeviceEncryptionHelper *)self _determineUpgradeEligibilityForContext:v8 completion:v10];

  os_activity_scope_leave(&state);
}

void __96__CDPUIDeviceToDeviceEncryptionHelper_performDeviceToDeviceEncryptionStateRepairWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (*(void *)(a1 + 40))
  {
    if ([MEMORY[0x263F08B88] isMainThread])
    {
      uint64_t v6 = *(void *)(a1 + 40);
      v7 = [*(id *)(a1 + 32) _cdpErrorWithUnderlyingError:v5];
      (*(void (**)(uint64_t, uint64_t, void *))(v6 + 16))(v6, a2, v7);
    }
    else
    {
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = __96__CDPUIDeviceToDeviceEncryptionHelper_performDeviceToDeviceEncryptionStateRepairWithCompletion___block_invoke_2;
      v10[3] = &unk_26433D7E0;
      id v8 = *(id *)(a1 + 40);
      char v13 = a2;
      uint64_t v9 = *(void *)(a1 + 32);
      id v12 = v8;
      v10[4] = v9;
      id v11 = v5;
      dispatch_async(MEMORY[0x263EF83A0], v10);
    }
  }
}

void __96__CDPUIDeviceToDeviceEncryptionHelper_performDeviceToDeviceEncryptionStateRepairWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 48);
  uint64_t v2 = *(unsigned __int8 *)(a1 + 56);
  id v3 = [*(id *)(a1 + 32) _cdpErrorWithUnderlyingError:*(void *)(a1 + 40)];
  (*(void (**)(uint64_t, uint64_t, id))(v1 + 16))(v1, v2, v3);
}

void __96__CDPUIDeviceToDeviceEncryptionHelper_performDeviceToDeviceEncryptionStateRepairWithCompletion___block_invoke_3(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    uint64_t v6 = _CDPLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2187CF000, v6, OS_LOG_TYPE_DEFAULT, "Determined to be eligible for upgrade, proceeding with repair", buf, 2u);
    }

    v7 = *(void **)(a1 + 32);
    id v8 = [v7 context];
    [v7 _beginUpgradeFlowWithContext:v8 completion:*(void *)(a1 + 40)];

    goto LABEL_20;
  }
  uint64_t v9 = _CDPLogSystem();
  v10 = v9;
  if (v5)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __96__CDPUIDeviceToDeviceEncryptionHelper_performDeviceToDeviceEncryptionStateRepairWithCompletion___block_invoke_3_cold_1();
    }

    if (*(void *)(a1 + 40))
    {
      if ([MEMORY[0x263F08B88] isMainThread])
      {
        id v11 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
LABEL_16:
        v11();
        goto LABEL_20;
      }
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __96__CDPUIDeviceToDeviceEncryptionHelper_performDeviceToDeviceEncryptionStateRepairWithCompletion___block_invoke_39;
      block[3] = &unk_26433CE80;
      id v17 = *(id *)(a1 + 40);
      id v16 = v5;
      dispatch_async(MEMORY[0x263EF83A0], block);

      id v12 = v17;
      goto LABEL_19;
    }
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2187CF000, v10, OS_LOG_TYPE_DEFAULT, "No error and no repair needed. Signaling successful completion.", buf, 2u);
    }

    if (*(void *)(a1 + 40))
    {
      if ([MEMORY[0x263F08B88] isMainThread])
      {
        id v11 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
        goto LABEL_16;
      }
      v13[0] = MEMORY[0x263EF8330];
      v13[1] = 3221225472;
      v13[2] = __96__CDPUIDeviceToDeviceEncryptionHelper_performDeviceToDeviceEncryptionStateRepairWithCompletion___block_invoke_40;
      v13[3] = &unk_26433CDE0;
      id v14 = *(id *)(a1 + 40);
      dispatch_async(MEMORY[0x263EF83A0], v13);
      id v12 = v14;
LABEL_19:
    }
  }
LABEL_20:
}

uint64_t __96__CDPUIDeviceToDeviceEncryptionHelper_performDeviceToDeviceEncryptionStateRepairWithCompletion___block_invoke_39(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

uint64_t __96__CDPUIDeviceToDeviceEncryptionHelper_performDeviceToDeviceEncryptionStateRepairWithCompletion___block_invoke_40(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)performDeviceToDeviceEncryptionStateRepairForContext:(id)a3 withCompletion:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  if (!self->_context)
  {
    v7 = [v12 altDSID];
    id v8 = +[CDPUIDeviceToDeviceEncryptionHelper _newLegacyFlowContextForAltDSID:v7];
    context = self->_context;
    self->_context = v8;
  }
  v10 = [v12 securityUpgradeContext];
  [(CDPUIDeviceToDeviceEncryptionFlowContext *)self->_context setSecurityUpgradeContext:v10];

  id v11 = [(CDPUIDeviceToDeviceEncryptionHelper *)self _presentingViewController];
  [(CDPUIDeviceToDeviceEncryptionFlowContext *)self->_context setPresentingViewController:v11];

  [(CDPUIDeviceToDeviceEncryptionHelper *)self performDeviceToDeviceEncryptionStateRepairWithCompletion:v6];
}

- (void)_configurePresentingViewControllerForModalPresentation
{
  id v3 = [(CDPUIDeviceToDeviceEncryptionHelper *)self _presentingViewController];
  [v3 setModalInPresentation:1];

  id v4 = [(CDPUIDeviceToDeviceEncryptionHelper *)self _presentingViewController];
  id v5 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v6 = [v5 userInterfaceIdiom];

  [v4 setModalPresentationStyle:2 * ((v6 & 0xFFFFFFFFFFFFFFFBLL) == 1)];
  v7 = [(CDPUIDeviceToDeviceEncryptionHelper *)self _presentingNavigationController];

  if (v7)
  {
    id v13 = [(CDPUIDeviceToDeviceEncryptionHelper *)self _presentingNavigationController];
    id v8 = [v13 navigationBar];
    [v8 setTranslucent:1];

    uint64_t v9 = [v13 navigationBar];
    id v10 = objc_alloc_init(MEMORY[0x263F827E8]);
    [v9 setBackgroundImage:v10 forBarMetrics:0];

    id v11 = [v13 navigationBar];
    id v12 = objc_alloc_init(MEMORY[0x263F827E8]);
    [v11 setShadowImage:v12];
  }
}

- (void)_beginUpgradeFlowWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __79__CDPUIDeviceToDeviceEncryptionHelper__beginUpgradeFlowWithContext_completion___block_invoke;
  aBlock[3] = &unk_26433CBD8;
  aBlock[4] = self;
  id v8 = v6;
  id v22 = v8;
  id v9 = v7;
  id v23 = v9;
  id v10 = (void (**)(void *, uint64_t, void))_Block_copy(aBlock);
  id v11 = [v8 cdpContext];
  uint64_t v12 = [v11 isiCDPEligible];

  if ([v8 deviceToDeviceEncryptionUpgradeUIStyle] == 3)
  {
    if (v12)
    {
      if (v10)
      {
        if ([MEMORY[0x263F08B88] isMainThread])
        {
          v10[2](v10, 1, 0);
        }
        else
        {
          block[0] = MEMORY[0x263EF8330];
          block[1] = 3221225472;
          block[2] = __79__CDPUIDeviceToDeviceEncryptionHelper__beginUpgradeFlowWithContext_completion___block_invoke_6;
          block[3] = &unk_26433CDE0;
          v20 = v10;
          dispatch_async(MEMORY[0x263EF83A0], block);
        }
      }
    }
    else
    {
      [(CDPUIDeviceToDeviceEncryptionHelper *)self _legacyRequestPermissionToContinueFlowWithCompletion:v10];
    }
  }
  else
  {
    id v13 = [(CDPUIDeviceToDeviceEncryptionHelper *)self _newUpgradeUIProvider];
    id v14 = [(CDPUIDeviceToDeviceEncryptionMessagingViewModel *)[CDPUIDeviceToDeviceEncryptionUpgradeMessageViewModel alloc] initWithContext:v8 is2FA:v12 hasLocalSecret:[(CDPUIDeviceToDeviceEncryptionHelper *)self _hasLocalSecret]];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __79__CDPUIDeviceToDeviceEncryptionHelper__beginUpgradeFlowWithContext_completion___block_invoke_7;
    v16[3] = &unk_26433CF70;
    id v17 = v13;
    v18 = v10;
    id v15 = v13;
    [v15 promptForUpgradeWithContext:v8 vm:v14 completion:v16];
  }
}

void __79__CDPUIDeviceToDeviceEncryptionHelper__beginUpgradeFlowWithContext_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    [*(id *)(a1 + 32) _configureNavigationController];
    id v6 = *(void **)(a1 + 32);
    uint64_t v7 = *(void *)(a1 + 40);
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __79__CDPUIDeviceToDeviceEncryptionHelper__beginUpgradeFlowWithContext_completion___block_invoke_2;
    v12[3] = &unk_26433CF70;
    v12[4] = v6;
    id v13 = *(id *)(a1 + 48);
    [v6 _continueUpgradeFlowWithContext:v7 completion:v12];
    id v8 = v13;
LABEL_7:

    goto LABEL_8;
  }
  if (*(void *)(a1 + 48))
  {
    if (![MEMORY[0x263F08B88] isMainThread])
    {
      v9[0] = MEMORY[0x263EF8330];
      v9[1] = 3221225472;
      v9[2] = __79__CDPUIDeviceToDeviceEncryptionHelper__beginUpgradeFlowWithContext_completion___block_invoke_5;
      v9[3] = &unk_26433CE80;
      id v11 = *(id *)(a1 + 48);
      id v10 = v5;
      dispatch_async(MEMORY[0x263EF83A0], v9);

      id v8 = v11;
      goto LABEL_7;
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
LABEL_8:
}

void __79__CDPUIDeviceToDeviceEncryptionHelper__beginUpgradeFlowWithContext_completion___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __79__CDPUIDeviceToDeviceEncryptionHelper__beginUpgradeFlowWithContext_completion___block_invoke_3;
  v9[3] = &unk_26433CF20;
  id v6 = *(void **)(a1 + 32);
  id v7 = *(id *)(a1 + 40);
  char v12 = a2;
  id v10 = v5;
  id v11 = v7;
  id v8 = v5;
  [v6 _dismissNavigationControllerWithCompletion:v9];
}

void __79__CDPUIDeviceToDeviceEncryptionHelper__beginUpgradeFlowWithContext_completion___block_invoke_3(uint64_t a1)
{
  if (*(void *)(a1 + 40))
  {
    if ([MEMORY[0x263F08B88] isMainThread])
    {
      uint64_t v2 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
      v2();
    }
    else
    {
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __79__CDPUIDeviceToDeviceEncryptionHelper__beginUpgradeFlowWithContext_completion___block_invoke_4;
      block[3] = &unk_26433CF20;
      id v5 = *(id *)(a1 + 40);
      char v6 = *(unsigned char *)(a1 + 48);
      id v4 = *(id *)(a1 + 32);
      dispatch_async(MEMORY[0x263EF83A0], block);
    }
  }
}

uint64_t __79__CDPUIDeviceToDeviceEncryptionHelper__beginUpgradeFlowWithContext_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

uint64_t __79__CDPUIDeviceToDeviceEncryptionHelper__beginUpgradeFlowWithContext_completion___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

uint64_t __79__CDPUIDeviceToDeviceEncryptionHelper__beginUpgradeFlowWithContext_completion___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __79__CDPUIDeviceToDeviceEncryptionHelper__beginUpgradeFlowWithContext_completion___block_invoke_7(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if (*(void *)(a1 + 40))
  {
    if ([MEMORY[0x263F08B88] isMainThread])
    {
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
    else
    {
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __79__CDPUIDeviceToDeviceEncryptionHelper__beginUpgradeFlowWithContext_completion___block_invoke_8;
      block[3] = &unk_26433CF20;
      id v8 = *(id *)(a1 + 40);
      char v9 = a2;
      id v7 = v5;
      dispatch_async(MEMORY[0x263EF83A0], block);
    }
  }
}

uint64_t __79__CDPUIDeviceToDeviceEncryptionHelper__beginUpgradeFlowWithContext_completion___block_invoke_8(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

- (void)_continueUpgradeFlowWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __82__CDPUIDeviceToDeviceEncryptionHelper__continueUpgradeFlowWithContext_completion___block_invoke;
  aBlock[3] = &unk_26433D830;
  id v17 = v6;
  id v18 = v7;
  aBlock[4] = self;
  id v8 = v6;
  id v9 = v7;
  id v10 = _Block_copy(aBlock);
  id v11 = [(CDPUIDeviceToDeviceEncryptionHelper *)self _inAppAuthenticationContextForFlowContext:v8];
  char v12 = [(CDPUIDeviceToDeviceEncryptionHelper *)self _authenticationController];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __82__CDPUIDeviceToDeviceEncryptionHelper__continueUpgradeFlowWithContext_completion___block_invoke_3;
  v14[3] = &unk_26433D880;
  id v15 = v10;
  id v13 = v10;
  [v12 authenticateWithContext:v11 completion:v14];
}

void __82__CDPUIDeviceToDeviceEncryptionHelper__continueUpgradeFlowWithContext_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (!v5 || v6)
  {
    id v13 = _CDPLogSystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      __82__CDPUIDeviceToDeviceEncryptionHelper__continueUpgradeFlowWithContext_completion___block_invoke_cold_1();
    }

    if (*(void *)(a1 + 48))
    {
      if ([MEMORY[0x263F08B88] isMainThread])
      {
        (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
      }
      else
      {
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __82__CDPUIDeviceToDeviceEncryptionHelper__continueUpgradeFlowWithContext_completion___block_invoke_43;
        block[3] = &unk_26433CE80;
        id v27 = *(id *)(a1 + 48);
        id v26 = v7;
        dispatch_async(MEMORY[0x263EF83A0], block);
      }
    }
  }
  else
  {
    id v8 = (void *)[objc_alloc(MEMORY[0x263F34350]) initWithAuthenticationResults:v5];
    if ([v8 isiCDPEligible])
    {
      aBlock[0] = MEMORY[0x263EF8330];
      aBlock[1] = 3221225472;
      aBlock[2] = __82__CDPUIDeviceToDeviceEncryptionHelper__continueUpgradeFlowWithContext_completion___block_invoke_2;
      aBlock[3] = &unk_26433CCF0;
      id v9 = *(void **)(a1 + 40);
      aBlock[4] = *(void *)(a1 + 32);
      id v22 = v9;
      id v10 = v5;
      id v23 = v10;
      id v24 = *(id *)(a1 + 48);
      id v11 = (void (**)(void))_Block_copy(aBlock);
      char v12 = [v10 objectForKeyedSubscript:*MEMORY[0x263F28F90]];
      if ([v12 BOOLValue]) {
        [*(id *)(a1 + 32) _presentSpinnerViewControllerWithCompletion:v11];
      }
      else {
        v11[2](v11);
      }

      id v17 = v22;
    }
    else
    {
      id v14 = _CDPLogSystem();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2187CF000, v14, OS_LOG_TYPE_DEFAULT, "Account is still not iCDP eligible, upgrade failed without an error", buf, 2u);
      }

      id v15 = *(void **)(a1 + 32);
      uint64_t v16 = *(void *)(a1 + 40);
      v18[0] = MEMORY[0x263EF8330];
      v18[1] = 3221225472;
      v18[2] = __82__CDPUIDeviceToDeviceEncryptionHelper__continueUpgradeFlowWithContext_completion___block_invoke_45;
      v18[3] = &unk_26433CDE0;
      id v19 = *(id *)(a1 + 48);
      [v15 _presentIneligibilityAlertForFlowContext:v16 completion:v18];
      id v17 = v19;
    }
  }
}

uint64_t __82__CDPUIDeviceToDeviceEncryptionHelper__continueUpgradeFlowWithContext_completion___block_invoke_43(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

uint64_t __82__CDPUIDeviceToDeviceEncryptionHelper__continueUpgradeFlowWithContext_completion___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _continueAuthenticatedUpgradeFlowWithContext:*(void *)(a1 + 40) authenticationResults:*(void *)(a1 + 48) completion:*(void *)(a1 + 56)];
}

void __82__CDPUIDeviceToDeviceEncryptionHelper__continueUpgradeFlowWithContext_completion___block_invoke_45(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    if ([MEMORY[0x263F08B88] isMainThread])
    {
      uint64_t v2 = *(void *)(a1 + 32);
      objc_msgSend(MEMORY[0x263F087E8], "cdp_errorWithCode:", 5095);
      id v3 = (id)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void, id))(v2 + 16))(v2, 0, v3);
    }
    else
    {
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __82__CDPUIDeviceToDeviceEncryptionHelper__continueUpgradeFlowWithContext_completion___block_invoke_2_47;
      block[3] = &unk_26433CDE0;
      id v5 = *(id *)(a1 + 32);
      dispatch_async(MEMORY[0x263EF83A0], block);
    }
  }
}

void __82__CDPUIDeviceToDeviceEncryptionHelper__continueUpgradeFlowWithContext_completion___block_invoke_2_47(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  objc_msgSend(MEMORY[0x263F087E8], "cdp_errorWithCode:", 5095);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

void __82__CDPUIDeviceToDeviceEncryptionHelper__continueUpgradeFlowWithContext_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (*(void *)(a1 + 32))
  {
    if ([MEMORY[0x263F08B88] isMainThread])
    {
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    }
    else
    {
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __82__CDPUIDeviceToDeviceEncryptionHelper__continueUpgradeFlowWithContext_completion___block_invoke_4;
      block[3] = &unk_26433D858;
      id v10 = *(id *)(a1 + 32);
      id v8 = v5;
      id v9 = v6;
      dispatch_async(MEMORY[0x263EF83A0], block);
    }
  }
}

uint64_t __82__CDPUIDeviceToDeviceEncryptionHelper__continueUpgradeFlowWithContext_completion___block_invoke_4(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)_continueAuthenticatedUpgradeFlowWithContext:(id)a3 authenticationResults:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  id v11 = _CDPLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2187CF000, v11, OS_LOG_TYPE_DEFAULT, "Authentication for upgrade succeeded, checking CDP state", buf, 2u);
  }

  char v12 = [(CDPUIDeviceToDeviceEncryptionHelper *)self _stateControllerForFlowContext:v8 withAuthenticationResults:v10];

  uint64_t v19 = MEMORY[0x263EF8330];
  uint64_t v20 = 3221225472;
  v21 = __117__CDPUIDeviceToDeviceEncryptionHelper__continueAuthenticatedUpgradeFlowWithContext_authenticationResults_completion___block_invoke;
  id v22 = &unk_26433D8A8;
  id v13 = v8;
  id v23 = v13;
  id v26 = v9;
  id v14 = v12;
  id v24 = v14;
  v25 = self;
  id v15 = v9;
  uint64_t v16 = (void (**)(void *, void *, void))_Block_copy(&v19);
  if ([(CDPUIDeviceToDeviceEncryptionHelper *)self _hasLocalSecret])
  {
    id v17 = [v13 cachedLocalSecret];

    if (v17)
    {
      id v18 = [v13 cachedLocalSecret];
      v16[2](v16, v18, 0);
    }
    else if ([v13 deviceToDeviceEncryptionUpgradeType] == 2)
    {
      [(CDPUIDeviceToDeviceEncryptionHelper *)self _validateLocalSecretForContext:v13 withStateController:v14 completion:v16];
    }
    else
    {
      v16[2](v16, 0, 0);
    }
  }
  else
  {
    [(CDPUIDeviceToDeviceEncryptionHelper *)self _createLocalSecretForContext:v13 completion:v16];
  }
}

void __117__CDPUIDeviceToDeviceEncryptionHelper__continueAuthenticatedUpgradeFlowWithContext_authenticationResults_completion___block_invoke(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (objc_msgSend(v6, "cdp_isCDPErrorWithCode:", -5307)
    && [a1[4] deviceToDeviceEncryptionUpgradeType] == 1)
  {
    id v7 = _CDPLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2187CF000, v7, OS_LOG_TYPE_DEFAULT, "Passcode creation cancelled but not required for 2FA-only upgrade, returning success", buf, 2u);
    }

    if (a1[7])
    {
      if ([MEMORY[0x263F08B88] isMainThread])
      {
        id v8 = (void (*)(void))*((void *)a1[7] + 2);
LABEL_16:
        v8();
        goto LABEL_20;
      }
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __117__CDPUIDeviceToDeviceEncryptionHelper__continueAuthenticatedUpgradeFlowWithContext_authenticationResults_completion___block_invoke_49;
      block[3] = &unk_26433CDE0;
      id v18 = a1[7];
      dispatch_async(MEMORY[0x263EF83A0], block);
      id v13 = v18;
      goto LABEL_19;
    }
  }
  else if (v6 && (objc_msgSend(v6, "cdp_isCDPErrorWithCode:", 5094) & 1) == 0)
  {
    char v12 = _CDPLogSystem();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      __117__CDPUIDeviceToDeviceEncryptionHelper__continueAuthenticatedUpgradeFlowWithContext_authenticationResults_completion___block_invoke_cold_1();
    }

    if (a1[7])
    {
      if ([MEMORY[0x263F08B88] isMainThread])
      {
        id v8 = (void (*)(void))*((void *)a1[7] + 2);
        goto LABEL_16;
      }
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = __117__CDPUIDeviceToDeviceEncryptionHelper__continueAuthenticatedUpgradeFlowWithContext_authenticationResults_completion___block_invoke_50;
      v14[3] = &unk_26433CE80;
      id v16 = a1[7];
      id v15 = v6;
      dispatch_async(MEMORY[0x263EF83A0], v14);

      id v13 = v16;
LABEL_19:
    }
  }
  else
  {
    id v9 = [a1[5] context];
    id v10 = [v5 validatedSecret];
    [v9 setCachedLocalSecret:v10];

    id v11 = [a1[5] context];
    objc_msgSend(v11, "setCachedLocalSecretType:", objc_msgSend(v5, "secretType"));

    [a1[6] _performAuthenticatedRepairFlowWithContext:a1[4] stateController:a1[5] completion:a1[7]];
  }
LABEL_20:
}

uint64_t __117__CDPUIDeviceToDeviceEncryptionHelper__continueAuthenticatedUpgradeFlowWithContext_authenticationResults_completion___block_invoke_49(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __117__CDPUIDeviceToDeviceEncryptionHelper__continueAuthenticatedUpgradeFlowWithContext_authenticationResults_completion___block_invoke_50(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

- (void)_performAuthenticatedRepairFlowWithContext:(id)a3 stateController:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __109__CDPUIDeviceToDeviceEncryptionHelper__performAuthenticatedRepairFlowWithContext_stateController_completion___block_invoke;
  v13[3] = &unk_26433CBD8;
  id v14 = v7;
  id v15 = v8;
  id v16 = v9;
  id v10 = v9;
  id v11 = v8;
  id v12 = v7;
  [v11 repairCloudDataProtectionStateWithCompletion:v13];
}

void __109__CDPUIDeviceToDeviceEncryptionHelper__performAuthenticatedRepairFlowWithContext_stateController_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (a2)
  {
    id v6 = *(void **)(a1 + 32);
    id v7 = [*(id *)(a1 + 40) context];
    [v6 setRepairContext:v7];
  }
  id v8 = _CDPLogSystem();
  id v9 = v8;
  if (v5)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __109__CDPUIDeviceToDeviceEncryptionHelper__performAuthenticatedRepairFlowWithContext_stateController_completion___block_invoke_cold_1();
    }
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    int v15 = a2;
    _os_log_impl(&dword_2187CF000, v9, OS_LOG_TYPE_DEFAULT, "Finished repairing CDP state: %{BOOL}d", buf, 8u);
  }

  if (*(void *)(a1 + 48))
  {
    if ([MEMORY[0x263F08B88] isMainThread])
    {
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
    else
    {
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __109__CDPUIDeviceToDeviceEncryptionHelper__performAuthenticatedRepairFlowWithContext_stateController_completion___block_invoke_52;
      block[3] = &unk_26433CF20;
      id v12 = *(id *)(a1 + 48);
      char v13 = a2;
      id v11 = v5;
      dispatch_async(MEMORY[0x263EF83A0], block);
    }
  }
}

uint64_t __109__CDPUIDeviceToDeviceEncryptionHelper__performAuthenticatedRepairFlowWithContext_stateController_completion___block_invoke_52(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

- (void)_determineUpgradeEligibilityForContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, void *))a4;
  id v8 = [v6 altDSID];

  if (!v8)
  {
    id v12 = _CDPLogSystem();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[CDPUIDeviceToDeviceEncryptionHelper _determineUpgradeEligibilityForContext:completion:]();
    }

    id v10 = (void *)MEMORY[0x263F087E8];
    uint64_t v11 = -5003;
    goto LABEL_9;
  }
  if ([v6 isDemoDevice])
  {
    id v9 = _CDPLogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[CDPUIDeviceToDeviceEncryptionHelper _determineUpgradeEligibilityForContext:completion:]();
    }

    id v10 = (void *)MEMORY[0x263F087E8];
    uint64_t v11 = -5314;
LABEL_9:
    char v13 = objc_msgSend(v10, "cdp_errorWithCode:", v11);
    v7[2](v7, 0, v13);

    goto LABEL_10;
  }
  uint64_t v14 = [v6 deviceToDeviceEncryptionUpgradeType];
  if (v14)
  {
    if (v14 == 2)
    {
      [(CDPUIDeviceToDeviceEncryptionHelper *)self _determineEscrowRepairUpgradeEligibilityForContext:v6 completion:v7];
    }
    else if (v14 == 1)
    {
      [(CDPUIDeviceToDeviceEncryptionHelper *)self _determineSecurityUpgradeEligibilityForContext:v6 completion:v7];
    }
  }
  else
  {
    [(CDPUIDeviceToDeviceEncryptionHelper *)self _determineManateeUpgradeEligibilityForContext:v6 completion:v7];
  }
LABEL_10:
}

- (void)_determineSecurityUpgradeEligibilityForContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 cdpContext];
  int v9 = [v8 isiCDPEligible];

  if (v9)
  {
    if (v7)
    {
      if ([MEMORY[0x263F08B88] isMainThread])
      {
        (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
      }
      else
      {
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __97__CDPUIDeviceToDeviceEncryptionHelper__determineSecurityUpgradeEligibilityForContext_completion___block_invoke;
        block[3] = &unk_26433CE80;
        id v15 = 0;
        id v16 = v7;
        dispatch_async(MEMORY[0x263EF83A0], block);
      }
    }
  }
  else
  {
    id v10 = [(CDPUIDeviceToDeviceEncryptionHelper *)self _authenticationContextForFlowContext:v6];
    uint64_t v11 = [(CDPUIDeviceToDeviceEncryptionHelper *)self _authenticationController];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __97__CDPUIDeviceToDeviceEncryptionHelper__determineSecurityUpgradeEligibilityForContext_completion___block_invoke_2;
    v12[3] = &unk_26433CBB0;
    id v13 = v7;
    [v11 checkSecurityUpgradeEligibilityForContext:v10 completion:v12];
  }
}

uint64_t __97__CDPUIDeviceToDeviceEncryptionHelper__determineSecurityUpgradeEligibilityForContext_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __97__CDPUIDeviceToDeviceEncryptionHelper__determineSecurityUpgradeEligibilityForContext_completion___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    if (*(void *)(a1 + 32))
    {
      if ([MEMORY[0x263F08B88] isMainThread])
      {
        (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
      }
      else
      {
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __97__CDPUIDeviceToDeviceEncryptionHelper__determineSecurityUpgradeEligibilityForContext_completion___block_invoke_3;
        block[3] = &unk_26433CDE0;
        id v12 = *(id *)(a1 + 32);
        dispatch_async(MEMORY[0x263EF83A0], block);
      }
    }
  }
  else
  {
    id v6 = objc_msgSend(MEMORY[0x263F087E8], "cdp_errorWithCode:underlyingError:", 5900, v5);
    id v7 = _CDPLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __97__CDPUIDeviceToDeviceEncryptionHelper__determineSecurityUpgradeEligibilityForContext_completion___block_invoke_2_cold_1();
    }

    if (*(void *)(a1 + 32))
    {
      if ([MEMORY[0x263F08B88] isMainThread])
      {
        (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
      }
      else
      {
        v8[0] = MEMORY[0x263EF8330];
        v8[1] = 3221225472;
        v8[2] = __97__CDPUIDeviceToDeviceEncryptionHelper__determineSecurityUpgradeEligibilityForContext_completion___block_invoke_53;
        v8[3] = &unk_26433CE80;
        id v10 = *(id *)(a1 + 32);
        id v9 = v6;
        dispatch_async(MEMORY[0x263EF83A0], v8);
      }
    }
  }
}

uint64_t __97__CDPUIDeviceToDeviceEncryptionHelper__determineSecurityUpgradeEligibilityForContext_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __97__CDPUIDeviceToDeviceEncryptionHelper__determineSecurityUpgradeEligibilityForContext_completion___block_invoke_53(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

- (void)_determineManateeUpgradeEligibilityForContext:(id)a3 completion:(id)a4
{
  id v5 = (void (**)(id, uint64_t, void))a4;
  if ([(CDPUIDeviceToDeviceEncryptionHelper *)self _hasManatee])
  {
    uint64_t v6 = [(CDPUIDeviceToDeviceEncryptionHelper *)self _inCircle] ^ 1;
    if (!v5) {
      goto LABEL_8;
    }
  }
  else
  {
    uint64_t v6 = 1;
    if (!v5) {
      goto LABEL_8;
    }
  }
  if ([MEMORY[0x263F08B88] isMainThread])
  {
    v5[2](v5, v6, 0);
  }
  else
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __96__CDPUIDeviceToDeviceEncryptionHelper__determineManateeUpgradeEligibilityForContext_completion___block_invoke;
    v7[3] = &unk_26433D8D0;
    id v8 = v5;
    char v9 = v6;
    dispatch_async(MEMORY[0x263EF83A0], v7);
  }
LABEL_8:
}

uint64_t __96__CDPUIDeviceToDeviceEncryptionHelper__determineManateeUpgradeEligibilityForContext_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40), 0);
}

- (void)_determineEscrowRepairUpgradeEligibilityForContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, uint64_t, void))a4;
  if ([(CDPUIDeviceToDeviceEncryptionHelper *)self _hasLocalSecret]
    && [(CDPUIDeviceToDeviceEncryptionHelper *)self _hasManatee]
    && [(CDPUIDeviceToDeviceEncryptionHelper *)self _inCircle])
  {
    id v8 = [(CDPUIDeviceToDeviceEncryptionHelper *)self _stateControllerForFlowContext:v6 withAuthenticationResults:0];
    [v8 shouldPerformRepairWithOptionForceFetch:1 completion:v7];
  }
  else if (v7)
  {
    if ([MEMORY[0x263F08B88] isMainThread])
    {
      v7[2](v7, 1, 0);
    }
    else
    {
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __101__CDPUIDeviceToDeviceEncryptionHelper__determineEscrowRepairUpgradeEligibilityForContext_completion___block_invoke;
      block[3] = &unk_26433CDE0;
      id v10 = v7;
      dispatch_async(MEMORY[0x263EF83A0], block);
    }
  }
}

uint64_t __101__CDPUIDeviceToDeviceEncryptionHelper__determineEscrowRepairUpgradeEligibilityForContext_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_validateLocalSecretForContext:(id)a3 withStateController:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = _CDPLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2187CF000, v11, OS_LOG_TYPE_DEFAULT, "Device has a local secret, prompting via CDP UI provider", buf, 2u);
  }

  id v12 = objc_alloc(MEMORY[0x263F202A8]);
  id v13 = (void *)[v12 initWithEventName:*MEMORY[0x263F34670] eventCategory:*MEMORY[0x263F34830] initData:0];
  uint64_t v14 = [v9 uiProvider];

  id v15 = [v10 repairContext];

  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __101__CDPUIDeviceToDeviceEncryptionHelper__validateLocalSecretForContext_withStateController_completion___block_invoke;
  v18[3] = &unk_26433CC00;
  id v19 = v13;
  uint64_t v20 = self;
  id v21 = v8;
  id v16 = v8;
  id v17 = v13;
  [v14 cdpContext:v15 promptForLocalSecretWithCompletion:v18];
}

void __101__CDPUIDeviceToDeviceEncryptionHelper__validateLocalSecretForContext_withStateController_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = _CDPLogSystem();
  id v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2187CF000, v8, OS_LOG_TYPE_DEFAULT, "Validated local secret successfully", buf, 2u);
    }

    [*(id *)(a1 + 32) setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263F34558]];
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __101__CDPUIDeviceToDeviceEncryptionHelper__validateLocalSecretForContext_withStateController_completion___block_invoke_cold_1();
    }

    [*(id *)(a1 + 32) setObject:MEMORY[0x263EFFA80] forKeyedSubscript:*MEMORY[0x263F34558]];
    [*(id *)(a1 + 32) populateUnderlyingErrorsStartingWithRootError:v6];
  }
  id v9 = [MEMORY[0x263F34338] rtcAnalyticsReporter];
  [v9 sendEvent:*(void *)(a1 + 32)];

  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __101__CDPUIDeviceToDeviceEncryptionHelper__validateLocalSecretForContext_withStateController_completion___block_invoke_56;
  v14[3] = &unk_26433D858;
  id v10 = *(void **)(a1 + 40);
  id v11 = *(id *)(a1 + 48);
  id v16 = v6;
  id v17 = v11;
  id v15 = v5;
  id v12 = v6;
  id v13 = v5;
  [v10 _presentSpinnerViewControllerWithCompletion:v14];
}

void __101__CDPUIDeviceToDeviceEncryptionHelper__validateLocalSecretForContext_withStateController_completion___block_invoke_56(id *a1)
{
  if (a1[6])
  {
    if ([MEMORY[0x263F08B88] isMainThread])
    {
      id v2 = (void (*)(void))*((void *)a1[6] + 2);
      v2();
    }
    else
    {
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __101__CDPUIDeviceToDeviceEncryptionHelper__validateLocalSecretForContext_withStateController_completion___block_invoke_2;
      block[3] = &unk_26433D858;
      id v6 = a1[6];
      id v4 = a1[4];
      id v5 = a1[5];
      dispatch_async(MEMORY[0x263EF83A0], block);
    }
  }
}

uint64_t __101__CDPUIDeviceToDeviceEncryptionHelper__validateLocalSecretForContext_withStateController_completion___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)_createLocalSecretForContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, void *))a4;
  if ([(CDPUIDeviceToDeviceEncryptionHelper *)self _hasLocalSecret])
  {
    id v8 = objc_msgSend(MEMORY[0x263F087E8], "cdp_errorWithCode:", 5094);
    v7[2](v7, 0, v8);
  }
  else
  {
    id v9 = _CDPLogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2187CF000, v9, OS_LOG_TYPE_DEFAULT, "Device does not have a local secret, showing secret creation flow", buf, 2u);
    }

    id v10 = objc_alloc(MEMORY[0x263F202A8]);
    id v11 = (void *)[v10 initWithEventName:*MEMORY[0x263F34670] eventCategory:*MEMORY[0x263F34830] initData:0];
    id v12 = [(CDPUIDeviceToDeviceEncryptionMessagingViewModel *)[CDPUIDeviceToDeviceEncryptionCreatePasscodeViewModel alloc] initWithContext:v6 is2FA:1 hasLocalSecret:0];
    id v13 = [(CDPUIDeviceToDeviceEncryptionHelper *)self _navigationController];
    uint64_t v14 = +[CDPUIDeviceToDeviceEncryptionPasscodeController passcodeControllerWithPresenter:v13 vm:v12];

    [v14 setDelegate:self];
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __79__CDPUIDeviceToDeviceEncryptionHelper__createLocalSecretForContext_completion___block_invoke;
    v17[3] = &unk_26433D8F8;
    id v18 = v14;
    id v19 = v11;
    uint64_t v20 = self;
    id v21 = v7;
    id v15 = v11;
    id v16 = v14;
    [v16 createPasscodeStateWithCompletion:v17];
  }
}

void __79__CDPUIDeviceToDeviceEncryptionHelper__createLocalSecretForContext_completion___block_invoke(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = _CDPLogSystem();
  id v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2187CF000, v8, OS_LOG_TYPE_DEFAULT, "Created local secret successfully", buf, 2u);
    }

    [a1[5] setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263F34558]];
    [a1[6] _postBiometricFollowUp];
    id v9 = _CDPLogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      __79__CDPUIDeviceToDeviceEncryptionHelper__createLocalSecretForContext_completion___block_invoke_cold_2();
    }

    id v10 = [a1[6] followUpProvider];
    [v10 deleteCreatePasscodeFollowUp];
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __52__CDPUIController__handleResetActionWithCompletion___block_invoke_cold_1();
    }

    [a1[5] setObject:MEMORY[0x263EFFA80] forKeyedSubscript:*MEMORY[0x263F34558]];
    [a1[5] populateUnderlyingErrorsStartingWithRootError:v6];
  }
  id v11 = [MEMORY[0x263F34338] rtcAnalyticsReporter];
  [v11 sendEvent:a1[5]];

  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __79__CDPUIDeviceToDeviceEncryptionHelper__createLocalSecretForContext_completion___block_invoke_59;
  v16[3] = &unk_26433D858;
  id v12 = a1[6];
  id v13 = a1[7];
  id v18 = v6;
  id v19 = v13;
  id v17 = v5;
  id v14 = v6;
  id v15 = v5;
  [v12 _presentSpinnerViewControllerWithCompletion:v16];
}

void __79__CDPUIDeviceToDeviceEncryptionHelper__createLocalSecretForContext_completion___block_invoke_59(id *a1)
{
  if (a1[6])
  {
    if ([MEMORY[0x263F08B88] isMainThread])
    {
      id v2 = (void (*)(void))*((void *)a1[6] + 2);
      v2();
    }
    else
    {
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __79__CDPUIDeviceToDeviceEncryptionHelper__createLocalSecretForContext_completion___block_invoke_2;
      block[3] = &unk_26433D858;
      id v6 = a1[6];
      id v4 = a1[4];
      id v5 = a1[5];
      dispatch_async(MEMORY[0x263EF83A0], block);
    }
  }
}

uint64_t __79__CDPUIDeviceToDeviceEncryptionHelper__createLocalSecretForContext_completion___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)_presentIneligibilityAlertForFlowContext:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(CDPUIDeviceToDeviceEncryptionHelper *)self _newUpgradeUIProvider];
  id v9 = [(CDPUIDeviceToDeviceEncryptionMessagingViewModel *)[CDPUIDeviceToDeviceEncryptionIneligibilityAlertViewModel alloc] initWithContext:v7 is2FA:0 hasLocalSecret:0];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __91__CDPUIDeviceToDeviceEncryptionHelper__presentIneligibilityAlertForFlowContext_completion___block_invoke;
  v12[3] = &unk_26433CF70;
  id v13 = v8;
  id v14 = v6;
  id v10 = v6;
  id v11 = v8;
  [v11 promptIneligibilityWithContext:v7 vm:v9 completion:v12];
}

uint64_t __91__CDPUIDeviceToDeviceEncryptionHelper__presentIneligibilityAlertForFlowContext_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_requestPermissionToCreatePasscodeForFlowContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, uint64_t))a4;
  if ([v6 deviceToDeviceEncryptionUpgradeType] == 1
    || [(CDPUIDeviceToDeviceEncryptionHelper *)self _hasLocalSecret]
    || [v6 shouldSuppressPasscodeCreationCancelPrompt])
  {
    if (v7)
    {
      if ([MEMORY[0x263F08B88] isMainThread])
      {
        v7[2](v7, 1);
      }
      else
      {
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __99__CDPUIDeviceToDeviceEncryptionHelper__requestPermissionToCreatePasscodeForFlowContext_completion___block_invoke;
        block[3] = &unk_26433CDE0;
        id v15 = v7;
        dispatch_async(MEMORY[0x263EF83A0], block);
      }
    }
  }
  else
  {
    id v8 = [(CDPUIDeviceToDeviceEncryptionHelper *)self _newUpgradeUIProvider];
    id v9 = [(CDPUIDeviceToDeviceEncryptionMessagingViewModel *)[CDPUIDeviceToDeviceEncryptionCancelCreateViewModel alloc] initWithContext:v6 is2FA:0 hasLocalSecret:0];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __99__CDPUIDeviceToDeviceEncryptionHelper__requestPermissionToCreatePasscodeForFlowContext_completion___block_invoke_2;
    v11[3] = &unk_26433CF70;
    id v12 = v8;
    id v13 = v7;
    id v10 = v8;
    [v10 promptForCancelWithContext:v6 vm:v9 completion:v11];
  }
}

uint64_t __99__CDPUIDeviceToDeviceEncryptionHelper__requestPermissionToCreatePasscodeForFlowContext_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __99__CDPUIDeviceToDeviceEncryptionHelper__requestPermissionToCreatePasscodeForFlowContext_completion___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if (*(void *)(a1 + 40))
  {
    if ([MEMORY[0x263F08B88] isMainThread])
    {
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
    else
    {
      v6[0] = MEMORY[0x263EF8330];
      v6[1] = 3221225472;
      v6[2] = __99__CDPUIDeviceToDeviceEncryptionHelper__requestPermissionToCreatePasscodeForFlowContext_completion___block_invoke_3;
      v6[3] = &unk_26433D8D0;
      id v7 = *(id *)(a1 + 40);
      char v8 = a2;
      dispatch_async(MEMORY[0x263EF83A0], v6);
    }
  }
}

uint64_t __99__CDPUIDeviceToDeviceEncryptionHelper__requestPermissionToCreatePasscodeForFlowContext_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (void)_legacyRequestPermissionToContinueFlowWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(CDPUIDeviceToDeviceEncryptionHelper *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __92__CDPUIDeviceToDeviceEncryptionHelper__legacyRequestPermissionToContinueFlowWithCompletion___block_invoke_2;
    v8[3] = &unk_26433D920;
    id v9 = v4;
    [v5 deviceToDeviceEncryptionHelper:self shouldContinueUpgradingUserToHSA2WithCompletion:v8];
    id v6 = v9;
LABEL_9:

    goto LABEL_10;
  }
  id v7 = _CDPLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2187CF000, v7, OS_LOG_TYPE_DEFAULT, "No delegate for requesting permission, continuing encryption upgrade", buf, 2u);
  }

  if (v4)
  {
    if (![MEMORY[0x263F08B88] isMainThread])
    {
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __92__CDPUIDeviceToDeviceEncryptionHelper__legacyRequestPermissionToContinueFlowWithCompletion___block_invoke;
      block[3] = &unk_26433CDE0;
      id v11 = v4;
      dispatch_async(MEMORY[0x263EF83A0], block);
      id v6 = v11;
      goto LABEL_9;
    }
    (*((void (**)(id, uint64_t, void))v4 + 2))(v4, 1, 0);
  }
LABEL_10:
}

uint64_t __92__CDPUIDeviceToDeviceEncryptionHelper__legacyRequestPermissionToContinueFlowWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __92__CDPUIDeviceToDeviceEncryptionHelper__legacyRequestPermissionToContinueFlowWithCompletion___block_invoke_2(uint64_t a1, int a2)
{
  id v4 = _CDPLogSystem();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2187CF000, v4, OS_LOG_TYPE_DEFAULT, "Permission to continue upgrading received, continuing encryption upgrade", buf, 2u);
    }

    if (*(void *)(a1 + 32))
    {
      if ([MEMORY[0x263F08B88] isMainThread])
      {
        (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
        return;
      }
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __92__CDPUIDeviceToDeviceEncryptionHelper__legacyRequestPermissionToContinueFlowWithCompletion___block_invoke_64;
      block[3] = &unk_26433CDE0;
      id v12 = *(id *)(a1 + 32);
      dispatch_async(MEMORY[0x263EF83A0], block);
      char v8 = v12;
LABEL_14:
    }
  }
  else
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2187CF000, v4, OS_LOG_TYPE_DEFAULT, "D2D encryption helper requested the flow to not proceed, cancelling the upgrade", buf, 2u);
    }

    if (*(void *)(a1 + 32))
    {
      if ([MEMORY[0x263F08B88] isMainThread])
      {
        uint64_t v6 = *(void *)(a1 + 32);
        id v7 = objc_msgSend(MEMORY[0x263F087E8], "cdp_errorWithCode:", -5307);
        (*(void (**)(uint64_t, void, void *))(v6 + 16))(v6, 0, v7);

        return;
      }
      v9[0] = MEMORY[0x263EF8330];
      v9[1] = 3221225472;
      v9[2] = __92__CDPUIDeviceToDeviceEncryptionHelper__legacyRequestPermissionToContinueFlowWithCompletion___block_invoke_65;
      v9[3] = &unk_26433CDE0;
      id v10 = *(id *)(a1 + 32);
      dispatch_async(MEMORY[0x263EF83A0], v9);
      char v8 = v10;
      goto LABEL_14;
    }
  }
}

uint64_t __92__CDPUIDeviceToDeviceEncryptionHelper__legacyRequestPermissionToContinueFlowWithCompletion___block_invoke_64(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __92__CDPUIDeviceToDeviceEncryptionHelper__legacyRequestPermissionToContinueFlowWithCompletion___block_invoke_65(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  objc_msgSend(MEMORY[0x263F087E8], "cdp_errorWithCode:", -5307);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

- (void)_presentSpinnerViewControllerWithCompletion:(id)a3
{
  id v4 = (void (**)(void))a3;
  id v6 = [(CDPUIDeviceToDeviceEncryptionHelper *)self _newSpinnerViewController];
  BOOL v5 = [(CDPUIDeviceToDeviceEncryptionHelper *)self _navigationController];
  [v5 pushViewController:v6 animated:1];

  v4[2](v4);
}

- (id)_authenticationContextForFlowContext:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x263F29110];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  id v6 = [v4 altDSID];

  [v5 setAltDSID:v6];

  return v5;
}

- (id)_inAppAuthenticationContextForFlowContext:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x263F290F0] sharedInstance];
  id v6 = [v4 altDSID];
  id v7 = [v5 authKitAccountWithAltDSID:v6];

  id v8 = objc_alloc_init(MEMORY[0x263F292A8]);
  id v9 = [v7 username];
  [v8 setUsername:v9];

  id v10 = (void *)MEMORY[0x263F343B8];
  id v11 = @"D2DENCRYPTION_AUTH_TITLE";
  if (([@"D2DENCRYPTION_AUTH_TITLE" containsString:@"REBRAND"] & 1) != 0
    || !_os_feature_enabled_impl())
  {
    int v12 = 0;
  }
  else
  {
    id v11 = [@"D2DENCRYPTION_AUTH_TITLE" stringByAppendingString:@"_REBRAND"];
    int v12 = 1;
  }
  id v13 = [v10 builderForKey:v11];
  id v14 = [v13 localizedString];
  [v8 setTitle:v14];

  if (v12) {
  id v15 = NSString;
  }
  id v16 = [MEMORY[0x263F343B8] builderForKey:@"D2DENCRYPTION_AUTH_MESSAGE"];
  id v17 = [v16 localizedString];
  id v18 = [v7 username];
  id v19 = [v15 stringWithValidatedFormat:v17, @"%@", 0, v18 validFormatSpecifiers error];
  [v8 setReason:v19];

  uint64_t v20 = [v4 altDSID];
  [v8 setAltDSID:v20];

  [v8 setAuthenticationType:0];
  [v8 setAnticipateEscrowAttempt:1];
  [v8 setIsUsernameEditable:0];
  [v8 setSupportsPiggybacking:1];
  [v8 setShouldOfferSecurityUpgrade:1];
  id v21 = [v4 telemetryFlowID];

  if (v21)
  {
    id v22 = [v4 telemetryFlowID];
    [v8 setTelemetryFlowID:v22];
  }
  id v23 = [v4 securityUpgradeContext];
  int v24 = [v23 isEqualToString:*MEMORY[0x263F29098]];

  if (v24)
  {
    [v8 setSecurityUpgradeContext:*MEMORY[0x263F290A0]];
  }
  else
  {
    v25 = [v4 securityUpgradeContext];
    [v8 setSecurityUpgradeContext:v25];
  }
  [v8 setForceInlinePresentation:1];
  id v26 = [(CDPUIDeviceToDeviceEncryptionHelper *)self _navigationController];
  [v8 setPresentingViewController:v26];

  return v8;
}

- (id)_authenticationController
{
  return self->_authenticationController;
}

- (id)_newUpgradeUIProvider
{
  return objc_alloc_init(CDPUIDeviceToDeviceEncryptionUIProviderImp);
}

- (id)_presentingViewController
{
  id v3 = [(CDPUIDeviceToDeviceEncryptionHelper *)self context];
  id v4 = [v3 presentingViewController];
  id v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [(CDPUIDeviceToDeviceEncryptionHelper *)self presentingViewController];
  }
  id v7 = v6;

  return v7;
}

- (id)_presentingNavigationController
{
  id v2 = [(CDPUIDeviceToDeviceEncryptionHelper *)self context];
  id v3 = [v2 presentingViewController];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return v4;
}

- (id)_navigationController
{
  return self->_navigationController;
}

- (void)_configureNavigationController
{
  id v3 = [(CDPUIDeviceToDeviceEncryptionHelper *)self context];
  if ([v3 forceInlinePresentation])
  {
    id v4 = [(CDPUIDeviceToDeviceEncryptionHelper *)self _presentingNavigationController];

    if (v4)
    {
      id v5 = [(CDPUIDeviceToDeviceEncryptionHelper *)self _presentingNavigationController];
      navigationController = self->_navigationController;
      self->_navigationController = v5;

      id obj = [(UINavigationController *)self->_navigationController topViewController];
      objc_storeWeak((id *)&self->_initialTopViewController, obj);
      goto LABEL_11;
    }
  }
  else
  {
  }
  id v7 = [(CDPUIDeviceToDeviceEncryptionHelper *)self context];
  if (![v7 deviceToDeviceEncryptionUpgradeUIStyle])
  {

    goto LABEL_10;
  }
  id v8 = [(CDPUIDeviceToDeviceEncryptionHelper *)self context];
  uint64_t v9 = [v8 deviceToDeviceEncryptionUpgradeUIStyle];

  if (v9 == 3)
  {
LABEL_10:
    id v11 = objc_alloc(MEMORY[0x263F829B8]);
    id v12 = [(CDPUIDeviceToDeviceEncryptionHelper *)self _newSpinnerViewController];
    id v13 = (UINavigationController *)[v11 initWithRootViewController:v12];
    id v14 = self->_navigationController;
    self->_navigationController = v13;

    id v15 = [(UINavigationController *)self->_navigationController navigationItem];
    [v15 setHidesBackButton:1];

    id obj = [(UINavigationController *)self->_navigationController transitionCoordinator];
    [obj animateAlongsideTransition:&__block_literal_global_0 completion:&__block_literal_global_94];
    id v16 = [(CDPUIDeviceToDeviceEncryptionHelper *)self _presentingViewController];
    [v16 presentViewController:self->_navigationController animated:1 completion:0];

    goto LABEL_11;
  }
  id v10 = [(CDPUIDeviceToDeviceEncryptionHelper *)self _presentingViewController];
  id obj = [v10 presentedViewController];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_storeStrong((id *)&self->_navigationController, obj);
  }
LABEL_11:
}

void __69__CDPUIDeviceToDeviceEncryptionHelper__configureNavigationController__block_invoke()
{
  os_log_t v0 = _CDPLogSystem();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG)) {
    __69__CDPUIDeviceToDeviceEncryptionHelper__configureNavigationController__block_invoke_cold_1();
  }
}

void __69__CDPUIDeviceToDeviceEncryptionHelper__configureNavigationController__block_invoke_92()
{
  os_log_t v0 = _CDPLogSystem();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG)) {
    __69__CDPUIDeviceToDeviceEncryptionHelper__configureNavigationController__block_invoke_92_cold_1();
  }
}

- (void)_dismissNavigationControllerWithCompletion:(id)a3
{
  id v13 = (void (**)(void))a3;
  id v4 = [(CDPUIDeviceToDeviceEncryptionHelper *)self context];
  int v5 = [v4 forceInlinePresentation];

  if (v5)
  {
    p_initialTopViewController = &self->_initialTopViewController;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_initialTopViewController);

    if (WeakRetained)
    {
      id v8 = [(CDPUIDeviceToDeviceEncryptionHelper *)self _navigationController];
      id v9 = objc_loadWeakRetained((id *)p_initialTopViewController);
      id v10 = (id)[v8 popToViewController:v9 animated:0];
    }
  }
  else
  {
    id v11 = [(CDPUIDeviceToDeviceEncryptionHelper *)self _presentingViewController];

    if (v11)
    {
      id v12 = [(CDPUIDeviceToDeviceEncryptionHelper *)self _presentingViewController];
      [v12 dismissViewControllerAnimated:1 completion:v13];

      goto LABEL_7;
    }
  }
  v13[2]();
LABEL_7:
}

- (id)_stateControllerForFlowContext:(id)a3 withAuthenticationResults:(id)a4
{
  int v5 = [(CDPUIDeviceToDeviceEncryptionHelper *)self _repairContextForFlowContext:a3 withAuthenticationResults:a4];
  id v6 = [(CDPUIDeviceToDeviceEncryptionHelper *)self _stateControllerWithRepairContext:v5];

  return v6;
}

- (id)_repairContextForFlowContext:(id)a3 withAuthenticationResults:(id)a4
{
  id v5 = a4;
  id v6 = (objc_class *)MEMORY[0x263F34350];
  id v7 = a3;
  if (v5)
  {
    uint64_t v8 = [[v6 alloc] initWithAuthenticationResults:v5];
  }
  else
  {
    uint64_t v8 = [(objc_class *)v6 contextForPrimaryAccount];
  }
  id v9 = (void *)v8;
  uint64_t v10 = [v7 requiresSynchronousRepair];

  objc_msgSend(v9, "set_disableAsyncSecureBackupEnrollment:", v10);

  return v9;
}

- (id)_stateControllerWithRepairContext:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x263F343F0];
  id v5 = a3;
  id v6 = (void *)[[v4 alloc] initWithContext:v5];

  id v7 = [CDPUIController alloc];
  uint64_t v8 = [(CDPUIDeviceToDeviceEncryptionHelper *)self _navigationController];
  id v9 = [(CDPUIBaseController *)v7 initWithPresentingViewController:v8];

  [(CDPUIController *)v9 setForceInlinePresentation:1];
  [v6 setUiProvider:v9];

  return v6;
}

- (id)_cdpErrorWithUnderlyingError:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3
    && ([v3 domain],
        id v5 = objc_claimAutoreleasedReturnValue(),
        int v6 = [v5 isEqualToString:*MEMORY[0x263F342B0]],
        v5,
        !v6))
  {
    if ((objc_msgSend(v4, "ak_isUserCancelError") & 1) != 0
      || (objc_msgSend(v4, "ak_isAuthenticationErrorWithCode:", -7064) & 1) != 0)
    {
      uint64_t v8 = -5307;
    }
    else if (objc_msgSend(v4, "ak_isUserSkippedError"))
    {
      uint64_t v8 = -5308;
    }
    else
    {
      uint64_t v8 = 5901;
    }
    objc_msgSend(MEMORY[0x263F087E8], "cdp_errorWithCode:underlyingError:", v8, v4);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v7 = v4;
  }
  id v9 = v7;

  return v9;
}

- (BOOL)_hasLocalSecret
{
  id v2 = [MEMORY[0x263F343A8] sharedInstance];
  char v3 = [v2 hasLocalSecret];

  return v3;
}

- (BOOL)_hasManatee
{
  id v3 = objc_alloc(MEMORY[0x263F343C0]);
  id v4 = [(CDPUIDeviceToDeviceEncryptionHelper *)self context];
  id v5 = [v4 cdpContext];
  int v6 = (void *)[v3 initWithContext:v5];

  LOBYTE(v4) = [v6 isManateeAvailable:0];
  return (char)v4;
}

- (BOOL)_inCircle
{
  id v3 = objc_alloc(MEMORY[0x263F34340]);
  id v4 = [(CDPUIDeviceToDeviceEncryptionHelper *)self context];
  id v5 = [v4 cdpContext];
  int v6 = (void *)[v3 initWithContext:v5];

  LOBYTE(v4) = [v6 combinedCachedCircleStatus:0] == 1;
  return (char)v4;
}

+ (id)_newLegacyFlowContext
{
  id v3 = [MEMORY[0x263F34350] contextForPrimaryAccount];
  id v4 = (void *)[a1 _newLegacyFlowContextWithContext:v3];

  return v4;
}

+ (id)_newLegacyFlowContextForAltDSID:(id)a3
{
  id v4 = [MEMORY[0x263F34350] contextForAccountWithAltDSID:a3];
  id v5 = (void *)[a1 _newLegacyFlowContextWithContext:v4];

  return v5;
}

+ (id)_newLegacyFlowContextWithContext:(id)a3
{
  id v3 = a3;
  id v4 = [[CDPUIDeviceToDeviceEncryptionFlowContext alloc] initWithCDPContext:v3];

  [(CDPUIDeviceToDeviceEncryptionFlowContext *)v4 setDeviceToDeviceEncryptionUpgradeUIStyle:3];
  [(CDPUIDeviceToDeviceEncryptionFlowContext *)v4 setDeviceToDeviceEncryptionUpgradeType:0];
  return v4;
}

- (void)_postBiometricFollowUp
{
  id v2 = _CDPLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_2187CF000, v2, OS_LOG_TYPE_DEFAULT, "Posting biometric follow up.", v5, 2u);
  }

  id v3 = [MEMORY[0x263F34388] contextForSettingUpBiometrics];
  id v4 = objc_alloc_init(MEMORY[0x263F34390]);
  [v4 postFollowUpWithContext:v3 error:0];
}

- (id)_newSpinnerViewController
{
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2050000000;
  id v2 = (void *)getAAUISpinnerViewControllerClass_softClass;
  uint64_t v14 = getAAUISpinnerViewControllerClass_softClass;
  if (!getAAUISpinnerViewControllerClass_softClass)
  {
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __getAAUISpinnerViewControllerClass_block_invoke;
    v10[3] = &unk_26433D708;
    v10[4] = &v11;
    __getAAUISpinnerViewControllerClass_block_invoke((uint64_t)v10);
    id v2 = (void *)v12[3];
  }
  id v3 = v2;
  _Block_object_dispose(&v11, 8);
  id v4 = objc_alloc_init(v3);
  id v5 = [v4 label];
  int v6 = @"UPDATING_APPLE_ID_LABEL";
  if (([@"UPDATING_APPLE_ID_LABEL" containsString:@"REBRAND"] & 1) != 0
    || !_os_feature_enabled_impl())
  {
    int v7 = 0;
  }
  else
  {
    int v6 = [@"UPDATING_APPLE_ID_LABEL" stringByAppendingString:@"_REBRAND"];
    int v7 = 1;
  }
  uint64_t v8 = CDPLocalizedString();
  [v5 setText:v8];

  if (v7) {
  [v4 setSpinning:1];
  }
  return v4;
}

- (void)localSecretValidationCanCancelWithViewController:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = [(CDPUIDeviceToDeviceEncryptionHelper *)self context];
  [(CDPUIDeviceToDeviceEncryptionHelper *)self _requestPermissionToCreatePasscodeForFlowContext:v6 completion:v5];
}

- (CDPUIDeviceToDeviceEncryptionFlowContext)context
{
  return self->_context;
}

- (CDPLocalSecretFollowUpProvider)followUpProvider
{
  return self->_followUpProvider;
}

- (void)setFollowUpProvider:(id)a3
{
}

- (UIViewController)presentingViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentingViewController);

  return (UIViewController *)WeakRetained;
}

- (CDPUIDeviceToDeviceEncryptionHelperDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CDPUIDeviceToDeviceEncryptionHelperDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_presentingViewController);
  objc_storeStrong((id *)&self->_followUpProvider, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_destroyWeak((id *)&self->_initialTopViewController);
  objc_storeStrong((id *)&self->_navigationController, 0);

  objc_storeStrong((id *)&self->_authenticationController, 0);
}

void __96__CDPUIDeviceToDeviceEncryptionHelper_performDeviceToDeviceEncryptionStateRepairWithCompletion___block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5(&dword_2187CF000, v0, v1, "Failed to determine upgrade eligibility with error: %@", v2, v3, v4, v5, v6);
}

void __82__CDPUIDeviceToDeviceEncryptionHelper__continueUpgradeFlowWithContext_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5(&dword_2187CF000, v0, v1, "Authentication for upgrade failed with error: %@", v2, v3, v4, v5, v6);
}

void __117__CDPUIDeviceToDeviceEncryptionHelper__continueAuthenticatedUpgradeFlowWithContext_authenticationResults_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5(&dword_2187CF000, v0, v1, "Passcode creation failed with error: %@", v2, v3, v4, v5, v6);
}

void __109__CDPUIDeviceToDeviceEncryptionHelper__performAuthenticatedRepairFlowWithContext_stateController_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5(&dword_2187CF000, v0, v1, "Failed to repair CDP state with error: %@", v2, v3, v4, v5, v6);
}

- (void)_determineUpgradeEligibilityForContext:completion:.cold.1()
{
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_2187CF000, v0, OS_LOG_TYPE_ERROR, "Context does not have altDSID", v1, 2u);
}

- (void)_determineUpgradeEligibilityForContext:completion:.cold.2()
{
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_2187CF000, v0, OS_LOG_TYPE_ERROR, "Account upgrade is not allowed on a demo device", v1, 2u);
}

void __97__CDPUIDeviceToDeviceEncryptionHelper__determineSecurityUpgradeEligibilityForContext_completion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5(&dword_2187CF000, v0, v1, "Account is not eligible for HSA2 upgrade: %@", v2, v3, v4, v5, v6);
}

void __101__CDPUIDeviceToDeviceEncryptionHelper__validateLocalSecretForContext_withStateController_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5(&dword_2187CF000, v0, v1, "Failed to validate local secret with error: %@", v2, v3, v4, v5, v6);
}

void __79__CDPUIDeviceToDeviceEncryptionHelper__createLocalSecretForContext_completion___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2187CF000, v0, v1, "Trying to delete walrus create passcode followup, if present", v2, v3, v4, v5, v6);
}

void __69__CDPUIDeviceToDeviceEncryptionHelper__configureNavigationController__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2187CF000, v0, v1, "Animating push event", v2, v3, v4, v5, v6);
}

void __69__CDPUIDeviceToDeviceEncryptionHelper__configureNavigationController__block_invoke_92_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2187CF000, v0, v1, "Finished pushing spinner view controller", v2, v3, v4, v5, v6);
}

@end