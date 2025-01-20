@interface AIAudiogramResultsViewController
- (AIAudiogramConfirmResultsViewControllerDelegate)audiogramConfirmationDelegate;
- (AIAudiogramKeyboardToolbar)keyboardToolbar;
- (AIAudiogramResultsViewController)initWithDelegate:(id)a3 audiogram:(id)a4;
- (BOOL)_scrollToIndexPathIfNecessary:(id)a3 animated:(BOOL)a4;
- (BOOL)analyticsDidCompleteIngestion;
- (BOOL)analyticsDidMakeAdjustments;
- (HKAudiogramSample)audiogram;
- (HKHealthStore)healthStore;
- (HKUnitPreferenceController)unitPreferenceController;
- (NSArray)frequencies;
- (NSDate)initialDate;
- (NSIndexPath)activeIndexPath;
- (NSLayoutConstraint)tableViewHeightConstraint;
- (NSMutableDictionary)tableViewCells;
- (UITableView)tableView;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (unint64_t)analyticsClient;
- (unint64_t)analyticsImportSource;
- (void)_confirmTapped:(id)a3;
- (void)_reloadAudiogramWithSensitivityPoints:(id)a3 date:(id)a4;
- (void)_setCellActive:(BOOL)a3 indexPath:(id)a4 scroll:(BOOL)a5;
- (void)_updateTableViewHeight;
- (void)dateCellDidPickDate:(id)a3;
- (void)dealloc;
- (void)earCellDidBeginEditingForFrequency:(id)a3 forEar:(int64_t)a4;
- (void)earCellDidEndEditingForFrequency:(id)a3 forEar:(int64_t)a4;
- (void)earCellDidUpdateHearingLevel:(id)a3 forFrequency:(id)a4 forEar:(int64_t)a5;
- (void)keyboardDoneTapped;
- (void)keyboardNegationTapped;
- (void)keyboardNextTapped;
- (void)keyboardPreviousTapped;
- (void)scrollViewDidEndScrollingAnimation:(id)a3;
- (void)setActiveIndexPath:(id)a3;
- (void)setAnalyticsClient:(unint64_t)a3;
- (void)setAnalyticsDidCompleteIngestion:(BOOL)a3;
- (void)setAnalyticsDidMakeAdjustments:(BOOL)a3;
- (void)setAnalyticsImportSource:(unint64_t)a3;
- (void)setAudiogram:(id)a3;
- (void)setAudiogramConfirmationDelegate:(id)a3;
- (void)setFrequencies:(id)a3;
- (void)setHealthStore:(id)a3;
- (void)setInitialDate:(id)a3;
- (void)setKeyboardToolbar:(id)a3;
- (void)setTableView:(id)a3;
- (void)setTableViewCells:(id)a3;
- (void)setTableViewHeightConstraint:(id)a3;
- (void)setUnitPreferenceController:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)timeCellDidPickDate:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation AIAudiogramResultsViewController

- (AIAudiogramResultsViewController)initWithDelegate:(id)a3 audiogram:(id)a4
{
  v39[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = aiLocString(@"AudiogramIngestionResultsTitle");
  v9 = aiLocString(@"AudiogramIngestionResultsDetailText");
  v38.receiver = self;
  v38.super_class = (Class)AIAudiogramResultsViewController;
  v10 = [(AIAudiogramResultsViewController *)&v38 initWithTitle:v8 detailText:v9 symbolName:0 contentLayout:3];

  if (v10)
  {
    [(AIAudiogramResultsViewController *)v10 setAudiogram:v7];
    [(AIAudiogramResultsViewController *)v10 setAudiogramConfirmationDelegate:v6];
    v11 = (void *)[(id)AIAudiogramValidFrequencies copy];
    [(AIAudiogramResultsViewController *)v10 setFrequencies:v11];

    v12 = objc_opt_new();
    [(AIAudiogramResultsViewController *)v10 setTableViewCells:v12];

    uint64_t v34 = 0;
    v35 = &v34;
    uint64_t v36 = 0x2020000000;
    BOOL v37 = 0;
    v13 = [(AIAudiogramResultsViewController *)v10 audiogram];
    BOOL v14 = v13 == 0;

    BOOL v37 = v14;
    if (*((unsigned char *)v35 + 24)) {
      goto LABEL_6;
    }
    id location = 0;
    p_id location = &location;
    uint64_t v30 = 0x3032000000;
    v31 = __Block_byref_object_copy__3;
    v32 = __Block_byref_object_dispose__3;
    v15 = [(AIAudiogramResultsViewController *)v10 frequencies];
    id v33 = (id)[v15 mutableCopy];

    [p_location[5] removeObject:&unk_26F2DB238];
    [p_location[5] removeObject:&unk_26F2DB250];
    [p_location[5] removeObject:&unk_26F2DB268];
    [p_location[5] removeObject:&unk_26F2DB280];
    [p_location[5] removeObject:&unk_26F2DB298];
    v16 = [(AIAudiogramResultsViewController *)v10 audiogram];
    v17 = [v16 sensitivityPoints];
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = __63__AIAudiogramResultsViewController_initWithDelegate_audiogram___block_invoke;
    v27[3] = &unk_265058F88;
    v27[4] = &v34;
    v27[5] = &location;
    [v17 enumerateObjectsUsingBlock:v27];

    if ([p_location[5] count]) {
      *((unsigned char *)v35 + 24) = 1;
    }
    _Block_object_dispose(&location, 8);

    if (*((unsigned char *)v35 + 24))
    {
LABEL_6:
      v18 = [(AIAudiogramResultsViewController *)v10 headerView];
      v19 = aiLocString(@"AudiogramIngestionResultsMissingTitle");
      [v18 setTitle:v19];

      v20 = [(AIAudiogramResultsViewController *)v10 headerView];
      v21 = aiLocString(@"AudiogramIngestionResultsMissingDetailText");
      [v20 setDetailText:v21];
    }
    objc_initWeak(&location, v10);
    v39[0] = objc_opt_class();
    v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:v39 count:1];
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __63__AIAudiogramResultsViewController_initWithDelegate_audiogram___block_invoke_2;
    v25[3] = &unk_265058FB0;
    objc_copyWeak(&v26, &location);
    id v23 = (id)[(AIAudiogramResultsViewController *)v10 registerForTraitChanges:v22 withHandler:v25];

    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);
    _Block_object_dispose(&v34, 8);
  }

  return v10;
}

void __63__AIAudiogramResultsViewController_initWithDelegate_audiogram___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v14 = a2;
  uint64_t v6 = [v14 leftEarSensitivity];
  if (!v6
    || (id v7 = (void *)v6,
        [v14 rightEarSensitivity],
        v8 = objc_claimAutoreleasedReturnValue(),
        v8,
        v7,
        !v8))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
  v9 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  v10 = NSNumber;
  v11 = [v14 frequency];
  v12 = [getHKUnitClass_2() hertzUnit];
  [v11 doubleValueForUnit:v12];
  v13 = objc_msgSend(v10, "numberWithDouble:");
  [v9 removeObject:v13];
}

