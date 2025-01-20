@interface LAPSPasscodeChangeUIAdapter
- (LAPSPasscodeChangeUIAdapter)initWithParentVC:(id)a3;
- (LAPSPasscodeChangeUIAdapter)initWithParentVC:(id)a3 options:(id)a4;
- (LAPSPasscodeChangeUIDelegate)delegate;
- (id)_alertControllerWithTitle:(id)a3 message:(id)a4;
- (id)fetchOldPasscodeViewController:(id)a3 backoffMessageForTimeout:(int64_t)a4;
- (void)_presentPasscodeDoesNotMeetRequirementsError:(id)a3 completion:(id)a4;
- (void)_presentPasscodeIsTooSimpleErrorWithCompletion:(id)a3;
- (void)_presentPasscodesDidNotMatchErrorWithCompletion:(id)a3;
- (void)containerViewControllerViewDidDisappear:(id)a3;
- (void)deactivateWithCompletion:(id)a3;
- (void)fetchNewPasscode:(id)a3 completion:(id)a4;
- (void)fetchNewPasscodeViewController:(id)a3 verifyPasscode:(id)a4;
- (void)fetchNewPasscodeViewController:(id)a3 verifyPasscode:(id)a4 matchesPasscode:(id)a5;
- (void)fetchOldPasscode:(id)a3 completion:(id)a4;
- (void)fetchOldPasscodeViewController:(id)a3 verifyPasscode:(id)a4;
- (void)presentAlertWithTitle:(id)a3 message:(id)a4 button:(id)a5 completion:(id)a6;
- (void)setDelegate:(id)a3;
@end

@implementation LAPSPasscodeChangeUIAdapter

- (LAPSPasscodeChangeUIAdapter)initWithParentVC:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(LAPSPasscodeChangeUIAdapterOptions);
  v6 = [(LAPSPasscodeChangeUIAdapter *)self initWithParentVC:v4 options:v5];

  return v6;
}

- (LAPSPasscodeChangeUIAdapter)initWithParentVC:(id)a3 options:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  v16.receiver = self;
  v16.super_class = (Class)LAPSPasscodeChangeUIAdapter;
  v8 = [(LAPSPasscodeChangeUIAdapter *)&v16 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_options, a4);
    v10 = [LAPSPasscodeChangeUIPresentationController alloc];
    v15 = v9;
    id v11 = objc_alloc_init(MEMORY[0x263F52538]);
    [v11 setDelegate:v15];
    uint64_t v12 = [(LAPSPasscodeChangeUIPresentationController *)v10 initWithParentVC:v6 containerVC:v11];
    presentationController = v15->_presentationController;
    v15->_presentationController = (LAPSPasscodeChangeUIPresentationController *)v12;
  }
  return v9;
}

id __56__LAPSPasscodeChangeUIAdapter_initWithParentVC_options___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x263F52538]);
  [v2 setDelegate:*(void *)(a1 + 32)];

  return v2;
}

- (void)fetchOldPasscode:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  presentationController = self->_presentationController;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __59__LAPSPasscodeChangeUIAdapter_fetchOldPasscode_completion___block_invoke;
  v12[3] = &unk_26506F0A0;
  v12[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  id v11 = __59__LAPSPasscodeChangeUIAdapter_fetchOldPasscode_completion___block_invoke((uint64_t)v12);
  [(LAPSPasscodeChangeUIPresentationController *)presentationController presentVC:v11 animated:0];
}

LAPSFetchOldPasscodeViewController *__59__LAPSPasscodeChangeUIAdapter_fetchOldPasscode_completion___block_invoke(uint64_t a1)
{
  id v2 = [LAPSFetchOldPasscodeViewController alloc];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __59__LAPSPasscodeChangeUIAdapter_fetchOldPasscode_completion___block_invoke_2;
  v9[3] = &unk_26506F050;
  v3 = *(void **)(a1 + 40);
  v9[4] = *(void *)(a1 + 32);
  id v10 = v3;
  id v4 = __59__LAPSPasscodeChangeUIAdapter_fetchOldPasscode_completion___block_invoke_2((uint64_t)v9);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __59__LAPSPasscodeChangeUIAdapter_fetchOldPasscode_completion___block_invoke_3;
  v7[3] = &unk_26506F078;
  id v8 = *(id *)(a1 + 48);
  v5 = [(LAPSFetchOldPasscodeViewController *)v2 initWithInput:v4 completion:v7];

  [(LAPSFetchOldPasscodeViewController *)v5 setDelegate:*(void *)(a1 + 32)];

  return v5;
}

