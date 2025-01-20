@interface AAUICodeEntryViewController
- (AAUICodeEntryContext)context;
- (AAUICodeEntryViewController)initWithContext:(id)a3;
- (BOOL)showSimplePINCancelButtonOnLeft;
- (BOOL)simplePIN;
- (BOOL)validatePIN:(id)a3;
- (CGSize)preferredContentSize;
- (id)pinInstructionsPrompt;
- (id)stringsBundle;
- (id)title;
- (void)_disableUserInteractionAndStartSpinner;
- (void)_enableUserInteractionAndStopSpinner;
- (void)_showIncorrectCodeAlert;
- (void)didAcceptEnteredPIN:(id)a3;
- (void)didCancelEnteringPIN;
- (void)setContext:(id)a3;
- (void)setPane:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation AAUICodeEntryViewController

- (AAUICodeEntryViewController)initWithContext:(id)a3
{
  id v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)AAUICodeEntryViewController;
  v6 = [(DevicePINController *)&v16 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_context, a3);
    v8 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:@"AAUICodeEntry" target:0 set:0 get:0 detail:0 cell:13 edit:0];
    [v8 setEditPaneClass:objc_opt_class()];
    [(DevicePINController *)v7 setSpecifier:v8];
    [(DevicePINController *)v7 setMode:3];
    [(DevicePINController *)v7 setShouldDismissWhenDone:1];
    [(DevicePINController *)v7 setHidesCancelButton:0];
    [(DevicePINController *)v7 setHidesNavigationButtons:0];
    [(DevicePINController *)v7 setPinDelegate:v7];
    [(DevicePINController *)v7 setPinLength:6];
    v9 = [MEMORY[0x263F82670] currentDevice];
    BOOL v10 = [v9 userInterfaceIdiom] != 1;

    [(DevicePINController *)v7 setNumericPIN:v10];
    v11 = [MEMORY[0x263F5FBC0] appearance];
    v12 = [MEMORY[0x263F825C8] labelColor];
    [v11 setTextColor:v12];

    v13 = [MEMORY[0x263F5FBC0] appearance];
    v14 = [MEMORY[0x263F825C8] systemBackgroundColor];
    [v13 setBackgroundColor:v14];
  }
  return v7;
}

- (void)viewWillAppear:(BOOL)a3
{
  v9.receiver = self;
  v9.super_class = (Class)AAUICodeEntryViewController;
  [(DevicePINController *)&v9 viewWillAppear:a3];
  v4 = [(AAUICodeEntryViewController *)self navigationController];
  id v5 = [v4 viewControllers];
  v6 = [v5 firstObject];

  if (v6 == self)
  {
    v7 = [(AAUICodeEntryViewController *)self navigationController];
    v8 = [v7 navigationBar];
    [v8 _setBackgroundOpacity:0.0];
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)AAUICodeEntryViewController;
  [(DevicePINController *)&v4 viewDidDisappear:a3];
  [(AAUICodeEntryViewController *)self _enableUserInteractionAndStopSpinner];
}

- (id)stringsBundle
{
  v2 = (void *)MEMORY[0x263F086E0];
  uint64_t v3 = objc_opt_class();
  return (id)[v2 bundleForClass:v3];
}

- (BOOL)showSimplePINCancelButtonOnLeft
{
  return 1;
}

- (CGSize)preferredContentSize
{
  double v2 = *MEMORY[0x263F001B0];
  double v3 = *(double *)(MEMORY[0x263F001B0] + 8);
  result.height = v3;
  result.width = v2;
  return result;
}

- (BOOL)simplePIN
{
  return 1;
}

- (void)setPane:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)AAUICodeEntryViewController;
  [(DevicePINController *)&v5 setPane:v4];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v4 setContext:self->_context];
  }
}

- (id)pinInstructionsPrompt
{
  if (self->_pinInstructions) {
    return self->_pinInstructions;
  }
  else {
    return &stru_26BD39CD8;
  }
}

- (void)didAcceptEnteredPIN:(id)a3
{
}

- (void)didCancelEnteringPIN
{
  double v3 = [(AAUICodeEntryContext *)self->_context cancelEntryAction];

  if (v3)
  {
    id v4 = [(AAUICodeEntryContext *)self->_context cancelEntryAction];
    v4[2]();
  }
}