void __63__AIAudiogramResultsViewController_initWithDelegate_audiogram___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  v4 = [a3 preferredContentSizeCategory];
  v5 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained(v5);
  id v7 = [WeakRetained traitCollection];
  v8 = [v7 preferredContentSizeCategory];
  char v9 = [v4 isEqualToString:v8];

  if ((v9 & 1) == 0)
  {
    id v11 = objc_loadWeakRetained(v5);
    v10 = [v11 tableView];
    [v10 reloadData];
  }
}

- (void)viewDidLoad
{
  v60[4] = *MEMORY[0x263EF8340];
  v59.receiver = self;
  v59.super_class = (Class)AIAudiogramResultsViewController;
  [(OBBaseWelcomeController *)&v59 viewDidLoad];
  [(AIAudiogramResultsViewController *)self setShouldAdjustScrollViewInsetForKeyboard:1];
  id v3 = objc_alloc(MEMORY[0x263F824A8]);
  v4 = aiLocString(@"AudiogramIngestionResultsNextButton");
  v57 = (void *)[v3 initWithTitle:v4 style:0 target:self action:sel__confirmTapped_];

  v5 = [(OBBaseWelcomeController *)self navigationItem];
  [v5 setRightBarButtonItem:v57];

  uint64_t v6 = [AIAudiogramKeyboardToolbar alloc];
  id v7 = [(AIAudiogramResultsViewController *)self view];
  [v7 frame];
  v8 = -[AIAudiogramKeyboardToolbar initWithFrame:target:](v6, "initWithFrame:target:", self, 0.0, 0.0);
  [(AIAudiogramResultsViewController *)self setKeyboardToolbar:v8];

  id v9 = objc_alloc(MEMORY[0x263F82C78]);
  v10 = objc_msgSend(v9, "initWithFrame:style:", 2, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  [(AIAudiogramResultsViewController *)self setTableView:v10];

  id v11 = [(AIAudiogramResultsViewController *)self tableView];
  [v11 setDataSource:self];

  v12 = [(AIAudiogramResultsViewController *)self tableView];
  [v12 setDelegate:self];

  v13 = [(AIAudiogramResultsViewController *)self tableView];
  [v13 setScrollEnabled:0];

  id v14 = [(AIAudiogramResultsViewController *)self tableView];
  v15 = [MEMORY[0x263F825C8] systemGroupedBackgroundColor];
  [v14 setBackgroundColor:v15];

  v16 = [(AIAudiogramResultsViewController *)self tableView];
  [v16 setTranslatesAutoresizingMaskIntoConstraints:0];

  v17 = [(AIAudiogramResultsViewController *)self contentView];
  v18 = [(AIAudiogramResultsViewController *)self tableView];
  [v17 addSubview:v18];

  v47 = (void *)MEMORY[0x263F08938];
  v56 = [(AIAudiogramResultsViewController *)self tableView];
  v54 = [v56 topAnchor];
  v55 = [(AIAudiogramResultsViewController *)self contentView];
  v53 = [v55 topAnchor];
  v52 = [v54 constraintEqualToAnchor:v53];
  v60[0] = v52;
  v51 = [(AIAudiogramResultsViewController *)self tableView];
  v49 = [v51 leadingAnchor];
  v50 = [(AIAudiogramResultsViewController *)self view];
  v48 = [v50 leadingAnchor];
  v46 = [v49 constraintEqualToAnchor:v48];
  v60[1] = v46;
  v45 = [(AIAudiogramResultsViewController *)self tableView];
  v44 = [v45 trailingAnchor];
  v19 = [(AIAudiogramResultsViewController *)self view];
  v20 = [v19 trailingAnchor];
  v21 = [v44 constraintEqualToAnchor:v20];
  v60[2] = v21;
  v22 = [(AIAudiogramResultsViewController *)self tableView];
  id v23 = [v22 bottomAnchor];
  v24 = [(AIAudiogramResultsViewController *)self contentView];
  v25 = [v24 bottomAnchor];
  id v26 = [v23 constraintEqualToAnchor:v25];
  v60[3] = v26;
  v27 = [MEMORY[0x263EFF8C0] arrayWithObjects:v60 count:4];
  [v47 activateConstraints:v27];

  v28 = [(AIAudiogramResultsViewController *)self tableView];
  uint64_t v29 = objc_opt_class();
  uint64_t v30 = +[AIAudiogramResultGraphCell reuseIdentifier];
  [v28 registerClass:v29 forCellReuseIdentifier:v30];

  v31 = [(AIAudiogramResultsViewController *)self tableView];
  uint64_t v32 = objc_opt_class();
  id v33 = +[AIAudiogramResultDateCell reuseIdentifier];
  [v31 registerClass:v32 forCellReuseIdentifier:v33];

  uint64_t v34 = [(AIAudiogramResultsViewController *)self tableView];
  uint64_t v35 = objc_opt_class();
  uint64_t v36 = +[AIAudiogramResultTimeCell reuseIdentifier];
  [v34 registerClass:v35 forCellReuseIdentifier:v36];

  BOOL v37 = [(AIAudiogramResultsViewController *)self tableView];
  uint64_t v38 = objc_opt_class();
  v39 = +[AIAudiogramResultEarCell reuseIdentifier];
  [v37 registerClass:v38 forCellReuseIdentifier:v39];

  v40 = [(AIAudiogramResultsViewController *)self scrollView];
  [v40 _addScrollViewScrollObserver:self];

  v41 = [MEMORY[0x263F08A00] defaultCenter];
  uint64_t v42 = *MEMORY[0x263F837A8];
  v58[0] = MEMORY[0x263EF8330];
  v58[1] = 3221225472;
  v58[2] = __47__AIAudiogramResultsViewController_viewDidLoad__block_invoke;
  v58[3] = &unk_265058668;
  v58[4] = self;
  id v43 = (id)[v41 addObserverForName:v42 object:0 queue:0 usingBlock:v58];
}

void __47__AIAudiogramResultsViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) activeIndexPath];

  if (v2)
  {
    id v3 = *(void **)(a1 + 32);
    id v4 = [v3 activeIndexPath];
    [v3 _scrollToIndexPathIfNecessary:v4 animated:1];
  }
}

- (void)dealloc
{
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)AIAudiogramResultsViewController;
  [(AIAudiogramResultsViewController *)&v4 dealloc];
}

- (void)viewDidLayoutSubviews
{
  [(AIAudiogramResultsViewController *)self _updateTableViewHeight];
  v3.receiver = self;
  v3.super_class = (Class)AIAudiogramResultsViewController;
  [(OBBaseWelcomeController *)&v3 viewDidLayoutSubviews];
}

- (void)_updateTableViewHeight
{
  [(UITableView *)self->_tableView contentSize];
  double v4 = v3;
  v5 = [(AIAudiogramResultsViewController *)self tableViewHeightConstraint];
  if (v5)
  {
  }
  else
  {
    id v9 = [(AIAudiogramResultsViewController *)self tableView];

    if (v9)
    {
      v10 = [(AIAudiogramResultsViewController *)self tableView];
      id v11 = [v10 heightAnchor];
      v12 = [v11 constraintEqualToConstant:v4];
      [(AIAudiogramResultsViewController *)self setTableViewHeightConstraint:v12];

      id v13 = [(AIAudiogramResultsViewController *)self tableViewHeightConstraint];
      [v13 setActive:1];
      goto LABEL_7;
    }
  }
  uint64_t v6 = [(AIAudiogramResultsViewController *)self tableViewHeightConstraint];
  [v6 constant];
  double v8 = v7;

  if (v4 == v8) {
    return;
  }
  id v13 = [(AIAudiogramResultsViewController *)self tableViewHeightConstraint];
  [v13 setConstant:v4];
LABEL_7:
}

