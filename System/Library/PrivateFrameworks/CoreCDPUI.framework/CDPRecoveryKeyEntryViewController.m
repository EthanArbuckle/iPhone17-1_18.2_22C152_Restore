@interface CDPRecoveryKeyEntryViewController
- (BOOL)hasText;
- (BOOL)shouldReloadSpecifiersOnResume;
- (CDPRecoveryKeyEntryViewController)initWithRecoveryContext:(id)a3 cdpContext:(id)a4;
- (id)_addEscapeOption:(id)a3 forEvent:(id)a4;
- (id)_makeEventWithName:(id)a3;
- (id)footerActionButton;
- (id)footerTextLabel;
- (id)headerView;
- (id)placeholderText;
- (id)specifiers;
- (id)textEntryCell;
- (void)_handleRecoveryKeyValidationWithSuccess:(BOOL)a3 error:(id)a4;
- (void)cancelFlow:(id)a3;
- (void)dealloc;
- (void)deleteBackward;
- (void)didFinishEnteringText:(id)a3;
- (void)didTapScanText;
- (void)didTapUseKeyboard:(id)a3;
- (void)disableUserInteractionAndStartSpinner;
- (void)enableUserInteractionAndStopSpinner;
- (void)handleForgotRecoveryKey:(id)a3;
- (void)handleRecoveryKeyEscapeDuringDataRecoveryFlow:(id)a3;
- (void)insertText:(id)a3;
- (void)keyboardCameraSessionDidDismiss:(id)a3;
- (void)skipRecoveryKeyDuringPasswordResetFlow:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation CDPRecoveryKeyEntryViewController

- (CDPRecoveryKeyEntryViewController)initWithRecoveryContext:(id)a3 cdpContext:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CDPRecoveryKeyEntryViewController;
  v9 = [(PSKeychainSyncSecurityCodeController *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_context, a3);
    objc_storeStrong((id *)&v10->_cdpContext, a4);
    [(PSKeychainSyncSecurityCodeController *)v10 setSecurityCodeType:2];
    -[PSKeychainSyncSecurityCodeController setMode:](v10, "setMode:", [v7 mode]);
  }
  v10->_keyboardIsVisible = 1;

  return v10;
}

- (BOOL)shouldReloadSpecifiersOnResume
{
  return 0;
}

- (void)viewDidLoad
{
  v12.receiver = self;
  v12.super_class = (Class)CDPRecoveryKeyEntryViewController;
  [(PSKeychainSyncSecurityCodeController *)&v12 viewDidLoad];
  v3 = [(CDPRecoveryKeyEntryViewController *)self table];
  v4 = [MEMORY[0x263F825C8] _systemBackgroundColor];
  [v3 setBackgroundColor:v4];

  v5 = [(CDPRecoveryKeyEntryViewController *)self table];
  [v5 setBounces:0];

  if ([(PSKeychainSyncSecurityCodeController *)self mode] == 1)
  {
    v6 = [(CDPRecoveryKeyEntryViewController *)self navigationItem];
    [v6 setRightBarButtonItem:0];
  }
  else
  {
    if ([(CDPRecoveryKeyEntryViewModel *)self->_context shouldSuppressCancelButton])
    {
      id v7 = [(CDPRecoveryKeyEntryViewController *)self navigationItem];
      [v7 setLeftBarButtonItem:0];
    }
    else
    {
      id v7 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:1 target:self action:sel_cancelFlow_];
      id v8 = [(CDPRecoveryKeyEntryViewController *)self navigationItem];
      [v8 setLeftBarButtonItem:v7];
    }
    v6 = [(CDPRecoveryKeyEntryViewController *)self table];
    [v6 setSeparatorStyle:1];
  }

  v9 = [MEMORY[0x263F08A00] defaultCenter];
  [v9 addObserver:self selector:sel_keyboardCameraSessionDidDismiss_ name:@"_UIKeyboardCameraSessionDidDismiss" object:0];

  v10 = [(CDPRecoveryKeyEntryViewController *)self _makeEventWithName:*MEMORY[0x263F346B8]];
  v11 = [MEMORY[0x263F34338] rtcAnalyticsReporter];
  [v11 sendEvent:v10];
}

- (id)_makeEventWithName:(id)a3
{
  v3 = (void *)MEMORY[0x263F202A8];
  context = self->_context;
  id v5 = a3;
  v6 = [(CDPRecoveryKeyEntryViewModel *)context context];
  id v7 = [v3 analyticsEventWithContext:v6 eventName:v5 category:*MEMORY[0x263F34830]];

  return v7;
}

- (void)viewWillAppear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CDPRecoveryKeyEntryViewController;
  [(PSKeychainSyncSecurityCodeController *)&v7 viewWillAppear:a3];
  [(PSKeychainSyncTextEntryController *)self setSecureTextEntry:0];
  if ([(PSKeychainSyncSecurityCodeController *)self mode] == 1)
  {
    recoveryCode = self->_recoveryCode;
    if (!recoveryCode)
    {
      id v5 = [(CDPRecoveryKeyEntryViewModel *)self->_context recoveryKey];
      v6 = self->_recoveryCode;
      self->_recoveryCode = v5;

      recoveryCode = self->_recoveryCode;
    }
    [(PSKeychainSyncTextEntryController *)self setTextEntryText:recoveryCode];
  }
}

