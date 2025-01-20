@interface CDPRemoteSecretEntryViewController
- (BOOL)pinIsAcceptable:(id)a3 outError:(id *)a4;
- (BOOL)simplePIN;
- (BOOL)useProgressiveDelays;
- (BOOL)validatePIN:(id)a3;
- (CDPRemoteDeviceSecretValidator)validator;
- (CDPRemoteSecretEntryViewController)initWithDevice:(id)a3 validator:(id)a4 delegate:(id)a5;
- (CDPRemoteSecretEntryViewController)initWithIsNumeric:(BOOL)a3 numericLength:(id)a4 validator:(id)a5 delegate:(id)a6;
- (CDPRemoteSecretEntryViewController)initWithValidator:(id)a3;
- (CDPRemoteValidationEscapeOffer)escapeOffer;
- (id)_passcodeEntryExplaination;
- (id)_passcodeEntryRequestForDevice;
- (id)title;
- (void)_handleSecretValidationWithPasscode:(id)a3;
- (void)didAcceptEnteredPIN:(id)a3;
- (void)didCancelEnteringPIN;
- (void)didEnterValidRemoteSecret:(id)a3;
- (void)disableUserInteractionAndStartSpinner;
- (void)enableUserInteractionAndStopSpinner;
- (void)setEscapeOffer:(id)a3;
- (void)setPane:(id)a3;
- (void)showIncorrectRemoteSecretAlertForPasscode:(id)a3 withRecoveryError:(id)a4 completion:(id)a5;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation CDPRemoteSecretEntryViewController

- (CDPRemoteSecretEntryViewController)initWithDevice:(id)a3 validator:(id)a4 delegate:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  id v11 = a4;
  uint64_t v12 = [v9 hasNumericSecret];
  v13 = [v9 numericSecretLength];
  v14 = [(CDPRemoteSecretEntryViewController *)self initWithIsNumeric:v12 numericLength:v13 validator:v11 delegate:v10];

  if (v14)
  {
    objc_storeStrong((id *)&v14->_remoteRecoveryDevice, a3);
    v14->_remainingAttempts = [(CDPDevice *)v14->_remoteRecoveryDevice remainingAttempts];
  }

  return v14;
}

- (CDPRemoteSecretEntryViewController)initWithIsNumeric:(BOOL)a3 numericLength:(id)a4 validator:(id)a5 delegate:(id)a6
{
  id v11 = a4;
  id v12 = a6;
  v13 = [(CDPRemoteSecretEntryViewController *)self initWithValidator:a5];
  v14 = v13;
  if (v13)
  {
    *(&v13->_hasNumericSecret + 1) = a3;
    objc_storeStrong((id *)&v13->_numericSecretLength, a4);
    v14->_remainingAttempts = 3;
    objc_storeWeak((id *)&v14->_delegate, v12);
    [(DevicePINController *)v14 setPinDelegate:v14];
    if ([(CDPRemoteSecretEntryViewController *)v14 simplePIN]) {
      [(DevicePINController *)v14 setPinLength:[(NSNumber *)v14->_numericSecretLength integerValue]];
    }
    v15 = [MEMORY[0x263F82670] currentDevice];
    uint64_t v16 = [v15 userInterfaceIdiom];

    BOOL v17 = v16 != 1 && *(&v14->_hasNumericSecret + 1);
    [(DevicePINController *)v14 setNumericPIN:v17];
    id WeakRetained = objc_loadWeakRetained((id *)&v14->_delegate);
    int v19 = [WeakRetained performingAccountRecovery];

    if (v19)
    {
      v20 = [MEMORY[0x263F343B8] builderForKey:@"GENERIC_NEXT_BUTTON"];
      v21 = [v20 localizedString];
      [(DevicePINController *)v14 setDoneButtonTitle:v21];
    }
  }

  return v14;
}

- (CDPRemoteSecretEntryViewController)initWithValidator:(id)a3
{
  id v5 = a3;
  v6 = [(CDPPassphraseEntryViewController *)self init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_validator, a3);
  }

  return v7;
}