- (void)_confirmTapped:(id)a3
{
  double v4 = [AIAudiogramConfirmResultsViewController alloc];
  v5 = [(AIAudiogramResultsViewController *)self audiogramConfirmationDelegate];
  uint64_t v6 = [(AIAudiogramResultsViewController *)self audiogram];
  v10 = [(AIAudiogramConfirmResultsViewController *)v4 initWithDelegate:v5 audiogram:v6];

  double v7 = [(AIAudiogramResultsViewController *)self healthStore];
  [(AIAudiogramConfirmResultsViewController *)v10 setHealthStore:v7];

  double v8 = [(AIAudiogramResultsViewController *)self unitPreferenceController];
  [(AIAudiogramConfirmResultsViewController *)v10 setUnitPreferenceController:v8];

  [(AIAudiogramConfirmResultsViewController *)v10 setAnalyticsDidCompleteIngestion:[(AIAudiogramResultsViewController *)self analyticsDidCompleteIngestion]];
  [(AIAudiogramConfirmResultsViewController *)v10 setAnalyticsDidMakeAdjustments:[(AIAudiogramResultsViewController *)self analyticsDidMakeAdjustments]];
  [(AIAudiogramConfirmResultsViewController *)v10 setAnalyticsImportSource:[(AIAudiogramResultsViewController *)self analyticsImportSource]];
  [(AIAudiogramConfirmResultsViewController *)v10 setAnalyticsClient:[(AIAudiogramResultsViewController *)self analyticsClient]];
  id v9 = [(AIAudiogramResultsViewController *)self navigationController];
  [v9 pushViewController:v10 animated:1];
}

- (void)_reloadAudiogramWithSensitivityPoints:(id)a3 date:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = [(AIAudiogramResultsViewController *)self audiogram];
  if ([v6 count])
  {
    uint64_t v15 = 0;
    v16 = &v15;
    uint64_t v17 = 0x2050000000;
    id v9 = (void *)getHKAudiogramSampleClass_softClass_1;
    uint64_t v18 = getHKAudiogramSampleClass_softClass_1;
    if (!getHKAudiogramSampleClass_softClass_1)
    {
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = __getHKAudiogramSampleClass_block_invoke_1;
      v14[3] = &unk_265058588;
      v14[4] = &v15;
      __getHKAudiogramSampleClass_block_invoke_1((uint64_t)v14);
      id v9 = (void *)v16[3];
    }
    id v10 = v9;
    _Block_object_dispose(&v15, 8);
    id v11 = metadataForHKAudiogramSample();
    v12 = [v10 audiogramSampleWithSensitivityPoints:v6 startDate:v7 endDate:v7 metadata:v11];
    [(AIAudiogramResultsViewController *)self setAudiogram:v12];
  }
  else
  {
    [(AIAudiogramResultsViewController *)self setAudiogram:0];
  }
  id v13 = v8;
  AXPerformBlockOnMainThread();
}

void __79__AIAudiogramResultsViewController__reloadAudiogramWithSensitivityPoints_date___block_invoke(uint64_t a1)
{
  v12[1] = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263F088C8] indexPathForRow:0 inSection:0];
  if (!*(void *)(a1 + 32))
  {
LABEL_5:
    id v7 = [*(id *)(a1 + 40) audiogram];

    if (v7)
    {
      double v8 = [*(id *)(a1 + 40) tableView];
      v12[0] = v2;
      id v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:1];
      [v8 insertRowsAtIndexPaths:v9 withRowAnimation:100];
      goto LABEL_10;
    }
    if (!*(void *)(a1 + 32)) {
      goto LABEL_11;
    }
LABEL_8:
    id v10 = [*(id *)(a1 + 40) audiogram];

    if (v10) {
      goto LABEL_11;
    }
    double v8 = [*(id *)(a1 + 40) tableView];
    id v11 = v2;
    id v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v11 count:1];
    [v8 deleteRowsAtIndexPaths:v9 withRowAnimation:100];
LABEL_10:

    goto LABEL_11;
  }
  double v3 = [*(id *)(a1 + 40) audiogram];

  if (!v3)
  {
    if (*(void *)(a1 + 32)) {
      goto LABEL_8;
    }
    goto LABEL_5;
  }
  double v4 = [*(id *)(a1 + 40) tableViewCells];
  v5 = [v4 objectForKey:v2];

  id v6 = [*(id *)(a1 + 40) audiogram];
  [v5 setAudiogram:v6];

LABEL_11:
}

- (void)_setCellActive:(BOOL)a3 indexPath:(id)a4 scroll:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a3;
  id v8 = a4;
  if (!v5
    || ![(AIAudiogramResultsViewController *)self _scrollToIndexPathIfNecessary:v8 animated:1])
  {
    id v9 = [(AIAudiogramResultsViewController *)self tableViewCells];
    id v10 = [v9 objectForKey:v8];

    if ([v8 section] == 1)
    {
      if (![v8 row])
      {
        id v19 = v8;
        AXPerformBlockOnMainThread();
      }
    }
    else
    {
      if ([v8 section] == 2 || objc_msgSend(v8, "section") == 3)
      {
        [v10 showActive:v6];
        uint64_t v11 = [v8 section];
        if (v11 == 3)
        {
          uint64_t v12 = [v8 row];
          id v9 = [(AIAudiogramResultsViewController *)self frequencies];
          BOOL v13 = v12 != [v9 count] - 1;
        }
        else
        {
          BOOL v13 = 1;
        }
        id v14 = [(AIAudiogramResultsViewController *)self keyboardToolbar];
        uint64_t v15 = [v14 nextItemButton];
        [v15 setEnabled:v13];

        if (v11 == 3) {
        BOOL v16 = [v8 section] != 2 || objc_msgSend(v8, "row") != 0;
        }
        uint64_t v17 = [(AIAudiogramResultsViewController *)self keyboardToolbar];
        uint64_t v18 = [v17 previousItemButton];
        [v18 setEnabled:v16];
      }
      else
      {
        uint64_t v17 = AXLogAudiogram();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
          -[AIAudiogramResultsViewController _setCellActive:indexPath:scroll:]();
        }
      }
    }
  }
}

void __68__AIAudiogramResultsViewController__setCellActive_indexPath_scroll___block_invoke(uint64_t a1)
{
  v4[1] = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) tableView];
  v4[0] = *(void *)(a1 + 40);
  double v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:1];
  [v2 reloadRowsAtIndexPaths:v3 withRowAnimation:100];
}

