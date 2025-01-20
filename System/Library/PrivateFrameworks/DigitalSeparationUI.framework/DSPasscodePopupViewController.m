@interface DSPasscodePopupViewController
+ (BOOL)isPasscodeSet;
- (BFFPasscodeView)passcodeView;
- (BOOL)isNumeric;
- (BOOL)optionsSheetIsEmpty;
- (BOOL)usesSimplePasscodeEntry;
- (BOOL)validatePIN:(id)a3;
- (DSNavigationDelegate)delegate;
- (DSPasscodePopupViewController)init;
- (DSWifiSyncStore)wifiSyncStore;
- (NSLayoutConstraint)contentHeightConstraint;
- (NSString)passcodeNew;
- (NSString)passcodeOld;
- (UIAlertController)passcodeOptionAlertController;
- (id)_createAndShowAnimatedNavBarSpinner;
- (id)passcodeInputView;
- (int64_t)passcodeState;
- (unint64_t)numericLength;
- (void)_animatePasscodeViewTransition;
- (void)_applyPasscode;
- (void)_commitPasscodeEntryTypeChange;
- (void)_setupFirstEntry;
- (void)_showPasswordRequirementAlertWithText:(id)a3;
- (void)_showWeakWarningAlert;
- (void)_transitionToPasscodePaneWithState:(int64_t)a3 animationType:(unint64_t)a4;
- (void)acceptWeakPasscode:(BOOL)a3;
- (void)configurePasscodeOptionsSheet;
- (void)configurePasscodeTypeUsingAnimations:(BOOL)a3;
- (void)handleCurrentPasscodeEntry:(id)a3;
- (void)handleNewPasscodeEntry:(id)a3;
- (void)handlePasscodeConfirmationEntry:(id)a3;
- (void)handlePasscodeDoesNotMeetConstraints:(id)a3;
- (void)keyboardDidShow:(id)a3;
- (void)nextButtonTapped;
- (void)passcodeInput:(id)a3 enteredPasscode:(id)a4;
- (void)passcodeInput:(id)a3 tappedFooterButton:(id)a4;
- (void)pushNextPane;
- (void)reset;
- (void)setContentHeightConstraint:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setNumeric:(BOOL)a3;
- (void)setNumericLength:(unint64_t)a3;
- (void)setPasscodeNew:(id)a3;
- (void)setPasscodeOld:(id)a3;
- (void)setPasscodeOptionAlertController:(id)a3;
- (void)setPasscodeState:(int64_t)a3;
- (void)setPasscodeView:(id)a3;
- (void)setWifiSyncStore:(id)a3;
- (void)userEnteredPasscode:(id)a3;
- (void)viewDidLoad;
@end

@implementation DSPasscodePopupViewController

- (DSPasscodePopupViewController)init
{
  v10.receiver = self;
  v10.super_class = (Class)DSPasscodePopupViewController;
  v3 = [(DSPasscodePopupViewController *)&v10 init];
  if (v3 == self)
  {
    uint64_t v4 = objc_opt_class();
    if (v4 == objc_opt_class())
    {
      os_log_t v5 = os_log_create("com.apple.DigitalSeparation", "DSPasscodeController");
      v6 = (void *)DSLog_2;
      DSLog_2 = (uint64_t)v5;
    }
    [(DSPasscodePopupViewController *)self _setupFirstEntry];
    v7 = (DSWifiSyncStore *)objc_alloc_init(MEMORY[0x263F3A398]);
    wifiSyncStore = self->_wifiSyncStore;
    self->_wifiSyncStore = v7;
  }
  return v3;
}

