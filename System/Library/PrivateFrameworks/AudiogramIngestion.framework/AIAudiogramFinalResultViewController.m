@interface AIAudiogramFinalResultViewController
- (AIAudiogramConfirmResultsViewControllerDelegate)audiogramConfirmationDelegate;
- (AIAudiogramFinalResultViewController)initWithAudiogram:(id)a3 selectedFrequencies:(id)a4 audiogramConfirmationDelegate:(id)a5 audiogramManualIngestionDelegate:(id)a6;
- (AIAudiogramManualIngestionDelegate)audiogramManualIngestionDelegate;
- (BOOL)_isAudiogramValid;
- (BOOL)analyticsDidCompleteIngestion;
- (BOOL)analyticsDidMakeAdjustments;
- (BOOL)didAddBackgroundLayer;
- (HKAudiogramSample)audiogram;
- (HKHealthStore)healthStore;
- (NSArray)frequencies;
- (NSDate)initialDate;
- (NSIndexPath)activeIndexPath;
- (NSLayoutConstraint)tableViewHeightConstraint;
- (NSNumber)maxLeftHearingLevelWidth;
- (NSNumber)maxRightHearingLevelWidth;
- (OBBoldTrayButton)doneButton;
- (UIStackView)stackView;
- (UITableView)tableView;
- (UIViewController)chartViewController;
- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (unint64_t)analyticsClient;
- (unint64_t)analyticsImportSource;
- (void)_cancelTapped:(id)a3;
- (void)_editFrequencyTapped:(id)a3;
- (void)_saveToHealth:(id)a3;
- (void)_updateMaxHearingLevelWidth;
- (void)_updateTableViewHeight;
- (void)contentCategoryDidChange:(id)a3;
- (void)dateCellDidPickDate:(id)a3;
- (void)enableDoneButton;
- (void)reloadAudiogram:(id)a3;
- (void)setActiveIndexPath:(id)a3;
- (void)setAnalyticsClient:(unint64_t)a3;
- (void)setAnalyticsDidCompleteIngestion:(BOOL)a3;
- (void)setAnalyticsDidMakeAdjustments:(BOOL)a3;
- (void)setAnalyticsImportSource:(unint64_t)a3;
- (void)setAudiogram:(id)a3;
- (void)setAudiogramConfirmationDelegate:(id)a3;
- (void)setAudiogramManualIngestionDelegate:(id)a3;
- (void)setChartViewController:(id)a3;
- (void)setDidAddBackgroundLayer:(BOOL)a3;
- (void)setDoneButton:(id)a3;
- (void)setFrequencies:(id)a3;
- (void)setHealthStore:(id)a3;
- (void)setInitialDate:(id)a3;
- (void)setMaxLeftHearingLevelWidth:(id)a3;
- (void)setMaxRightHearingLevelWidth:(id)a3;
- (void)setStackView:(id)a3;
- (void)setTableView:(id)a3;
- (void)setTableViewHeightConstraint:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)updateFrequencies:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation AIAudiogramFinalResultViewController

- (AIAudiogramFinalResultViewController)initWithAudiogram:(id)a3 selectedFrequencies:(id)a4 audiogramConfirmationDelegate:(id)a5 audiogramManualIngestionDelegate:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v39.receiver = self;
  v39.super_class = (Class)AIAudiogramFinalResultViewController;
  v14 = [(AIAudiogramFinalResultViewController *)&v39 initWithTitle:&stru_26F2D3B98 detailText:0 symbolName:0 contentLayout:3];
  v15 = v14;
  if (v14)
  {
    [(AIAudiogramFinalResultViewController *)v14 setAudiogramConfirmationDelegate:v12];
    [(AIAudiogramFinalResultViewController *)v15 setAudiogramManualIngestionDelegate:v13];
    [(AIAudiogramFinalResultViewController *)v15 setFrequencies:v11];
    [(AIAudiogramFinalResultViewController *)v15 setAudiogram:v10];
    uint64_t v45 = 0;
    v46 = &v45;
    uint64_t v47 = 0x2050000000;
    v16 = (void *)getHKHealthStoreClass_softClass_0;
    uint64_t v48 = getHKHealthStoreClass_softClass_0;
    if (!getHKHealthStoreClass_softClass_0)
    {
      uint64_t v40 = MEMORY[0x263EF8330];
      uint64_t v41 = 3221225472;
      v42 = __getHKHealthStoreClass_block_invoke_0;
      v43 = &unk_265058588;
      v44 = &v45;
      __getHKHealthStoreClass_block_invoke_0((uint64_t)&v40);
      v16 = (void *)v46[3];
    }
    v17 = v16;
    _Block_object_dispose(&v45, 8);
    id v18 = objc_alloc_init(v17);
    [(AIAudiogramFinalResultViewController *)v15 setHealthStore:v18];

    uint64_t v45 = 0;
    v46 = &v45;
    uint64_t v47 = 0x2050000000;
    v19 = (void *)getHKSingleAudiogramChartViewControllerClass_softClass_0;
    uint64_t v48 = getHKSingleAudiogramChartViewControllerClass_softClass_0;
    if (!getHKSingleAudiogramChartViewControllerClass_softClass_0)
    {
      uint64_t v40 = MEMORY[0x263EF8330];
      uint64_t v41 = 3221225472;
      v42 = __getHKSingleAudiogramChartViewControllerClass_block_invoke_0;
      v43 = &unk_265058588;
      v44 = &v45;
      __getHKSingleAudiogramChartViewControllerClass_block_invoke_0((uint64_t)&v40);
      v19 = (void *)v46[3];
    }
    v20 = v19;
    _Block_object_dispose(&v45, 8);
    id v21 = [v20 alloc];
    v22 = [(AIAudiogramFinalResultViewController *)v15 healthStore];
    v23 = [(AIAudiogramFinalResultViewController *)v15 audiogram];
    v24 = (void *)[v21 initWithHealthStore:v22 staticAudiogram:v23 selectedFrequency:0];
    [(AIAudiogramFinalResultViewController *)v15 setChartViewController:v24];

    v25 = [(AIAudiogramFinalResultViewController *)v15 chartViewController];
    v26 = [v25 view];
    v27 = [MEMORY[0x263F825C8] systemBackgroundColor];
    [v26 setBackgroundColor:v27];

    v28 = [MEMORY[0x263F5B898] boldButton];
    [(AIAudiogramFinalResultViewController *)v15 setDoneButton:v28];

    v29 = [(AIAudiogramFinalResultViewController *)v15 doneButton];
    v30 = aiLocString(@"AudiogramIngestionButtonDone");
    [v29 setTitle:v30 forState:0];

    v31 = [(AIAudiogramFinalResultViewController *)v15 doneButton];
    [v31 addTarget:v15 action:sel__saveToHealth_ forControlEvents:64];

    v32 = [(AIAudiogramFinalResultViewController *)v15 buttonTray];
    v33 = [(AIAudiogramFinalResultViewController *)v15 doneButton];
    [v32 addButton:v33];

    [(AIAudiogramFinalResultViewController *)v15 enableDoneButton];
    id v34 = objc_alloc(MEMORY[0x263F824A8]);
    v35 = aiLocString(@"AudiogramIngestionImportOptionCancel");
    v36 = (void *)[v34 initWithTitle:v35 style:0 target:v15 action:sel__cancelTapped_];

    v37 = [(OBBaseWelcomeController *)v15 navigationItem];
    [v37 setRightBarButtonItem:v36];
  }
  return v15;
}