- (void)viewWillAppear:(BOOL)a3
{
  v9.receiver = self;
  v9.super_class = (Class)CDPRemoteSecretEntryViewController;
  [(DevicePINController *)&v9 viewWillAppear:a3];
  v4 = [(CDPRemoteSecretEntryViewController *)self navigationController];
  id v5 = [v4 viewControllers];
  v6 = [v5 firstObject];

  if (v6 == self)
  {
    v7 = [(CDPRemoteSecretEntryViewController *)self navigationController];
    v8 = [v7 navigationBar];
    [v8 _setBackgroundOpacity:0.0];
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CDPRemoteSecretEntryViewController;
  [(DevicePINController *)&v4 viewDidDisappear:a3];
  [(CDPRemoteSecretEntryViewController *)self enableUserInteractionAndStopSpinner];
}

- (BOOL)useProgressiveDelays
{
  return 0;
}

- (void)setPane:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CDPRemoteSecretEntryViewController;
  [(DevicePINController *)&v9 setPane:v4];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    [v5 setRemoteSecretType:0];
    [v5 setDevice:self->_remoteRecoveryDevice];
    v6 = [(CDPRemoteSecretEntryViewController *)self escapeOffer];
    [v6 setPresentingViewController:self];

    v7 = [(CDPRemoteSecretEntryViewController *)self escapeOffer];
    [v5 setEscapeOffer:v7];

    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v5, "setRemoteAccountRecovery:", objc_msgSend(WeakRetained, "performingAccountRecovery"));
  }
}

- (id)title
{
  return 0;
}

- (id)_passcodeEntryRequestForDevice
{
  if (![(CDPDevice *)self->_remoteRecoveryDevice isCurrentDevice])
  {
    if (!self->_remoteRecoveryDevice)
    {
      v18 = CDPLocalizedString();
      goto LABEL_17;
    }
    id v11 = NSString;
    id v12 = [MEMORY[0x263F343B8] builderForKey:@"REMOTE_SECRET_ENTRY_MESSAGE_OTHER"];
    v13 = objc_msgSend(v12, "addSecretType:", -[CDPDevice localSecretType](self->_remoteRecoveryDevice, "localSecretType"));
    v14 = [(CDPDevice *)self->_remoteRecoveryDevice modelClass];
    v15 = [v13 addUnqualifiedDeviceClass:v14];
    uint64_t v16 = [v15 localizedString];
    BOOL v17 = [(CDPDevice *)self->_remoteRecoveryDevice localizedName];
    v18 = [v11 stringWithValidatedFormat:v16, @"%@", 0, v17 validFormatSpecifiers error];

LABEL_11:
    goto LABEL_17;
  }
  v3 = [MEMORY[0x263F343A8] sharedInstance];
  if (([v3 hasLocalSecret] & 1) == 0)
  {

    goto LABEL_10;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  int v5 = [WeakRetained performingAccountRecovery];

  if (!v5)
  {
LABEL_10:
    id v12 = [MEMORY[0x263F343B8] builderForKey:@"REMOTE_SECRET_ENTRY_MESSAGE_SAME"];
    v13 = objc_msgSend(v12, "addSecretType:", -[CDPDevice localSecretType](self->_remoteRecoveryDevice, "localSecretType"));
    int v19 = [(CDPDevice *)self->_remoteRecoveryDevice modelClass];
    v20 = [v13 addUnqualifiedDeviceClass:v19];
    v18 = [v20 localizedString];

    goto LABEL_11;
  }
  v6 = [MEMORY[0x263F343A8] sharedInstance];
  v7 = [v6 deviceClass];

  v8 = (void *)MEMORY[0x263F343B8];
  objc_super v9 = @"ACCOUNT_RECOVERY_CURRENT_DEVICE_REMOTE_SECRET_INSTRUCTIONS";
  if (([@"ACCOUNT_RECOVERY_CURRENT_DEVICE_REMOTE_SECRET_INSTRUCTIONS" containsString:@"REBRAND"] & 1) != 0|| !_os_feature_enabled_impl())
  {
    int v10 = 0;
  }
  else
  {
    objc_super v9 = [@"ACCOUNT_RECOVERY_CURRENT_DEVICE_REMOTE_SECRET_INSTRUCTIONS" stringByAppendingString:@"_REBRAND"];
    int v10 = 1;
  }
  v21 = [v8 builderForKey:v9];
  v22 = [v21 addSecretType:1];
  v23 = [v22 addDeviceClass:v7];
  v18 = [v23 localizedString];

  if (v10) {
LABEL_17:
  }

  return v18;
}

- (id)_passcodeEntryExplaination
{
  v3 = (void *)MEMORY[0x263F343B8];
  id v4 = @"REMOTE_SECRET_ENTRY_SUBTITLE";
  if (([@"REMOTE_SECRET_ENTRY_SUBTITLE" containsString:@"REBRAND"] & 1) != 0
    || !_os_feature_enabled_impl())
  {
    int v5 = 0;
  }
  else
  {
    id v4 = [@"REMOTE_SECRET_ENTRY_SUBTITLE" stringByAppendingString:@"_REBRAND"];
    int v5 = 1;
  }
  v6 = [v3 builderForKey:v4];
  v7 = objc_msgSend(v6, "addSecretType:", -[CDPDevice localSecretType](self->_remoteRecoveryDevice, "localSecretType"));
  v8 = [v7 localizedString];

  if (v5) {

  }
  return v8;
}

- (BOOL)pinIsAcceptable:(id)a3 outError:(id *)a4
{
  return 1;
}

- (void)didAcceptEnteredPIN:(id)a3
{
  if (self->_validationState == 2)
  {
    self->_validationState = 0;
    [(CDPRemoteSecretEntryViewController *)self didEnterValidRemoteSecret:a3];
  }
}

- (void)didCancelEnteringPIN
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained cancelledRemoteSecretEntry:self];
}