- (void)viewDidLoad
{
  v35.receiver = self;
  v35.super_class = (Class)DSPasscodePopupViewController;
  [(DSPasscodePopupViewController *)&v35 viewDidLoad];
  v3 = [(DSPasscodePopupViewController *)self view];
  uint64_t v4 = [MEMORY[0x263F825C8] systemBackgroundColor];
  [v3 setBackgroundColor:v4];

  os_log_t v5 = objc_opt_new();
  [(DSPasscodePopupViewController *)self setPasscodeView:v5];

  v6 = [(DSPasscodePopupViewController *)self passcodeView];
  [v6 setPasscodeViewController:self];

  v7 = [(DSPasscodePopupViewController *)self view];
  v8 = [(DSPasscodePopupViewController *)self passcodeView];
  [v7 addSubview:v8];

  v9 = [(DSPasscodePopupViewController *)self passcodeView];
  [v9 setTranslatesAutoresizingMaskIntoConstraints:0];

  objc_super v10 = [(DSPasscodePopupViewController *)self view];
  [v10 frame];
  double v12 = v11 * 0.15;

  v13 = [(DSPasscodePopupViewController *)self passcodeView];
  v14 = [v13 topAnchor];
  v15 = [(DSPasscodePopupViewController *)self view];
  v16 = [v15 topAnchor];
  v17 = [v14 constraintEqualToAnchor:v16 constant:v12];
  [v17 setActive:1];

  v18 = [(DSPasscodePopupViewController *)self passcodeView];
  v19 = [v18 bottomAnchor];
  v20 = [(DSPasscodePopupViewController *)self view];
  v21 = [v20 keyboardLayoutGuide];
  v22 = [v21 topAnchor];
  v23 = [v19 constraintEqualToAnchor:v22];
  [v23 setActive:1];

  v24 = [(DSPasscodePopupViewController *)self passcodeView];
  v25 = [v24 widthAnchor];
  v26 = [(DSPasscodePopupViewController *)self view];
  v27 = [v26 widthAnchor];
  v28 = [v25 constraintEqualToAnchor:v27];
  [v28 setActive:1];

  v29 = [(DSPasscodePopupViewController *)self passcodeView];
  [v29 setTitle:0];

  v30 = [(DSPasscodePopupViewController *)self passcodeView];
  v31 = [(DSPasscodePopupViewController *)self passcodeInputView];
  [v30 transitionToPasscodeInput:v31 delegate:self];

  [(DSPasscodePopupViewController *)self configurePasscodeOptionsSheet];
  [(DSPasscodePopupViewController *)self configurePasscodeTypeUsingAnimations:0];
  v32 = [MEMORY[0x263F08A00] defaultCenter];
  [v32 addObserver:self selector:sel_keyboardDidShow_ name:*MEMORY[0x263F837A8] object:0];

  v33 = [(DSPasscodePopupViewController *)self passcodeView];
  v34 = [v33 passcodeInputView];

  [v34 becomeFirstResponder];
}

+ (BOOL)isPasscodeSet
{
  v2 = [MEMORY[0x263F53C50] sharedConnection];
  char v3 = [v2 isPasscodeSet];

  return v3;
}

- (void)_setupFirstEntry
{
  if (+[DSPasscodePopupViewController isPasscodeSet])
  {
    int v9 = 0;
    char v3 = [MEMORY[0x263F53C50] sharedConnection];
    int v4 = [v3 unlockScreenTypeWithOutSimplePasscodeType:&v9];

    if (v4 == 1)
    {
      [(DSPasscodePopupViewController *)self setNumeric:1];
      v6 = self;
      uint64_t v5 = 0;
    }
    else
    {
      if (v4)
      {
        [(DSPasscodePopupViewController *)self setNumeric:0];
        goto LABEL_12;
      }
      [(DSPasscodePopupViewController *)self setNumeric:1];
      if (v9) {
        uint64_t v5 = 6;
      }
      else {
        uint64_t v5 = 4;
      }
      v6 = self;
    }
    [(DSPasscodePopupViewController *)v6 setNumericLength:v5];
LABEL_12:
    v7 = self;
    uint64_t v8 = 0;
    goto LABEL_13;
  }
  [(DSPasscodePopupViewController *)self setNumeric:1];
  [(DSPasscodePopupViewController *)self setNumericLength:6];
  v7 = self;
  uint64_t v8 = 5;
LABEL_13:
  [(DSPasscodePopupViewController *)v7 setPasscodeState:v8];
  [(DSPasscodePopupViewController *)self configurePasscodeTypeUsingAnimations:0];
  [(DSPasscodePopupViewController *)self configurePasscodeOptionsSheet];
}

- (BOOL)usesSimplePasscodeEntry
{
  BOOL v3 = [(DSPasscodePopupViewController *)self isNumeric];
  if (v3) {
    LOBYTE(v3) = [(DSPasscodePopupViewController *)self numericLength] == 4
  }
              || [(DSPasscodePopupViewController *)self numericLength] == 6;
  return v3;
}

- (void)reset
{
  [(DSPasscodePopupViewController *)self setPasscodeOld:0];
  [(DSPasscodePopupViewController *)self setPasscodeNew:0];
  [(DSPasscodePopupViewController *)self _setupFirstEntry];
  int64_t v3 = [(DSPasscodePopupViewController *)self passcodeState];
  [(DSPasscodePopupViewController *)self _transitionToPasscodePaneWithState:v3 animationType:0];
}

