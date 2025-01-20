@interface CDPUIEDPRecoveryTokeniOSEntryViewController
- (BOOL)hasText;
- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5;
- (BOOL)textFieldShouldReturn:(id)a3;
- (CDPUIEDPRecoveryTokenEntryViewControllerDelegate)delegate;
- (CDPUIEDPRecoveryTokeniOSEntryViewController)initWithViewModel:(id)a3 delegate:(id)a4;
- (id)_makeDontHaveRecoveryTokenButton;
- (void)_dontHaveRecoveryTokenButtonInvoked;
- (void)beginWaitingForValidation;
- (void)deleteBackward;
- (void)endWaitingForValidation;
- (void)insertText:(id)a3;
- (void)setDelegate:(id)a3;
- (void)textFieldDidChangeSelection:(id)a3;
- (void)textFieldDidEndEditing:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation CDPUIEDPRecoveryTokeniOSEntryViewController

- (CDPUIEDPRecoveryTokeniOSEntryViewController)initWithViewModel:(id)a3 delegate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = [v7 titleText];
  v10 = [MEMORY[0x263F827E8] systemImageNamed:@"key.icloud"];
  v17.receiver = self;
  v17.super_class = (Class)CDPUIEDPRecoveryTokeniOSEntryViewController;
  v11 = [(CDPUIEDPRecoveryTokeniOSEntryViewController *)&v17 initWithTitle:v9 detailText:0 icon:v10 contentLayout:2];

  if (v11)
  {
    objc_storeWeak((id *)&v11->_delegate, v8);
    [v7 setCameraPresenter:v11];
    v12 = [v7 entryField];
    [v12 setDelegate:v11];

    objc_storeStrong((id *)&v11->_viewModel, a3);
    v13 = (void *)[objc_alloc(MEMORY[0x263F823E8]) initWithActivityIndicatorStyle:100];
    [v13 startAnimating];
    uint64_t v14 = [objc_alloc(MEMORY[0x263F824A8]) initWithCustomView:v13];
    spinnerBarButtonItem = v11->_spinnerBarButtonItem;
    v11->_spinnerBarButtonItem = (UIBarButtonItem *)v14;
  }
  return v11;
}