- (BOOL)validatePIN:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = [(PSDetailController *)self pane];
  [v5 resignFirstResponder];

  p_validationState = (uint64_t *)&self->_validationState;
  switch(self->_validationState)
  {
    case 0uLL:
      v7 = _CDPLogSystem();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        validator = self->_validator;
        int v15 = 138412290;
        uint64_t v16 = validator;
        _os_log_impl(&dword_2187CF000, v7, OS_LOG_TYPE_DEFAULT, "ValidationStateNone - Requesting validation using %@", (uint8_t *)&v15, 0xCu);
      }

      char v9 = 1;
      uint64_t *p_validationState = 1;
      [(CDPRemoteSecretEntryViewController *)self _handleSecretValidationWithPasscode:v4];
      goto LABEL_17;
    case 1uLL:
      id v11 = _CDPLogSystem();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        -[CDPRemoteSecretEntryViewController validatePIN:].cold.5();
      }
      goto LABEL_12;
    case 2uLL:
      id v11 = _CDPLogSystem();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        -[CDPRemoteSecretEntryViewController validatePIN:]();
      }
LABEL_12:

      goto LABEL_13;
    case 3uLL:
      id v12 = _CDPLogSystem();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
        -[CDPRemoteSecretEntryViewController validatePIN:].cold.4();
      }

      char v9 = 0;
      uint64_t *p_validationState = 0;
      goto LABEL_17;
    default:
      int v10 = _CDPLogSystem();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        -[CDPRemoteSecretEntryViewController validatePIN:](p_validationState, v10);
      }

LABEL_13:
      char v9 = 1;
LABEL_17:
      v13 = _CDPLogSystem();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        -[CDPRemoteSecretEntryViewController validatePIN:](v9, v13);
      }

      return v9;
  }
}

- (void)didEnterValidRemoteSecret:(id)a3
{
  id v4 = _CDPLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[CDPRemoteSecretEntryViewController didEnterValidRemoteSecret:]();
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained remoteSecretEntry:self didAcceptValidRemoteSecretForDevice:self->_remoteRecoveryDevice];
}

- (BOOL)simplePIN
{
  return *(&self->_hasNumericSecret + 1)
      && ([(NSNumber *)self->_numericSecretLength integerValue] & 0xFFFFFFFFFFFFFFFDLL) == 4;
}