- (void)configurePasscodeTypeUsingAnimations:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(DSPasscodePopupViewController *)self usesSimplePasscodeEntry])
  {
    id v11 = [(DSPasscodePopupViewController *)self navigationItem];
    id v5 = objc_alloc(MEMORY[0x263F824A8]);
    v6 = DSUILocStringForKey(@"QUICK_EXIT");
    v7 = [(DSPasscodePopupViewController *)self delegate];
    uint64_t v8 = (void *)[v5 initWithTitle:v6 style:0 target:v7 action:sel_quickExit];
    [v11 setRightBarButtonItem:v8];
  }
  else
  {
    id v9 = objc_alloc(MEMORY[0x263F824A8]);
    objc_super v10 = DSUILocStringForKey(@"NEXT");
    id v11 = (id)[v9 initWithTitle:v10 style:2 target:self action:sel_nextButtonTapped];

    v6 = [(DSPasscodePopupViewController *)self navigationItem];
    [v6 setRightBarButtonItem:v11 animated:v3];
  }
}

- (void)_animatePasscodeViewTransition
{
  id v4 = [(DSPasscodePopupViewController *)self passcodeInputView];
  BOOL v3 = [(DSPasscodePopupViewController *)self passcodeView];
  [v3 animateTransitionToPasscodeInput:v4 animation:3];
}

- (id)passcodeInputView
{
  if ([(DSPasscodePopupViewController *)self usesSimplePasscodeEntry]) {
    uint64_t v3 = objc_msgSend(objc_alloc(MEMORY[0x263F68050]), "initWithFrame:numberOfEntryFields:", -[DSPasscodePopupViewController numericLength](self, "numericLength"), 0.0, 0.0, 0.0, 0.0);
  }
  else {
    uint64_t v3 = objc_msgSend(objc_alloc(MEMORY[0x263F68028]), "initWithFrame:numericOnly:", -[DSPasscodePopupViewController isNumeric](self, "isNumeric"), 0.0, 0.0, 0.0, 0.0);
  }
  id v4 = (void *)v3;
  switch([(DSPasscodePopupViewController *)self passcodeState])
  {
    case 0:
      id v5 = @"PASSCODE_ENTER_OLD";
      goto LABEL_11;
    case 1:
      v7 = @"PASSCODE_ENTER_NEW";
      goto LABEL_13;
    case 2:
      id v5 = @"PASSCODE_ENTER_NEW_AGAIN";
      goto LABEL_11;
    case 3:
      id v5 = @"PASSCODE_REENTRY_FAILURE";
      goto LABEL_11;
    case 4:
      id v5 = @"PASSCODE_ENTRY_FAILURE";
LABEL_11:
      v6 = DSUILocStringForKey(v5);
      goto LABEL_14;
    case 5:
      v7 = @"PASSCODE_ENTER_CREATE";
LABEL_13:
      v6 = DSUILocStringForKey(v7);
      if ([(DSPasscodePopupViewController *)self optionsSheetIsEmpty])
      {
LABEL_14:
        [v4 setFooterButtonText:0];
      }
      else
      {
        objc_super v10 = DSUILocStringForKey(@"PASSCODE_OPTIONS");
        [v4 setFooterButtonText:v10];
      }
      break;
    default:
      v6 = 0;
      break;
  }
  uint64_t v8 = [v4 instructions];
  [v8 setText:v6];

  [v4 setFooterView:0];
  return v4;
}

- (void)nextButtonTapped
{
  id v5 = [(DSPasscodePopupViewController *)self passcodeView];
  uint64_t v3 = [v5 passcodeInputView];
  id v4 = [v3 passcode];
  [(DSPasscodePopupViewController *)self userEnteredPasscode:v4];
}

- (void)handleCurrentPasscodeEntry:(id)a3
{
  id v7 = a3;
  if (-[DSPasscodePopupViewController validatePIN:](self, "validatePIN:"))
  {
    [(DSPasscodePopupViewController *)self setPasscodeOld:v7];
    id v4 = self;
    uint64_t v5 = 1;
    uint64_t v6 = 2;
  }
  else
  {
    id v4 = self;
    uint64_t v5 = 4;
    uint64_t v6 = 3;
  }
  [(DSPasscodePopupViewController *)v4 _transitionToPasscodePaneWithState:v5 animationType:v6];
}