- (void)_cancelTapped:(id)a3
{
  id v3 = [(AIAudiogramFinalResultViewController *)self audiogramManualIngestionDelegate];
  [v3 cancelButtonTapped];
}

- (void)_editFrequencyTapped:(id)a3
{
  v4 = [AIAudiogramFrequencySelectionViewController alloc];
  v5 = aiLocString(@"AudiogramFrequencyAddRemoveFrequenciesTitle");
  v6 = aiLocString(@"AudiogramFrequencyAddRemoveFrequenciesSubtitle");
  v7 = [(AIAudiogramFinalResultViewController *)self frequencies];
  v8 = [(AIAudiogramFinalResultViewController *)self audiogramManualIngestionDelegate];
  id v10 = [(AIAudiogramFrequencySelectionViewController *)v4 initWithTitle:v5 detailText:v6 selectedFrequencies:v7 delegate:v8 isModal:1];

  v9 = (void *)[objc_alloc(MEMORY[0x263F829B8]) initWithRootViewController:v10];
  [(AIAudiogramFinalResultViewController *)self presentViewController:v9 animated:1 completion:0];
}

- (void)_saveToHealth:(id)a3
{
  if ([(AIAudiogramFinalResultViewController *)self _isAudiogramValid])
  {
    v4 = [(AIAudiogramFinalResultViewController *)self healthStore];
    v5 = [(AIAudiogramFinalResultViewController *)self audiogram];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __54__AIAudiogramFinalResultViewController__saveToHealth___block_invoke;
    v6[3] = &unk_2650587A8;
    v6[4] = self;
    [v4 saveObject:v5 withCompletion:v6];
  }
}

void __54__AIAudiogramFinalResultViewController__saveToHealth___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    v6 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __54__AIAudiogramFinalResultViewController__saveToHealth___block_invoke_300;
    block[3] = &unk_2650586B8;
    block[4] = *(void *)(a1 + 32);
    dispatch_async(v6, block);

    AXPerformBlockOnMainThread();
  }
  else
  {
    v7 = AXLogAudiogram();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __54__AIAudiogramFinalResultViewController__saveToHealth___block_invoke_cold_1((uint64_t)v5, v7);
    }
  }
}

void __54__AIAudiogramFinalResultViewController__saveToHealth___block_invoke_300(uint64_t a1)
{
  v11[4] = *MEMORY[0x263EF8340];
  v10[0] = @"adjusted";
  v2 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "analyticsDidMakeAdjustments"));
  v11[0] = v2;
  v10[1] = @"completed";
  id v3 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "analyticsDidCompleteIngestion"));
  v11[1] = v3;
  v10[2] = @"import_source";
  v4 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "analyticsImportSource"));
  v11[2] = v4;
  v10[3] = @"client";
  id v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "analyticsClient"));
  v11[3] = v5;
  v6 = [NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:4];

  v7 = AXLogAggregate();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v8 = 138412290;
    v9 = v6;
    _os_log_impl(&dword_23F0D7000, v7, OS_LOG_TYPE_INFO, "Audiogram Ingestion completed: %@", (uint8_t *)&v8, 0xCu);
  }

  AnalyticsSendEvent();
}