- (void)_handleSecretValidationWithPasscode:(id)a3
{
  v11[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  [(CDPRemoteSecretEntryViewController *)self disableUserInteractionAndStartSpinner];
  validator = self->_validator;
  remoteRecoveryDevice = self->_remoteRecoveryDevice;
  if (remoteRecoveryDevice)
  {
    v11[0] = self->_remoteRecoveryDevice;
    v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:1];
  }
  else
  {
    v7 = 0;
  }
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __74__CDPRemoteSecretEntryViewController__handleSecretValidationWithPasscode___block_invoke;
  v9[3] = &unk_26433D510;
  v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  [(CDPRemoteDeviceSecretValidator *)validator validateSecret:v8 devices:v7 type:0 withCompletion:v9];
  if (remoteRecoveryDevice) {
}
  }

void __74__CDPRemoteSecretEntryViewController__handleSecretValidationWithPasscode___block_invoke(uint64_t a1, int a2, int a3, void *a4)
{
  id v7 = a4;
  uint64_t v8 = *(void *)(a1 + 32);
  if (a2)
  {
    char v9 = *(void **)(v8 + 1240);
    *(void *)(v8 + 1240) = 0;

    *(void *)(*(void *)(a1 + 32) + 1256) = 2;
    id v10 = _CDPLogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2187CF000, v10, OS_LOG_TYPE_DEFAULT, "Validator provided response, moved to ValidationStateValid", buf, 2u);
    }

    [*(id *)(a1 + 32) pinEntered:*(void *)(a1 + 40)];
  }
  else
  {
    --*(void *)(v8 + 1232);
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1224), "setRemainingAttempts:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1224), "remainingAttempts") - 1);
    if (a3)
    {
      [*(id *)(a1 + 32) enableUserInteractionAndStopSpinner];
      id v11 = _CDPLogSystem();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2187CF000, v11, OS_LOG_TYPE_DEFAULT, "Validator provided response, moved to ValidationStateInvalid", buf, 2u);
      }

      *(void *)(*(void *)(a1 + 32) + 1256) = 3;
      v13 = *(void **)(a1 + 32);
      id v12 = *(void **)(a1 + 40);
      v23[0] = MEMORY[0x263EF8330];
      v23[1] = 3221225472;
      v23[2] = __74__CDPRemoteSecretEntryViewController__handleSecretValidationWithPasscode___block_invoke_42;
      v23[3] = &unk_26433CC30;
      v23[4] = v13;
      id v24 = v12;
      [v13 showIncorrectRemoteSecretAlertForPasscode:v24 withRecoveryError:v7 completion:v23];
      v14 = v24;
    }
    else
    {
      int v15 = _CDPLogSystem();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        __74__CDPRemoteSecretEntryViewController__handleSecretValidationWithPasscode___block_invoke_cold_1((uint64_t)v7, v15);
      }

      uint64_t v16 = *(void *)(a1 + 32);
      uint64_t v17 = *(void **)(v16 + 1240);
      *(void *)(v16 + 1240) = 0;

      v20[0] = MEMORY[0x263EF8330];
      v20[1] = 3221225472;
      v20[2] = __74__CDPRemoteSecretEntryViewController__handleSecretValidationWithPasscode___block_invoke_44;
      v20[3] = &unk_26433CC30;
      id v18 = v7;
      uint64_t v19 = *(void *)(a1 + 32);
      id v21 = v18;
      uint64_t v22 = v19;
      dispatch_async(MEMORY[0x263EF83A0], v20);
      v14 = v21;
    }
  }
}

void __74__CDPRemoteSecretEntryViewController__handleSecretValidationWithPasscode___block_invoke_42(uint64_t a1)
{
  [*(id *)(a1 + 32) pinEntered:*(void *)(a1 + 40)];
  id v2 = [*(id *)(a1 + 32) pane];
  [v2 becomeFirstResponder];
}

