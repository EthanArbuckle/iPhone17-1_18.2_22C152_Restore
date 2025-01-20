@interface AIAudiogramConfirmResultsViewController
- (AIAudiogramConfirmResultsViewController)initWithDelegate:(id)a3 audiogram:(id)a4;
- (AIAudiogramConfirmResultsViewControllerDelegate)delegate;
- (BOOL)analyticsDidCompleteIngestion;
- (BOOL)analyticsDidMakeAdjustments;
- (HKAudiogramSample)audiogram;
- (HKHealthStore)healthStore;
- (HKUnitPreferenceController)unitPreferenceController;
- (unint64_t)analyticsClient;
- (unint64_t)analyticsImportSource;
- (void)_saveToHealth:(id)a3;
- (void)setAnalyticsClient:(unint64_t)a3;
- (void)setAnalyticsDidCompleteIngestion:(BOOL)a3;
- (void)setAnalyticsDidMakeAdjustments:(BOOL)a3;
- (void)setAnalyticsImportSource:(unint64_t)a3;
- (void)setAudiogram:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setHealthStore:(id)a3;
- (void)setUnitPreferenceController:(id)a3;
- (void)viewDidLoad;
@end

@implementation AIAudiogramConfirmResultsViewController

- (AIAudiogramConfirmResultsViewController)initWithDelegate:(id)a3 audiogram:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = aiLocString(@"AudiogramIngestionResultsTitle");
  v9 = aiLocString(@"AudiogramIngestionConfirmResultsDetailTitle");
  v12.receiver = self;
  v12.super_class = (Class)AIAudiogramConfirmResultsViewController;
  v10 = [(AIAudiogramConfirmResultsViewController *)&v12 initWithTitle:v8 detailText:v9 symbolName:0 contentLayout:3];

  if (v10)
  {
    [(AIAudiogramConfirmResultsViewController *)v10 setAudiogram:v7];
    [(AIAudiogramConfirmResultsViewController *)v10 setDelegate:v6];
  }

  return v10;
}