void __54__AIAudiogramFinalResultViewController__saveToHealth___block_invoke_319(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) audiogramConfirmationDelegate];

  if (v2)
  {
    id v3 = [*(id *)(a1 + 32) audiogramConfirmationDelegate];
    v4 = [*(id *)(a1 + 32) audiogram];
    [v3 audiogramIngestionDidSaveAudiogram:v4];

    id v5 = [*(id *)(a1 + 32) audiogramManualIngestionDelegate];
    [v5 completedAudiogramManualIngestion];
  }
}

- (void)enableDoneButton
{
  id v3 = [(AIAudiogramFinalResultViewController *)self doneButton];
  objc_msgSend(v3, "setEnabled:", -[AIAudiogramFinalResultViewController _isAudiogramValid](self, "_isAudiogramValid"));
}

- (BOOL)_isAudiogramValid
{
  id v3 = [(AIAudiogramFinalResultViewController *)self audiogram];
  if (v3)
  {
    v4 = [(AIAudiogramFinalResultViewController *)self audiogram];
    id v5 = [v4 sensitivityPoints];
    BOOL v6 = [v5 count] != 0;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (void)viewDidLoad
{
  v109[2] = *MEMORY[0x263EF8340];
  v107.receiver = self;
  v107.super_class = (Class)AIAudiogramFinalResultViewController;
  [(OBBaseWelcomeController *)&v107 viewDidLoad];
  id v3 = objc_opt_new();
  [v3 setTextAlignment:1];
  v4 = [MEMORY[0x263F82760] _preferredFontForTextStyle:*MEMORY[0x263F83610] weight:*MEMORY[0x263F83630]];
  [v3 setFont:v4];

  [v3 setAdjustsFontForContentSizeCategory:1];
  [v3 setNumberOfLines:0];
  id v5 = aiLocString(@"AudiogramIngestionFinalResultsTitle");
  v106 = v3;
  [v3 setText:v5];

  BOOL v6 = objc_opt_new();
  [v6 setTextAlignment:1];
  v7 = [MEMORY[0x263F82760] preferredFontForTextStyle:*MEMORY[0x263F83570]];
  [v6 setFont:v7];

  [v6 setAdjustsFontForContentSizeCategory:1];
  [v6 setNumberOfLines:0];
  int v8 = aiLocString(@"AudiogramIngestionFinalResultsSubtitle");
  v105 = v6;
  [v6 setText:v8];

  id v9 = objc_alloc(MEMORY[0x263F82BF8]);
  v109[0] = v3;
  v109[1] = v6;
  id v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v109 count:2];
  id v11 = (void *)[v9 initWithArrangedSubviews:v10];

  [v11 setAxis:1];
  [v11 setSpacing:4.0];
  id v12 = [MEMORY[0x263F825C8] systemBackgroundColor];
  [v11 setBackgroundColor:v12];

  [v11 setLayoutMarginsRelativeArrangement:1];
  objc_msgSend(v11, "setLayoutMargins:", 4.0, 16.0, 4.0, 16.0);
  [v11 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v13 = [(AIAudiogramFinalResultViewController *)self contentView];
  v14 = v11;
  [v13 addSubview:v11];

  v15 = [MEMORY[0x263F08A00] defaultCenter];
  [v15 addObserver:self selector:sel_contentCategoryDidChange_ name:*MEMORY[0x263F83428] object:0];

  v16 = [(AIAudiogramFinalResultViewController *)self chartViewController];
  v17 = [v16 view];
  [v17 setUserInteractionEnabled:0];

  id v18 = [(AIAudiogramFinalResultViewController *)self chartViewController];
  v19 = [v18 view];
  [v19 setTranslatesAutoresizingMaskIntoConstraints:0];

  v20 = [(AIAudiogramFinalResultViewController *)self contentView];
  id v21 = [(AIAudiogramFinalResultViewController *)self chartViewController];
  v22 = [v21 view];
  [v20 addSubview:v22];

  v23 = [(AIAudiogramFinalResultViewController *)self chartViewController];
  [(AIAudiogramFinalResultViewController *)self addChildViewController:v23];

  v24 = [(AIAudiogramFinalResultViewController *)self chartViewController];
  [v24 didMoveToParentViewController:self];

  v25 = [(AIAudiogramFinalResultViewController *)self chartViewController];
  v26 = [v25 view];
  [v26 _setSafeAreaInsetsFrozen:1];

  id v27 = objc_alloc(MEMORY[0x263F82C78]);
  v28 = objc_msgSend(v27, "initWithFrame:style:", 2, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  [(AIAudiogramFinalResultViewController *)self setTableView:v28];

  v29 = [(AIAudiogramFinalResultViewController *)self tableView];
  [v29 setDataSource:self];

  v30 = [(AIAudiogramFinalResultViewController *)self tableView];
  [v30 setDelegate:self];

  v31 = [(AIAudiogramFinalResultViewController *)self tableView];
  [v31 setScrollEnabled:0];

  v32 = [(AIAudiogramFinalResultViewController *)self tableView];
  [v32 setTranslatesAutoresizingMaskIntoConstraints:0];

  v33 = [(AIAudiogramFinalResultViewController *)self tableView];
  id v34 = [MEMORY[0x263F825C8] systemGroupedBackgroundColor];
  [v33 setBackgroundColor:v34];

  v35 = [(AIAudiogramFinalResultViewController *)self tableView];
  [v35 setSectionHeaderTopPadding:8.0];

  v36 = [(AIAudiogramFinalResultViewController *)self contentView];
  v37 = [(AIAudiogramFinalResultViewController *)self tableView];
  [v36 addSubview:v37];

  v38 = [(AIAudiogramFinalResultViewController *)self view];
  objc_super v39 = [MEMORY[0x263F825C8] systemGroupedBackgroundColor];
  [v38 setBackgroundColor:v39];

  v79 = (void *)MEMORY[0x263F08938];
  v102 = [v14 topAnchor];
  v103 = [(AIAudiogramFinalResultViewController *)self contentView];
  v101 = [v103 topAnchor];
  v100 = [v102 constraintEqualToAnchor:v101 constant:-50.0];
  v108[0] = v100;
  v98 = [v14 leadingAnchor];
  v99 = [(AIAudiogramFinalResultViewController *)self view];
  v97 = [v99 leadingAnchor];
  v96 = [v98 constraintEqualToAnchor:v97];
  v108[1] = v96;
  v104 = v14;
  v94 = [v14 trailingAnchor];
  v95 = [(AIAudiogramFinalResultViewController *)self view];
  v93 = [v95 trailingAnchor];
  v92 = [v94 constraintEqualToAnchor:v93];
  v108[2] = v92;
  v91 = [(AIAudiogramFinalResultViewController *)self chartViewController];
  v90 = [v91 view];
  v89 = [v90 topAnchor];
  v88 = [v14 bottomAnchor];
  v87 = [v89 constraintEqualToAnchor:v88];
  v108[3] = v87;
  v86 = [(AIAudiogramFinalResultViewController *)self chartViewController];
  v85 = [v86 view];
  v83 = [v85 leadingAnchor];
  v84 = [(AIAudiogramFinalResultViewController *)self view];
  v82 = [v84 leadingAnchor];
  v81 = [v83 constraintEqualToAnchor:v82];
  v108[4] = v81;
  v80 = [(AIAudiogramFinalResultViewController *)self chartViewController];
  v78 = [v80 view];
  v76 = [v78 trailingAnchor];
  v77 = [(AIAudiogramFinalResultViewController *)self view];
  v75 = [v77 trailingAnchor];
  v74 = [v76 constraintEqualToAnchor:v75];
  v108[5] = v74;
  v73 = [(AIAudiogramFinalResultViewController *)self chartViewController];
  v72 = [v73 view];
  v70 = [v72 heightAnchor];
  v71 = [(AIAudiogramFinalResultViewController *)self view];
  v69 = [v71 heightAnchor];
  v68 = [v70 constraintEqualToAnchor:v69 multiplier:0.4];
  v108[6] = v68;
  v67 = [(AIAudiogramFinalResultViewController *)self tableView];
  v65 = [v67 topAnchor];
  v66 = [(AIAudiogramFinalResultViewController *)self chartViewController];
  v64 = [v66 view];
  v63 = [v64 bottomAnchor];
  v62 = [v65 constraintEqualToAnchor:v63];
  v108[7] = v62;
  v61 = [(AIAudiogramFinalResultViewController *)self tableView];
  v59 = [v61 leadingAnchor];
  v60 = [(AIAudiogramFinalResultViewController *)self view];
  v58 = [v60 leadingAnchor];
  v57 = [v59 constraintEqualToAnchor:v58];
  v108[8] = v57;
  v56 = [(AIAudiogramFinalResultViewController *)self tableView];
  v55 = [v56 trailingAnchor];
  uint64_t v40 = [(AIAudiogramFinalResultViewController *)self view];
  uint64_t v41 = [v40 trailingAnchor];
  v42 = [v55 constraintEqualToAnchor:v41];
  v108[9] = v42;
  v43 = [(AIAudiogramFinalResultViewController *)self tableView];
  v44 = [v43 bottomAnchor];
  uint64_t v45 = [(AIAudiogramFinalResultViewController *)self contentView];
  v46 = [v45 bottomAnchor];
  uint64_t v47 = [v44 constraintEqualToAnchor:v46];
  v108[10] = v47;
  uint64_t v48 = [MEMORY[0x263EFF8C0] arrayWithObjects:v108 count:11];
  [v79 activateConstraints:v48];

  v49 = [(AIAudiogramFinalResultViewController *)self tableView];
  uint64_t v50 = objc_opt_class();
  v51 = +[AIAudiogramFrequencyInputCell reuseIdentifier];
  [v49 registerClass:v50 forCellReuseIdentifier:v51];

  v52 = [(AIAudiogramFinalResultViewController *)self tableView];
  uint64_t v53 = objc_opt_class();
  v54 = +[AIAudiogramV2ResultDateCell reuseIdentifier];
  [v52 registerClass:v53 forCellReuseIdentifier:v54];

  [(AIAudiogramFinalResultViewController *)self _updateMaxHearingLevelWidth];
}

- (void)viewWillAppear:(BOOL)a3
{
  v13.receiver = self;
  v13.super_class = (Class)AIAudiogramFinalResultViewController;
  [(AIAudiogramFinalResultViewController *)&v13 viewWillAppear:a3];
  if (![(AIAudiogramFinalResultViewController *)self didAddBackgroundLayer])
  {
    v4 = [MEMORY[0x263F157E8] layer];
    id v5 = [MEMORY[0x263F825C8] systemBackgroundColor];
    objc_msgSend(v4, "setBackgroundColor:", objc_msgSend(v5, "CGColor"));

    BOOL v6 = [(AIAudiogramFinalResultViewController *)self view];
    [v6 bounds];
    double v8 = v7;
    id v9 = [(AIAudiogramFinalResultViewController *)self view];
    [v9 bounds];
    objc_msgSend(v4, "setFrame:", 0.0, 0.0, v8, v10 * 0.4);

    id v11 = [(AIAudiogramFinalResultViewController *)self view];
    id v12 = [v11 layer];
    [v12 insertSublayer:v4 atIndex:0];

    [(AIAudiogramFinalResultViewController *)self setDidAddBackgroundLayer:1];
  }
}

- (void)contentCategoryDidChange:(id)a3
{
  [(AIAudiogramFinalResultViewController *)self _updateMaxHearingLevelWidth];
  v4 = [(AIAudiogramFinalResultViewController *)self tableView];
  [v4 reloadData];

  [(AIAudiogramFinalResultViewController *)self _updateTableViewHeight];
}

- (void)viewDidLayoutSubviews
{
  [(AIAudiogramFinalResultViewController *)self _updateTableViewHeight];
  v3.receiver = self;
  v3.super_class = (Class)AIAudiogramFinalResultViewController;
  [(OBBaseWelcomeController *)&v3 viewDidLayoutSubviews];
}

- (void)_updateTableViewHeight
{
  [(UITableView *)self->_tableView layoutIfNeeded];
  [(UITableView *)self->_tableView contentSize];
  double v4 = v3 + 100.0;
  id v5 = [(AIAudiogramFinalResultViewController *)self tableViewHeightConstraint];
  if (v5)
  {
  }
  else
  {
    id v9 = [(AIAudiogramFinalResultViewController *)self tableView];

    if (v9)
    {
      double v10 = [(AIAudiogramFinalResultViewController *)self tableView];
      id v11 = [v10 heightAnchor];
      id v12 = [v11 constraintEqualToConstant:v4];
      [(AIAudiogramFinalResultViewController *)self setTableViewHeightConstraint:v12];

      id v13 = [(AIAudiogramFinalResultViewController *)self tableViewHeightConstraint];
      [v13 setActive:1];
      goto LABEL_7;
    }
  }
  BOOL v6 = [(AIAudiogramFinalResultViewController *)self tableViewHeightConstraint];
  [v6 constant];
  double v8 = v7;

  if (v4 == v8) {
    return;
  }
  id v13 = [(AIAudiogramFinalResultViewController *)self tableViewHeightConstraint];
  [v13 setConstant:v4];
LABEL_7:
}

- (void)reloadAudiogram:(id)a3
{
  id v4 = a3;
  [(AIAudiogramFinalResultViewController *)self setAudiogram:v4];
  id v5 = [(AIAudiogramFinalResultViewController *)self chartViewController];
  [v5 updateStaticAudiogram:v4];

  [(AIAudiogramFinalResultViewController *)self _updateMaxHearingLevelWidth];
  BOOL v6 = [(AIAudiogramFinalResultViewController *)self tableView];
  [v6 reloadData];

  [(AIAudiogramFinalResultViewController *)self enableDoneButton];
}

- (void)updateFrequencies:(id)a3
{
  [(AIAudiogramFinalResultViewController *)self setFrequencies:a3];
  id v4 = [(AIAudiogramFinalResultViewController *)self tableView];
  [v4 reloadData];
}

- (void)_updateMaxHearingLevelWidth
{
  v69[1] = *MEMORY[0x263EF8340];
  v57 = [getHKUnitClass_0() decibelHearingLevelUnit];
  uint64_t v3 = aiLocString(@"AudiogramIngestionDecibelAbbreviation");
  uint64_t v68 = *MEMORY[0x263F82270];
  id v4 = [MEMORY[0x263F82760] preferredFontForTextStyle:*MEMORY[0x263F835D0]];
  v69[0] = v4;
  uint64_t v5 = [NSDictionary dictionaryWithObjects:v69 forKeys:&v68 count:1];

  BOOL v6 = NSString;
  double v7 = aiLocString(@"AudiogramIngestionResultsFrequency");
  double v8 = aiLocString(@"AudiogramIngestionResultsNoData");
  v56 = (void *)v3;
  id v9 = objc_msgSend(v6, "stringWithFormat:", v7, v8, v3);

  v49 = v9;
  v55 = (void *)v5;
  [v9 sizeWithAttributes:v5];
  double v11 = v10;
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  uint64_t v50 = self;
  id v12 = [(AIAudiogramFinalResultViewController *)self audiogram];
  id v13 = [v12 sensitivityPoints];

  obuint64_t j = v13;
  uint64_t v53 = [v13 countByEnumeratingWithState:&v62 objects:v67 count:16];
  if (!v53)
  {
    double v14 = 0.0;
    double v15 = 0.0;
    goto LABEL_31;
  }
  uint64_t v52 = *(void *)v63;
  double v14 = 0.0;
  double v15 = 0.0;
  do
  {
    for (uint64_t i = 0; i != v53; ++i)
    {
      if (*(void *)v63 != v52) {
        objc_enumerationMutation(obj);
      }
      v17 = *(void **)(*((void *)&v62 + 1) + 8 * i);
      long long v58 = 0u;
      long long v59 = 0u;
      long long v60 = 0u;
      long long v61 = 0u;
      id v18 = [v17 tests];
      uint64_t v19 = [v18 countByEnumeratingWithState:&v58 objects:v66 count:16];
      if (!v19)
      {

        double v15 = fmax(v15, v11);
        continue;
      }
      uint64_t v20 = v19;
      uint64_t v54 = i;
      char v21 = 0;
      char v22 = 0;
      uint64_t v23 = *(void *)v59;
      double v24 = v15;
      do
      {
        for (uint64_t j = 0; j != v20; ++j)
        {
          if (*(void *)v59 != v23) {
            objc_enumerationMutation(v18);
          }
          v26 = *(void **)(*((void *)&v58 + 1) + 8 * j);
          id v27 = [v26 sensitivity];
          [v27 doubleValueForUnit:v57];
          double v29 = v28;

          v30 = NSString;
          v31 = aiLocString(@"AudiogramIngestionResultsFrequency");
          v32 = [NSNumber numberWithDouble:v29];
          v33 = objc_msgSend(v30, "stringWithFormat:", v31, v32, v56);

          [v33 sizeWithAttributes:v55];
          double v35 = v34;
          uint64_t v36 = [v26 side];
          double v37 = fmax(v14, v35);
          double v38 = fmax(v24, v35);
          if (v36) {
            char v21 = 1;
          }
          else {
            char v22 = 1;
          }
          if (v36) {
            double v14 = v37;
          }
          else {
            double v24 = v38;
          }
        }
        uint64_t v20 = [v18 countByEnumeratingWithState:&v58 objects:v66 count:16];
      }
      while (v20);

      double v15 = fmax(v24, v11);
      if (v21)
      {
        uint64_t i = v54;
        if (v22) {
          goto LABEL_25;
        }
      }
      else
      {
        if (v22)
        {
          double v14 = fmax(v14, v11);
          uint64_t i = v54;
LABEL_25:
          double v15 = v24;
          continue;
        }
        uint64_t i = v54;
      }
    }
    uint64_t v53 = [obj countByEnumeratingWithState:&v62 objects:v67 count:16];
  }
  while (v53);
LABEL_31:

  objc_super v39 = [(AIAudiogramFinalResultViewController *)v50 audiogram];
  uint64_t v40 = [v39 sensitivityPoints];
  uint64_t v41 = [v40 count];
  v42 = [(AIAudiogramFinalResultViewController *)v50 frequencies];
  uint64_t v43 = [v42 count];

  double v44 = fmax(v15, v11);
  double v45 = fmax(v14, v11);
  if (v41 == v43) {
    double v46 = v14;
  }
  else {
    double v46 = v45;
  }
  if (v41 == v43) {
    double v44 = v15;
  }
  uint64_t v47 = [NSNumber numberWithDouble:v44];
  [(AIAudiogramFinalResultViewController *)v50 setMaxLeftHearingLevelWidth:v47];

  uint64_t v48 = [NSNumber numberWithDouble:v46];
  [(AIAudiogramFinalResultViewController *)v50 setMaxRightHearingLevelWidth:v48];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 section])
  {
    uint64_t v47 = 0;
    uint64_t v48 = &v47;
    uint64_t v49 = 0x3032000000;
    uint64_t v50 = __Block_byref_object_copy__1;
    v51 = __Block_byref_object_dispose__1;
    id v52 = 0;
    uint64_t v41 = 0;
    v42 = &v41;
    uint64_t v43 = 0x3032000000;
    double v44 = __Block_byref_object_copy__1;
    double v45 = __Block_byref_object_dispose__1;
    id v46 = 0;
    double v8 = [(AIAudiogramFinalResultViewController *)self frequencies];
    id v9 = objc_msgSend(v8, "objectAtIndex:", objc_msgSend(v7, "row"));

    double v10 = [getHKUnitClass_0() decibelHearingLevelUnit];
    uint64_t v37 = 0;
    double v38 = &v37;
    uint64_t v39 = 0x2020000000;
    char v40 = 0;
    uint64_t v33 = 0;
    double v34 = &v33;
    uint64_t v35 = 0x2020000000;
    char v36 = 0;
    double v11 = [(AIAudiogramFinalResultViewController *)self audiogram];
    id v12 = [v11 sensitivityPoints];
    uint64_t v23 = MEMORY[0x263EF8330];
    uint64_t v24 = 3221225472;
    v25 = __72__AIAudiogramFinalResultViewController_tableView_cellForRowAtIndexPath___block_invoke;
    v26 = &unk_2650587F8;
    id v13 = v9;
    id v27 = v13;
    double v29 = &v47;
    id v14 = v10;
    id v28 = v14;
    v30 = &v37;
    v31 = &v41;
    v32 = &v33;
    [v12 enumerateObjectsUsingBlock:&v23];

    double v15 = +[AIAudiogramFrequencyInputCell reuseIdentifier];
    v16 = [v6 dequeueReusableCellWithIdentifier:v15];

    v17 = [(AIAudiogramFinalResultViewController *)self maxLeftHearingLevelWidth];
    [v16 setLeftEarLabelWidth:v17];

    id v18 = [(AIAudiogramFinalResultViewController *)self maxRightHearingLevelWidth];
    [v16 setRightEarLabelWidth:v18];

    [v16 setFrequency:v13];
    [v16 setLeftHearingLevel:v48[5]];
    [v16 setRightHearingLevel:v42[5]];
    [v16 setLeftEarMasked:*((unsigned __int8 *)v38 + 24)];
    [v16 setRightEarMasked:*((unsigned __int8 *)v34 + 24)];
    [v16 configureLayout];
    [v16 setAccessoryType:1];

    _Block_object_dispose(&v33, 8);
    _Block_object_dispose(&v37, 8);

    _Block_object_dispose(&v41, 8);
    _Block_object_dispose(&v47, 8);
  }
  else
  {
    uint64_t v19 = +[AIAudiogramV2ResultDateCell reuseIdentifier];
    v16 = [v6 dequeueReusableCellWithIdentifier:v19];

    uint64_t v20 = [(AIAudiogramFinalResultViewController *)self audiogramManualIngestionDelegate];
    char v21 = [v20 getPickedDate];
    [v16 setDate:v21];

    [v16 setDelegate:self];
    [v16 setSelectionStyle:0];
    [v16 configureLayout];
  }

  return v16;
}

void __72__AIAudiogramFinalResultViewController_tableView_cellForRowAtIndexPath___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 frequency];
  uint64_t v5 = [getHKUnitClass_0() hertzUnit];
  [v4 doubleValueForUnit:v5];
  double v7 = v6;
  [*(id *)(a1 + 32) doubleValue];
  double v9 = v8;

  if (v7 == v9)
  {
    double v10 = [v3 tests];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __72__AIAudiogramFinalResultViewController_tableView_cellForRowAtIndexPath___block_invoke_2;
    v14[3] = &unk_2650587D0;
    long long v13 = *(_OWORD *)(a1 + 40);
    id v11 = (id)v13;
    long long v12 = *(_OWORD *)(a1 + 56);
    long long v15 = v13;
    long long v16 = v12;
    uint64_t v17 = *(void *)(a1 + 72);
    [v10 enumerateObjectsUsingBlock:v14];
  }
}