void __74__CDPRemoteSecretEntryViewController__handleSecretValidationWithPasscode___block_invoke_44(uint64_t a1)
{
  id v2 = (id *)(a1 + 32);
  v3 = [*(id *)(a1 + 32) domain];
  int v4 = [v3 isEqualToString:*MEMORY[0x263F342B0]];

  if (!v4)
  {
    v6 = _CDPLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __74__CDPRemoteSecretEntryViewController__handleSecretValidationWithPasscode___block_invoke_44_cold_5();
    }

    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 1248));
    [WeakRetained finishValidation:*(void *)(a1 + 40) withError:*(void *)(a1 + 32)];
    goto LABEL_8;
  }
  uint64_t v5 = [*v2 code];
  if (v5 <= -5213)
  {
    switch(v5)
    {
      case -5223:
        [*(id *)(a1 + 40) enableUserInteractionAndStopSpinner];
        id v10 = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 1248));

        if (!v10)
        {
          id v11 = _CDPLogSystem();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
            __74__CDPRemoteSecretEntryViewController__handleSecretValidationWithPasscode___block_invoke_44_cold_4();
          }
        }
        id v12 = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 1248));
        [v12 performPiggybackingRecovery:*(void *)(a1 + 40)];

        break;
      case -5221:
        [*(id *)(a1 + 40) enableUserInteractionAndStopSpinner];
        id v13 = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 1248));

        if (!v13)
        {
          v14 = _CDPLogSystem();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
            __74__CDPRemoteSecretEntryViewController__handleSecretValidationWithPasscode___block_invoke_44_cold_3();
          }
        }
        id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 1248));
        [WeakRetained presentDeviceSelection:*(void *)(a1 + 40)];
        goto LABEL_8;
      case -5218:
        [*(id *)(a1 + 40) enableUserInteractionAndStopSpinner];
        id v8 = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 1248));

        if (!v8)
        {
          char v9 = _CDPLogSystem();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
            __74__CDPRemoteSecretEntryViewController__handleSecretValidationWithPasscode___block_invoke_44_cold_2();
          }
        }
        id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 1248));
        [WeakRetained performCustodianRecovery:*(void *)(a1 + 40)];
LABEL_8:

        return;
    }
LABEL_35:
    id v15 = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 1248));
    [v15 dismissRecoveryFlow:*(void *)(a1 + 40) completion:0];

    uint64_t v16 = _CDPLogSystem();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      __74__CDPRemoteSecretEntryViewController__handleSecretValidationWithPasscode___block_invoke_44_cold_1((uint64_t *)v2, v16);
    }

    return;
  }
  switch(v5)
  {
    case -5212:
      [*(id *)(a1 + 40) enableUserInteractionAndStopSpinner];
      id v17 = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 1248));
      [v17 performRecoveryKeyRecovery:*(void *)(a1 + 40)];
      break;
    case -5209:
      [*(id *)(a1 + 40) enableUserInteractionAndStopSpinner];
      id v17 = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 1248));
      [v17 performRemoteApproval:*(void *)(a1 + 40)];
      break;
    case -5208:
      id v17 = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 1248));
      [v17 performAccountReset:*(void *)(a1 + 40)];
      break;
    case -5206:
      [*(id *)(a1 + 40) enableUserInteractionAndStopSpinner];
      id v17 = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 1248));
      [v17 remoteSecretEntry:*(void *)(a1 + 40) depletedRemainingAttemptsForDevice:*(void *)(*(void *)(a1 + 40) + 1224)];
      break;
    case -5203:
      [*(id *)(a1 + 40) enableUserInteractionAndStopSpinner];
      id v17 = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 1248));
      [v17 exceededMaximumAttemptsForRemoteSecretEntry:*(void *)(a1 + 40)];
      break;
    case -5200:
      id v17 = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 1248));
      [v17 finishValidation:*(void *)(a1 + 40) withError:*(void *)(a1 + 32)];
      break;
    default:
      goto LABEL_35;
  }
}