- (void)viewDidLoad
{
  v50[8] = *MEMORY[0x263EF8340];
  v49.receiver = self;
  v49.super_class = (Class)CDPUIEDPRecoveryTokeniOSEntryViewController;
  [(OBBaseWelcomeController *)&v49 viewDidLoad];
  v3 = [(CDPUIEDPRecoveryTokeniOSEntryViewController *)self contentView];
  v4 = [(CDPUIEDPRecoveryTokenEntryViewModel *)self->_viewModel entryField];
  [v3 addSubview:v4];

  v5 = [(CDPUIEDPRecoveryTokeniOSEntryViewController *)self contentView];
  v6 = [(CDPUIEDPRecoveryTokenEntryViewModel *)self->_viewModel toggleEntryModeButton];
  [v5 addSubview:v6];

  id v7 = [(CDPUIEDPRecoveryTokeniOSEntryViewController *)self _makeDontHaveRecoveryTokenButton];
  id v8 = [(CDPUIEDPRecoveryTokeniOSEntryViewController *)self contentView];
  [v8 addSubview:v7];

  v32 = (void *)MEMORY[0x263F08938];
  v48 = [(CDPUIEDPRecoveryTokenEntryViewModel *)self->_viewModel entryField];
  v46 = [v48 topAnchor];
  v47 = [(CDPUIEDPRecoveryTokeniOSEntryViewController *)self contentView];
  v45 = [v47 topAnchor];
  v44 = [v46 constraintEqualToAnchor:v45];
  v50[0] = v44;
  v43 = [(CDPUIEDPRecoveryTokenEntryViewModel *)self->_viewModel entryField];
  v41 = [v43 leadingAnchor];
  v42 = [(CDPUIEDPRecoveryTokeniOSEntryViewController *)self contentView];
  v40 = [v42 leadingAnchor];
  v39 = [v41 constraintEqualToAnchor:v40];
  v50[1] = v39;
  v38 = [(CDPUIEDPRecoveryTokenEntryViewModel *)self->_viewModel entryField];
  v36 = [v38 trailingAnchor];
  v37 = [(CDPUIEDPRecoveryTokeniOSEntryViewController *)self contentView];
  v35 = [v37 trailingAnchor];
  v34 = [v36 constraintEqualToAnchor:v35];
  v50[2] = v34;
  v33 = [(CDPUIEDPRecoveryTokenEntryViewModel *)self->_viewModel toggleEntryModeButton];
  v30 = [v33 topAnchor];
  v31 = [(CDPUIEDPRecoveryTokenEntryViewModel *)self->_viewModel entryField];
  v29 = [v31 bottomAnchor];
  v27 = [v30 constraintEqualToAnchor:v29 constant:8.0];
  v50[3] = v27;
  v26 = [(CDPUIEDPRecoveryTokenEntryViewModel *)self->_viewModel toggleEntryModeButton];
  v24 = [v26 centerXAnchor];
  v25 = [(CDPUIEDPRecoveryTokeniOSEntryViewController *)self contentView];
  v23 = [v25 centerXAnchor];
  v22 = [v24 constraintEqualToAnchor:v23];
  v50[4] = v22;
  v20 = [v7 topAnchor];
  v21 = [(CDPUIEDPRecoveryTokenEntryViewModel *)self->_viewModel toggleEntryModeButton];
  v19 = [v21 bottomAnchor];
  v9 = [v20 constraintEqualToAnchor:v19 constant:8.0];
  v50[5] = v9;
  v28 = v7;
  v10 = [v7 centerXAnchor];
  v11 = [(CDPUIEDPRecoveryTokeniOSEntryViewController *)self contentView];
  v12 = [v11 centerXAnchor];
  v13 = [v10 constraintEqualToAnchor:v12];
  v50[6] = v13;
  uint64_t v14 = [v7 bottomAnchor];
  v15 = [(CDPUIEDPRecoveryTokeniOSEntryViewController *)self contentView];
  v16 = [v15 bottomAnchor];
  objc_super v17 = [v14 constraintEqualToAnchor:v16 constant:-8.0];
  v50[7] = v17;
  v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:v50 count:8];
  [v32 activateConstraints:v18];
}

- (void)beginWaitingForValidation
{
  v3 = [(CDPUIEDPRecoveryTokeniOSEntryViewController *)self view];
  [v3 setUserInteractionEnabled:0];

  spinnerBarButtonItem = self->_spinnerBarButtonItem;
  id v5 = [(OBBaseWelcomeController *)self navigationItem];
  [v5 setRightBarButtonItem:spinnerBarButtonItem];
}

- (void)endWaitingForValidation
{
  id v2 = [(CDPUIEDPRecoveryTokeniOSEntryViewController *)self view];
  [v2 setUserInteractionEnabled:1];
}

- (void)viewDidAppear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CDPUIEDPRecoveryTokeniOSEntryViewController;
  [(OBBaseWelcomeController *)&v7 viewDidAppear:a3];
  v4 = [(CDPUIEDPRecoveryTokeniOSEntryViewController *)self delegate];
  [v4 recoveryTokenEntryViewControllerDidAppear:self];

  id v5 = [(CDPUIEDPRecoveryTokenEntryViewModel *)self->_viewModel entryField];
  [v5 becomeFirstResponder];

  v6 = [MEMORY[0x263F828A0] activeKeyboard];
  objc_msgSend(v6, "setReturnKeyEnabled:", -[CDPUIEDPRecoveryTokenEntryViewModel tokenCanBeValidated](self->_viewModel, "tokenCanBeValidated"));
}