void __72__AIAudiogramFinalResultViewController_tableView_cellForRowAtIndexPath___block_invoke_2(void *a1, void *a2)
{
  id v15 = a2;
  if ([v15 side])
  {
    if ([v15 side] != 1) {
      goto LABEL_6;
    }
    id v3 = NSNumber;
    id v4 = [v15 sensitivity];
    [v4 doubleValueForUnit:a1[4]];
    uint64_t v5 = objc_msgSend(v3, "numberWithDouble:");
    uint64_t v6 = *(void *)(a1[7] + 8);
    double v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    char v8 = [v15 masked];
    uint64_t v9 = a1[8];
  }
  else
  {
    double v10 = NSNumber;
    id v11 = [v15 sensitivity];
    [v11 doubleValueForUnit:a1[4]];
    uint64_t v12 = objc_msgSend(v10, "numberWithDouble:");
    uint64_t v13 = *(void *)(a1[5] + 8);
    id v14 = *(void **)(v13 + 40);
    *(void *)(v13 + 40) = v12;

    char v8 = [v15 masked];
    uint64_t v9 = a1[6];
  }
  *(unsigned char *)(*(void *)(v9 + 8) + 24) = v8;
LABEL_6:
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  if (!a4) {
    return 1;
  }
  id v4 = [(AIAudiogramFinalResultViewController *)self frequencies];
  int64_t v5 = [v4 count];

  return v5;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 2;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  [v10 deselectRowAtIndexPath:v6 animated:1];
  if ([v6 section])
  {
    double v7 = [v10 cellForRowAtIndexPath:v6];
    char v8 = [v7 frequency];
    uint64_t v9 = [(AIAudiogramFinalResultViewController *)self audiogramManualIngestionDelegate];
    [v9 didSelectNodeToEditWithSelectedFrequency:v8];
  }
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  return 0;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  return 0.01;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  v47[4] = *MEMORY[0x263EF8340];
  if (a4)
  {
    int64_t v5 = (objc_class *)MEMORY[0x263F82E00];
    id v46 = a3;
    id v6 = [v5 alloc];
    double v7 = objc_msgSend(v6, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    id v8 = objc_alloc_init(MEMORY[0x263F82BF8]);
    [(AIAudiogramFinalResultViewController *)self setStackView:v8];

    uint64_t v9 = [(AIAudiogramFinalResultViewController *)self stackView];
    [v9 setAxis:1];

    id v10 = [(AIAudiogramFinalResultViewController *)self stackView];
    [v10 setTranslatesAutoresizingMaskIntoConstraints:0];

    id v11 = [(AIAudiogramFinalResultViewController *)self stackView];
    [v7 addSubview:v11];

    uint64_t v12 = [MEMORY[0x263F824E8] buttonWithType:1];
    uint64_t v13 = aiLocString(@"AudiogramFrequencyAddRemoveFrequenciesTitle");
    [v12 setTitle:v13 forState:0];

    id v14 = [MEMORY[0x263F82760] preferredFontForTextStyle:*MEMORY[0x263F835B8]];
    id v15 = [v12 titleLabel];
    [v15 setFont:v14];

    long long v16 = [v12 titleLabel];
    [v16 setNumberOfLines:0];

    [v12 setContentHorizontalAlignment:4];
    double v45 = v12;
    [v12 addTarget:self action:sel__editFrequencyTapped_ forControlEvents:64];
    uint64_t v17 = [(AIAudiogramFinalResultViewController *)self stackView];
    [v17 addArrangedSubview:v12];

    char v36 = (void *)MEMORY[0x263F08938];
    double v44 = [(AIAudiogramFinalResultViewController *)self stackView];
    uint64_t v43 = [v44 leadingAnchor];
    v42 = [v7 leadingAnchor];
    uint64_t v41 = [v43 constraintEqualToAnchor:v42 constant:16.0];
    v47[0] = v41;
    char v40 = [(AIAudiogramFinalResultViewController *)self stackView];
    double v38 = [v40 trailingAnchor];
    uint64_t v37 = [v7 trailingAnchor];
    uint64_t v35 = [v38 constraintEqualToAnchor:v37 constant:-16.0];
    v47[1] = v35;
    id v18 = [(AIAudiogramFinalResultViewController *)self stackView];
    uint64_t v19 = [v18 topAnchor];
    uint64_t v20 = v7;
    uint64_t v39 = v7;
    char v21 = [v7 topAnchor];
    char v22 = [v19 constraintEqualToAnchor:v21 constant:14.0];
    v47[2] = v22;
    uint64_t v23 = [(AIAudiogramFinalResultViewController *)self stackView];
    uint64_t v24 = [v23 bottomAnchor];
    v25 = [v20 bottomAnchor];
    v26 = [v24 constraintEqualToAnchor:v25];
    v47[3] = v26;
    id v27 = [MEMORY[0x263EFF8C0] arrayWithObjects:v47 count:4];
    [v36 activateConstraints:v27];

    id v28 = [(AIAudiogramFinalResultViewController *)self stackView];
    [v28 layoutIfNeeded];

    [v46 frame];
    double v30 = v29;

    v31 = self;
    v32 = v39;
    uint64_t v33 = [(AIAudiogramFinalResultViewController *)v31 stackView];
    [v33 frame];
    objc_msgSend(v39, "setFrame:", 0.0, 0.0, v30);
  }
  else
  {
    v32 = 0;
  }
  return v32;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  double result = *MEMORY[0x263F839B8];
  if (!a4) {
    return 0.01;
  }
  return result;
}

- (void)dateCellDidPickDate:(id)a3
{
  id v4 = a3;
  id v5 = [(AIAudiogramFinalResultViewController *)self audiogramManualIngestionDelegate];
  [v5 updateAudiogramDate:v4];
}

- (NSDate)initialDate
{
  return self->_initialDate;
}

- (void)setInitialDate:(id)a3
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

- (UIViewController)chartViewController
{
  return self->_chartViewController;
}

- (void)setChartViewController:(id)a3
{
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (void)setTableView:(id)a3
{
}

- (NSLayoutConstraint)tableViewHeightConstraint
{
  return self->_tableViewHeightConstraint;
}

- (void)setTableViewHeightConstraint:(id)a3
{
}

- (NSIndexPath)activeIndexPath
{
  return self->_activeIndexPath;
}

- (void)setActiveIndexPath:(id)a3
{
}

- (HKAudiogramSample)audiogram
{
  return self->_audiogram;
}

- (void)setAudiogram:(id)a3
{
}

- (NSArray)frequencies
{
  return self->_frequencies;
}

- (void)setFrequencies:(id)a3
{
}

- (AIAudiogramConfirmResultsViewControllerDelegate)audiogramConfirmationDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_audiogramConfirmationDelegate);
  return (AIAudiogramConfirmResultsViewControllerDelegate *)WeakRetained;
}