- (void)handleNewPasscodeEntry:(id)a3
{
  id v4 = a3;
  if (![v4 length])
  {
    id v7 = 0;
    goto LABEL_6;
  }
  uint64_t v5 = [MEMORY[0x263F53C50] sharedConnection];
  id v8 = 0;
  int v6 = [v5 passcode:v4 meetsCurrentConstraintsOutError:&v8];
  id v7 = v8;

  if (!v6)
  {
LABEL_6:
    [(DSPasscodePopupViewController *)self handlePasscodeDoesNotMeetConstraints:v7];
    goto LABEL_7;
  }
  [(DSPasscodePopupViewController *)self setPasscodeNew:v4];
  [(DSPasscodePopupViewController *)self usesSimplePasscodeEntry];
  if (SecPasswordIsPasswordWeak2()) {
    [(DSPasscodePopupViewController *)self _showWeakWarningAlert];
  }
  else {
    [(DSPasscodePopupViewController *)self _transitionToPasscodePaneWithState:2 animationType:3];
  }
LABEL_7:
}

- (void)handlePasscodeDoesNotMeetConstraints:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(DSPasscodePopupViewController *)self passcodeView];
  int v6 = [v5 passcodeInputView];
  [v6 setPasscode:&stru_26E9097D0];

  if (v4
    && ([v4 domain],
        id v7 = objc_claimAutoreleasedReturnValue(),
        int v8 = [v7 isEqualToString:*MEMORY[0x263F53B10]],
        v7,
        v8))
  {
    id v9 = [v4 localizedDescription];
    [(DSPasscodePopupViewController *)self _showPasswordRequirementAlertWithText:v9];

    objc_super v10 = (void *)DSLog_2;
    if (os_log_type_enabled((os_log_t)DSLog_2, OS_LOG_TYPE_INFO))
    {
      id v11 = v10;
      double v12 = [v4 description];
      int v19 = 138543362;
      v20 = v12;
      _os_log_impl(&dword_235BFC000, v11, OS_LOG_TYPE_INFO, "Passcode did not meet constraint: %{public}@", (uint8_t *)&v19, 0xCu);

LABEL_7:
    }
  }
  else
  {
    v13 = [MEMORY[0x263F53C50] sharedConnection];
    v14 = [v13 localizedDescriptionOfCurrentPasscodeConstraints];
    [(DSPasscodePopupViewController *)self _showPasswordRequirementAlertWithText:v14];

    v15 = (void *)DSLog_2;
    if (os_log_type_enabled((os_log_t)DSLog_2, OS_LOG_TYPE_INFO))
    {
      v16 = (void *)MEMORY[0x263F53C50];
      id v11 = v15;
      v17 = [v16 sharedConnection];
      v18 = [v17 localizedDescriptionOfCurrentPasscodeConstraints];
      int v19 = 138543362;
      v20 = v18;
      _os_log_impl(&dword_235BFC000, v11, OS_LOG_TYPE_INFO, "Passcode did not meet constraints. Constraints are: %{public}@", (uint8_t *)&v19, 0xCu);

      goto LABEL_7;
    }
  }
}

- (void)handlePasscodeConfirmationEntry:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(DSPasscodePopupViewController *)self passcodeNew];
  int v6 = [v4 isEqualToString:v5];

  if (v6)
  {
    [(DSPasscodePopupViewController *)self _applyPasscode];
  }
  else
  {
    [(DSPasscodePopupViewController *)self _transitionToPasscodePaneWithState:3 animationType:3];
  }
}

- (void)userEnteredPasscode:(id)a3
{
  id v6 = a3;
  if (![(DSPasscodePopupViewController *)self passcodeState]
    || [(DSPasscodePopupViewController *)self passcodeState] == 4)
  {
    uint64_t v4 = [(DSPasscodePopupViewController *)self handleCurrentPasscodeEntry:v6];
LABEL_10:
    id v5 = v6;
    goto LABEL_11;
  }
  if ([(DSPasscodePopupViewController *)self passcodeState] == 1
    || [(DSPasscodePopupViewController *)self passcodeState] == 5)
  {
    uint64_t v4 = [(DSPasscodePopupViewController *)self handleNewPasscodeEntry:v6];
    goto LABEL_10;
  }
  if ([(DSPasscodePopupViewController *)self passcodeState] == 2
    || (uint64_t v4 = [(DSPasscodePopupViewController *)self passcodeState], v5 = v6, v4 == 3))
  {
    uint64_t v4 = [(DSPasscodePopupViewController *)self handlePasscodeConfirmationEntry:v6];
    goto LABEL_10;
  }
LABEL_11:
  MEMORY[0x270F9A758](v4, v5);
}