- (void)keyboardCameraSessionDidDismiss:(id)a3
{
  v4 = _CDPLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[CDPRecoveryKeyEntryViewController keyboardCameraSessionDidDismiss:]();
  }

  [(CDPRecoveryKeyEntryViewController *)self didTapUseKeyboard:0];
  id v5 = [(CDPRecoveryKeyEntryViewController *)self view];
  [v5 setNeedsLayout];
}

- (id)specifiers
{
  v24.receiver = self;
  v24.super_class = (Class)CDPRecoveryKeyEntryViewController;
  v3 = [(PSKeychainSyncSecurityCodeController *)&v24 specifiers];
  if ([(CDPRecoveryKeyEntryViewModel *)self->_context isFooterForVerifyFlow]
    || [(CDPRecoveryKeyEntryViewModel *)self->_context isFooterForMismatchRepairFlow]
    || [(PSKeychainSyncSecurityCodeController *)self mode] == 2)
  {
    v4 = [MEMORY[0x263F824E8] buttonWithType:0];
    enterRecoveryKeyButton = self->_enterRecoveryKeyButton;
    self->_enterRecoveryKeyButton = v4;

    v6 = [(CDPRecoveryKeyEntryViewController *)self table];
    [v6 addSubview:self->_enterRecoveryKeyButton];
  }
  objc_super v7 = [(PSKeychainSyncViewController *)self groupSpecifier];
  [v7 removePropertyForKey:*MEMORY[0x263F600F8]];

  id v8 = [(CDPRecoveryKeyEntryViewModel *)self->_context footerLabelText];
  if (v8)
  {

LABEL_9:
    v9 = _CDPLogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v23 = 0;
      _os_log_impl(&dword_2187CF000, v9, OS_LOG_TYPE_DEFAULT, "Should show footer button", v23, 2u);
    }

    v10 = [(CDPRecoveryKeyEntryViewController *)self footerActionButton];
    [v10 setAlpha:1.0];

    v11 = [(CDPRecoveryKeyEntryViewController *)self footerActionButton];
    [v11 removeTarget:self action:0 forControlEvents:64];

    if ([(CDPRecoveryKeyEntryViewModel *)self->_context supportsRKRecovery])
    {
      objc_super v12 = _CDPLogSystem();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v23 = 0;
        _os_log_impl(&dword_2187CF000, v12, OS_LOG_TYPE_DEFAULT, "Context supports RK recovery", v23, 2u);
      }

      v13 = [(CDPRecoveryKeyEntryViewController *)self footerActionButton];
      v14 = v13;
      v15 = sel_skipRecoveryKeyDuringPasswordResetFlow_;
    }
    else if ([(CDPRecoveryKeyEntryViewModel *)self->_context isFooterForVerifyFlow])
    {
      v16 = _CDPLogSystem();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v23 = 0;
        _os_log_impl(&dword_2187CF000, v16, OS_LOG_TYPE_DEFAULT, "Context is footer button for verify flow", v23, 2u);
      }

      v13 = [(CDPRecoveryKeyEntryViewController *)self footerActionButton];
      v14 = v13;
      v15 = sel_handleForgotRecoveryKey_;
    }
    else
    {
      BOOL v17 = [(CDPRecoveryKeyEntryViewModel *)self->_context isDataRecoveryFlow];
      v18 = _CDPLogSystem();
      BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
      if (v17)
      {
        if (v19)
        {
          *(_WORD *)v23 = 0;
          _os_log_impl(&dword_2187CF000, v18, OS_LOG_TYPE_DEFAULT, "Context is data recovery flow", v23, 2u);
        }

        v13 = [(CDPRecoveryKeyEntryViewController *)self footerActionButton];
        v14 = v13;
        v15 = sel_handleRecoveryKeyEscapeDuringDataRecoveryFlow_;
      }
      else
      {
        if (v19)
        {
          *(_WORD *)v23 = 0;
          _os_log_impl(&dword_2187CF000, v18, OS_LOG_TYPE_DEFAULT, "Showing footer button for some other reason", v23, 2u);
        }

        v13 = [(CDPRecoveryKeyEntryViewController *)self footerActionButton];
        v14 = v13;
        v15 = sel_continueFlow_;
      }
    }
    [v13 addTarget:self action:v15 forEvents:64];
    goto LABEL_27;
  }
  if ([(CDPRecoveryKeyEntryViewModel *)self->_context isFooterForVerifyFlow]
    || [(CDPRecoveryKeyEntryViewModel *)self->_context isDataRecoveryFlow])
  {
    goto LABEL_9;
  }
  v22 = _CDPLogSystem();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v23 = 0;
    _os_log_impl(&dword_2187CF000, v22, OS_LOG_TYPE_DEFAULT, "Should not show footer button.", v23, 2u);
  }

  v14 = [(CDPRecoveryKeyEntryViewController *)self footerActionButton];
  [v14 setAlpha:0.0];
