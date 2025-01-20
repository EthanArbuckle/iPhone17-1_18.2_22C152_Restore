@interface DADiagnosticsNotesController
- (BOOL)shouldAutorotateToInterfaceOrientation:(int64_t)a3;
- (DADiagnosticsNotesController)init;
- (void)_cancelButtonPressed;
- (void)_disableButtons;
- (void)_enableButtons;
- (void)_okButtonPressed;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation DADiagnosticsNotesController

- (void)_disableButtons
{
  v3 = [(PSDetailController *)self pane];
  [v3 resignFirstResponder];

  v4 = [(PSDetailController *)self pane];
  [v4 setEnabled:0];

  v5 = [(DADiagnosticsNotesController *)self navigationItem];
  v6 = [v5 leftBarButtonItem];
  [v6 setEnabled:0];

  id v8 = [(DADiagnosticsNotesController *)self navigationItem];
  v7 = [v8 rightBarButtonItem];
  [v7 setEnabled:0];
}

- (void)_enableButtons
{
  v3 = [(PSDetailController *)self pane];
  [v3 setEnabled:1];

  v4 = [(DADiagnosticsNotesController *)self navigationItem];
  v5 = [v4 leftBarButtonItem];
  [v5 setEnabled:1];

  id v7 = [(DADiagnosticsNotesController *)self navigationItem];
  v6 = [v7 rightBarButtonItem];
  [v6 setEnabled:1];
}

- (void)_cancelButtonPressed
{
  id v2 = [(DADiagnosticsNotesController *)self parentController];
  [v2 dismiss];
}

- (void)_okButtonPressed
{
  [(DADiagnosticsNotesController *)self _disableButtons];
  v3 = [(DADiagnosticsNotesController *)self specifier];
  v4 = [v3 propertyForKey:@"kDADiagnosticSaveNotesDelegate"];

  v5 = [(PSDetailController *)self pane];
  v6 = [v5 preferenceValue];

  id v7 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __48__DADiagnosticsNotesController__okButtonPressed__block_invoke;
  block[3] = &unk_26492BC28;
  id v11 = v4;
  id v12 = v6;
  v13 = self;
  id v8 = v6;
  id v9 = v4;
  dispatch_async(v7, block);
}

void __48__DADiagnosticsNotesController__okButtonPressed__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) saveNotesInBackground:*(void *)(a1 + 40)];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __48__DADiagnosticsNotesController__okButtonPressed__block_invoke_2;
  block[3] = &unk_26492BC00;
  void block[4] = *(void *)(a1 + 48);
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __48__DADiagnosticsNotesController__okButtonPressed__block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _enableButtons];
  id v2 = [*(id *)(a1 + 32) parentController];
  [v2 dismiss];
}

- (DADiagnosticsNotesController)init
{
  v15.receiver = self;
  v15.super_class = (Class)DADiagnosticsNotesController;
  id v2 = [(DADiagnosticsNotesController *)&v15 init];
  v3 = v2;
  if (v2)
  {
    v4 = [(DADiagnosticsNotesController *)v2 navigationItem];
    v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v6 = [v5 localizedStringForKey:@"DIAG_NOTES_TITLE" value:&stru_26E020258 table:@"Diagnostic"];
    [v4 setTitle:v6];

    id v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v8 = [v7 localizedStringForKey:@"DIAGS_NOTES_PROMPT" value:&stru_26E020258 table:@"Diagnostic"];
    [v4 setPrompt:v8];

    id v9 = (void *)[objc_alloc(MEMORY[0x263F1C468]) initWithBarButtonSystemItem:1 target:v3 action:sel__cancelButtonPressed];
    id v10 = objc_alloc(MEMORY[0x263F1C468]);
    id v11 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v12 = [v11 localizedStringForKey:@"OK" value:&stru_26E020258 table:@"Diagnostic"];
    v13 = (void *)[v10 initWithTitle:v12 style:2 target:v3 action:sel__okButtonPressed];

    [v4 setLeftBarButtonItem:v9];
    [v4 setRightBarButtonItem:v13];
  }
  return v3;
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)DADiagnosticsNotesController;
  [(PSDetailController *)&v5 viewWillAppear:a3];
  v4 = [(PSDetailController *)self pane];
  [v4 becomeFirstResponder];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(int64_t)a3
{
  v4 = [MEMORY[0x263F1C5C0] currentDevice];
  uint64_t v5 = [v4 userInterfaceIdiom];

  return a3 == 1 || (v5 & 0xFFFFFFFFFFFFFFFBLL) == 1;
}

@end