- (void)_transitionToPasscodePaneWithState:(int64_t)a3 animationType:(unint64_t)a4
{
  [(DSPasscodePopupViewController *)self setPasscodeState:a3];
  id v8 = [(DSPasscodePopupViewController *)self passcodeView];
  id v6 = [v8 passcodeInputView];
  [v6 setPasscode:&stru_26E9097D0];

  id v7 = [(DSPasscodePopupViewController *)self passcodeInputView];
  [v8 animateTransitionToPasscodeInput:v7 animation:a4];
}

- (void)_applyPasscode
{
  uint64_t v3 = [(DSPasscodePopupViewController *)self _createAndShowAnimatedNavBarSpinner];
  uint64_t v4 = [MEMORY[0x263F82438] sharedApplication];
  uint64_t v5 = [v4 beginBackgroundTaskWithName:@"com.apple.DigitalSeparation.passcode" expirationHandler:0];

  id v6 = [(DSPasscodePopupViewController *)self passcodeOld];
  id v7 = dispatch_get_global_queue(0, 0);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __47__DSPasscodePopupViewController__applyPasscode__block_invoke;
  v10[3] = &unk_264C6EE90;
  id v11 = v6;
  double v12 = self;
  id v13 = v3;
  uint64_t v14 = v5;
  id v8 = v3;
  id v9 = v6;
  dispatch_async(v7, v10);
}

void __47__DSPasscodePopupViewController__applyPasscode__block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x263F53C50] sharedConnection];
  char v3 = objc_opt_respondsToSelector();
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = [*(id *)(a1 + 40) passcodeNew];
  if (v3)
  {
    uint64_t v18 = 0;
    id v6 = (id *)&v18;
    char v7 = [v2 changePasscodeFrom:v4 to:v5 skipRecovery:1 outError:&v18];
  }
  else
  {
    uint64_t v17 = 0;
    id v6 = (id *)&v17;
    char v7 = [v2 changePasscodeFrom:v4 to:v5 outError:&v17];
  }
  char v8 = v7;
  id v9 = *v6;

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __47__DSPasscodePopupViewController__applyPasscode__block_invoke_2;
  block[3] = &unk_264C6EE68;
  char v16 = v8;
  objc_super v10 = *(void **)(a1 + 48);
  uint64_t v15 = *(void *)(a1 + 56);
  block[4] = *(void *)(a1 + 40);
  id v13 = v9;
  id v14 = v10;
  id v11 = v9;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __47__DSPasscodePopupViewController__applyPasscode__block_invoke_2(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 64))
  {
    v2 = DSLog_2;
    if (os_log_type_enabled((os_log_t)DSLog_2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_235BFC000, v2, OS_LOG_TYPE_INFO, "Passcode update successful.", buf, 2u);
    }
    char v3 = [MEMORY[0x263F828C0] sharedInputModeController];
    [v3 saveDeviceUnlockPasscodeInputModes];

    uint64_t v4 = [MEMORY[0x263F82438] sharedApplication];
    [v4 endBackgroundTask:*(void *)(a1 + 56)];

    uint64_t v5 = [MEMORY[0x263F5FBB0] sharedManager];
    id v6 = [*(id *)(a1 + 32) passcodeNew];
    uint64_t v7 = *(void *)(a1 + 32);
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __47__DSPasscodePopupViewController__applyPasscode__block_invoke_342;
    v15[3] = &unk_264C6EE40;
    v15[4] = v7;
    id v16 = *(id *)(a1 + 40);
    id v17 = *(id *)(a1 + 48);
    [v5 promptForDevicePasscodeChangeToPasscode:v6 overController:v7 completion:v15];
  }
  else
  {
    if (*(void *)(a1 + 40))
    {
      char v8 = DSLog_2;
      if (os_log_type_enabled((os_log_t)DSLog_2, OS_LOG_TYPE_ERROR)) {
        __47__DSPasscodePopupViewController__applyPasscode__block_invoke_2_cold_1(a1 + 40, v8, v9, v10, v11, v12, v13, v14);
      }
    }
    [*(id *)(a1 + 48) stopAnimating];
    uint64_t v5 = [MEMORY[0x263F82438] sharedApplication];
    [v5 endBackgroundTask:*(void *)(a1 + 56)];
  }
}

void __47__DSPasscodePopupViewController__applyPasscode__block_invoke_342(id *a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = DSLog_2;
    if (os_log_type_enabled((os_log_t)DSLog_2, OS_LOG_TYPE_ERROR)) {
      __47__DSPasscodePopupViewController__applyPasscode__block_invoke_342_cold_1((uint64_t)v4, v5, v6, v7, v8, v9, v10, v11);
    }
  }
  uint64_t v12 = [a1[4] wifiSyncStore];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __47__DSPasscodePopupViewController__applyPasscode__block_invoke_343;
  v15[3] = &unk_264C6EE18;
  id v16 = a1[5];
  id v13 = a1[6];
  id v14 = a1[4];
  id v17 = v13;
  id v18 = v14;
  [v12 removeAllPairedDevicesOnQueue:MEMORY[0x263EF83A0] completion:v15];
}

