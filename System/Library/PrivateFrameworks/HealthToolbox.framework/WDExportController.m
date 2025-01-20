@interface WDExportController
- (BOOL)exportInProgress;
- (HKApplicationProviding)applicationProvider;
- (WDExportController)initWithProfile:(id)a3;
- (void)_beginExport;
- (void)_cleanUpExport;
- (void)_shareExportFileAndCleanUp;
- (void)setApplicationProvider:(id)a3;
- (void)verifyExportWithPresentingViewController:(id)a3 shareSheetSourceView:(id)a4;
@end

@implementation WDExportController

- (WDExportController)initWithProfile:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)WDExportController;
  v5 = [(WDExportController *)&v9 init];
  if (v5)
  {
    v6 = [[WDExportManager alloc] initWithProfile:v4];
    exportManager = v5->_exportManager;
    v5->_exportManager = v6;
  }
  return v5;
}

- (HKApplicationProviding)applicationProvider
{
  return [(WDExportManager *)self->_exportManager applicationProvider];
}

- (void)setApplicationProvider:(id)a3
{
}

- (BOOL)exportInProgress
{
  return self->_isExporting;
}

- (void)verifyExportWithPresentingViewController:(id)a3 shareSheetSourceView:(id)a4
{
  v6 = (void *)MEMORY[0x263F1C3F8];
  id obj = a4;
  id v7 = a3;
  v8 = WDBundle();
  objc_super v9 = [v8 localizedStringForKey:@"EXPORT_TITLE" value:&stru_26D2EA890 table:@"WellnessDashboard-Localizable"];
  v10 = WDBundle();
  v11 = [v10 localizedStringForKey:@"EXPORT_PROMPT" value:&stru_26D2EA890 table:@"WellnessDashboard-Localizable"];
  v12 = [v6 alertControllerWithTitle:v9 message:v11 preferredStyle:1];

  v13 = (void *)MEMORY[0x263F1C3F0];
  v14 = WDBundle();
  v15 = [v14 localizedStringForKey:@"CANCEL" value:&stru_26D2EA890 table:@"WellnessDashboard-Localizable"];
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __84__WDExportController_verifyExportWithPresentingViewController_shareSheetSourceView___block_invoke;
  v24[3] = &unk_26458DFA8;
  v24[4] = self;
  v16 = [v13 actionWithTitle:v15 style:1 handler:v24];

  [v12 addAction:v16];
  v17 = (void *)MEMORY[0x263F1C3F0];
  v18 = WDBundle();
  v19 = [v18 localizedStringForKey:@"EXPORT_YES" value:&stru_26D2EA890 table:@"WellnessDashboard-Localizable"];
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __84__WDExportController_verifyExportWithPresentingViewController_shareSheetSourceView___block_invoke_2;
  v23[3] = &unk_26458DFA8;
  v23[4] = self;
  v20 = [v17 actionWithTitle:v19 style:0 handler:v23];

  [v12 addAction:v20];
  objc_storeWeak((id *)&self->_exportSourceView, obj);

  id v21 = objc_storeWeak((id *)&self->_exportPresentingViewController, v7);
  [v7 presentViewController:v12 animated:1 completion:0];
}

id __84__WDExportController_verifyExportWithPresentingViewController_shareSheetSourceView___block_invoke(uint64_t a1)
{
  objc_storeWeak((id *)(*(void *)(a1 + 32) + 48), 0);
  v2 = (id *)(*(void *)(a1 + 32) + 56);

  return objc_storeWeak(v2, 0);
}

uint64_t __84__WDExportController_verifyExportWithPresentingViewController_shareSheetSourceView___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _beginExport];
}

- (void)_beginExport
{
  self->_isExporting = 1;
  v3 = (void *)MEMORY[0x263F1C3F8];
  id v4 = WDBundle();
  v5 = [v4 localizedStringForKey:@"EXPORT_PREPARING_TITLE" value:&stru_26D2EA890 table:@"WellnessDashboard-Localizable"];
  v6 = WDBundle();
  id v7 = [v6 localizedStringForKey:@"EXPORT_PREPARING_MESSAGE" value:&stru_26D2EA890 table:@"WellnessDashboard-Localizable"];
  v8 = [v3 alertControllerWithTitle:v5 message:v7 preferredStyle:1];

  objc_super v9 = (void *)MEMORY[0x263F1C3F0];
  v10 = WDBundle();
  v11 = [v10 localizedStringForKey:@"CANCEL" value:&stru_26D2EA890 table:@"WellnessDashboard-Localizable"];
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __34__WDExportController__beginExport__block_invoke;
  v21[3] = &unk_26458DFA8;
  v21[4] = self;
  v12 = [v9 actionWithTitle:v11 style:1 handler:v21];

  [v8 addAction:v12];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_exportPresentingViewController);
  [WeakRetained presentViewController:v8 animated:1 completion:0];

  objc_initWeak(&location, self);
  v14 = [(WDExportController *)self applicationProvider];
  v15 = [v14 application];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __34__WDExportController__beginExport__block_invoke_2;
  v18[3] = &unk_26458DD60;
  objc_copyWeak(&v19, &location);
  v18[4] = self;
  self->_backgroundTask = [v15 beginBackgroundTaskWithName:@"Export" expirationHandler:v18];

  exportManager = self->_exportManager;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __34__WDExportController__beginExport__block_invoke_3;
  v17[3] = &unk_26458DFD0;
  v17[4] = self;
  [(WDExportManager *)exportManager createExportFileWithCompletion:v17];
  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