- (BOOL)_scrollToIndexPathIfNecessary:(id)a3 animated:(BOOL)a4
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v5 = a3;
  BOOL v6 = [(AIAudiogramResultsViewController *)self tableView];
  [v6 rectForRowAtIndexPath:v5];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;

  uint64_t v15 = [(AIAudiogramResultsViewController *)self view];
  BOOL v16 = [(AIAudiogramResultsViewController *)self tableView];
  double v42 = v10;
  double v43 = v8;
  objc_msgSend(v15, "convertRect:fromView:", v16, v8, v10, v12, v14);
  CGFloat v18 = v17;
  double v20 = v19;
  CGFloat v22 = v21;
  double v24 = v23;

  v25 = [(AIAudiogramResultsViewController *)self scrollView];
  [v25 frame];
  double v27 = v20 - v26;

  v28 = [(AIAudiogramResultsViewController *)self scrollView];
  [v28 frame];
  double v30 = v29;
  v31 = [(AIAudiogramResultsViewController *)self scrollView];
  [v31 contentInset];
  double v33 = v30 - v32;

  double v34 = v24 + v27;
  uint64_t v35 = AXLogAudiogram();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
  {
    BOOL v36 = v34 > v33 || v27 < 0.0;
    v50.origin.x = v18;
    v50.origin.y = v27;
    v50.size.width = v22;
    v50.size.height = v24;
    BOOL v37 = NSStringFromCGRect(v50);
    *(_DWORD *)buf = 67109378;
    BOOL v46 = v36;
    __int16 v47 = 2112;
    v48 = v37;
    _os_log_impl(&dword_23F0D7000, v35, OS_LOG_TYPE_INFO, "Should scroll to row rect in view? %d %@", buf, 0x12u);

    if (v36) {
      goto LABEL_10;
    }
  }
  else
  {

    if (v27 < 0.0 || v34 > v33)
    {
LABEL_10:
      v39 = [(AIAudiogramResultsViewController *)self scrollView];
      v40 = [(AIAudiogramResultsViewController *)self tableView];
      objc_msgSend(v39, "convertRect:fromView:", v40, v43, v42, v12, v14);

      id v44 = v5;
      AXPerformBlockOnMainThread();

      BOOL v38 = 1;
      goto LABEL_11;
    }
  }
  BOOL v38 = 0;
LABEL_11:

  return v38;
}

void __75__AIAudiogramResultsViewController__scrollToIndexPathIfNecessary_animated___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  double v2 = *MEMORY[0x263F00148];
  if (*(unsigned char *)(a1 + 88))
  {
    double MinY = CGRectGetMinY(*(CGRect *)(a1 + 48));
    double v4 = AXLogAudiogram();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      v12.x = v2;
      v12.y = MinY;
      BOOL v6 = NSStringFromCGPoint(v12);
      *(_DWORD *)double v10 = 138412546;
      *(void *)&v10[4] = v5;
      *(_WORD *)&v10[12] = 2112;
      *(void *)&v10[14] = v6;
      double v7 = "Scrolling up to row: %@ - %@";
LABEL_7:
      _os_log_impl(&dword_23F0D7000, v4, OS_LOG_TYPE_INFO, v7, v10, 0x16u);
    }
  }
  else
  {
    if (!*(unsigned char *)(a1 + 89))
    {
      double MinY = *(double *)(MEMORY[0x263F00148] + 8);
      goto LABEL_9;
    }
    double MinY = CGRectGetMaxY(*(CGRect *)(a1 + 48)) - *(double *)(a1 + 80);
    double v4 = AXLogAudiogram();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      v13.x = v2;
      v13.y = MinY;
      BOOL v6 = NSStringFromCGPoint(v13);
      *(_DWORD *)double v10 = 138412546;
      *(void *)&v10[4] = v8;
      *(_WORD *)&v10[12] = 2112;
      *(void *)&v10[14] = v6;
      double v7 = "Scrolling down to row: %@ - %@";
      goto LABEL_7;
    }
  }

LABEL_9:
  double v9 = objc_msgSend(*(id *)(a1 + 40), "scrollView", *(_OWORD *)v10, *(void *)&v10[16], v11);
  objc_msgSend(v9, "setContentOffset:animated:", *(unsigned __int8 *)(a1 + 90), v2, MinY);
}

- (void)setActiveIndexPath:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a3;
  BOOL v6 = AXLogAudiogram();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    activeIndexPath = self->_activeIndexPath;
    int v13 = 138412546;
    double v14 = activeIndexPath;
    __int16 v15 = 2112;
    id v16 = v5;
    _os_log_impl(&dword_23F0D7000, v6, OS_LOG_TYPE_INFO, "Updating active index path %@ -> %@", (uint8_t *)&v13, 0x16u);
  }

  id v8 = [(AIAudiogramResultsViewController *)self activeIndexPath];

  if (v8 != v5)
  {
    double v9 = [(AIAudiogramResultsViewController *)self activeIndexPath];
    objc_storeStrong((id *)&self->_activeIndexPath, a3);
    double v10 = [MEMORY[0x263F088C8] indexPathForRow:0 inSection:1];
    if (v9 == v10) {
      [(AIAudiogramResultsViewController *)self _setCellActive:0 indexPath:v9 scroll:0];
    }
    uint64_t v11 = [(AIAudiogramResultsViewController *)self activeIndexPath];
    if (v11 != v10)
    {

LABEL_12:
      goto LABEL_13;
    }
    if ([v9 section] == 2)
    {
    }
    else
    {
      uint64_t v12 = [v9 section];

      if (v12 != 3) {
        goto LABEL_12;
      }
    }
    [(AIAudiogramResultsViewController *)self _setCellActive:0 indexPath:v9 scroll:0];
    goto LABEL_12;
  }
LABEL_13:
}

- (void)keyboardDoneTapped
{
  [(AIAudiogramResultsViewController *)self setActiveIndexPath:0];
  id v3 = [(AIAudiogramResultsViewController *)self tableView];
  [v3 endEditing:1];
}

- (void)keyboardNegationTapped
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  id v3 = [a1 activeIndexPath];
  OUTLINED_FUNCTION_1_0();
  _os_log_error_impl(&dword_23F0D7000, a2, OS_LOG_TYPE_ERROR, "Attempted to negate value on a cell that was not active or in the wrong section %@", v4, 0xCu);
}

void __58__AIAudiogramResultsViewController_keyboardNegationTapped__block_invoke(uint64_t a1)
{
  UIAccessibilityNotifications v1 = *MEMORY[0x263F83188];
  double v2 = NSString;
  id v4 = [*(id *)(a1 + 32) hearingLevel];
  id v3 = [v2 stringWithFormat:@"%@", v4];
  UIAccessibilityPostNotification(v1, v3);
}

- (void)keyboardPreviousTapped
{
  *(_WORD *)UIAccessibilityNotifications v1 = 0;
  _os_log_error_impl(&dword_23F0D7000, log, OS_LOG_TYPE_ERROR, "Attempted to negate value on a cell that was not active", v1, 2u);
}