void __47__DSPasscodePopupViewController__applyPasscode__block_invoke_343(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = DSLog_2;
    if (os_log_type_enabled((os_log_t)DSLog_2, OS_LOG_TYPE_ERROR)) {
      __47__DSPasscodePopupViewController__applyPasscode__block_invoke_343_cold_1(a1, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __47__DSPasscodePopupViewController__applyPasscode__block_invoke_344;
  v13[3] = &unk_264C6ED28;
  id v11 = *(id *)(a1 + 40);
  uint64_t v12 = *(void *)(a1 + 48);
  id v14 = v11;
  uint64_t v15 = v12;
  dispatch_async(MEMORY[0x263EF83A0], v13);
}

uint64_t __47__DSPasscodePopupViewController__applyPasscode__block_invoke_344(uint64_t a1)
{
  [*(id *)(a1 + 32) stopAnimating];
  [*(id *)(a1 + 40) reset];
  v2 = *(void **)(a1 + 40);
  return [v2 pushNextPane];
}

- (BOOL)validatePIN:(id)a3
{
  id v3 = (void *)MEMORY[0x263F53C50];
  id v4 = a3;
  uint64_t v5 = [v3 sharedConnection];
  if ([v5 isPasscodeSet])
  {
    id v8 = 0;
    char v6 = [v5 unlockDeviceWithPasscode:v4 outError:&v8];

    id v4 = v8;
  }
  else
  {
    char v6 = [v4 isEqualToString:&stru_26E9097D0];
  }

  return v6;
}

- (void)pushNextPane
{
  [(DSPasscodePopupViewController *)self dismissViewControllerAnimated:1 completion:0];
  id v3 = [(DSPasscodePopupViewController *)self delegate];
  [v3 pushNextPane];
}

- (void)passcodeInput:(id)a3 enteredPasscode:(id)a4
{
}

- (void)passcodeInput:(id)a3 tappedFooterButton:(id)a4
{
  id v5 = [(DSPasscodePopupViewController *)self passcodeOptionAlertController];
  [(DSPasscodePopupViewController *)self presentViewController:v5 animated:1 completion:0];
}

- (void)_showWeakWarningAlert
{
  id v3 = DSUILocStringForKey(@"WEAK_PASSCODE_DETAILS");
  id v4 = (void *)MEMORY[0x263F82418];
  id v5 = DSUILocStringForKey(@"WEAK_PASSCODE");
  char v6 = [v4 alertControllerWithTitle:v5 message:v3 preferredStyle:1];

  uint64_t v7 = (void *)MEMORY[0x263F82400];
  id v8 = DSUILocStringForKey(@"CHANGE_PASSCODE");
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __54__DSPasscodePopupViewController__showWeakWarningAlert__block_invoke;
  v14[3] = &unk_264C6E848;
  v14[4] = self;
  uint64_t v9 = [v7 actionWithTitle:v8 style:1 handler:v14];
  [v6 addAction:v9];

  uint64_t v10 = (void *)MEMORY[0x263F82400];
  id v11 = DSUILocStringForKey(@"USE_WEAK_PASSCODE_ANYWAY");
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __54__DSPasscodePopupViewController__showWeakWarningAlert__block_invoke_2;
  v13[3] = &unk_264C6E848;
  void v13[4] = self;
  uint64_t v12 = [v10 actionWithTitle:v11 style:0 handler:v13];
  [v6 addAction:v12];

  [(DSPasscodePopupViewController *)self presentViewController:v6 animated:1 completion:0];
}

uint64_t __54__DSPasscodePopupViewController__showWeakWarningAlert__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) acceptWeakPasscode:0];
}

uint64_t __54__DSPasscodePopupViewController__showWeakWarningAlert__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) acceptWeakPasscode:1];
}

- (void)_showPasswordRequirementAlertWithText:(id)a3
{
  id v4 = (void *)MEMORY[0x263F82418];
  id v5 = a3;
  char v6 = DSUILocStringForKey(@"WEAK_PASSCODE");
  id v10 = [v4 alertControllerWithTitle:v6 message:v5 preferredStyle:1];

  uint64_t v7 = (void *)MEMORY[0x263F82400];
  id v8 = DSUILocStringForKey(@"OK");
  uint64_t v9 = [v7 actionWithTitle:v8 style:0 handler:&__block_literal_global_7];
  [v10 addAction:v9];

  [(DSPasscodePopupViewController *)self presentViewController:v10 animated:1 completion:0];
}