- (id)_makeDontHaveRecoveryTokenButton
{
  objc_initWeak(&location, self);
  id v2 = (void *)MEMORY[0x263F823D0];
  uint64_t v13 = MEMORY[0x263EF8330];
  uint64_t v14 = 3221225472;
  v15 = __79__CDPUIEDPRecoveryTokeniOSEntryViewController__makeDontHaveRecoveryTokenButton__block_invoke;
  v16 = &unk_26433DA10;
  objc_copyWeak(&v17, &location);
  v3 = [v2 actionWithHandler:&v13];
  v4 = objc_msgSend(MEMORY[0x263F824E8], "buttonWithType:primaryAction:", 0, v3, v13, v14, v15, v16);
  [v4 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v5 = CDPLocalizedStringInTable();
  [v4 setTitle:v5 forState:0];

  v6 = (void *)MEMORY[0x263F81708];
  objc_super v7 = [MEMORY[0x263F82B60] mainScreen];
  id v8 = [v7 traitCollection];
  v9 = [v6 preferredFontForTextStyle:*MEMORY[0x263F83570] compatibleWithTraitCollection:v8];
  v10 = [v4 titleLabel];
  [v10 setFont:v9];

  v11 = [MEMORY[0x263F825C8] systemBlueColor];
  [v4 setTitleColor:v11 forState:0];

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

  return v4;
}

void __79__CDPUIEDPRecoveryTokeniOSEntryViewController__makeDontHaveRecoveryTokenButton__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _dontHaveRecoveryTokenButtonInvoked];
}

- (void)_dontHaveRecoveryTokenButtonInvoked
{
  v3 = _CDPLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_2187CF000, v3, OS_LOG_TYPE_DEFAULT, "User tapped Dont Have Token button", v5, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained recoveryTokenEntryViewControllerDidTapForgotToken:self];
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  [a3 resignFirstResponder];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v5 = [(CDPUIEDPRecoveryTokenEntryViewModel *)self->_viewModel entryField];
  v6 = [v5 text];
  [WeakRetained recoveryTokenEntryViewController:self didRequestValidationForToken:v6];

  return 0;
}

- (void)textFieldDidEndEditing:(id)a3
{
  viewModel = self->_viewModel;
  id v7 = [a3 text];
  id v5 = [(CDPUIEDPRecoveryTokenEntryViewModel *)viewModel formattedFinalText:v7];
  v6 = [(CDPUIEDPRecoveryTokenEntryViewModel *)self->_viewModel entryField];
  [v6 setText:v5];
}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v8 = a5;
  BOOL v9 = [(CDPUIEDPRecoveryTokenEntryViewModel *)self->_viewModel canEnterTextWithoutModification:v8];
  if (!v9)
  {
    BOOL v10 = [(CDPUIEDPRecoveryTokenEntryViewModel *)self->_viewModel canEnterText:v8];
    v11 = _CDPLogSystem();
    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG);
    if (v10)
    {
      if (v12) {
        -[CDPUIEDPRecoveryTokeniOSEntryViewController textField:shouldChangeCharactersInRange:replacementString:]();
      }

      -[CDPUIEDPRecoveryTokenEntryViewModel processEnteredText:inRange:](self->_viewModel, "processEnteredText:inRange:", v8, location, length);
    }
    else
    {
      if (v12) {
        -[CDPUIEDPRecoveryTokeniOSEntryViewController textField:shouldChangeCharactersInRange:replacementString:]();
      }
    }
  }

  return v9;
}

- (void)textFieldDidChangeSelection:(id)a3
{
  objc_msgSend(MEMORY[0x263F828A0], "activeKeyboard", a3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setReturnKeyEnabled:", -[CDPUIEDPRecoveryTokenEntryViewModel tokenCanBeValidated](self->_viewModel, "tokenCanBeValidated"));
}

- (BOOL)hasText
{
  return [(CDPUIEDPRecoveryTokenEntryViewModel *)self->_viewModel hasText];
}

- (void)insertText:(id)a3
{
}

- (void)deleteBackward
{
}

- (CDPUIEDPRecoveryTokenEntryViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CDPUIEDPRecoveryTokenEntryViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_spinnerBarButtonItem, 0);

  objc_storeStrong((id *)&self->_viewModel, 0);
}

- (void)textField:shouldChangeCharactersInRange:replacementString:.cold.1()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_0(&dword_2187CF000, v0, v1, "shouldChangeCharactersInRange: Valid input in range (%ld, %ld), just need to format", v2, v3);
}

- (void)textField:shouldChangeCharactersInRange:replacementString:.cold.2()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_0(&dword_2187CF000, v0, v1, "shouldChangeCharactersInRange: ignoring invalid input in range (%ld, %ld)", v2, v3);
}

@end