- (void)viewDidLoad
{
  v71[1] = *MEMORY[0x263EF8340];
  v60.receiver = self;
  v60.super_class = (Class)AIAudiogramConfirmResultsViewController;
  [(OBBaseWelcomeController *)&v60 viewDidLoad];
  v2 = [(AIAudiogramConfirmResultsViewController *)self healthStore];
  BOOL v3 = v2 == 0;

  if (v3)
  {
    uint64_t v66 = 0;
    v67 = &v66;
    uint64_t v68 = 0x2050000000;
    v4 = (void *)getHKHealthStoreClass_softClass_1;
    uint64_t v69 = getHKHealthStoreClass_softClass_1;
    if (!getHKHealthStoreClass_softClass_1)
    {
      uint64_t v61 = MEMORY[0x263EF8330];
      uint64_t v62 = 3221225472;
      v63 = __getHKHealthStoreClass_block_invoke_1;
      v64 = &unk_265058588;
      v65 = &v66;
      __getHKHealthStoreClass_block_invoke_1((uint64_t)&v61);
      v4 = (void *)v67[3];
    }
    v5 = v4;
    _Block_object_dispose(&v66, 8);
    id v6 = objc_alloc_init(v5);
    [(AIAudiogramConfirmResultsViewController *)self setHealthStore:v6];
  }
  id v7 = [(AIAudiogramConfirmResultsViewController *)self unitPreferenceController];
  BOOL v8 = v7 == 0;

  if (v8)
  {
    uint64_t v66 = 0;
    v67 = &v66;
    uint64_t v68 = 0x2050000000;
    v9 = (void *)getHKUnitPreferenceControllerClass_softClass;
    uint64_t v69 = getHKUnitPreferenceControllerClass_softClass;
    if (!getHKUnitPreferenceControllerClass_softClass)
    {
      uint64_t v61 = MEMORY[0x263EF8330];
      uint64_t v62 = 3221225472;
      v63 = __getHKUnitPreferenceControllerClass_block_invoke;
      v64 = &unk_265058588;
      v65 = &v66;
      __getHKUnitPreferenceControllerClass_block_invoke((uint64_t)&v61);
      v9 = (void *)v67[3];
    }
    v10 = v9;
    _Block_object_dispose(&v66, 8);
    id v11 = [v10 alloc];
    objc_super v12 = [(AIAudiogramConfirmResultsViewController *)self healthStore];
    v13 = (void *)[v11 initWithHealthStore:v12];
    [(AIAudiogramConfirmResultsViewController *)self setUnitPreferenceController:v13];
  }
  uint64_t v66 = 0;
  v67 = &v66;
  uint64_t v68 = 0x2050000000;
  v14 = (void *)getHKSampleTypeUpdateControllerClass_softClass;
  uint64_t v69 = getHKSampleTypeUpdateControllerClass_softClass;
  if (!getHKSampleTypeUpdateControllerClass_softClass)
  {
    uint64_t v61 = MEMORY[0x263EF8330];
    uint64_t v62 = 3221225472;
    v63 = __getHKSampleTypeUpdateControllerClass_block_invoke;
    v64 = &unk_265058588;
    v65 = &v66;
    __getHKSampleTypeUpdateControllerClass_block_invoke((uint64_t)&v61);
    v14 = (void *)v67[3];
  }
  v15 = v14;
  _Block_object_dispose(&v66, 8);
  id v16 = [v15 alloc];
  v17 = [(AIAudiogramConfirmResultsViewController *)self healthStore];
  v58 = (void *)[v16 initWithHealthStore:v17];

  uint64_t v66 = 0;
  v67 = &v66;
  uint64_t v68 = 0x2050000000;
  v18 = (void *)getHKAudiogramChartViewControllerClass_softClass;
  uint64_t v69 = getHKAudiogramChartViewControllerClass_softClass;
  if (!getHKAudiogramChartViewControllerClass_softClass)
  {
    uint64_t v61 = MEMORY[0x263EF8330];
    uint64_t v62 = 3221225472;
    v63 = __getHKAudiogramChartViewControllerClass_block_invoke;
    v64 = &unk_265058588;
    v65 = &v66;
    __getHKAudiogramChartViewControllerClass_block_invoke((uint64_t)&v61);
    v18 = (void *)v67[3];
  }
  v19 = v18;
  _Block_object_dispose(&v66, 8);
  id v20 = [v19 alloc];
  v21 = [(AIAudiogramConfirmResultsViewController *)self unitPreferenceController];
  v22 = (void *)[v20 initWithUnitController:v21 sampleTypeUpdateController:v58 minimumAudiogramHeight:400.0];

  v23 = [v22 view];
  [v23 setTranslatesAutoresizingMaskIntoConstraints:0];

  v24 = [(AIAudiogramConfirmResultsViewController *)self audiogram];
  v71[0] = v24;
  v25 = [MEMORY[0x263EFF8C0] arrayWithObjects:v71 count:1];
  [v22 setAudiograms:v25];

  [v22 setIsAccessibilityElement:1];
  v26 = [(AIAudiogramConfirmResultsViewController *)self contentView];
  v27 = [v22 view];
  [v26 addSubview:v27];

  [(AIAudiogramConfirmResultsViewController *)self addChildViewController:v22];
  v42 = (void *)MEMORY[0x263F08938];
  v57 = [v22 view];
  v54 = [v57 topAnchor];
  v56 = [(AIAudiogramConfirmResultsViewController *)self contentView];
  v55 = [v56 topAnchor];
  v53 = [v54 constraintEqualToAnchor:v55];
  v70[0] = v53;
  v52 = [v22 view];
  v50 = [v52 leadingAnchor];
  v51 = [(AIAudiogramConfirmResultsViewController *)self contentView];
  v49 = [v51 leadingAnchor];
  v48 = [v50 constraintEqualToAnchor:v49 constant:16.0];
  v70[1] = v48;
  v47 = [v22 view];
  v45 = [v47 trailingAnchor];
  v46 = [(AIAudiogramConfirmResultsViewController *)self contentView];
  v44 = [v46 trailingAnchor];
  v43 = [v45 constraintEqualToAnchor:v44 constant:-16.0];
  v70[2] = v43;
  v28 = [v22 view];
  v29 = [v28 bottomAnchor];
  v30 = [(AIAudiogramConfirmResultsViewController *)self contentView];
  v31 = [v30 bottomAnchor];
  v32 = [v29 constraintEqualToAnchor:v31 constant:-16.0];
  v70[3] = v32;
  v33 = [v22 view];
  v34 = [v33 heightAnchor];
  v35 = [v34 constraintEqualToConstant:400.0];
  v70[4] = v35;
  v36 = [MEMORY[0x263EFF8C0] arrayWithObjects:v70 count:5];
  [v42 activateConstraints:v36];

  v37 = [MEMORY[0x263F5B898] boldButton];
  v38 = aiLocString(@"AudiogramIngestionConfirmResultsSaveButton");
  [v37 setTitle:v38 forState:0];

  [v37 addTarget:self action:sel__saveToHealth_ forControlEvents:64];
  v39 = [(AIAudiogramConfirmResultsViewController *)self buttonTray];
  [v39 addButton:v37];

  v40 = [(AIAudiogramConfirmResultsViewController *)self buttonTray];
  v41 = [MEMORY[0x263F825C8] systemBackgroundColor];
  [v40 setBackgroundColor:v41];
}