LABEL_27:

  v20 = [(CDPRecoveryKeyEntryViewController *)self navigationItem];
  [v20 setTitle:0];

  return v3;
}

- (void)viewWillLayoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)CDPRecoveryKeyEntryViewController;
  [(CDPRecoveryKeyEntryViewController *)&v13 viewWillLayoutSubviews];
  v3 = [(CDPRecoveryKeyEntryViewModel *)self->_context footerLabelText];
  if (v3)
  {
    v4 = [(CDPRecoveryKeyEntryViewController *)self footerTextLabel];
    [v4 setTextAlignment:1];

    id v5 = [(CDPRecoveryKeyEntryViewController *)self footerTextLabel];
    [v5 setAlpha:1.0];

    v6 = [(CDPRecoveryKeyEntryViewController *)self footerTextLabel];
    objc_super v7 = (void *)MEMORY[0x263F81708];
    uint64_t v8 = *MEMORY[0x263F83570];
    v9 = [MEMORY[0x263F82B60] mainScreen];
    v10 = [v9 traitCollection];
    v11 = [v7 preferredFontForTextStyle:v8 compatibleWithTraitCollection:v10];
    [v6 setFont:v11];

    objc_super v12 = [(CDPRecoveryKeyEntryViewController *)self footerTextLabel];
    [v12 setText:v3];
  }
}

- (void)viewDidLayoutSubviews
{
  v61.receiver = self;
  v61.super_class = (Class)CDPRecoveryKeyEntryViewController;
  [(PSKeychainSyncSecurityCodeController *)&v61 viewDidLayoutSubviews];
  v3 = [(CDPRecoveryKeyEntryViewController *)self table];
  [v3 bounds];
  CGFloat v58 = v5;
  CGFloat v59 = v4;
  double v7 = v6;
  CGFloat rect = v8;

  v9 = [(CDPRecoveryKeyEntryViewModel *)self->_context footerLabelText];
  v10 = [(CDPRecoveryKeyEntryViewController *)self footerTextLabel];
  v11 = v10;
  if (v9)
  {
    [v10 frame];
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;

    v18 = [(CDPRecoveryKeyEntryViewController *)self textEntryCell];
    [v18 frame];
    CGFloat v19 = CGRectGetMaxY(v62) + 36.0;

    v11 = [(CDPRecoveryKeyEntryViewController *)self footerTextLabel];
    objc_msgSend(v11, "setFrame:", v13, v19, v15, v17);
  }
  else
  {
    [v10 setAlpha:0.0];
  }

  [(UIButton *)self->_enterRecoveryKeyButton removeTarget:self action:0 forControlEvents:64];
  if (self->_keyboardIsVisible) {
    v20 = @"RECOVERY_KEY_ENTRY_SCAN_TEXT";
  }
  else {
    v20 = @"CODE_ENTRY_USE_KEYBOARD";
  }
  if (self->_keyboardIsVisible) {
    v21 = @"text.viewfinder";
  }
  else {
    v21 = @"keyboard";
  }
  if (self->_keyboardIsVisible) {
    v22 = &selRef_didTapScanText;
  }
  else {
    v22 = &selRef_didTapUseKeyboard_;
  }
  v23 = [MEMORY[0x263F343B8] builderForKey:v20];
  objc_super v24 = [v23 localizedString];

  [(UIButton *)self->_enterRecoveryKeyButton addTarget:self action:*v22 forEvents:64];
  v25 = [MEMORY[0x263F824F0] plainButtonConfiguration];
  v26 = [MEMORY[0x263F827E8] systemImageNamed:v21];
  [v25 setImage:v26];

  [v25 setImagePadding:3.0];
  v27 = [MEMORY[0x263F82818] configurationWithPointSize:14.0];
  [v25 setPreferredSymbolConfigurationForImage:v27];

  [(UIButton *)self->_enterRecoveryKeyButton setConfiguration:v25];
  [(UIButton *)self->_enterRecoveryKeyButton setTitle:v24 forState:0];
  [(UIButton *)self->_enterRecoveryKeyButton sizeToFit];
  [(UIButton *)self->_enterRecoveryKeyButton frame];
  double v29 = v28;
  double v31 = v30 + 42.0;
  float v32 = (v7 - (v30 + 42.0)) * 0.5;
  double v33 = floorf(v32);
  v34 = [(CDPRecoveryKeyEntryViewController *)self textEntryCell];
  [v34 frame];
  double v35 = CGRectGetMaxY(v63) + 30.0;

  -[UIButton setFrame:](self->_enterRecoveryKeyButton, "setFrame:", v33, v35, v31, v29);
  v36 = [(CDPRecoveryKeyEntryViewModel *)self->_context footerButtonTitle];
  if (v36)
  {
    v37 = [(CDPRecoveryKeyEntryViewController *)self footerActionButton];
    [v37 setAttributedTitle:v36 forState:0];

    v38 = [(CDPRecoveryKeyEntryViewController *)self footerActionButton];
    [v38 setAttributedTitle:v36 forState:1];

    v39 = [(CDPRecoveryKeyEntryViewController *)self footerActionButton];
    [v39 sizeToFit];

    v40 = [(CDPRecoveryKeyEntryViewController *)self footerActionButton];
    [v40 frame];
    double v42 = v41;
    double v44 = v43;

    float v45 = (v7 - v42) * 0.5;
    double v46 = floorf(v45);
    if ([(CDPRecoveryKeyEntryViewModel *)self->_context isFooterForVerifyFlow]
      || [(CDPRecoveryKeyEntryViewModel *)self->_context isFooterForMismatchRepairFlow]
      || [(CDPRecoveryKeyEntryViewModel *)self->_context isDataRecoveryFlow])
    {
      v64.origin.x = v33;
      v64.origin.y = v35;
      v64.size.width = v31;
      v64.size.height = v29;
      double MaxY = CGRectGetMaxY(v64);
      double v48 = 60.0;
    }
    else
    {
      v66.origin.y = v58;
      v66.origin.x = v59;
      v66.size.width = v7;
      v66.size.height = rect;
      double MaxY = CGRectGetMaxY(v66) - v44;
      double v48 = -50.0;
    }
    double v49 = MaxY + v48;
    v50 = [(CDPRecoveryKeyEntryViewController *)self footerActionButton];
    objc_msgSend(v50, "setFrame:", v46, v49, v42, v44);
  }
  v51 = [(CDPRecoveryKeyEntryViewController *)self view];
  [v51 bounds];
  double Width = CGRectGetWidth(v65);

  if ([(PSKeychainSyncSecurityCodeController *)self mode] == 1 && Width > 0.0 && Width <= 320.0)
  {
    v53 = _CDPLogSystem();
    if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2187CF000, v53, OS_LOG_TYPE_DEFAULT, "Small screen detected, reducing font size", buf, 2u);
    }

    v54 = [(CDPRecoveryKeyEntryViewController *)self textEntryCell];
    v55 = [v54 textField];
    v56 = [MEMORY[0x263F81708] systemFontOfSize:12.0];
    [v55 setFont:v56];
  }
}