LAPSFetchOldPasscodeViewControllerInput *__59__LAPSPasscodeChangeUIAdapter_fetchOldPasscode_completion___block_invoke_2(uint64_t a1)
{
  id v2 = objc_alloc_init(LAPSFetchOldPasscodeViewControllerInput);
  v3 = [*(id *)(*(void *)(a1 + 32) + 16) title];
  if (v3)
  {
    [(LAPSFetchOldPasscodeViewControllerInput *)v2 setTitle:v3];
  }
  else
  {
    id v4 = +[LALocalizedString passcodeChangeTitle];
    [(LAPSFetchOldPasscodeViewControllerInput *)v2 setTitle:v4];
  }
  v5 = [*(id *)(*(void *)(a1 + 32) + 16) oldPasscodePrompt];
  if (v5)
  {
    [(LAPSFetchOldPasscodeViewControllerInput *)v2 setPrompt:v5];
  }
  else
  {
    id v6 = +[LALocalizedString passcodeChangeOldPasscode];
    [(LAPSFetchOldPasscodeViewControllerInput *)v2 setPrompt:v6];
  }
  id v7 = +[LALocalizedString passcodeChangeNext];
  [(LAPSFetchOldPasscodeViewControllerInput *)v2 setNextButton:v7];

  -[LAPSFetchOldPasscodeViewControllerInput setBackoffTimeout:](v2, "setBackoffTimeout:", [*(id *)(a1 + 40) backoffTimeout]);
  if ([*(id *)(a1 + 40) failedAttempts] >= 1)
  {
    id v8 = +[LALocalizedString passcodeChangeErrorInvalidPasscodeWithFailedAttemptsCount:](LALocalizedString, "passcodeChangeErrorInvalidPasscodeWithFailedAttemptsCount:", [*(id *)(a1 + 40) failedAttempts]);
    [(LAPSFetchOldPasscodeViewControllerInput *)v2 setErrorMessage:v8];
  }
  id v9 = [*(id *)(a1 + 40) passcodeType];
  [(LAPSFetchOldPasscodeViewControllerInput *)v2 setPasscodeType:v9];

  return v2;
}

void __59__LAPSPasscodeChangeUIAdapter_fetchOldPasscode_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  unint64_t v10 = a2;
  unint64_t v5 = a3;
  if (!(v10 | v5)) {
    __59__LAPSPasscodeChangeUIAdapter_fetchOldPasscode_completion___block_invoke_3_cold_1();
  }
  uint64_t v6 = *(void *)(a1 + 32);
  if (v5)
  {
    (*(void (**)(uint64_t, void, unint64_t))(v6 + 16))(v6, 0, v5);
  }
  else
  {
    id v7 = [LAPSFetchOldPasscodeResult alloc];
    id v8 = [(id)v10 passcode];
    id v9 = [(LAPSFetchOldPasscodeResult *)v7 initWithPasscode:v8];
    (*(void (**)(uint64_t, LAPSFetchOldPasscodeResult *, void))(v6 + 16))(v6, v9, 0);
  }
}

- (void)fetchNewPasscode:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  presentationController = self->_presentationController;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __59__LAPSPasscodeChangeUIAdapter_fetchNewPasscode_completion___block_invoke;
  v12[3] = &unk_26506F118;
  v12[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  id v11 = __59__LAPSPasscodeChangeUIAdapter_fetchNewPasscode_completion___block_invoke((uint64_t)v12);
  [(LAPSPasscodeChangeUIPresentationController *)presentationController presentVC:v11 animated:1];
}