- (void)_saveToHealth:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v5 = [(AIAudiogramConfirmResultsViewController *)self healthStore];
  id v6 = [(AIAudiogramConfirmResultsViewController *)self audiogram];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __57__AIAudiogramConfirmResultsViewController__saveToHealth___block_invoke;
  v7[3] = &unk_265058F30;
  v7[4] = self;
  objc_copyWeak(&v8, &location);
  [v5 saveObject:v6 withCompletion:v7];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __57__AIAudiogramConfirmResultsViewController__saveToHealth___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    id v6 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __57__AIAudiogramConfirmResultsViewController__saveToHealth___block_invoke_293;
    block[3] = &unk_2650586B8;
    block[4] = *(void *)(a1 + 32);
    dispatch_async(v6, block);

    objc_copyWeak(&v8, (id *)(a1 + 40));
    AXPerformBlockOnMainThread();
    objc_destroyWeak(&v8);
  }
  else
  {
    id v7 = AXLogAudiogram();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __54__AIAudiogramFinalResultViewController__saveToHealth___block_invoke_cold_1((uint64_t)v5, v7);
    }
  }
}

void __57__AIAudiogramConfirmResultsViewController__saveToHealth___block_invoke_293(uint64_t a1)
{
  v11[4] = *MEMORY[0x263EF8340];
  v10[0] = @"adjusted";
  v2 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "analyticsDidMakeAdjustments"));
  v11[0] = v2;
  v10[1] = @"completed";
  BOOL v3 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "analyticsDidCompleteIngestion"));
  v11[1] = v3;
  v10[2] = @"import_source";
  id v4 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "analyticsImportSource"));
  v11[2] = v4;
  v10[3] = @"client";
  id v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "analyticsClient"));
  v11[3] = v5;
  id v6 = [NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:4];

  id v7 = AXLogAggregate();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v8 = 138412290;
    v9 = v6;
    _os_log_impl(&dword_23F0D7000, v7, OS_LOG_TYPE_INFO, "Audiogram Ingestion completed: %@", (uint8_t *)&v8, 0xCu);
  }

  AnalyticsSendEvent();
}

void __57__AIAudiogramConfirmResultsViewController__saveToHealth___block_invoke_312(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) delegate];

  if (v2)
  {
    BOOL v3 = [*(id *)(a1 + 32) delegate];
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    id v5 = [WeakRetained audiogram];
    [v3 audiogramIngestionDidSaveAudiogram:v5];
  }
  id v6 = objc_loadWeakRetained((id *)(a1 + 40));
  [v6 dismissViewControllerAnimated:1 completion:0];
}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (void)setHealthStore:(id)a3
{
}

- (HKUnitPreferenceController)unitPreferenceController
{
  return self->_unitPreferenceController;
}

- (void)setUnitPreferenceController:(id)a3
{
}

- (BOOL)analyticsDidMakeAdjustments
{
  return self->_analyticsDidMakeAdjustments;
}

- (void)setAnalyticsDidMakeAdjustments:(BOOL)a3
{
  self->_analyticsDidMakeAdjustments = a3;
}

- (BOOL)analyticsDidCompleteIngestion
{
  return self->_analyticsDidCompleteIngestion;
}

- (void)setAnalyticsDidCompleteIngestion:(BOOL)a3
{
  self->_analyticsDidCompleteIngestion = a3;
}

- (unint64_t)analyticsImportSource
{
  return self->_analyticsImportSource;
}

- (void)setAnalyticsImportSource:(unint64_t)a3
{
  self->_analyticsImportSource = a3;
}

- (unint64_t)analyticsClient
{
  return self->_analyticsClient;
}

- (void)setAnalyticsClient:(unint64_t)a3
{
  self->_analyticsClient = a3;
}

- (AIAudiogramConfirmResultsViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (AIAudiogramConfirmResultsViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (HKAudiogramSample)audiogram
{
  return self->_audiogram;
}

- (void)setAudiogram:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audiogram, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_unitPreferenceController, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
}

@end