- (void)didTapScanText
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2187CF000, v0, v1, "Scan Text button tapped.", v2, v3, v4, v5, v6);
}

- (void)didTapUseKeyboard:(id)a3
{
  uint64_t v4 = _CDPLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[CDPRecoveryKeyEntryViewController didTapUseKeyboard:]();
  }

  self->_keyboardIsVisible = 1;
  [(PSKeychainSyncSecurityCodeController *)self setMode:[(CDPRecoveryKeyEntryViewModel *)self->_context mode]];
  uint64_t v5 = [(CDPRecoveryKeyEntryViewController *)self textEntryCell];
  [v5 endEditing:1];

  uint8_t v6 = [(CDPRecoveryKeyEntryViewController *)self textEntryCell];
  [v6 becomeFirstResponder];

  double v7 = [(CDPRecoveryKeyEntryViewController *)self view];
  [v7 setNeedsLayout];
}

- (id)placeholderText
{
  return [(CDPRecoveryKeyEntryViewModel *)self->_context placeholderText];
}

- (void)cancelFlow:(id)a3
{
}

- (void)handleRecoveryKeyEscapeDuringDataRecoveryFlow:(id)a3
{
  uint64_t v4 = [(CDPRecoveryKeyEntryViewModel *)self->_context context];
  int v5 = [v4 _supportsCustodianRecovery];

  if (v5)
  {
    uint8_t v6 = _CDPLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      [(CDPRecoveryKeyEntryViewController *)v6 handleRecoveryKeyEscapeDuringDataRecoveryFlow:v8];
    }

    context = self->_context;
    uint64_t v10 = -5218;
LABEL_12:
    [(CDPRecoveryKeyEntryViewModel *)context handleNoRecoveryKeyWithCDPStateError:v10];
    return;
  }
  v11 = [(CDPRecoveryKeyEntryViewModel *)self->_context edpRecoveryTokenEscapeOption];
  double v12 = [v11 escapeAction];

  if (!v12)
  {
    double v14 = _CDPLogSystem();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      [(CDPRecoveryKeyEntryViewController *)v14 handleRecoveryKeyEscapeDuringDataRecoveryFlow:v16];
    }

    context = self->_context;
    uint64_t v10 = -5215;
    goto LABEL_12;
  }
  id v17 = [(CDPRecoveryKeyEntryViewModel *)self->_context edpRecoveryTokenEscapeOption];
  double v13 = [v17 escapeAction];
  v13[2]();
}