LAPSFetchNewPasscodeViewController *__59__LAPSPasscodeChangeUIAdapter_fetchNewPasscode_completion___block_invoke(uint64_t a1)
{
  id v2 = [LAPSFetchNewPasscodeViewController alloc];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __59__LAPSPasscodeChangeUIAdapter_fetchNewPasscode_completion___block_invoke_2;
  v9[3] = &unk_26506F0C8;
  v3 = *(void **)(a1 + 40);
  v9[4] = *(void *)(a1 + 32);
  id v10 = v3;
  id v4 = __59__LAPSPasscodeChangeUIAdapter_fetchNewPasscode_completion___block_invoke_2((uint64_t)v9);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __59__LAPSPasscodeChangeUIAdapter_fetchNewPasscode_completion___block_invoke_3;
  v7[3] = &unk_26506F0F0;
  id v8 = *(id *)(a1 + 48);
  unint64_t v5 = [(LAPSFetchNewPasscodeViewController *)v2 initWithInput:v4 completion:v7];

  [(LAPSFetchNewPasscodeViewController *)v5 setDelegate:*(void *)(a1 + 32)];

  return v5;
}

LAPSFetchNewPasscodeViewControllerInput *__59__LAPSPasscodeChangeUIAdapter_fetchNewPasscode_completion___block_invoke_2(uint64_t a1)
{
  id v2 = objc_alloc_init(LAPSFetchNewPasscodeViewControllerInput);
  v3 = [*(id *)(*(void *)(a1 + 32) + 16) title];
  if (v3)
  {
    [(LAPSFetchNewPasscodeViewControllerInput *)v2 setTitle:v3];
  }
  else
  {
    id v4 = +[LALocalizedString passcodeChangeTitle];
    [(LAPSFetchNewPasscodeViewControllerInput *)v2 setTitle:v4];
  }
  unint64_t v5 = +[LALocalizedString cancel];
  [(LAPSFetchNewPasscodeViewControllerInput *)v2 setPasscodeOptionsCancelTitle:v5];

  id v6 = [*(id *)(*(void *)(a1 + 32) + 16) passcodePrompt];
  if (v6)
  {
    [(LAPSFetchNewPasscodeViewControllerInput *)v2 setPrompt:v6];
  }
  else
  {
    id v7 = +[LALocalizedString passcodeChangeNewPasscode];
    [(LAPSFetchNewPasscodeViewControllerInput *)v2 setPrompt:v7];
  }
  id v8 = +[LALocalizedString passcodeRecoveryRecoveryEnabled];
  [(LAPSFetchNewPasscodeViewControllerInput *)v2 setFooterRecoveryEnabled:v8];

  id v9 = +[LALocalizedString passcodeRecoveryRecoveryDisabled];
  [(LAPSFetchNewPasscodeViewControllerInput *)v2 setFooterRecoveryDisabled:v9];

  id v10 = +[LALocalizedString passcodeChangeNext];
  [(LAPSFetchNewPasscodeViewControllerInput *)v2 setNextButton:v10];

  id v11 = [*(id *)(a1 + 40) passcodeType];
  [(LAPSFetchNewPasscodeViewControllerInput *)v2 setPasscodeType:v11];

  uint64_t v12 = +[LALocalizedString passcodeChangeOptions];
  [(LAPSFetchNewPasscodeViewControllerInput *)v2 setPasscodeOptionsTitle:v12];

  id v13 = +[LALocalizedString passcodeRecoveryTitle];
  [(LAPSFetchNewPasscodeViewControllerInput *)v2 setPasscodeRecoveryTitle:v13];

  id v14 = +[LALocalizedString passcodeRecoveryEnabledTitle];
  [(LAPSFetchNewPasscodeViewControllerInput *)v2 setPasscodeRecoveryEnabledTitle:v14];

  v15 = +[LALocalizedString passcodeRecoveryDisabledTitle];
  [(LAPSFetchNewPasscodeViewControllerInput *)v2 setPasscodeRecoveryDisabledTitle:v15];

  objc_super v16 = [*(id *)(a1 + 40) allowedPasscodeTypes];
  [(LAPSFetchNewPasscodeViewControllerInput *)v2 setAllowedPasscodeTypes:v16];

  -[LAPSFetchNewPasscodeViewControllerInput setIsPasscodeRecoveryOptionVisible:](v2, "setIsPasscodeRecoveryOptionVisible:", [*(id *)(*(void *)(a1 + 32) + 16) isPasscodeRecoveryOptionVisible]);
  -[LAPSFetchNewPasscodeViewControllerInput setIsPasscodeRecoveryMessageHidden:](v2, "setIsPasscodeRecoveryMessageHidden:", [*(id *)(*(void *)(a1 + 32) + 16) isPasscodeRecoveryMessageHidden]);
  -[LAPSFetchNewPasscodeViewControllerInput setIsPasscodeRecoverySupported:](v2, "setIsPasscodeRecoverySupported:", [*(id *)(a1 + 40) isPasscodeRecoverySupported]);
  -[LAPSFetchNewPasscodeViewControllerInput setIsPasscodeRecoveryRestricted:](v2, "setIsPasscodeRecoveryRestricted:", [*(id *)(a1 + 40) isPasscodeRecoveryRestricted]);
  -[LAPSFetchNewPasscodeViewControllerInput setIsPasscodeRecoveryEnabled:](v2, "setIsPasscodeRecoveryEnabled:", [*(id *)(a1 + 40) isPasscodeRecoveryEnabled]);
  v17 = +[LALocalizedString passcodeChangeNewPasscodeVerify];
  [(LAPSFetchNewPasscodeViewControllerInput *)v2 setVerifyPrompt:v17];

  v18 = +[LALocalizedString passcodeChangeDone];
  [(LAPSFetchNewPasscodeViewControllerInput *)v2 setVerifyNextButton:v18];

  return v2;
}