- (void)acceptWeakPasscode:(BOOL)a3
{
  if (a3)
  {
    uint64_t v4 = 2;
  }
  else
  {
    [(DSPasscodePopupViewController *)self setPasscodeNew:0];
    uint64_t v4 = 1;
  }
  [(DSPasscodePopupViewController *)self _transitionToPasscodePaneWithState:v4 animationType:3];
}

- (void)_commitPasscodeEntryTypeChange
{
  [(DSPasscodePopupViewController *)self configurePasscodeTypeUsingAnimations:1];
  [(DSPasscodePopupViewController *)self _animatePasscodeViewTransition];
  [(DSPasscodePopupViewController *)self configurePasscodeOptionsSheet];
}

- (void)configurePasscodeOptionsSheet
{
  int v25 = 0;
  id v3 = [MEMORY[0x263F53C50] sharedConnection];
  unsigned int v4 = [v3 minimumNewPasscodeEntryScreenTypeWithOutSimplePasscodeType:&v25];

  id v5 = [MEMORY[0x263F82418] alertControllerWithTitle:0 message:0 preferredStyle:0];
  if ([(DSPasscodePopupViewController *)self isNumeric])
  {
    char v6 = (void *)MEMORY[0x263F82400];
    uint64_t v7 = DSUILocStringForKey(@"CUSTOM_ALPHANUMERIC_CODE");
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __62__DSPasscodePopupViewController_configurePasscodeOptionsSheet__block_invoke;
    v24[3] = &unk_264C6E848;
    v24[4] = self;
    id v8 = [v6 actionWithTitle:v7 style:0 handler:v24];
    [v5 addAction:v8];
  }
  if (v4 <= 1)
  {
    if (![(DSPasscodePopupViewController *)self isNumeric]
      || [(DSPasscodePopupViewController *)self numericLength])
    {
      uint64_t v9 = (void *)MEMORY[0x263F82400];
      id v10 = DSUILocStringForKey(@"CUSTOM_NUMERIC_CODE");
      v23[0] = MEMORY[0x263EF8330];
      v23[1] = 3221225472;
      v23[2] = __62__DSPasscodePopupViewController_configurePasscodeOptionsSheet__block_invoke_2;
      v23[3] = &unk_264C6E848;
      v23[4] = self;
      id v11 = [v9 actionWithTitle:v10 style:0 handler:v23];
      [v5 addAction:v11];
    }
    if (!v4)
    {
      if ([(DSPasscodePopupViewController *)self numericLength] != 6)
      {
        uint64_t v12 = (void *)MEMORY[0x263F82400];
        id v13 = DSUILocStringForKey(@"6_DIGIT_CODE");
        v22[0] = MEMORY[0x263EF8330];
        v22[1] = 3221225472;
        v22[2] = __62__DSPasscodePopupViewController_configurePasscodeOptionsSheet__block_invoke_3;
        v22[3] = &unk_264C6E848;
        v22[4] = self;
        id v14 = [v12 actionWithTitle:v13 style:0 handler:v22];
        [v5 addAction:v14];
      }
      if (!v25 && [(DSPasscodePopupViewController *)self numericLength] != 4)
      {
        uint64_t v15 = (void *)MEMORY[0x263F82400];
        id v16 = DSUILocStringForKey(@"4_DIGIT_CODE");
        v21[0] = MEMORY[0x263EF8330];
        v21[1] = 3221225472;
        v21[2] = __62__DSPasscodePopupViewController_configurePasscodeOptionsSheet__block_invoke_4;
        v21[3] = &unk_264C6E848;
        v21[4] = self;
        id v17 = [v15 actionWithTitle:v16 style:0 handler:v21];
        [v5 addAction:v17];
      }
    }
  }
  id v18 = (void *)MEMORY[0x263F82400];
  int v19 = DSUILocStringForKey(@"CANCEL");
  v20 = [v18 actionWithTitle:v19 style:1 handler:0];
  [v5 addAction:v20];

  [(DSPasscodePopupViewController *)self setPasscodeOptionAlertController:v5];
}

uint64_t __62__DSPasscodePopupViewController_configurePasscodeOptionsSheet__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setNumeric:0];
  [*(id *)(a1 + 32) setNumericLength:0];
  v2 = *(void **)(a1 + 32);
  return [v2 _commitPasscodeEntryTypeChange];
}