uint64_t __34__WDExportController__beginExport__block_invoke(uint64_t a1, void *a2)
{
  a2;
  v3 = *(void **)(a1 + 32);
  uint64_t v4 = v3[3];
  if (v4 == 1)
  {
    [v3 _shareExportFileAndCleanUp];
  }
  else if (!v4)
  {
    v3[3] = 2;
    [*(id *)(*(void *)(a1 + 32) + 8) cancelCurrentExport];
    v5 = (void *)MEMORY[0x263F1C3F8];
    v6 = WDBundle();
    id v7 = [v6 localizedStringForKey:@"EXPORT_CANCELING_TITLE" value:&stru_26D2EA890 table:@"WellnessDashboard-Localizable"];
    v8 = [v5 alertControllerWithTitle:v7 message:0 preferredStyle:1];

    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 56));
    [WeakRetained presentViewController:v8 animated:1 completion:0];
  }

  return MEMORY[0x270F9A758]();
}

void __34__WDExportController__beginExport__block_invoke_2(uint64_t a1)
{
  NSLog(&cfstr_BackgroundHand.isa);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = [WeakRetained applicationProvider];
  v3 = [v2 application];
  [v3 endBackgroundTask:*(void *)(*(void *)(a1 + 32) + 16)];

  WeakRetained[2] = *MEMORY[0x263F1D108];
}

void __34__WDExportController__beginExport__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __34__WDExportController__beginExport__block_invoke_4;
  v5[3] = &unk_26458DB58;
  v5[4] = *(void *)(a1 + 32);
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x263EF83A0], v5);
}

void __34__WDExportController__beginExport__block_invoke_4(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = v2[3];
  if (v3 == 2)
  {
    [v2 _cleanUpExport];
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 56));
    id v7 = WeakRetained;
    uint64_t v9 = MEMORY[0x263EF8330];
    uint64_t v10 = 3221225472;
    v11 = __34__WDExportController__beginExport__block_invoke_6;
    v12 = &unk_26458DC98;
    uint64_t v13 = *(void *)(a1 + 32);
    v8 = &v9;
    goto LABEL_6;
  }
  if (!v3)
  {
    v2[3] = 1;
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 32), *(id *)(a1 + 40));
    id v4 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 56));
    v5 = [v4 presentedViewController];

    if (v5)
    {
      id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 56));
      id v7 = WeakRetained;
      uint64_t v14 = MEMORY[0x263EF8330];
      uint64_t v15 = 3221225472;
      v16 = __34__WDExportController__beginExport__block_invoke_5;
      v17 = &unk_26458DC98;
      uint64_t v18 = *(void *)(a1 + 32);
      v8 = &v14;
LABEL_6:
      objc_msgSend(WeakRetained, "dismissViewControllerAnimated:completion:", 1, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18);
    }
  }
}

uint64_t __34__WDExportController__beginExport__block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) _shareExportFileAndCleanUp];
}

id __34__WDExportController__beginExport__block_invoke_6(uint64_t a1)
{
  return objc_storeWeak((id *)(*(void *)(a1 + 32) + 56), 0);
}