void __59__LAPSPasscodeChangeUIAdapter_fetchNewPasscode_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  unint64_t v10 = a2;
  unint64_t v5 = a3;
  if (!(v10 | v5)) {
    __59__LAPSPasscodeChangeUIAdapter_fetchNewPasscode_completion___block_invoke_3_cold_1();
  }
  uint64_t v6 = *(void *)(a1 + 32);
  if (v5)
  {
    (*(void (**)(uint64_t, void, unint64_t))(v6 + 16))(v6, 0, v5);
  }
  else
  {
    id v7 = [LAPSFetchNewPasscodeResult alloc];
    id v8 = [(id)v10 passcode];
    id v9 = -[LAPSFetchNewPasscodeResult initWithPasscode:isPasscodeRecoveryEnabled:](v7, "initWithPasscode:isPasscodeRecoveryEnabled:", v8, [(id)v10 isPasscodeRecoveryEnabled]);
    (*(void (**)(uint64_t, LAPSFetchNewPasscodeResult *, void))(v6 + 16))(v6, v9, 0);
  }
}

- (void)deactivateWithCompletion:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  [(LAPSPasscodeChangeUIPresentationController *)self->_presentationController dismissWithCompletion:v4];
}

- (void)presentAlertWithTitle:(id)a3 message:(id)a4 button:(id)a5 completion:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  id v14 = [(LAPSPasscodeChangeUIAdapter *)self _alertControllerWithTitle:v13 message:v12];

  v15 = (void *)MEMORY[0x263F82400];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __79__LAPSPasscodeChangeUIAdapter_presentAlertWithTitle_message_button_completion___block_invoke;
  v18[3] = &unk_26506F140;
  id v19 = v10;
  id v16 = v10;
  v17 = [v15 actionWithTitle:v11 style:1 handler:v18];

  [v14 addAction:v17];
  [(LAPSPasscodeChangeUIPresentationController *)self->_presentationController presentAlertVC:v14];
}

uint64_t __79__LAPSPasscodeChangeUIAdapter_presentAlertWithTitle_message_button_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchOldPasscodeViewController:(id)a3 verifyPasscode:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(LAPSPasscodeChangeUIAdapter *)self delegate];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __77__LAPSPasscodeChangeUIAdapter_fetchOldPasscodeViewController_verifyPasscode___block_invoke;
  v11[3] = &unk_26506F190;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [v8 passcodeChangeUI:self verifyPasscode:v9 completion:v11];
}