- (BOOL)validatePIN:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(PSDetailController *)self pane];
  [v5 resignFirstResponder];

  v6 = [(AAUICodeEntryContext *)self->_context codeEnteredAction];

  if (v6)
  {
    [(AAUICodeEntryViewController *)self _disableUserInteractionAndStartSpinner];
    uint64_t v20 = 0;
    v21 = &v20;
    uint64_t v22 = 0x2020000000;
    char v23 = 0;
    uint64_t v16 = 0;
    v17 = &v16;
    uint64_t v18 = 0x2020000000;
    char v19 = 0;
    dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
    v8 = [(AAUICodeEntryContext *)self->_context codeEnteredAction];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __43__AAUICodeEntryViewController_validatePIN___block_invoke;
    v12[3] = &unk_263F936C8;
    v14 = &v20;
    v15 = &v16;
    objc_super v9 = v7;
    v13 = v9;
    ((void (**)(void, id, void *))v8)[2](v8, v4, v12);

    dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
    if (!*((unsigned char *)v21 + 24))
    {
      if (*((unsigned char *)v17 + 24))
      {
        [(AAUICodeEntryViewController *)self dismissViewControllerAnimated:1 completion:0];
        BOOL v10 = 0;
        goto LABEL_7;
      }
      [(AAUICodeEntryViewController *)self _showIncorrectCodeAlert];
    }
    [(AAUICodeEntryViewController *)self _enableUserInteractionAndStopSpinner];
    BOOL v10 = *((unsigned char *)v21 + 24) != 0;
LABEL_7:

    _Block_object_dispose(&v16, 8);
    _Block_object_dispose(&v20, 8);
    goto LABEL_8;
  }
  BOOL v10 = 1;
LABEL_8:

  return v10;
}

intptr_t __43__AAUICodeEntryViewController_validatePIN___block_invoke(uint64_t a1, char a2, char a3)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = a3;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)title
{
  return 0;
}

- (void)_showIncorrectCodeAlert
{
  double v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v4 = [v3 localizedStringForKey:@"INCORRECT_CODE_TRY_AGAIN_ALERT" value:&stru_26BD39CD8 table:@"Localizable"];

  objc_super v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v6 = [v5 localizedStringForKey:@"INCORRECT_CODE_TRY_AGAIN_ALERT_TITLE" value:&stru_26BD39CD8 table:@"Localizable"];

  dispatch_semaphore_t v7 = [MEMORY[0x263F82418] alertWithTitle:v6 message:v4];
  objc_initWeak(&location, self);
  v8 = (void *)MEMORY[0x263F82400];
  objc_super v9 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  BOOL v10 = [v9 localizedStringForKey:@"OK" value:&stru_26BD39CD8 table:@"Localizable"];
  uint64_t v12 = MEMORY[0x263EF8330];
  uint64_t v13 = 3221225472;
  v14 = __54__AAUICodeEntryViewController__showIncorrectCodeAlert__block_invoke;
  v15 = &unk_263F928F0;
  objc_copyWeak(&v16, &location);
  v11 = [v8 actionWithTitle:v10 style:0 handler:&v12];

  objc_msgSend(v7, "addAction:", v11, v12, v13, v14, v15);
  [(AAUICodeEntryViewController *)self presentViewController:v7 animated:1 completion:0];

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

void __54__AAUICodeEntryViewController__showIncorrectCodeAlert__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained pane];
  [v1 becomeFirstResponder];
}

- (void)_disableUserInteractionAndStartSpinner
{
  double v3 = [MEMORY[0x263F5FBF8] sharedSpinnerManager];
  id v4 = [(AAUICodeEntryViewController *)self navigationItem];
  [v3 startAnimatingInNavItem:v4 forIdentifier:@"aauiCodeEntryValidator" hideBackButton:1];

  id v5 = [(AAUICodeEntryViewController *)self view];
  [v5 setUserInteractionEnabled:0];
}

- (void)_enableUserInteractionAndStopSpinner
{
  double v2 = [(AAUICodeEntryViewController *)self view];
  [v2 setUserInteractionEnabled:1];

  id v3 = [MEMORY[0x263F5FBF8] sharedSpinnerManager];
  [v3 stopAnimatingForIdentifier:@"aauiCodeEntryValidator"];
}

- (AAUICodeEntryContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_pinInstructions, 0);
}

@end