- (void)keyboardNextTapped
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v3 = [(AIAudiogramResultsViewController *)self activeIndexPath];

  if (v3)
  {
    id v4 = [(AIAudiogramResultsViewController *)self activeIndexPath];
    uint64_t v5 = [v4 section];

    if (v5 == 2)
    {
      BOOL v6 = [(AIAudiogramResultsViewController *)self tableView];
      int64_t v7 = [(AIAudiogramResultsViewController *)self tableView:v6 numberOfRowsInSection:2];

      id v8 = [(AIAudiogramResultsViewController *)self activeIndexPath];
      if ([v8 row] < 0)
      {

        int64_t v11 = v7 - 1;
      }
      else
      {
        double v9 = [(AIAudiogramResultsViewController *)self activeIndexPath];
        unint64_t v10 = [v9 row];
        int64_t v11 = v7 - 1;

        if (v10 < v7 - 1)
        {
          uint64_t v12 = (void *)MEMORY[0x263F088C8];
          int v13 = [(AIAudiogramResultsViewController *)self activeIndexPath];
          uint64_t v14 = [v13 row] + 1;
          __int16 v15 = v12;
          uint64_t v16 = 2;
LABEL_13:
          CGFloat v18 = [v15 indexPathForRow:v14 inSection:v16];

LABEL_19:
          double v29 = AXLogAudiogram();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
          {
            int v35 = 138412290;
            BOOL v36 = v18;
            _os_log_impl(&dword_23F0D7000, v29, OS_LOG_TYPE_INFO, "Moving focus forwards to %@", (uint8_t *)&v35, 0xCu);
          }

          if (v18)
          {
            [(AIAudiogramResultsViewController *)self setActiveIndexPath:v18];
            double v30 = [(AIAudiogramResultsViewController *)self activeIndexPath];
            v31 = self;
            uint64_t v32 = 1;
            double v33 = v30;
            uint64_t v34 = 1;
          }
          else
          {
            double v30 = [(AIAudiogramResultsViewController *)self activeIndexPath];
            v31 = self;
            uint64_t v32 = 0;
            double v33 = v30;
            uint64_t v34 = 0;
          }
          [(AIAudiogramResultsViewController *)v31 _setCellActive:v32 indexPath:v33 scroll:v34];

          goto LABEL_25;
        }
      }
      double v27 = [(AIAudiogramResultsViewController *)self activeIndexPath];
      uint64_t v28 = [v27 row];

      if (v28 == v11)
      {
        CGFloat v18 = [MEMORY[0x263F088C8] indexPathForRow:0 inSection:3];
        goto LABEL_19;
      }
    }
    else
    {
      double v19 = [(AIAudiogramResultsViewController *)self activeIndexPath];
      uint64_t v20 = [v19 section];

      if (v20 == 3)
      {
        double v21 = [(AIAudiogramResultsViewController *)self tableView];
        int64_t v22 = [(AIAudiogramResultsViewController *)self tableView:v21 numberOfRowsInSection:3];

        double v23 = [(AIAudiogramResultsViewController *)self activeIndexPath];
        if ([v23 row] < 0)
        {
        }
        else
        {
          double v24 = [(AIAudiogramResultsViewController *)self activeIndexPath];
          unint64_t v25 = [v24 row];

          if (v25 < v22 - 1)
          {
            double v26 = (void *)MEMORY[0x263F088C8];
            int v13 = [(AIAudiogramResultsViewController *)self activeIndexPath];
            uint64_t v14 = [v13 row] + 1;
            __int16 v15 = v26;
            uint64_t v16 = 3;
            goto LABEL_13;
          }
        }
      }
    }
    CGFloat v18 = 0;
    goto LABEL_19;
  }
  uint64_t v17 = AXLogAudiogram();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
    -[AIAudiogramResultsViewController keyboardPreviousTapped](v17);
  }

  CGFloat v18 = [(AIAudiogramResultsViewController *)self tableView];
  [v18 endEditing:1];
LABEL_25:
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  int64_t v7 = (void *)MEMORY[0x263F088C8];
  id v8 = a4;
  uint64_t v9 = [v8 row];
  uint64_t v10 = [v8 section];

  int64_t v11 = [v7 indexPathForRow:v9 inSection:v10];
  uint64_t v12 = objc_opt_new();
  int v13 = [(AIAudiogramResultsViewController *)self activeIndexPath];

  switch([v11 section])
  {
    case 0:
      uint64_t v14 = +[AIAudiogramResultGraphCell reuseIdentifier];
      __int16 v15 = [v6 dequeueReusableCellWithIdentifier:v14];

      uint64_t v16 = [(AIAudiogramResultsViewController *)self audiogram];
      [v15 setAudiogram:v16];

      goto LABEL_26;
    case 1:
      uint64_t v18 = [v11 row];
      if (v18 == 1)
      {
        uint64_t v37 = +[AIAudiogramResultTimeCell reuseIdentifier];
        __int16 v15 = [v6 dequeueReusableCellWithIdentifier:v37];

        BOOL v38 = [(AIAudiogramResultsViewController *)self audiogram];
        if (v38)
        {
          v39 = [(AIAudiogramResultsViewController *)self audiogram];
          v40 = [v39 startDate];
          [v15 setDate:v40];
        }
        else
        {
          v39 = [MEMORY[0x263EFF910] date];
          [v15 setDate:v39];
        }

        [v15 setDelegate:self];
        [v15 configureLayout];
LABEL_26:
        v41 = [(AIAudiogramResultsViewController *)self tableViewCells];
        [v41 setObject:v15 forKey:v11];
      }
      else if (v18)
      {
        uint64_t v17 = AXLogAudiogram();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
          -[AIAudiogramResultsViewController tableView:cellForRowAtIndexPath:]();
        }
LABEL_23:

        __int16 v15 = v12;
      }
      else
      {
        double v19 = [(AIAudiogramResultsViewController *)self audiogram];
        uint64_t v20 = [v19 startDate];

        if (!v20)
        {
          uint64_t v20 = [(AIAudiogramResultsViewController *)self initialDate];
          if (!v20)
          {
            uint64_t v20 = [MEMORY[0x263EFF910] date];
          }
        }
        BOOL v21 = v13 == v11;
        int64_t v22 = +[AIAudiogramResultDateCell reuseIdentifier];
        __int16 v15 = [v6 dequeueReusableCellWithIdentifier:v22];

        [v15 showActive:v21];
        [v15 setDate:v20];
        [v15 setDelegate:self];
        [v15 configureLayout];
        double v23 = [(AIAudiogramResultsViewController *)self tableViewCells];
        [v23 setObject:v15 forKey:v11];

LABEL_18:
      }

      return v15;
    case 2:
      double v24 = [(AIAudiogramResultsViewController *)self frequencies];
      uint64_t v20 = objc_msgSend(v24, "objectAtIndex:", objc_msgSend(v11, "row"));

      uint64_t v52 = 0;
      v53 = &v52;
      uint64_t v54 = 0x3032000000;
      v55 = __Block_byref_object_copy__3;
      v56 = __Block_byref_object_dispose__3;
      id v57 = 0;
      unint64_t v25 = [(AIAudiogramResultsViewController *)self audiogram];

      if (v25)
      {
        double v26 = [(AIAudiogramResultsViewController *)self audiogram];
        double v27 = [v26 sensitivityPoints];
        v49[0] = MEMORY[0x263EF8330];
        v49[1] = 3221225472;
        v49[2] = __68__AIAudiogramResultsViewController_tableView_cellForRowAtIndexPath___block_invoke;
        v49[3] = &unk_265059000;
        id v50 = v20;
        v51 = &v52;
        [v27 enumerateObjectsUsingBlock:v49];
      }
      uint64_t v28 = +[AIAudiogramResultEarCell reuseIdentifier];
      __int16 v15 = [v6 dequeueReusableCellWithIdentifier:v28];

      [v15 setFrequency:v20];
      [v15 setHearingLevel:v53[5]];
      [v15 setEar:1];
      [v15 setDelegate:self];
      double v29 = [(AIAudiogramResultsViewController *)self keyboardToolbar];
      [v15 setKeyboardToolbar:v29];

      [v15 configureLayout];
      double v30 = [(AIAudiogramResultsViewController *)self tableViewCells];
      [v30 setObject:v15 forKey:v11];
      goto LABEL_17;
    case 3:
      v31 = [(AIAudiogramResultsViewController *)self frequencies];
      uint64_t v20 = objc_msgSend(v31, "objectAtIndex:", objc_msgSend(v11, "row"));

      uint64_t v52 = 0;
      v53 = &v52;
      uint64_t v54 = 0x3032000000;
      v55 = __Block_byref_object_copy__3;
      v56 = __Block_byref_object_dispose__3;
      id v57 = 0;
      uint64_t v32 = [(AIAudiogramResultsViewController *)self audiogram];

      if (v32)
      {
        double v33 = [(AIAudiogramResultsViewController *)self audiogram];
        uint64_t v34 = [v33 sensitivityPoints];
        uint64_t v43 = MEMORY[0x263EF8330];
        uint64_t v44 = 3221225472;
        v45 = __68__AIAudiogramResultsViewController_tableView_cellForRowAtIndexPath___block_invoke_2;
        BOOL v46 = &unk_265059000;
        id v47 = v20;
        v48 = &v52;
        [v34 enumerateObjectsUsingBlock:&v43];
      }
      int v35 = +[AIAudiogramResultEarCell reuseIdentifier];
      __int16 v15 = [v6 dequeueReusableCellWithIdentifier:v35];

      [v15 setFrequency:v20];
      [v15 setHearingLevel:v53[5]];
      [v15 setEar:2];
      [v15 setDelegate:self];
      BOOL v36 = [(AIAudiogramResultsViewController *)self keyboardToolbar];
      [v15 setKeyboardToolbar:v36];

      [v15 configureLayout];
      double v30 = [(AIAudiogramResultsViewController *)self tableViewCells];
      [v30 setObject:v15 forKey:v11];