- (void)skipRecoveryKeyDuringPasswordResetFlow:(id)a3
{
  id v4 = a3;
  if ([(CDPRecoveryKeyEntryViewModel *)self->_context mandatesRecoveryKey])
  {
    v40[0] = 0;
    v40[1] = v40;
    v40[2] = 0x3032000000;
    v40[3] = __Block_byref_object_copy__0;
    v40[4] = __Block_byref_object_dispose__0;
    id v41 = [(CDPRecoveryKeyEntryViewController *)self _makeEventWithName:*MEMORY[0x263F346B0]];
    int v5 = [[CDPRemoteValidationEscapeOffer alloc] initWithCDPContext:self->_cdpContext];
    uint8_t v6 = [MEMORY[0x263F343B8] builderForKey:@"SKIP_RK_ALERT_TITLE_CANT_RESET_PASSWORD_TITLE_CASE"];
    uint64_t v7 = [v6 localizedString];
    [(CDPRemoteValidationEscapeOffer *)v5 setTitle:v7];

    uint64_t v8 = [MEMORY[0x263F343B8] builderForKey:@"SKIP_RK_ALERT_MESSAGE_CANT_RESET_PASSWORD"];
    v9 = [v8 localizedString];
    [(CDPRemoteValidationEscapeOffer *)v5 setMessage:v9];

    [(CDPRemoteValidationEscapeOffer *)v5 setPresentingViewController:self];
    uint64_t v10 = objc_alloc_init(CDPEscapeOption);
    [(CDPEscapeOption *)v10 setTitleLocalizationKey:@"TRY_AGAIN"];
    [(CDPEscapeOption *)v10 setTitleTelemetryKey:*MEMORY[0x263F34940]];
    v11 = (void *)MEMORY[0x263F343B8];
    double v12 = [(CDPEscapeOption *)v10 titleLocalizationKey];
    double v13 = [v11 builderForKey:v12];
    double v14 = [v13 localizedString];
    [(CDPEscapeOption *)v10 setTitle:v14];

    objc_initWeak(&location, self);
    v34[0] = MEMORY[0x263EF8330];
    v34[1] = 3221225472;
    v34[2] = __76__CDPRecoveryKeyEntryViewController_skipRecoveryKeyDuringPasswordResetFlow___block_invoke;
    v34[3] = &unk_26433D960;
    objc_copyWeak(&v38, &location);
    v37 = v40;
    uint64_t v15 = v10;
    double v35 = v15;
    v36 = self;
    [(CDPEscapeOption *)v15 setEscapeAction:v34];
    [(CDPEscapeOption *)v15 setStyle:0];
    uint64_t v16 = objc_alloc_init(CDPEscapeOption);
    [(CDPEscapeOption *)v16 setTitleLocalizationKey:@"DONT_RESET_PASSWORD"];
    [(CDPEscapeOption *)v16 setTitleTelemetryKey:*MEMORY[0x263F34858]];
    id v17 = (void *)MEMORY[0x263F343B8];
    v18 = [(CDPEscapeOption *)v16 titleLocalizationKey];
    CGFloat v19 = [v17 builderForKey:v18];
    v20 = [v19 localizedString];
    [(CDPEscapeOption *)v16 setTitle:v20];

    uint64_t v26 = MEMORY[0x263EF8330];
    uint64_t v27 = 3221225472;
    double v28 = __76__CDPRecoveryKeyEntryViewController_skipRecoveryKeyDuringPasswordResetFlow___block_invoke_89;
    double v29 = &unk_26433D960;
    objc_copyWeak(&v33, &location);
    float v32 = v40;
    v21 = v16;
    double v30 = v21;
    double v31 = self;
    [(CDPEscapeOption *)v21 setEscapeAction:&v26];
    -[CDPEscapeOption setStyle:](v21, "setStyle:", 0, v26, v27, v28, v29);
    [(CDPRemoteValidationEscapeOffer *)v5 addEscapeOptionsObject:v15];
    [(CDPRemoteValidationEscapeOffer *)v5 addEscapeOptionsObject:v21];
    v22 = _CDPLogSystem();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
      -[CDPRecoveryKeyEntryViewController skipRecoveryKeyDuringPasswordResetFlow:]();
    }

    [(CDPRemoteValidationEscapeOffer *)v5 handleEscapeAction:self];
    objc_destroyWeak(&v33);

    objc_destroyWeak(&v38);
    objc_destroyWeak(&location);

    _Block_object_dispose(v40, 8);
  }
  else
  {
    v23 = _CDPLogSystem();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
      [(CDPRecoveryKeyEntryViewController *)v23 skipRecoveryKeyDuringPasswordResetFlow:v25];
    }

    [(CDPRecoveryKeyEntryViewModel *)self->_context handleNoRecoveryKeyWithCDPStateError:-5215];
  }
}