- (void)showIncorrectRemoteSecretAlertForPasscode:(id)a3 withRecoveryError:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (self->_remoteRecoveryDevice)
  {
    id v10 = [a4 userInfo];
    id v11 = [v10 allValues];
    id v12 = [v11 firstObject];

    if (!objc_msgSend(v12, "cdp_isCDPErrorWithCode:", -5205))
    {
      id v17 = [MEMORY[0x263F343B8] builderForKey:@"REMOTE_SECRET_ENTRY_RECOVERY_ERROR_TITLE"];
      uint64_t v51 = [v17 localizedString];

      id v18 = [MEMORY[0x263F343B8] builderForKey:@"REMOTE_SECRET_ENTRY_RECOVERY_ERROR_MESSAGE"];
      uint64_t v19 = objc_msgSend(v18, "addSecretType:", -[CDPDevice localSecretType](self->_remoteRecoveryDevice, "localSecretType"));
      v20 = [(CDPDevice *)self->_remoteRecoveryDevice modelClass];
      [v19 addDeviceClass:v20];
      id v21 = v9;
      uint64_t v22 = v12;
      v23 = v10;
      v25 = id v24 = v8;
      uint64_t v16 = [v25 localizedString];

      id v8 = v24;
      id v10 = v23;
      id v12 = v22;
      id v9 = v21;
      id v15 = (void *)v51;

LABEL_16:
      goto LABEL_17;
    }
    id v13 = [MEMORY[0x263F343A8] sharedInstance];
    v49 = [v13 deviceClass];

    v14 = [(CDPDevice *)self->_remoteRecoveryDevice modelClass];
    if ([v14 length])
    {
      uint64_t v50 = [(CDPDevice *)self->_remoteRecoveryDevice modelClass];
    }
    else
    {
      uint64_t v50 = 0;
    }

    uint64_t v26 = [(CDPDevice *)self->_remoteRecoveryDevice localSecretType];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    id v48 = v8;
    if (([WeakRetained performingAccountRecovery] & 1) == 0)
    {
      v28 = [MEMORY[0x263F343A8] sharedInstance];
      if ([v28 hasLocalSecret])
      {
        v29 = [MEMORY[0x263F53C50] sharedConnection];
        id v54 = 0;
        int v30 = [v29 unlockDeviceWithPasscode:v8 outError:&v54];
        id v47 = v54;

        if (v30)
        {
          v31 = [MEMORY[0x263F343B8] builderForKey:@"REMOTE_SECRET_ENTRY_INCORRECT_TITLE_OTHER_DEVICE"];
          v32 = [v31 addSecretType:v26];
          v33 = [v32 addDeviceClass:v50];
          id v15 = [v33 localizedString];

          v34 = [MEMORY[0x263F343B8] builderForKey:@"REMOTE_SECRET_ENTRY_INCORRECT_MESSAGE_OTHER_DEVICE"];
          v35 = [v34 addSecretType:v26];
          v36 = [v35 addDeviceClass:v50];
          v46 = [v36 addSecretType:v26];
          v37 = [v46 addDeviceClass:v49];
          uint64_t v16 = [v37 localizedString];

          v38 = (void *)v50;
LABEL_15:

          id v8 = v48;
          goto LABEL_16;
        }
LABEL_14:
        v39 = [MEMORY[0x263F343B8] builderForKey:@"REMOTE_SECRET_ENTRY_INCORRECT_TITLE"];
        v40 = [v39 addSecretType:v26];
        id v15 = [v40 localizedString];

        v34 = [MEMORY[0x263F343B8] builderForKey:@"REMOTE_SECRET_ENTRY_INCORRECT_MESSAGE"];
        v38 = (void *)v50;
        v35 = [v34 addDeviceClass:v50];
        v36 = [v35 addSecretType:v26];
        uint64_t v16 = [v36 localizedString];
        goto LABEL_15;
      }
    }
    id v47 = 0;
    goto LABEL_14;
  }
  id v15 = CDPLocalizedString();
  uint64_t v16 = CDPLocalizedString();
LABEL_17:
  v41 = (void *)MEMORY[0x263F82400];
  v42 = CDPLocalizedString();
  v52[0] = MEMORY[0x263EF8330];
  v52[1] = 3221225472;
  v52[2] = __109__CDPRemoteSecretEntryViewController_showIncorrectRemoteSecretAlertForPasscode_withRecoveryError_completion___block_invoke;
  v52[3] = &unk_26433D790;
  v52[4] = self;
  id v53 = v9;
  id v43 = v9;
  v44 = [v41 actionWithTitle:v42 style:0 handler:v52];

  v45 = [MEMORY[0x263F82418] alertControllerWithTitle:v15 message:v16 preferredStyle:1];
  [v45 addAction:v44];
  [(CDPRemoteSecretEntryViewController *)self presentViewController:v45 animated:1 completion:0];
}

uint64_t __109__CDPRemoteSecretEntryViewController_showIncorrectRemoteSecretAlertForPasscode_withRecoveryError_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  v3 = *(void **)(a1 + 32);

  return [v3 setLastEntry:0];
}