LABEL_17:

      _Block_object_dispose(&v52, 8);
      goto LABEL_18;
    default:
      uint64_t v17 = AXLogAudiogram();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        -[AIAudiogramIndividualFrequencyInputViewController tableView:cellForRowAtIndexPath:](v11, v17);
      }
      goto LABEL_23;
  }
}

void __68__AIAudiogramResultsViewController_tableView_cellForRowAtIndexPath___block_invoke(uint64_t a1, void *a2)
{
  id v13 = a2;
  id v3 = [v13 frequency];
  id v4 = [getHKUnitClass_2() hertzUnit];
  [v3 doubleValueForUnit:v4];
  double v6 = v5;
  [*(id *)(a1 + 32) doubleValue];
  if (v6 == v7)
  {
    id v8 = [v13 leftEarSensitivity];

    if (!v8) {
      goto LABEL_5;
    }
    uint64_t v9 = NSNumber;
    id v3 = [v13 leftEarSensitivity];
    id v4 = [getHKUnitClass_2() decibelHearingLevelUnit];
    [v3 doubleValueForUnit:v4];
    uint64_t v10 = objc_msgSend(v9, "numberWithDouble:");
    uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;
  }
LABEL_5:
}

void __68__AIAudiogramResultsViewController_tableView_cellForRowAtIndexPath___block_invoke_2(uint64_t a1, void *a2)
{
  id v13 = a2;
  id v3 = [v13 frequency];
  id v4 = [getHKUnitClass_2() hertzUnit];
  [v3 doubleValueForUnit:v4];
  double v6 = v5;
  [*(id *)(a1 + 32) doubleValue];
  if (v6 == v7)
  {
    id v8 = [v13 rightEarSensitivity];

    if (!v8) {
      goto LABEL_5;
    }
    uint64_t v9 = NSNumber;
    id v3 = [v13 rightEarSensitivity];
    id v4 = [getHKUnitClass_2() decibelHearingLevelUnit];
    [v3 doubleValueForUnit:v4];
    uint64_t v10 = objc_msgSend(v9, "numberWithDouble:");
    uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;
  }
LABEL_5:
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v6 = a3;
  if ((unint64_t)(a4 - 2) < 2)
  {
    uint64_t v12 = [(AIAudiogramResultsViewController *)self frequencies];
    int64_t v11 = [v12 count];
  }
  else if (a4 == 1)
  {
    int64_t v11 = 2;
  }
  else if (a4)
  {
    id v13 = AXLogAudiogram();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[AIAudiogramResultsViewController tableView:numberOfRowsInSection:](a4, v13);
    }

    int64_t v11 = 0;
  }
  else
  {
    double v7 = [(OBBaseWelcomeController *)self navigationItem];
    id v8 = [v7 rightBarButtonItem];
    uint64_t v9 = [(AIAudiogramResultsViewController *)self audiogram];
    [v8 setEnabled:v9 != 0];

    uint64_t v10 = [(AIAudiogramResultsViewController *)self audiogram];
    int64_t v11 = v10 != 0;
  }
  return v11;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 4;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  id v5 = a3;
  id v6 = 0;
  switch(a4)
  {
    case 0:
      break;
    case 1:
      uint64_t v7 = aiLocString(@"AudiogramIngestionResultsDate");
      goto LABEL_9;
    case 2:
      uint64_t v9 = 1;
      goto LABEL_8;
    case 3:
      uint64_t v9 = 2;
LABEL_8:
      uint64_t v7 = Soft_HKAudiogramEarLocalizedDisplayNameForEar(v9);
LABEL_9:
      id v6 = (void *)v7;
      break;
    default:
      id v8 = AXLogAudiogram();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        -[AIAudiogramResultsViewController tableView:titleForHeaderInSection:](a4, v8);
      }

      id v6 = 0;
      break;
  }

  return v6;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  if (objc_msgSend(a4, "section", a3)) {
    return *MEMORY[0x263F839B8];
  }
  +[AIAudiogramResultGraphCell cellHeight];
  return result;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v10 = a4;
  [a3 deselectRowAtIndexPath:v10 animated:1];
  id v6 = [(AIAudiogramResultsViewController *)self activeIndexPath];

  uint64_t v7 = [v10 section];
  if ((unint64_t)(v7 - 2) < 2 || v7 == 1 && ![v10 row])
  {
    if (v6 == v10) {
      id v8 = 0;
    }
    else {
      id v8 = v10;
    }
    [(AIAudiogramResultsViewController *)self setActiveIndexPath:v8];
    uint64_t v9 = [(AIAudiogramResultsViewController *)self activeIndexPath];
    [(AIAudiogramResultsViewController *)self _setCellActive:v9 != 0 indexPath:v10 scroll:1];
  }
}