void __76__CDPRecoveryKeyEntryViewController_skipRecoveryKeyDuringPasswordResetFlow___block_invoke(uint64_t a1)
{
  uint64_t v2 = _CDPLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __76__CDPRecoveryKeyEntryViewController_skipRecoveryKeyDuringPasswordResetFlow___block_invoke_cold_1();
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v5 = [WeakRetained _addEscapeOption:*(void *)(a1 + 32) forEvent:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
    uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    uint64_t v8 = [MEMORY[0x263F34338] rtcAnalyticsReporter];
    [v8 sendEvent:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
  }
  [*(id *)(a1 + 40) dismissAlerts];
}

void __76__CDPRecoveryKeyEntryViewController_skipRecoveryKeyDuringPasswordResetFlow___block_invoke_89(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  uint64_t v3 = _CDPLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    __76__CDPRecoveryKeyEntryViewController_skipRecoveryKeyDuringPasswordResetFlow___block_invoke_89_cold_1();
  }

  uint64_t v4 = [WeakRetained _addEscapeOption:*(void *)(a1 + 32) forEvent:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  uint64_t v7 = [MEMORY[0x263F34338] rtcAnalyticsReporter];
  [v7 sendEvent:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];

  [*(id *)(*(void *)(a1 + 40) + 1528) handleNoRecoveryKeyWithCDPStateError:-5307];
}

- (id)_addEscapeOption:(id)a3 forEvent:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [a3 titleTelemetryKey];
  [v5 setObject:v6 forKeyedSubscript:*MEMORY[0x263F345F8]];

  return v5;
}

- (void)handleForgotRecoveryKey:(id)a3
{
  uint64_t v4 = (void *)MEMORY[0x263F82418];
  id v5 = [MEMORY[0x263F343B8] builderForKey:@"CDP_FORGOT_RECOVERY_KEY_ALERT_TITLE"];
  uint64_t v6 = [v5 localizedString];
  uint64_t v7 = [MEMORY[0x263F343B8] builderForKey:@"CDP_FORGOT_RECOVERY_KEY_ALERT_MESSAGE"];
  uint64_t v8 = [v7 localizedString];
  v9 = [v4 alertControllerWithTitle:v6 message:v8 preferredStyle:1];

  uint64_t v10 = (void *)MEMORY[0x263F82400];
  v11 = [MEMORY[0x263F343B8] builderForKey:@"CDP_FORGOT_RECOVERY_KEY_ALERT_REPLACE_KEY_OPTION"];
  double v12 = [v11 localizedString];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __61__CDPRecoveryKeyEntryViewController_handleForgotRecoveryKey___block_invoke;
  v19[3] = &unk_26433D3A8;
  v19[4] = self;
  double v13 = [v10 actionWithTitle:v12 style:0 handler:v19];
  [v9 addAction:v13];

  double v14 = (void *)MEMORY[0x263F82400];
  uint64_t v15 = [MEMORY[0x263F343B8] builderForKey:@"CANCEL"];
  uint64_t v16 = [v15 localizedString];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __61__CDPRecoveryKeyEntryViewController_handleForgotRecoveryKey___block_invoke_105;
  v18[3] = &unk_26433D3A8;
  v18[4] = self;
  id v17 = [v14 actionWithTitle:v16 style:1 handler:v18];
  [v9 addAction:v17];

  [(CDPRecoveryKeyEntryViewController *)self presentViewController:v9 animated:1 completion:0];
}

uint64_t __61__CDPRecoveryKeyEntryViewController_handleForgotRecoveryKey___block_invoke(uint64_t a1)
{
  uint64_t v2 = _CDPLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __61__CDPRecoveryKeyEntryViewController_handleForgotRecoveryKey___block_invoke_cold_1();
  }

  return [*(id *)(*(void *)(a1 + 32) + 1528) handleForgotRecoveryKeyWithCDPStateError:-5308];
}

uint64_t __61__CDPRecoveryKeyEntryViewController_handleForgotRecoveryKey___block_invoke_105(uint64_t a1)
{
  uint64_t v2 = _CDPLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __61__CDPRecoveryKeyEntryViewController_handleForgotRecoveryKey___block_invoke_105_cold_1();
  }

  return [*(id *)(*(void *)(a1 + 32) + 1528) handleForgotRecoveryKeyWithCDPStateError:-5307];
}

- (id)headerView
{
  headerView = self->_headerView;
  if (!headerView)
  {
    uint64_t v4 = [CDPRecoveryKeyCreateHeaderView alloc];
    id v5 = [(CDPRecoveryKeyEntryViewController *)self specifier];
    uint64_t v6 = [(CDPRecoveryKeyCreateHeaderView *)v4 initWithSpecifier:v5];
    uint64_t v7 = self->_headerView;
    self->_headerView = v6;

    headerView = self->_headerView;
  }
  uint64_t v8 = [(CDPRecoveryKeyEntryViewModel *)self->_context headerTitle];
  [(PSKeychainSyncHeaderView *)headerView setTitleText:v8];

  v9 = self->_headerView;
  uint64_t v10 = [(CDPRecoveryKeyEntryViewModel *)self->_context headerSubtitle];
  [(PSKeychainSyncHeaderView *)v9 setDetailText:v10];

  v11 = self->_headerView;

  return v11;
}