void __77__LAPSPasscodeChangeUIAdapter_fetchOldPasscodeViewController_verifyPasscode___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  if (!v3)
  {
    [*(id *)(a1 + 32) finishWithPasscode:*(void *)(a1 + 40)];
    goto LABEL_16;
  }
  id v4 = [v3 domain];
  if (![v4 isEqualToString:@"com.apple.LocalAuthentication.LAPSErrorDomain"])
  {

    goto LABEL_13;
  }
  uint64_t v5 = [v3 code];

  if (v5 != 4)
  {
LABEL_13:
    [*(id *)(a1 + 32) finishWithError:v3];
    goto LABEL_16;
  }
  id v6 = [v3 userInfo];
  id v7 = [v6 objectForKeyedSubscript:@"LAPSFailedAttemptsErrorKey"];
  id v8 = v7;
  if (!v7) {
    id v7 = &unk_26F32BBA8;
  }
  uint64_t v9 = [v7 integerValue];

  id v10 = [v3 userInfo];
  uint64_t v11 = [v10 objectForKeyedSubscript:@"LAPSBackOffTimeoutErrorKey"];
  id v12 = (void *)v11;
  if (v11) {
    id v13 = (void *)v11;
  }
  else {
    id v13 = &unk_26F32BBA8;
  }
  id v14 = v13;

  if (v9 < 1)
  {
    v15 = &stru_26F31E768;
  }
  else
  {
    v15 = +[LALocalizedString passcodeChangeErrorInvalidPasscodeWithFailedAttemptsCount:v9];
  }
  id v16 = *(void **)(a1 + 32);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __77__LAPSPasscodeChangeUIAdapter_fetchOldPasscodeViewController_verifyPasscode___block_invoke_22;
  v18[3] = &unk_26506F168;
  id v19 = v14;
  id v20 = v16;
  id v17 = v14;
  [v16 showPasscodeValidationError:v15 completion:v18];

LABEL_16:
}

uint64_t __77__LAPSPasscodeChangeUIAdapter_fetchOldPasscodeViewController_verifyPasscode___block_invoke_22(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) integerValue];
  if (result >= 1)
  {
    id v3 = *(void **)(a1 + 40);
    uint64_t v4 = [*(id *)(a1 + 32) integerValue];
    return [v3 startBackoffWithTimeout:v4];
  }
  return result;
}

- (id)fetchOldPasscodeViewController:(id)a3 backoffMessageForTimeout:(int64_t)a4
{
  uint64_t v4 = [NSNumber numberWithInteger:vcvtpd_s64_f64((double)a4 / 60.0)];
  uint64_t v5 = [v4 integerValue];

  if (v5 <= 1) {
    uint64_t v6 = 1;
  }
  else {
    uint64_t v6 = v5;
  }

  return +[LALocalizedString passcodeChangeBackoffMessage:v6];
}

