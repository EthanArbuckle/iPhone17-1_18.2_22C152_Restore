@interface CDPSingleICSCEntryViewController
- (void)disableUserInteractionAndStartSpinner;
- (void)enableUserInteractionAndStopSpinner;
- (void)forgotSecurityCode;
- (void)viewDidDisappear:(BOOL)a3;
@end

@implementation CDPSingleICSCEntryViewController

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CDPSingleICSCEntryViewController;
  [(PSKeychainSyncTextEntryController *)&v4 viewDidDisappear:a3];
  [(CDPSingleICSCEntryViewController *)self enableUserInteractionAndStopSpinner];
}

- (void)forgotSecurityCode
{
  v3 = (void *)MEMORY[0x263F82418];
  objc_super v4 = CDPLocalizedString();
  v5 = CDPLocalizedString();
  v6 = [v3 alertControllerWithTitle:v4 message:v5 preferredStyle:1];

  v7 = (void *)MEMORY[0x263F82400];
  v8 = CDPLocalizedString();
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __54__CDPSingleICSCEntryViewController_forgotSecurityCode__block_invoke;
  v17[3] = &unk_26433D3A8;
  v17[4] = self;
  v9 = [v7 actionWithTitle:v8 style:0 handler:v17];
  [v6 addAction:v9];

  v10 = (void *)MEMORY[0x263F82400];
  v11 = CDPLocalizedString();
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __54__CDPSingleICSCEntryViewController_forgotSecurityCode__block_invoke_2;
  v16[3] = &unk_26433D3A8;
  v16[4] = self;
  v12 = [v10 actionWithTitle:v11 style:0 handler:v16];
  [v6 addAction:v12];

  v13 = (void *)MEMORY[0x263F82400];
  v14 = CDPLocalizedString();
  v15 = [v13 actionWithTitle:v14 style:1 handler:0];
  [v6 addAction:v15];

  [(CDPSingleICSCEntryViewController *)self presentViewController:v6 animated:1 completion:0];
}

void __54__CDPSingleICSCEntryViewController_forgotSecurityCode__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 keychainSyncController:*(void *)(a1 + 32) didFinishWithResult:@"approveFromOtherDevice" error:0];
}

void __54__CDPSingleICSCEntryViewController_forgotSecurityCode__block_invoke_2(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x263F82418];
  v3 = CDPLocalizedString();
  objc_super v4 = CDPLocalizedString();
  v5 = [v2 alertControllerWithTitle:v3 message:v4 preferredStyle:1];

  v6 = (void *)MEMORY[0x263F82400];
  v7 = CDPLocalizedString();
  v8 = [v6 actionWithTitle:v7 style:1 handler:0];
  [v5 addAction:v8];

  v9 = (void *)MEMORY[0x263F82400];
  v10 = CDPLocalizedString();
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __54__CDPSingleICSCEntryViewController_forgotSecurityCode__block_invoke_3;
  v12[3] = &unk_26433D3A8;
  v12[4] = *(void *)(a1 + 32);
  v11 = [v9 actionWithTitle:v10 style:0 handler:v12];
  [v5 addAction:v11];

  [*(id *)(a1 + 32) presentViewController:v5 animated:1 completion:0];
}

void __54__CDPSingleICSCEntryViewController_forgotSecurityCode__block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) disableUserInteractionAndStartSpinner];
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 keychainSyncController:*(void *)(a1 + 32) didFinishWithResult:@"resetKeychain" error:0];
}

- (void)disableUserInteractionAndStartSpinner
{
  v3 = [MEMORY[0x263F5FBF8] sharedSpinnerManager];
  objc_super v4 = [(CDPSingleICSCEntryViewController *)self navigationItem];
  [v3 startAnimatingInNavItem:v4 forIdentifier:@"singleICSCEntryController" hideBackButton:1];

  id v5 = [(CDPSingleICSCEntryViewController *)self view];
  [v5 setUserInteractionEnabled:0];
}

- (void)enableUserInteractionAndStopSpinner
{
  id v2 = [(CDPSingleICSCEntryViewController *)self view];
  [v2 setUserInteractionEnabled:1];

  id v3 = [MEMORY[0x263F5FBF8] sharedSpinnerManager];
  [v3 stopAnimatingForIdentifier:@"singleICSCEntryController"];
}

@end