- (void)didFinishEnteringText:(id)a3
{
  id v4 = a3;
  if ([(PSKeychainSyncSecurityCodeController *)self mode] == 1)
  {
    id v5 = [(CDPRecoveryKeyEntryViewModel *)self->_context completionHandler];
    v5[2](v5, 1, 0);
  }
  else
  {
    [(CDPRecoveryKeyEntryViewController *)self disableUserInteractionAndStartSpinner];
    context = self->_context;
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __59__CDPRecoveryKeyEntryViewController_didFinishEnteringText___block_invoke;
    v7[3] = &unk_26433D988;
    v7[4] = self;
    [(CDPRecoveryKeyEntryViewModel *)context processCollectedRecoveryKey:v4 completion:v7];
  }
}

uint64_t __59__CDPRecoveryKeyEntryViewController_didFinishEnteringText___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _handleRecoveryKeyValidationWithSuccess:a2 error:a3];
}

- (void)_handleRecoveryKeyValidationWithSuccess:(BOOL)a3 error:(id)a4
{
  if (!a3)
  {
    id v5 = a4;
    [(CDPRecoveryKeyEntryViewController *)self enableUserInteractionAndStopSpinner];
    int v6 = objc_msgSend(v5, "cdp_isCDPErrorWithCode:", -5213);

    if (v6)
    {
      uint64_t v7 = (void *)MEMORY[0x263F82418];
      uint64_t v8 = [MEMORY[0x263F343B8] builderForKey:@"CDP_MK_MAX_ATTEMPT_TITLE"];
      v9 = [v8 localizedString];
      uint64_t v10 = [MEMORY[0x263F343B8] builderForKey:@"CDP_MK_MAX_ATTEMPT_DESCRIPTION"];
      v11 = [v10 localizedString];
      double v12 = [v7 alertControllerWithTitle:v9 message:v11 preferredStyle:1];

      double v13 = (void *)MEMORY[0x263F82400];
      double v14 = [MEMORY[0x263F343B8] builderForKey:@"GENERIC_ERROR_DEFAULT_BUTTON"];
      uint64_t v15 = [v14 localizedString];
      v27[0] = MEMORY[0x263EF8330];
      v27[1] = 3221225472;
      v27[2] = __83__CDPRecoveryKeyEntryViewController__handleRecoveryKeyValidationWithSuccess_error___block_invoke;
      v27[3] = &unk_26433D3A8;
      v27[4] = self;
      uint64_t v16 = [v13 actionWithTitle:v15 style:0 handler:v27];
    }
    else
    {
      id v17 = _CDPLogSystem();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        -[CDPRecoveryKeyEntryViewController _handleRecoveryKeyValidationWithSuccess:error:]();
      }

      v18 = [MEMORY[0x263F343B8] builderForKey:@"REMOTE_SECRET_ENTRY_RECOVERY_ERROR_MESSAGE_RK"];
      CGFloat v19 = [v18 localizedString];

      v20 = (void *)MEMORY[0x263F82418];
      v21 = [MEMORY[0x263F343B8] builderForKey:@"REMOTE_SECRET_ENTRY_RECOVERY_ERROR_TITLE"];
      v22 = [v21 localizedString];
      double v12 = [v20 alertControllerWithTitle:v22 message:v19 preferredStyle:1];

      v23 = (void *)MEMORY[0x263F82400];
      uint64_t v24 = [MEMORY[0x263F343B8] builderForKey:@"GENERIC_ERROR_DEFAULT_BUTTON"];
      uint64_t v25 = [v24 localizedString];
      v26[0] = MEMORY[0x263EF8330];
      v26[1] = 3221225472;
      v26[2] = __83__CDPRecoveryKeyEntryViewController__handleRecoveryKeyValidationWithSuccess_error___block_invoke_123;
      v26[3] = &unk_26433D3A8;
      v26[4] = self;
      uint64_t v16 = [v23 actionWithTitle:v25 style:0 handler:v26];
    }
    [v12 addAction:v16];
    [(CDPRecoveryKeyEntryViewController *)self presentViewController:v12 animated:1 completion:0];
  }
}

uint64_t __83__CDPRecoveryKeyEntryViewController__handleRecoveryKeyValidationWithSuccess_error___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 1528) handleCancel];
}

void __83__CDPRecoveryKeyEntryViewController__handleRecoveryKeyValidationWithSuccess_error___block_invoke_123(uint64_t a1)
{
  [*(id *)(a1 + 32) setTextEntryText:&stru_26C9EBCA0];
  id v2 = [*(id *)(a1 + 32) textEntryCell];
  [v2 becomeFirstResponder];
}

- (id)textEntryCell
{
  v8.receiver = self;
  v8.super_class = (Class)CDPRecoveryKeyEntryViewController;
  id v2 = [(PSKeychainSyncSecurityCodeController *)&v8 textEntryCell];
  uint64_t v3 = [MEMORY[0x263F82DA0] currentTraitCollection];
  uint64_t v4 = [v3 userInterfaceStyle];

  if (v4 == 2) {
    [MEMORY[0x263F825C8] systemGray5Color];
  }
  else {
  id v5 = [MEMORY[0x263F825C8] systemGray6Color];
  }
  [v2 setBackgroundColor:v5];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v6 = [v2 textField];
    [v6 setAdjustsFontSizeToFitWidth:1];
  }

  return v2;
}