- (void)disableUserInteractionAndStartSpinner
{
  v3 = [MEMORY[0x263F5FBF8] sharedSpinnerManager];
  int v4 = [(CDPRemoteSecretEntryViewController *)self navigationItem];
  [v3 startAnimatingInNavItem:v4 forIdentifier:@"remoteSecretValidator" hideBackButton:1];

  id v5 = [(CDPRemoteSecretEntryViewController *)self view];
  [v5 setUserInteractionEnabled:0];
}

- (void)enableUserInteractionAndStopSpinner
{
  uint64_t v2 = [(CDPRemoteSecretEntryViewController *)self view];
  [v2 setUserInteractionEnabled:1];

  id v3 = [MEMORY[0x263F5FBF8] sharedSpinnerManager];
  [v3 stopAnimatingForIdentifier:@"remoteSecretValidator"];
}

- (CDPRemoteDeviceSecretValidator)validator
{
  return self->_validator;
}

- (CDPRemoteValidationEscapeOffer)escapeOffer
{
  return self->_escapeOffer;
}

- (void)setEscapeOffer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_escapeOffer, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_validator, 0);
  objc_storeStrong((id *)&self->_remoteRecoveryDevice, 0);

  objc_storeStrong((id *)&self->_numericSecretLength, 0);
}

- (void)validatePIN:(char)a1 .cold.1(char a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1 & 1;
  _os_log_debug_impl(&dword_2187CF000, a2, OS_LOG_TYPE_DEBUG, "validatePIN: Returning isValid=%i", (uint8_t *)v2, 8u);
}

- (void)validatePIN:(uint64_t *)a1 .cold.2(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *a1;
  int v3 = 134217984;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_2187CF000, a2, OS_LOG_TYPE_DEBUG, "Unexpected _validationState=%lu - Returning isValid=YES", (uint8_t *)&v3, 0xCu);
}

- (void)validatePIN:.cold.3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2187CF000, v0, v1, "ValidationStateValid - Returning isValid=YES", v2, v3, v4, v5, v6);
}

- (void)validatePIN:.cold.4()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2187CF000, v0, v1, "ValidationStateInvalid - Returning isValid=NO", v2, v3, v4, v5, v6);
}

- (void)validatePIN:.cold.5()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2187CF000, v0, v1, "ValidationStateWaiting - Returning isValid=YES", v2, v3, v4, v5, v6);
}

- (void)didEnterValidRemoteSecret:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2187CF000, v0, v1, "didEnterValidRemoteSecret: called, sending the delegate remoteSecretEntry:didAcceptValidRemoteSecretForDevice:", v2, v3, v4, v5, v6);
}

void __74__CDPRemoteSecretEntryViewController__handleSecretValidationWithPasscode___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2187CF000, a2, OS_LOG_TYPE_ERROR, "Validator indicated that we can't retry: %@", (uint8_t *)&v2, 0xCu);
}

void __74__CDPRemoteSecretEntryViewController__handleSecretValidationWithPasscode___block_invoke_44_cold_1(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_2187CF000, a2, OS_LOG_TYPE_ERROR, "Default error returned by validator: %@", (uint8_t *)&v3, 0xCu);
}

void __74__CDPRemoteSecretEntryViewController__handleSecretValidationWithPasscode___block_invoke_44_cold_2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4(&dword_2187CF000, v0, v1, "Delegate is nil when trying to performCustodianRecovery", v2, v3, v4, v5, v6);
}

void __74__CDPRemoteSecretEntryViewController__handleSecretValidationWithPasscode___block_invoke_44_cold_3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4(&dword_2187CF000, v0, v1, "Delegate is nil when trying to presentDeviceSelection", v2, v3, v4, v5, v6);
}

void __74__CDPRemoteSecretEntryViewController__handleSecretValidationWithPasscode___block_invoke_44_cold_4()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4(&dword_2187CF000, v0, v1, "Delegate is nil when trying to performPiggybackingFromRemoteSecretEntry", v2, v3, v4, v5, v6);
}

void __74__CDPRemoteSecretEntryViewController__handleSecretValidationWithPasscode___block_invoke_44_cold_5()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4(&dword_2187CF000, v0, v1, "Unexpected error returned by the daemon, dismissing and attempting to cancel validation", v2, v3, v4, v5, v6);
}

@end