- (void)setAudiogramConfirmationDelegate:(id)a3
{
}

- (AIAudiogramManualIngestionDelegate)audiogramManualIngestionDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_audiogramManualIngestionDelegate);
  return (AIAudiogramManualIngestionDelegate *)WeakRetained;
}

- (void)setAudiogramManualIngestionDelegate:(id)a3
{
}

- (OBBoldTrayButton)doneButton
{
  return self->_doneButton;
}

- (void)setDoneButton:(id)a3
{
}

- (UIStackView)stackView
{
  return self->_stackView;
}

- (void)setStackView:(id)a3
{
}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (void)setHealthStore:(id)a3
{
}

- (NSNumber)maxLeftHearingLevelWidth
{
  return self->_maxLeftHearingLevelWidth;
}

- (void)setMaxLeftHearingLevelWidth:(id)a3
{
}

- (NSNumber)maxRightHearingLevelWidth
{
  return self->_maxRightHearingLevelWidth;
}

- (void)setMaxRightHearingLevelWidth:(id)a3
{
}

- (BOOL)didAddBackgroundLayer
{
  return self->_didAddBackgroundLayer;
}

- (void)setDidAddBackgroundLayer:(BOOL)a3
{
  self->_didAddBackgroundLayer = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maxRightHearingLevelWidth, 0);
  objc_storeStrong((id *)&self->_maxLeftHearingLevelWidth, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_storeStrong((id *)&self->_doneButton, 0);
  objc_destroyWeak((id *)&self->_audiogramManualIngestionDelegate);
  objc_destroyWeak((id *)&self->_audiogramConfirmationDelegate);
  objc_storeStrong((id *)&self->_frequencies, 0);
  objc_storeStrong((id *)&self->_audiogram, 0);
  objc_storeStrong((id *)&self->_activeIndexPath, 0);
  objc_storeStrong((id *)&self->_tableViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_chartViewController, 0);
  objc_storeStrong((id *)&self->_initialDate, 0);
}

void __54__AIAudiogramFinalResultViewController__saveToHealth___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_23F0D7000, a2, OS_LOG_TYPE_ERROR, "Failed to write audiogram sample to HK with error: %@", (uint8_t *)&v2, 0xCu);
}

@end