- (id)footerTextLabel
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.super.super.super.isa
                                                 + (int)*MEMORY[0x263F5FD88]));
}

- (id)footerActionButton
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.super.super.super.isa
                                                 + (int)*MEMORY[0x263F5FD80]));
}

- (void)disableUserInteractionAndStartSpinner
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a1 navigationItem];
  int v5 = 138412290;
  int v6 = v3;
  OUTLINED_FUNCTION_2_0(&dword_2187CF000, a2, v4, "Starting spinner for item: %@", (uint8_t *)&v5);
}

- (void)enableUserInteractionAndStopSpinner
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a1 navigationItem];
  int v5 = 138412290;
  int v6 = v3;
  OUTLINED_FUNCTION_2_0(&dword_2187CF000, a2, v4, "Stopping spinner for item: %@", (uint8_t *)&v5);
}

- (void)dealloc
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2187CF000, v0, v1, "CDPRecoveryKeyEntryViewController is going away...", v2, v3, v4, v5, v6);
}

- (void)insertText:(id)a3
{
  [(PSKeychainSyncTextEntryController *)self setTextEntryText:a3];
  [(CDPRecoveryKeyEntryViewController *)self didTapUseKeyboard:0];
  self->hasText = 1;

  [(PSKeychainSyncTextEntryController *)self setHidesNextButton:0];
}

- (void)deleteBackward
{
  [(PSKeychainSyncTextEntryController *)self setTextEntryText:0];
  self->hasText = 0;

  [(PSKeychainSyncTextEntryController *)self setHidesNextButton:1];
}

- (BOOL)hasText
{
  return self->hasText;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cdpContext, 0);
  objc_storeStrong((id *)&self->_enterRecoveryKeyButton, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_recoveryCode, 0);

  objc_storeStrong((id *)&self->_headerView, 0);
}

- (void)keyboardCameraSessionDidDismiss:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2187CF000, v0, v1, "keyboardCameraSessionDidDismiss was invoked. Camera input was dismissed. Setting the text input mode to Keyboard.", v2, v3, v4, v5, v6);
}

- (void)didTapUseKeyboard:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2187CF000, v0, v1, "Use Keyboard button tapped.", v2, v3, v4, v5, v6);
}

- (void)handleRecoveryKeyEscapeDuringDataRecoveryFlow:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  int v3 = 134217984;
  uint64_t v4 = -5218;
  OUTLINED_FUNCTION_2_0(&dword_2187CF000, a1, a3, "iOS: Sending error %ld because user doesnt have their RK and has custodian recovery available.", (uint8_t *)&v3);
}

- (void)handleRecoveryKeyEscapeDuringDataRecoveryFlow:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  int v3 = 134217984;
  uint64_t v4 = -5215;
  OUTLINED_FUNCTION_2_0(&dword_2187CF000, a1, a3, "iOS: Sending error %ld because user chose to try RK later.", (uint8_t *)&v3);
}

- (void)skipRecoveryKeyDuringPasswordResetFlow:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2187CF000, v0, v1, "iOS: RKMandate is true. Presenting the skip recovery alert", v2, v3, v4, v5, v6);
}

- (void)skipRecoveryKeyDuringPasswordResetFlow:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  int v3 = 134217984;
  uint64_t v4 = -5215;
  OUTLINED_FUNCTION_2_0(&dword_2187CF000, a1, a3, "iOS: RKMandate is false. Skipping recovery flow with error: %ld", (uint8_t *)&v3);
}

void __76__CDPRecoveryKeyEntryViewController_skipRecoveryKeyDuringPasswordResetFlow___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2187CF000, v0, v1, "User tapped try again in skip RK in password recovery flow.", v2, v3, v4, v5, v6);
}

void __76__CDPRecoveryKeyEntryViewController_skipRecoveryKeyDuringPasswordResetFlow___block_invoke_89_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2187CF000, v0, v1, "User tapped don't reset password in password recovery flow.", v2, v3, v4, v5, v6);
}

void __61__CDPRecoveryKeyEntryViewController_handleForgotRecoveryKey___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2187CF000, v0, v1, "User tapped replace recovery key in forgot recovery key flow", v2, v3, v4, v5, v6);
}

void __61__CDPRecoveryKeyEntryViewController_handleForgotRecoveryKey___block_invoke_105_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2187CF000, v0, v1, "User tapped cancel in forgot recovery key flow", v2, v3, v4, v5, v6);
}

- (void)_handleRecoveryKeyValidationWithSuccess:error:.cold.1()
{
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_2187CF000, v0, OS_LOG_TYPE_ERROR, "Invalid code entered... lets try again", v1, 2u);
}

@end