- (void)scrollViewDidEndScrollingAnimation:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v4 = [(AIAudiogramResultsViewController *)self activeIndexPath];

  if (v4)
  {
    id v5 = AXLogAudiogram();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      id v6 = [(AIAudiogramResultsViewController *)self activeIndexPath];
      int v8 = 138412290;
      uint64_t v9 = v6;
      _os_log_impl(&dword_23F0D7000, v5, OS_LOG_TYPE_INFO, "Finished scrolling to index path %@", (uint8_t *)&v8, 0xCu);
    }
    uint64_t v7 = [(AIAudiogramResultsViewController *)self activeIndexPath];
    [(AIAudiogramResultsViewController *)self _setCellActive:1 indexPath:v7 scroll:0];
  }
}

- (void)dateCellDidPickDate:(id)a3
{
  v10[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(AIAudiogramResultsViewController *)self audiogram];
  id v6 = [v5 sensitivityPoints];
  [(AIAudiogramResultsViewController *)self _reloadAudiogramWithSensitivityPoints:v6 date:v4];

  uint64_t v7 = [MEMORY[0x263F088C8] indexPathForRow:1 inSection:1];
  int v8 = [(AIAudiogramResultsViewController *)self tableView];
  v10[0] = v7;
  uint64_t v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:1];
  [v8 reloadRowsAtIndexPaths:v9 withRowAnimation:5];
}

- (void)timeCellDidPickDate:(id)a3
{
  v10[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(AIAudiogramResultsViewController *)self audiogram];
  id v6 = [v5 sensitivityPoints];
  [(AIAudiogramResultsViewController *)self _reloadAudiogramWithSensitivityPoints:v6 date:v4];

  uint64_t v7 = [MEMORY[0x263F088C8] indexPathForRow:0 inSection:1];
  int v8 = [(AIAudiogramResultsViewController *)self tableView];
  v10[0] = v7;
  uint64_t v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:1];
  [v8 reloadRowsAtIndexPaths:v9 withRowAnimation:5];
}

- (void)earCellDidUpdateHearingLevel:(id)a3 forFrequency:(id)a4 forEar:(int64_t)a5
{
  uint64_t v67 = *MEMORY[0x263EF8340];
  id v42 = a3;
  id v8 = a4;
  [(AIAudiogramResultsViewController *)self setAnalyticsDidMakeAdjustments:1];
  uint64_t v9 = AXLogAudiogram();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = Soft_HKAudiogramEarLocalizedDisplayNameForEar(a5);
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)&uint8_t buf[4] = a5;
    LOWORD(v58) = 2112;
    *(void *)((char *)&v58 + 2) = v10;
    _os_log_impl(&dword_23F0D7000, v9, OS_LOG_TYPE_INFO, "Updating %i (%@) ear of audiogram", buf, 0x12u);
  }
  int64_t v11 = [(AIAudiogramResultsViewController *)self audiogram];
  if (v11)
  {
    uint64_t v12 = [(AIAudiogramResultsViewController *)self audiogram];
    id v13 = [v12 sensitivityPoints];
    uint64_t v14 = (void *)[v13 mutableCopy];
  }
  else
  {
    uint64_t v14 = objc_opt_new();
  }

  *(void *)buf = 0;
  *(void *)&long long v58 = buf;
  *((void *)&v58 + 1) = 0x3032000000;
  objc_super v59 = __Block_byref_object_copy__3;
  v60 = __Block_byref_object_dispose__3;
  id v61 = [getHKUnitClass_2() hertzUnit];
  uint64_t v49 = 0;
  id v50 = &v49;
  uint64_t v51 = 0x2020000000;
  uint64_t v52 = -1;
  v45[0] = MEMORY[0x263EF8330];
  v45[1] = 3221225472;
  v45[2] = __85__AIAudiogramResultsViewController_earCellDidUpdateHearingLevel_forFrequency_forEar___block_invoke;
  v45[3] = &unk_265059028;
  id v47 = buf;
  id v41 = v8;
  id v46 = v41;
  v48 = &v49;
  [v14 enumerateObjectsUsingBlock:v45];
  __int16 v15 = AXLogAudiogram();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    uint64_t v16 = v50[3];
    int v17 = [v14 count];
    *(_DWORD *)v62 = 67109376;
    *(_DWORD *)&v62[4] = v16;
    LOWORD(v63) = 1024;
    *(_DWORD *)((char *)&v63 + 2) = v17;
    _os_log_impl(&dword_23F0D7000, v15, OS_LOG_TYPE_INFO, "Updating audiogram point %i of %i points", v62, 0xEu);
  }

  v40 = [getHKUnitClass_2() decibelHearingLevelUnit];
  if (v42)
  {
    id HKQuantityClass_1 = getHKQuantityClass_1();
    [v42 doubleValue];
    double v19 = objc_msgSend(HKQuantityClass_1, "quantityWithUnit:doubleValue:", v40);
  }
  else
  {
    double v19 = 0;
  }
  uint64_t v20 = v19;
  if (a5 != 1)
  {
    if (v50[3] != -1)
    {
      BOOL v21 = objc_msgSend(v14, "objectAtIndexedSubscript:");
      uint64_t v22 = [v21 leftEarSensitivity];

      goto LABEL_16;
    }
    uint64_t v20 = 0;
  }
  uint64_t v22 = v20;
LABEL_16:
  double v23 = v19;
  if (a5 == 2)
  {
LABEL_20:
    uint64_t v25 = v23;
    goto LABEL_21;
  }
  if (v50[3] == -1)
  {
    double v23 = 0;
    goto LABEL_20;
  }
  double v24 = objc_msgSend(v14, "objectAtIndexedSubscript:");
  uint64_t v25 = [v24 rightEarSensitivity];