- (void)fetchNewPasscodeViewController:(id)a3 verifyPasscode:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  id v8 = [(LAPSPasscodeChangeUIAdapter *)self delegate];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __77__LAPSPasscodeChangeUIAdapter_fetchNewPasscodeViewController_verifyPasscode___block_invoke;
  v11[3] = &unk_26506F1E0;
  objc_copyWeak(&v14, &location);
  id v9 = v6;
  id v12 = v9;
  id v10 = v7;
  id v13 = v10;
  [v8 passcodeChangeUI:self verifyNewPasscode:v10 completion:v11];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __77__LAPSPasscodeChangeUIAdapter_fetchNewPasscodeViewController_verifyPasscode___block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (WeakRetained)
  {
    if (!v3)
    {
      [a1[4] continueWithPasscode:a1[5]];
      goto LABEL_15;
    }
    uint64_t v5 = [v3 domain];
    if ([v5 isEqualToString:@"com.apple.LocalAuthentication.LAPSErrorDomain"])
    {
      uint64_t v6 = [v3 code];

      if (v6 == 9) {
        goto LABEL_14;
      }
      id v7 = [v3 domain];
      if ([v7 isEqualToString:@"com.apple.LocalAuthentication.LAPSErrorDomain"])
      {
        uint64_t v8 = [v3 code];

        if (v8 == 6)
        {
          v14[0] = MEMORY[0x263EF8330];
          v14[1] = 3221225472;
          v14[2] = __77__LAPSPasscodeChangeUIAdapter_fetchNewPasscodeViewController_verifyPasscode___block_invoke_2;
          v14[3] = &unk_26506E980;
          id v15 = a1[4];
          [WeakRetained _presentPasscodeDoesNotMeetRequirementsError:v3 completion:v14];

          goto LABEL_15;
        }
      }
      else
      {
      }
      uint64_t v5 = [v3 domain];
      if ([v5 isEqualToString:@"com.apple.LocalAuthentication.LAPSErrorDomain"])
      {
        uint64_t v9 = [v3 code];

        if (v9 == 5)
        {
          v10[0] = MEMORY[0x263EF8330];
          v10[1] = 3221225472;
          v10[2] = __77__LAPSPasscodeChangeUIAdapter_fetchNewPasscodeViewController_verifyPasscode___block_invoke_3;
          v10[3] = &unk_26506F1B8;
          objc_copyWeak(&v13, a1 + 6);
          id v11 = a1[4];
          id v12 = a1[5];
          [WeakRetained _presentPasscodeIsTooSimpleErrorWithCompletion:v10];

          objc_destroyWeak(&v13);
          goto LABEL_15;
        }
LABEL_14:
        [a1[4] finishWithError:v3];
        goto LABEL_15;
      }
    }

    goto LABEL_14;
  }
LABEL_15:
}

uint64_t __77__LAPSPasscodeChangeUIAdapter_fetchNewPasscodeViewController_verifyPasscode___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) clear];
}

void __77__LAPSPasscodeChangeUIAdapter_fetchNewPasscodeViewController_verifyPasscode___block_invoke_3(uint64_t a1, char a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v6 = WeakRetained;
    uint64_t v5 = *(void **)(a1 + 32);
    if (a2) {
      [v5 continueWithPasscode:*(void *)(a1 + 40)];
    }
    else {
      [v5 clear];
    }
    id WeakRetained = v6;
  }
}

- (void)fetchNewPasscodeViewController:(id)a3 verifyPasscode:(id)a4 matchesPasscode:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  if ([v9 isEqual:a5])
  {
    [v8 finishWithPasscode:v9];
  }
  else
  {
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __93__LAPSPasscodeChangeUIAdapter_fetchNewPasscodeViewController_verifyPasscode_matchesPasscode___block_invoke;
    v10[3] = &unk_26506E980;
    id v11 = v8;
    [(LAPSPasscodeChangeUIAdapter *)self _presentPasscodesDidNotMatchErrorWithCompletion:v10];
  }
}

uint64_t __93__LAPSPasscodeChangeUIAdapter_fetchNewPasscodeViewController_verifyPasscode_matchesPasscode___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) restart];
}

- (void)containerViewControllerViewDidDisappear:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = LACLogPasscodeService();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138543362;
    id v8 = v4;
    _os_log_impl(&dword_23F450000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ did disappear", (uint8_t *)&v7, 0xCu);
  }

  id v6 = [(LAPSPasscodeChangeUIAdapter *)self delegate];
  [v6 passcodeChangeUIDidDisappear:self];
}

- (void)_presentPasscodeIsTooSimpleErrorWithCompletion:(id)a3
{
  id v4 = a3;
  presentationController = self->_presentationController;
  uint64_t v8 = MEMORY[0x263EF8330];
  uint64_t v9 = 3221225472;
  id v10 = __78__LAPSPasscodeChangeUIAdapter__presentPasscodeIsTooSimpleErrorWithCompletion___block_invoke;
  id v11 = &unk_26506F208;
  id v12 = self;
  id v13 = v4;
  id v6 = v4;
  int v7 = __78__LAPSPasscodeChangeUIAdapter__presentPasscodeIsTooSimpleErrorWithCompletion___block_invoke((uint64_t)&v8);
  -[LAPSPasscodeChangeUIPresentationController presentAlertVC:](presentationController, "presentAlertVC:", v7, v8, v9, v10, v11, v12);
}