- (void)_shareExportFileAndCleanUp
{
  v31[1] = *MEMORY[0x263EF8340];
  if (self->_exportFileURL)
  {
    uint64_t v3 = objc_alloc_init(WDExportSource);
    [(WDExportSource *)v3 setUrl:self->_exportFileURL];
    id v4 = WDBundle();
    v5 = [v4 localizedStringForKey:@"EXPORT_SUBJECT" value:&stru_26D2EA890 table:@"WellnessDashboard-Localizable"];
    [(WDExportSource *)v3 setSubject:v5];

    id v6 = objc_alloc(MEMORY[0x263F1C3E8]);
    v31[0] = v3;
    id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v31 count:1];
    v8 = (void *)[v6 initWithActivityItems:v7 applicationActivities:0];

    uint64_t v9 = [v8 popoverPresentationController];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_exportSourceView);
    [v9 setSourceView:WeakRetained];

    uint64_t v11 = *MEMORY[0x263F1CFD8];
    v30[0] = @"com.apple.Health.ShareExtension";
    v30[1] = v11;
    uint64_t v12 = *MEMORY[0x263F1D000];
    v30[2] = *MEMORY[0x263F1CFF0];
    v30[3] = v12;
    uint64_t v13 = *MEMORY[0x263F1CFA8];
    v30[4] = *MEMORY[0x263F1D008];
    v30[5] = v13;
    uint64_t v14 = *MEMORY[0x263F1CF98];
    v30[6] = *MEMORY[0x263F1D010];
    v30[7] = v14;
    uint64_t v15 = *MEMORY[0x263F1CFF8];
    v30[8] = *MEMORY[0x263F1CFE0];
    v30[9] = v15;
    v30[10] = *MEMORY[0x263F1CFE8];
    v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v30 count:11];
    [v8 setExcludedActivityTypes:v16];

    v29[0] = MEMORY[0x263EF8330];
    v29[1] = 3221225472;
    v29[2] = __48__WDExportController__shareExportFileAndCleanUp__block_invoke;
    v29[3] = &unk_26458DFF8;
    v29[4] = self;
    [v8 setCompletionWithItemsHandler:v29];
    id v17 = objc_loadWeakRetained((id *)&self->_exportPresentingViewController);
    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    v28[2] = __48__WDExportController__shareExportFileAndCleanUp__block_invoke_2;
    v28[3] = &unk_26458DC98;
    v28[4] = self;
    [v17 presentViewController:v8 animated:1 completion:v28];
  }
  else
  {
    uint64_t v18 = (void *)MEMORY[0x263F1C3F8];
    id v19 = WDBundle();
    v20 = [v19 localizedStringForKey:@"EXPORT_TITLE" value:&stru_26D2EA890 table:@"WellnessDashboard-Localizable"];
    id v21 = WDBundle();
    v22 = [v21 localizedStringForKey:@"EXPORT_NO_DATA" value:&stru_26D2EA890 table:@"WellnessDashboard-Localizable"];
    uint64_t v3 = [v18 alertControllerWithTitle:v20 message:v22 preferredStyle:1];

    v23 = (void *)MEMORY[0x263F1C3F0];
    v24 = WDBundle();
    v25 = [v24 localizedStringForKey:@"OK" value:&stru_26D2EA890 table:@"WellnessDashboard-Localizable"];
    v8 = [v23 actionWithTitle:v25 style:1 handler:0];

    [(WDExportSource *)v3 addAction:v8];
    id v26 = objc_loadWeakRetained((id *)&self->_exportPresentingViewController);
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = __48__WDExportController__shareExportFileAndCleanUp__block_invoke_3;
    v27[3] = &unk_26458DC98;
    v27[4] = self;
    [v26 presentViewController:v3 animated:1 completion:v27];

    [(WDExportController *)self _cleanUpExport];
  }
}

uint64_t __48__WDExportController__shareExportFileAndCleanUp__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _cleanUpExport];
}

id __48__WDExportController__shareExportFileAndCleanUp__block_invoke_2(uint64_t a1)
{
  objc_storeWeak((id *)(*(void *)(a1 + 32) + 48), 0);
  v2 = (id *)(*(void *)(a1 + 32) + 56);

  return objc_storeWeak(v2, 0);
}

id __48__WDExportController__shareExportFileAndCleanUp__block_invoke_3(uint64_t a1)
{
  return objc_storeWeak((id *)(*(void *)(a1 + 32) + 56), 0);
}

- (void)_cleanUpExport
{
  self->_isExporting = 0;
  exportFileURL = self->_exportFileURL;
  self->_exportResult = 0;
  self->_exportFileURL = 0;

  id v4 = [(WDExportController *)self applicationProvider];
  v5 = [v4 application];
  [v5 endBackgroundTask:self->_backgroundTask];

  self->_backgroundTask = *MEMORY[0x263F1D108];
  exportManager = self->_exportManager;

  [(WDExportManager *)exportManager cleanupExportFilesWithError:0];
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_exportPresentingViewController);
  objc_destroyWeak((id *)&self->_exportSourceView);
  objc_storeStrong((id *)&self->_exportFileURL, 0);

  objc_storeStrong((id *)&self->_exportManager, 0);
}

@end