LABEL_21:
  id v26 = getHKQuantityClass_1();
  uint64_t v27 = *(void *)(v58 + 40);
  [v41 doubleValue];
  uint64_t v28 = objc_msgSend(v26, "quantityWithUnit:doubleValue:", v27);
  if (!(v22 | v25)) {
    goto LABEL_32;
  }
  uint64_t v53 = 0;
  uint64_t v54 = &v53;
  uint64_t v55 = 0x2050000000;
  double v29 = (void *)getHKAudiogramSensitivityPointClass_softClass_1;
  uint64_t v56 = getHKAudiogramSensitivityPointClass_softClass_1;
  if (!getHKAudiogramSensitivityPointClass_softClass_1)
  {
    *(void *)v62 = MEMORY[0x263EF8330];
    uint64_t v63 = 3221225472;
    v64 = __getHKAudiogramSensitivityPointClass_block_invoke_1;
    v65 = &unk_265058588;
    v66 = &v53;
    __getHKAudiogramSensitivityPointClass_block_invoke_1((uint64_t)v62);
    double v29 = (void *)v54[3];
  }
  id v30 = v29;
  _Block_object_dispose(&v53, 8);
  id v44 = 0;
  v31 = [v30 sensitivityPointWithFrequency:v28 leftEarSensitivity:v22 rightEarSensitivity:v25 error:&v44];
  id v32 = v44;
  if (v32)
  {
    double v33 = v32;
    uint64_t v34 = AXLogAudiogram();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
      -[AIAudiogramResultsViewController earCellDidUpdateHearingLevel:forFrequency:forEar:]();
    }
    goto LABEL_45;
  }
  if (v31)
  {
    if (v50[3] == -1)
    {
      v39 = AXLogAudiogram();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v62 = 0;
        _os_log_impl(&dword_23F0D7000, v39, OS_LOG_TYPE_INFO, "Adding audiogram point", v62, 2u);
      }

      [v14 addObject:v31];
      v43[0] = MEMORY[0x263EF8330];
      v43[1] = 3221225472;
      v43[2] = __85__AIAudiogramResultsViewController_earCellDidUpdateHearingLevel_forFrequency_forEar___block_invoke_99;
      v43[3] = &unk_265059050;
      v43[4] = buf;
      [v14 sortUsingComparator:v43];
    }
    else
    {
      int v35 = AXLogAudiogram();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v62 = 0;
        _os_log_impl(&dword_23F0D7000, v35, OS_LOG_TYPE_INFO, "Updating audiogram point", v62, 2u);
      }

      [v14 replaceObjectAtIndex:v50[3] withObject:v31];
    }
  }
  else
  {
LABEL_32:
    if (v50[3] == -1)
    {
      uint64_t v37 = AXLogAudiogram();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v62 = 0;
        _os_log_impl(&dword_23F0D7000, v37, OS_LOG_TYPE_INFO, "No update needed for blank audiogram point", v62, 2u);
      }
    }
    else
    {
      BOOL v36 = AXLogAudiogram();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v62 = 0;
        _os_log_impl(&dword_23F0D7000, v36, OS_LOG_TYPE_INFO, "Removing audiogram point", v62, 2u);
      }

      [v14 removeObjectAtIndex:v50[3]];
    }
    v31 = 0;
  }
  double v33 = [(AIAudiogramResultsViewController *)self audiogram];
  if (v33)
  {
    uint64_t v34 = [(AIAudiogramResultsViewController *)self audiogram];
    BOOL v38 = [v34 startDate];
  }
  else
  {
    BOOL v38 = [MEMORY[0x263EFF910] date];
    uint64_t v34 = v38;
  }
  [(AIAudiogramResultsViewController *)self _reloadAudiogramWithSensitivityPoints:v14 date:v38];
  if (v33) {

  }
LABEL_45:
  _Block_object_dispose(&v49, 8);
  _Block_object_dispose(buf, 8);
}

void __85__AIAudiogramResultsViewController_earCellDidUpdateHearingLevel_forFrequency_forEar___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v7 = [a2 frequency];
  [v7 doubleValueForUnit:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
  double v9 = v8;
  [*(id *)(a1 + 32) doubleValue];
  double v11 = v10;

  if (v9 == v11)
  {
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = a3;
    *a4 = 1;
  }
}

BOOL __85__AIAudiogramResultsViewController_earCellDidUpdateHearingLevel_forFrequency_forEar___block_invoke_99(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = [a2 frequency];
  [v6 doubleValueForUnit:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)];
  double v8 = v7;
  double v9 = [v5 frequency];

  [v9 doubleValueForUnit:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)];
  BOOL v11 = v8 > v10;

  return v11;
}

- (void)earCellDidBeginEditingForFrequency:(id)a3 forEar:(int64_t)a4
{
  if (a4 == 1) {
    uint64_t v5 = 2;
  }
  else {
    uint64_t v5 = 3;
  }
  id v6 = a3;
  double v7 = [(AIAudiogramResultsViewController *)self frequencies];
  uint64_t v8 = [v7 indexOfObject:v6];

  id v12 = [MEMORY[0x263F088C8] indexPathForRow:v8 inSection:v5];
  id v9 = [(AIAudiogramResultsViewController *)self activeIndexPath];

  double v10 = v12;
  if (v12 != v9)
  {
    [(AIAudiogramResultsViewController *)self setActiveIndexPath:v12];
    BOOL v11 = [(AIAudiogramResultsViewController *)self activeIndexPath];
    [(AIAudiogramResultsViewController *)self _scrollToIndexPathIfNecessary:v11 animated:1];

    double v10 = v12;
  }
}

- (void)earCellDidEndEditingForFrequency:(id)a3 forEar:(int64_t)a4
{
  if (a4 == 1) {
    uint64_t v5 = 2;
  }
  else {
    uint64_t v5 = 3;
  }
  id v6 = a3;
  double v7 = [(AIAudiogramResultsViewController *)self frequencies];
  uint64_t v8 = [v7 indexOfObject:v6];

  id v11 = [MEMORY[0x263F088C8] indexPathForRow:v8 inSection:v5];
  id v9 = [(AIAudiogramResultsViewController *)self activeIndexPath];

  double v10 = v11;
  if (v11 == v9)
  {
    [(AIAudiogramResultsViewController *)self setActiveIndexPath:0];
    double v10 = v11;
  }
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

- (NSDate)initialDate
{
  return self->_initialDate;
}

- (void)setInitialDate:(id)a3
{
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

- (AIAudiogramConfirmResultsViewControllerDelegate)audiogramConfirmationDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_audiogramConfirmationDelegate);
  return (AIAudiogramConfirmResultsViewControllerDelegate *)WeakRetained;
}

- (void)setAudiogramConfirmationDelegate:(id)a3
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

- (NSMutableDictionary)tableViewCells
{
  return self->_tableViewCells;
}

- (void)setTableViewCells:(id)a3
{
}

- (AIAudiogramKeyboardToolbar)keyboardToolbar
{
  return self->_keyboardToolbar;
}

- (void)setKeyboardToolbar:(id)a3
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyboardToolbar, 0);
  objc_storeStrong((id *)&self->_tableViewCells, 0);
  objc_storeStrong((id *)&self->_frequencies, 0);
  objc_storeStrong((id *)&self->_audiogram, 0);
  objc_storeStrong((id *)&self->_activeIndexPath, 0);
  objc_storeStrong((id *)&self->_tableViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_destroyWeak((id *)&self->_audiogramConfirmationDelegate);
  objc_storeStrong((id *)&self->_initialDate, 0);
  objc_storeStrong((id *)&self->_unitPreferenceController, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
}

- (void)_setCellActive:indexPath:scroll:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_23F0D7000, v0, v1, "Attempted to set non-activating section to active: %@", v2, v3, v4, v5, v6);
}

- (void)tableView:cellForRowAtIndexPath:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_23F0D7000, v0, v1, "Unexpected row (%@) for audiogram table view", v2, v3, v4, v5, v6);
}

- (void)tableView:(int)a1 numberOfRowsInSection:(NSObject *)a2 .cold.1(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_23F0D7000, a2, OS_LOG_TYPE_ERROR, "Unknown section (%i) picking number of rows in audiogram table view", (uint8_t *)v2, 8u);
}

- (void)tableView:(int)a1 titleForHeaderInSection:(NSObject *)a2 .cold.1(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_23F0D7000, a2, OS_LOG_TYPE_ERROR, "Unknown section (%i) creating title for audiogram table view", (uint8_t *)v2, 8u);
}

- (void)earCellDidUpdateHearingLevel:forFrequency:forEar:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_23F0D7000, v0, v1, "Error updating audiogram point: %@", v2, v3, v4, v5, v6);
}

@end