id __78__LAPSPasscodeChangeUIAdapter__presentPasscodeIsTooSimpleErrorWithCompletion___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = +[LALocalizedString passcodeChangeErrorPasscodeIsTooEasyTitle];
  id v4 = +[LALocalizedString passcodeChangeErrorPasscodeIsTooEasyText];
  uint64_t v5 = [v2 _alertControllerWithTitle:v3 message:v4];

  id v6 = (void *)MEMORY[0x263F82400];
  int v7 = +[LALocalizedString passcodeChangeUseAnyway];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __78__LAPSPasscodeChangeUIAdapter__presentPasscodeIsTooSimpleErrorWithCompletion___block_invoke_2;
  v18[3] = &unk_26506F140;
  id v19 = *(id *)(a1 + 40);
  uint64_t v8 = [v6 actionWithTitle:v7 style:0 handler:v18];
  [v5 addAction:v8];

  uint64_t v9 = (void *)MEMORY[0x263F82400];
  id v10 = +[LALocalizedString passcodeChangeUseDifferentPasscode];
  uint64_t v13 = MEMORY[0x263EF8330];
  uint64_t v14 = 3221225472;
  id v15 = __78__LAPSPasscodeChangeUIAdapter__presentPasscodeIsTooSimpleErrorWithCompletion___block_invoke_3;
  id v16 = &unk_26506F140;
  id v17 = *(id *)(a1 + 40);
  id v11 = [v9 actionWithTitle:v10 style:1 handler:&v13];
  objc_msgSend(v5, "addAction:", v11, v13, v14, v15, v16);

  return v5;
}

uint64_t __78__LAPSPasscodeChangeUIAdapter__presentPasscodeIsTooSimpleErrorWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __78__LAPSPasscodeChangeUIAdapter__presentPasscodeIsTooSimpleErrorWithCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_presentPasscodeDoesNotMeetRequirementsError:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  presentationController = self->_presentationController;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __87__LAPSPasscodeChangeUIAdapter__presentPasscodeDoesNotMeetRequirementsError_completion___block_invoke;
  v12[3] = &unk_26506F230;
  id v13 = v6;
  uint64_t v14 = self;
  id v15 = v7;
  id v9 = v7;
  id v10 = v6;
  id v11 = __87__LAPSPasscodeChangeUIAdapter__presentPasscodeDoesNotMeetRequirementsError_completion___block_invoke((uint64_t)v12);
  [(LAPSPasscodeChangeUIPresentationController *)presentationController presentAlertVC:v11];
}

id __87__LAPSPasscodeChangeUIAdapter__presentPasscodeDoesNotMeetRequirementsError_completion___block_invoke(uint64_t a1)
{
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __87__LAPSPasscodeChangeUIAdapter__presentPasscodeDoesNotMeetRequirementsError_completion___block_invoke_2;
  v16[3] = &unk_26506E808;
  id v17 = *(id *)(a1 + 32);
  id v2 = __87__LAPSPasscodeChangeUIAdapter__presentPasscodeDoesNotMeetRequirementsError_completion___block_invoke_2((uint64_t)v16);
  id v3 = *(void **)(a1 + 40);
  id v4 = +[LALocalizedString passcodeChangeErrorPasscodeDoesNotMeetRequirementsTitle];
  if (v2)
  {
    uint64_t v5 = [v3 _alertControllerWithTitle:v4 message:v2];
  }
  else
  {
    id v6 = +[LALocalizedString passcodeChangeErrorPasscodeDoesNotMeetRequirementsText];
    uint64_t v5 = [v3 _alertControllerWithTitle:v4 message:v6];
  }
  id v7 = (void *)MEMORY[0x263F82400];
  uint64_t v8 = +[LALocalizedString passcodeChangeUseDifferentPasscode];
  uint64_t v11 = MEMORY[0x263EF8330];
  uint64_t v12 = 3221225472;
  id v13 = __87__LAPSPasscodeChangeUIAdapter__presentPasscodeDoesNotMeetRequirementsError_completion___block_invoke_3;
  uint64_t v14 = &unk_26506F140;
  id v15 = *(id *)(a1 + 48);
  id v9 = [v7 actionWithTitle:v8 style:0 handler:&v11];
  objc_msgSend(v5, "addAction:", v9, v11, v12, v13, v14);

  return v5;
}