uint64_t __62__DSPasscodePopupViewController_configurePasscodeOptionsSheet__block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setNumeric:1];
  [*(id *)(a1 + 32) setNumericLength:0];
  v2 = *(void **)(a1 + 32);
  return [v2 _commitPasscodeEntryTypeChange];
}

uint64_t __62__DSPasscodePopupViewController_configurePasscodeOptionsSheet__block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) setNumeric:1];
  [*(id *)(a1 + 32) setNumericLength:6];
  v2 = *(void **)(a1 + 32);
  return [v2 _commitPasscodeEntryTypeChange];
}

uint64_t __62__DSPasscodePopupViewController_configurePasscodeOptionsSheet__block_invoke_4(uint64_t a1)
{
  [*(id *)(a1 + 32) setNumeric:1];
  [*(id *)(a1 + 32) setNumericLength:4];
  v2 = *(void **)(a1 + 32);
  return [v2 _commitPasscodeEntryTypeChange];
}

- (BOOL)optionsSheetIsEmpty
{
  id v3 = [(DSPasscodePopupViewController *)self passcodeOptionAlertController];
  if (v3)
  {
    unsigned int v4 = [(DSPasscodePopupViewController *)self passcodeOptionAlertController];
    id v5 = [v4 actions];
    BOOL v6 = (unint64_t)[v5 count] < 2;
  }
  else
  {
    BOOL v6 = 1;
  }

  return v6;
}

- (void)keyboardDidShow:(id)a3
{
  id v15 = [a3 userInfo];
  unsigned int v4 = [v15 objectForKey:*MEMORY[0x263F837B8]];
  [v4 CGRectValue];
  double v6 = v5;

  uint64_t v7 = [(DSPasscodePopupViewController *)self passcodeView];
  id v8 = [v7 passcodeInputView];
  [v8 bounds];
  double v10 = v9;
  id v11 = [(DSPasscodePopupViewController *)self view];
  [v11 bounds];
  BOOL v13 = v10 > v12 - v6;
  id v14 = [(DSPasscodePopupViewController *)self passcodeView];
  [v14 setScrollEnabled:v13];
}

- (id)_createAndShowAnimatedNavBarSpinner
{
  id v3 = (void *)[objc_alloc(MEMORY[0x263F823E8]) initWithActivityIndicatorStyle:100];
  unsigned int v4 = [(DSPasscodePopupViewController *)self navigationItem];
  [v4 setTitleView:v3];

  [v3 startAnimating];
  return v3;
}

- (DSNavigationDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (DSNavigationDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (int64_t)passcodeState
{
  return self->_passcodeState;
}

- (void)setPasscodeState:(int64_t)a3
{
  self->_passcodeState = a3;
}

- (NSString)passcodeNew
{
  return self->_passcodeNew;
}

- (void)setPasscodeNew:(id)a3
{
}

- (NSString)passcodeOld
{
  return self->_passcodeOld;
}

- (void)setPasscodeOld:(id)a3
{
}

- (BOOL)isNumeric
{
  return self->_numeric;
}

- (void)setNumeric:(BOOL)a3
{
  self->_numeric = a3;
}

- (unint64_t)numericLength
{
  return self->_numericLength;
}

- (void)setNumericLength:(unint64_t)a3
{
  self->_numericLength = a3;
}

- (BFFPasscodeView)passcodeView
{
  return self->_passcodeView;
}

- (void)setPasscodeView:(id)a3
{
}

- (NSLayoutConstraint)contentHeightConstraint
{
  return self->_contentHeightConstraint;
}

- (void)setContentHeightConstraint:(id)a3
{
}

- (UIAlertController)passcodeOptionAlertController
{
  return self->_passcodeOptionAlertController;
}

- (void)setPasscodeOptionAlertController:(id)a3
{
}

- (DSWifiSyncStore)wifiSyncStore
{
  return self->_wifiSyncStore;
}

- (void)setWifiSyncStore:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wifiSyncStore, 0);
  objc_storeStrong((id *)&self->_passcodeOptionAlertController, 0);
  objc_storeStrong((id *)&self->_contentHeightConstraint, 0);
  objc_storeStrong((id *)&self->_passcodeView, 0);
  objc_storeStrong((id *)&self->_passcodeOld, 0);
  objc_storeStrong((id *)&self->_passcodeNew, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __47__DSPasscodePopupViewController__applyPasscode__block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __47__DSPasscodePopupViewController__applyPasscode__block_invoke_342_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __47__DSPasscodePopupViewController__applyPasscode__block_invoke_343_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end