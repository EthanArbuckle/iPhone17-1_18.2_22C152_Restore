@interface CDPUICustodianCodeEntryViewController
- (BOOL)showSimplePINCancelButtonOnLeft;
- (BOOL)simplePIN;
- (BOOL)validatePIN:(id)a3;
- (CDPUICustodianCodeEntryViewController)initWithViewModel:(id)a3 cdpContext:(id)a4;
- (CGSize)preferredContentSize;
- (id)_makeViewDidAppearEvent;
- (id)pinInstructionsPrompt;
- (id)stringsBundle;
- (void)_disableUserInteractionAndStartSpinner;
- (void)_enableUserInteractionAndStopSpinner;
- (void)didAcceptEnteredPIN:(id)a3;
- (void)setPane:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation CDPUICustodianCodeEntryViewController

- (CDPUICustodianCodeEntryViewController)initWithViewModel:(id)a3 cdpContext:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)CDPUICustodianCodeEntryViewController;
  v9 = [(DevicePINController *)&v17 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_viewModel, a3);
    objc_storeStrong((id *)&v10->_cdpContext, a4);
    v11 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:@"CDPUICustodianCodeEntry" target:0 set:0 get:0 detail:0 cell:13 edit:0];
    [v11 setEditPaneClass:objc_opt_class()];
    [(DevicePINController *)v10 setSpecifier:v11];
    [(DevicePINController *)v10 setMode:3];
    [(DevicePINController *)v10 setShouldDismissWhenDone:1];
    [(DevicePINController *)v10 setHidesCancelButton:0];
    [(DevicePINController *)v10 setHidesNavigationButtons:1];
    [(DevicePINController *)v10 setPinDelegate:v10];
    [(DevicePINController *)v10 setPinLength:6];
    [(DevicePINController *)v10 setNumericPIN:1];
    v12 = [MEMORY[0x263F5FBC0] appearance];
    v13 = [MEMORY[0x263F825C8] labelColor];
    [v12 setTextColor:v13];

    v14 = [MEMORY[0x263F5FBC0] appearance];
    v15 = [MEMORY[0x263F825C8] systemBackgroundColor];
    [v14 setBackgroundColor:v15];
  }
  return v10;
}

- (void)viewDidAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CDPUICustodianCodeEntryViewController;
  [(DevicePINController *)&v6 viewDidAppear:a3];
  v4 = [MEMORY[0x263F34338] rtcAnalyticsReporter];
  v5 = [(CDPUICustodianCodeEntryViewController *)self _makeViewDidAppearEvent];
  [v4 sendEvent:v5];
}

- (void)viewWillAppear:(BOOL)a3
{
  v10.receiver = self;
  v10.super_class = (Class)CDPUICustodianCodeEntryViewController;
  [(DevicePINController *)&v10 viewWillAppear:a3];
  v4 = [(CDPUICustodianCodeEntryViewController *)self navigationItem];
  [v4 setTitle:&stru_26C9EBCA0];

  v5 = [(CDPUICustodianCodeEntryViewController *)self navigationController];
  objc_super v6 = [v5 viewControllers];
  id v7 = [v6 firstObject];

  if (v7 == self)
  {
    id v8 = [(CDPUICustodianCodeEntryViewController *)self navigationController];
    v9 = [v8 navigationBar];
    [v9 _setBackgroundOpacity:0.0];
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CDPUICustodianCodeEntryViewController;
  [(DevicePINController *)&v4 viewDidDisappear:a3];
  [(CDPUICustodianCodeEntryViewController *)self _enableUserInteractionAndStopSpinner];
}

- (id)_makeViewDidAppearEvent
{
  v3 = [MEMORY[0x263F202A8] analyticsEventWithContext:self->_cdpContext eventName:*MEMORY[0x263F346D8] category:*MEMORY[0x263F34830]];
  objc_super v4 = [MEMORY[0x263EFF980] array];
  v5 = [(CDPUICustodianCodeEntryViewController *)self navigationItem];
  objc_super v6 = [v5 backBarButtonItem];

  if (v6)
  {
    id v7 = (void *)MEMORY[0x263F34850];
  }
  else
  {
    id v8 = [(CDPUICustodianCodeEntryViewController *)self navigationItem];
    v9 = [v8 leftBarButtonItem];

    if (!v9) {
      goto LABEL_6;
    }
    id v7 = (void *)MEMORY[0x263F34858];
  }
  [v4 addObject:*v7];
LABEL_6:
  objc_super v10 = [(CDPUICodeEntryViewModel *)self->_viewModel escapeOffer];
  v11 = [v10 titleTelemetryKey];

  if (v11)
  {
    v12 = [(CDPUICodeEntryViewModel *)self->_viewModel escapeOffer];
    v13 = [v12 titleTelemetryKey];
    [v4 addObject:v13];
  }
  if ([v4 count])
  {
    v14 = objc_msgSend(v4, "aaf_arrayAsCommaSeperatedString");
    [v3 setObject:v14 forKeyedSubscript:*MEMORY[0x263F345E8]];
  }

  return v3;
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
  v5.super_class = (Class)CDPUICustodianCodeEntryViewController;
  [(DevicePINController *)&v5 setPane:v4];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v4 setViewModel:self->_viewModel];
  }
}

- (id)pinInstructionsPrompt
{
  if (self->_pinInstructions) {
    return self->_pinInstructions;
  }
  else {
    return &stru_26C9EBCA0;
  }
}

- (void)didAcceptEnteredPIN:(id)a3
{
}

- (BOOL)validatePIN:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(PSDetailController *)self pane];
  [v5 resignFirstResponder];

  objc_super v6 = [(CDPUICodeEntryViewModel *)self->_viewModel codeEnteredAction];

  if (v6)
  {
    [(CDPUICustodianCodeEntryViewController *)self _disableUserInteractionAndStartSpinner];
    id v7 = [(CDPUICodeEntryViewModel *)self->_viewModel codeEnteredAction];
    char v8 = ((uint64_t (**)(void, id))v7)[2](v7, v4);

    if ((v8 & 1) == 0)
    {
      v9 = [(PSDetailController *)self pane];
      [v9 becomeFirstResponder];

      CDPLocalizedString();
      objc_super v10 = (NSString *)objc_claimAutoreleasedReturnValue();
      pinInstructions = self->_pinInstructions;
      self->_pinInstructions = v10;
    }
    [(CDPUICustodianCodeEntryViewController *)self _enableUserInteractionAndStopSpinner];
  }
  else
  {
    char v8 = 1;
  }

  return v8;
}

- (void)_disableUserInteractionAndStartSpinner
{
  double v3 = [MEMORY[0x263F5FBF8] sharedSpinnerManager];
  id v4 = [(CDPUICustodianCodeEntryViewController *)self navigationItem];
  [v3 startAnimatingInNavItem:v4 forIdentifier:@"CDPUICustodianCodeEntry" hideBackButton:1];

  id v5 = [(CDPUICustodianCodeEntryViewController *)self view];
  [v5 setUserInteractionEnabled:0];
}

- (void)_enableUserInteractionAndStopSpinner
{
  double v2 = [(CDPUICustodianCodeEntryViewController *)self view];
  [v2 setUserInteractionEnabled:1];

  id v3 = [MEMORY[0x263F5FBF8] sharedSpinnerManager];
  [v3 stopAnimatingForIdentifier:@"CDPUICustodianCodeEntry"];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cdpContext, 0);
  objc_storeStrong((id *)&self->_pinInstructions, 0);

  objc_storeStrong((id *)&self->_viewModel, 0);
}

@end