id __87__LAPSPasscodeChangeUIAdapter__presentPasscodeDoesNotMeetRequirementsError_completion___block_invoke_2(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) userInfo];
  id v2 = [v1 objectForKeyedSubscript:*MEMORY[0x263F08320]];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = v2;
    if ([v3 length]) {
      id v4 = v3;
    }
    else {
      id v4 = 0;
    }
    id v5 = v4;
  }
  else
  {
    id v3 = 0;
    id v5 = 0;
  }

  return v5;
}

uint64_t __87__LAPSPasscodeChangeUIAdapter__presentPasscodeDoesNotMeetRequirementsError_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_presentPasscodesDidNotMatchErrorWithCompletion:(id)a3
{
  id v4 = a3;
  presentationController = self->_presentationController;
  uint64_t v8 = MEMORY[0x263EF8330];
  uint64_t v9 = 3221225472;
  id v10 = __79__LAPSPasscodeChangeUIAdapter__presentPasscodesDidNotMatchErrorWithCompletion___block_invoke;
  uint64_t v11 = &unk_26506F208;
  uint64_t v12 = self;
  id v13 = v4;
  id v6 = v4;
  id v7 = __79__LAPSPasscodeChangeUIAdapter__presentPasscodesDidNotMatchErrorWithCompletion___block_invoke((uint64_t)&v8);
  -[LAPSPasscodeChangeUIPresentationController presentAlertVC:](presentationController, "presentAlertVC:", v7, v8, v9, v10, v11, v12);
}

id __79__LAPSPasscodeChangeUIAdapter__presentPasscodesDidNotMatchErrorWithCompletion___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = +[LALocalizedString passcodeChangeErrorNewPasscodeMismatchTitle];
  id v4 = +[LALocalizedString passcodeChangeErrorNewPasscodeMismatchText];
  id v5 = [v2 _alertControllerWithTitle:v3 message:v4];

  id v6 = (void *)MEMORY[0x263F82400];
  id v7 = +[LALocalizedString tryAgain];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __79__LAPSPasscodeChangeUIAdapter__presentPasscodesDidNotMatchErrorWithCompletion___block_invoke_2;
  v10[3] = &unk_26506F140;
  id v11 = *(id *)(a1 + 40);
  uint64_t v8 = [v6 actionWithTitle:v7 style:0 handler:v10];
  [v5 addAction:v8];

  return v5;
}

uint64_t __79__LAPSPasscodeChangeUIAdapter__presentPasscodesDidNotMatchErrorWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)_alertControllerWithTitle:(id)a3 message:(id)a4
{
  return (id)[MEMORY[0x263F82418] alertControllerWithTitle:a3 message:a4 preferredStyle:1];
}

- (LAPSPasscodeChangeUIDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->delegate);

  return (LAPSPasscodeChangeUIDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->delegate);
  objc_storeStrong((id *)&self->_options, 0);

  objc_storeStrong((id *)&self->_presentationController, 0);
}

void __59__LAPSPasscodeChangeUIAdapter_fetchOldPasscode_completion___block_invoke_3_cold_1()
{
  __assert_rtn("-[LAPSPasscodeChangeUIAdapter fetchOldPasscode:completion:]_block_invoke_3", "LAPSPasscodeChangeUIAdapter.m", 70, "output != nil || error != nil");
}

void __59__LAPSPasscodeChangeUIAdapter_fetchNewPasscode_completion___block_invoke_3_cold_1()
{
  __assert_rtn("-[LAPSPasscodeChangeUIAdapter fetchNewPasscode:completion:]_block_invoke_3", "LAPSPasscodeChangeUIAdapter.m", 113, "output != nil || error != nil");
}

@end