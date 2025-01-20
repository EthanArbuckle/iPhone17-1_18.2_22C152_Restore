@interface AIAudiogramIndividualFrequencyInputViewController
- (AIAudiogramConfirmResultsViewControllerDelegate)audiogramConfirmationDelegate;
- (AIAudiogramIndividualFrequencyInputViewController)initWithDelegate:(id)a3 audiogramConfirmationDelegate:(id)a4 audiogram:(id)a5 currentFrequency:(id)a6 isModalViewController:(BOOL)a7 selectedSymbols:(id)a8;
- (AIAudiogramKeyboardToolbarForSensitivityPoint)keyboardToolbar;
- (AIAudiogramManualIngestionDelegate)delegate;
- (BOOL)_scrollToIndexPathIfNecessary:(id)a3 animated:(BOOL)a4;
- (BOOL)analyticsDidMakeAdjustments;
- (BOOL)didAddBackgroundLayer;
- (BOOL)hasLeftMaskedSymbol;
- (BOOL)hasLeftSymbols;
- (BOOL)hasRightMaskedSymbol;
- (BOOL)hasRightSymbols;
- (BOOL)isModal;
- (BOOL)userAddedFrequencyAfterOptical;
- (HKAudiogramSample)audiogram;
- (HKUnitPreferenceController)unitPreferenceController;
- (NSArray)symbols;
- (NSDate)initialDate;
- (NSIndexPath)activeIndexPath;
- (NSLayoutConstraint)tableViewHeightConstraint;
- (NSMutableArray)sensitivityPoints;
- (NSNumber)currentFrequency;
- (OBTrayButton)footerButton;
- (UILabel)frequencyTitleLabel;
- (UITableView)tableView;
- (UIViewController)chartViewController;
- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (id)_earCellForEar:(int64_t)a3;
- (id)earCellForTableView:(id)a3 atIndexPath:(id)a4 withEar:(int64_t)a5;
- (id)newSensitivityPointForHearingLevel:(id)a3 ear:(int64_t)a4 updateIndex:(int64_t)a5 masked:(BOOL)a6;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (int64_t)indexOfFrequencyInSensitivityPoints:(id)a3;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_cancelTapped:(id)a3;
- (void)_continueToNextFrequencyInput:(id)a3;
- (void)_doneButtonTapped:(id)a3;
- (void)_reloadAudiogramWithSensitivityPoints:(id)a3;
- (void)_updateTableViewHeight;
- (void)addSensitivityPoint:(id)a3;
- (void)adjustHearingLevel:(int64_t)a3 forEar:(int64_t)a4;
- (void)contentCategoryDidChange:(id)a3;
- (void)earCellDidBeginEditingForEar:(int64_t)a3;
- (void)earCellDidEndEditingForEar:(int64_t)a3;
- (void)earCellDidUpdateHearingLevel:(id)a3 forEar:(int64_t)a4 masked:(BOOL)a5;
- (void)keyboardDoneTapped;
- (void)keyboardNegationTapped;
- (void)minusButtonTapped:(int64_t)a3;
- (void)plusButtonTapped:(int64_t)a3;
- (void)reloadAudiogram;
- (void)setActiveIndexPath:(id)a3;
- (void)setAnalyticsDidMakeAdjustments:(BOOL)a3;
- (void)setAudiogram:(id)a3;
- (void)setAudiogramConfirmationDelegate:(id)a3;
- (void)setChartViewController:(id)a3;
- (void)setCurrentFrequency:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDidAddBackgroundLayer:(BOOL)a3;
- (void)setFooterButton:(id)a3;
- (void)setFrequencyTitleLabel:(id)a3;
- (void)setHasLeftMaskedSymbol:(BOOL)a3;
- (void)setHasLeftSymbols:(BOOL)a3;
- (void)setHasRightMaskedSymbol:(BOOL)a3;
- (void)setHasRightSymbols:(BOOL)a3;
- (void)setInitialDate:(id)a3;
- (void)setIsModal:(BOOL)a3;
- (void)setKeyboardToolbar:(id)a3;
- (void)setSensitivityPoints:(id)a3;
- (void)setSymbols:(id)a3;
- (void)setTableView:(id)a3;
- (void)setTableViewHeightConstraint:(id)a3;
- (void)setUnitPreferenceController:(id)a3;
- (void)setUserAddedFrequencyAfterOptical:(BOOL)a3;
- (void)symbolSelectionForFrequencyHasChanged:(int64_t)a3 masked:(BOOL)a4 noneSelected:(BOOL)a5;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)updateActiveIndexPathForEar:(int64_t)a3 beginEditing:(BOOL)a4;
- (void)updateSensitivityPoint:(id)a3 atIndex:(int64_t)a4;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation AIAudiogramIndividualFrequencyInputViewController

- (AIAudiogramIndividualFrequencyInputViewController)initWithDelegate:(id)a3 audiogramConfirmationDelegate:(id)a4 audiogram:(id)a5 currentFrequency:(id)a6 isModalViewController:(BOOL)a7 selectedSymbols:(id)a8
{
  BOOL v9 = a7;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a8;
  v72.receiver = self;
  v72.super_class = (Class)AIAudiogramIndividualFrequencyInputViewController;
  v19 = [(AIAudiogramIndividualFrequencyInputViewController *)&v72 initWithTitle:&stru_26F2D3B98 detailText:&stru_26F2D3B98 symbolName:0 contentLayout:3];
  v20 = v19;
  if (v19)
  {
    [(AIAudiogramIndividualFrequencyInputViewController *)v19 setDelegate:v14];
    [(AIAudiogramIndividualFrequencyInputViewController *)v20 setAudiogramConfirmationDelegate:v15];
    [(AIAudiogramIndividualFrequencyInputViewController *)v20 setAudiogram:v16];
    [(AIAudiogramIndividualFrequencyInputViewController *)v20 setUserAddedFrequencyAfterOptical:0];
    uint64_t v78 = 0;
    v79 = &v78;
    uint64_t v80 = 0x2050000000;
    v21 = (void *)getHKHealthStoreClass_softClass;
    uint64_t v81 = getHKHealthStoreClass_softClass;
    if (!getHKHealthStoreClass_softClass)
    {
      uint64_t v73 = MEMORY[0x263EF8330];
      uint64_t v74 = 3221225472;
      v75 = __getHKHealthStoreClass_block_invoke;
      v76 = &unk_265058588;
      v77 = &v78;
      __getHKHealthStoreClass_block_invoke((uint64_t)&v73);
      v21 = (void *)v79[3];
    }
    v22 = v21;
    _Block_object_dispose(&v78, 8);
    id v23 = objc_alloc_init(v22);
    uint64_t v78 = 0;
    v79 = &v78;
    uint64_t v80 = 0x2050000000;
    v24 = (void *)getHKSingleAudiogramChartViewControllerClass_softClass;
    uint64_t v81 = getHKSingleAudiogramChartViewControllerClass_softClass;
    if (!getHKSingleAudiogramChartViewControllerClass_softClass)
    {
      uint64_t v73 = MEMORY[0x263EF8330];
      uint64_t v74 = 3221225472;
      v75 = __getHKSingleAudiogramChartViewControllerClass_block_invoke;
      v76 = &unk_265058588;
      v77 = &v78;
      __getHKSingleAudiogramChartViewControllerClass_block_invoke((uint64_t)&v73);
      v24 = (void *)v79[3];
    }
    id v71 = v14;
    v25 = v24;
    _Block_object_dispose(&v78, 8);
    id v26 = [v25 alloc];
    v27 = [(AIAudiogramIndividualFrequencyInputViewController *)v20 audiogram];
    v69 = v23;
    v28 = (void *)[v26 initWithHealthStore:v23 staticAudiogram:v27 selectedFrequency:v17];
    [(AIAudiogramIndividualFrequencyInputViewController *)v20 setChartViewController:v28];

    v29 = [(AIAudiogramIndividualFrequencyInputViewController *)v20 chartViewController];
    v30 = [v29 view];
    v31 = [MEMORY[0x263F825C8] systemBackgroundColor];
    [v30 setBackgroundColor:v31];

    id v32 = objc_alloc(MEMORY[0x263F828E0]);
    v33 = objc_msgSend(v32, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    [(AIAudiogramIndividualFrequencyInputViewController *)v20 setFrequencyTitleLabel:v33];

    v34 = [(AIAudiogramIndividualFrequencyInputViewController *)v20 frequencyTitleLabel];
    [v34 setTranslatesAutoresizingMaskIntoConstraints:0];

    v35 = [(AIAudiogramIndividualFrequencyInputViewController *)v20 frequencyTitleLabel];
    [v35 setTextAlignment:1];

    v36 = [MEMORY[0x263F82760] _preferredFontForTextStyle:*MEMORY[0x263F83610] weight:*MEMORY[0x263F83630]];
    v37 = [(AIAudiogramIndividualFrequencyInputViewController *)v20 frequencyTitleLabel];
    [v37 setFont:v36];

    v38 = [(AIAudiogramIndividualFrequencyInputViewController *)v20 frequencyTitleLabel];
    [v38 setAdjustsFontForContentSizeCategory:1];

    v39 = [(AIAudiogramIndividualFrequencyInputViewController *)v20 frequencyTitleLabel];
    [v39 setNumberOfLines:0];

    [(AIAudiogramIndividualFrequencyInputViewController *)v20 setCurrentFrequency:v17];
    v40 = (void *)MEMORY[0x263EFF980];
    v41 = [v16 sensitivityPoints];
    v42 = [v40 arrayWithArray:v41];
    [(AIAudiogramIndividualFrequencyInputViewController *)v20 setSensitivityPoints:v42];

    if (_os_feature_enabled_impl())
    {
      v43 = v20;
      v44 = v18;
    }
    else
    {
      v44 = &unk_26F2DB4F0;
      v43 = v20;
    }
    [(AIAudiogramIndividualFrequencyInputViewController *)v43 setSymbols:v44];
    v45 = [(AIAudiogramIndividualFrequencyInputViewController *)v20 symbols];
    -[AIAudiogramIndividualFrequencyInputViewController setHasLeftSymbols:](v20, "setHasLeftSymbols:", [v45 containsObject:&unk_26F2DB160]);

    v46 = [(AIAudiogramIndividualFrequencyInputViewController *)v20 symbols];
    -[AIAudiogramIndividualFrequencyInputViewController setHasRightSymbols:](v20, "setHasRightSymbols:", [v46 containsObject:&unk_26F2DB178]);

    if ([(AIAudiogramIndividualFrequencyInputViewController *)v20 hasLeftSymbols]) {
      uint64_t v47 = 1;
    }
    else {
      uint64_t v47 = [v18 containsObject:&unk_26F2DB190];
    }
    id v70 = v17;
    [(AIAudiogramIndividualFrequencyInputViewController *)v20 setHasLeftSymbols:v47];
    -[AIAudiogramIndividualFrequencyInputViewController setHasLeftMaskedSymbol:](v20, "setHasLeftMaskedSymbol:", [v18 containsObject:&unk_26F2DB190]);
    id v48 = v15;
    if ([(AIAudiogramIndividualFrequencyInputViewController *)v20 hasRightSymbols]) {
      uint64_t v49 = 1;
    }
    else {
      uint64_t v49 = [v18 containsObject:&unk_26F2DB1A8];
    }
    [(AIAudiogramIndividualFrequencyInputViewController *)v20 setHasRightSymbols:v49];
    -[AIAudiogramIndividualFrequencyInputViewController setHasRightMaskedSymbol:](v20, "setHasRightMaskedSymbol:", [v18 containsObject:&unk_26F2DB1A8]);
    v50 = [MEMORY[0x263F5B898] boldButton];
    [(AIAudiogramIndividualFrequencyInputViewController *)v20 setFooterButton:v50];

    if (v9) {
      v51 = @"AudiogramIngestionButtonDone";
    }
    else {
      v51 = @"AudiogramIngestionButtonContinue";
    }
    v52 = aiLocString(v51);
    v53 = [(AIAudiogramIndividualFrequencyInputViewController *)v20 footerButton];
    [v53 setTitle:v52 forState:0];

    if (v9) {
      v54 = sel__doneButtonTapped_;
    }
    else {
      v54 = sel__continueToNextFrequencyInput_;
    }
    v55 = [(AIAudiogramIndividualFrequencyInputViewController *)v20 footerButton];
    [v55 addTarget:v20 action:v54 forControlEvents:64];

    id v56 = objc_alloc(MEMORY[0x263F824A8]);
    v57 = aiLocString(@"AudiogramIngestionImportOptionCancel");
    v58 = (void *)[v56 initWithTitle:v57 style:0 target:v20 action:sel__cancelTapped_];

    id v59 = objc_alloc(MEMORY[0x263F824A8]);
    v60 = aiLocString(@"AudiogramIngestionButtonDone");
    v61 = (void *)[v59 initWithTitle:v60 style:0 target:v20 action:sel__doneButtonTapped_];

    if ([(AIAudiogramIndividualFrequencyInputViewController *)v20 userAddedFrequencyAfterOptical])
    {
      v62 = [(OBBaseWelcomeController *)v20 navigationItem];
      [v62 setLeftBarButtonItem:v58];

      v63 = [(OBBaseWelcomeController *)v20 navigationItem];
      v64 = v63;
      v65 = v61;
    }
    else
    {
      v66 = [(AIAudiogramIndividualFrequencyInputViewController *)v20 buttonTray];
      v67 = [(AIAudiogramIndividualFrequencyInputViewController *)v20 footerButton];
      [v66 addButton:v67];

      v63 = [(OBBaseWelcomeController *)v20 navigationItem];
      v64 = v63;
      v65 = v58;
    }
    [v63 setRightBarButtonItem:v65];
    id v15 = v48;

    id v14 = v71;
    id v17 = v70;
  }

  return v20;
}

- (void)viewDidLoad
{
  v105[1] = *MEMORY[0x263EF8340];
  v103.receiver = self;
  v103.super_class = (Class)AIAudiogramIndividualFrequencyInputViewController;
  [(OBBaseWelcomeController *)&v103 viewDidLoad];
  v3 = [AIAudiogramKeyboardToolbarForSensitivityPoint alloc];
  v4 = [(AIAudiogramIndividualFrequencyInputViewController *)self view];
  [v4 frame];
  v5 = -[AIAudiogramKeyboardToolbarForSensitivityPoint initWithFrame:target:](v3, "initWithFrame:target:", self, 0.0, 0.0);
  [(AIAudiogramIndividualFrequencyInputViewController *)self setKeyboardToolbar:v5];

  [(AIAudiogramIndividualFrequencyInputViewController *)self setShouldAdjustScrollViewInsetForKeyboard:1];
  v6 = [MEMORY[0x263F08A00] defaultCenter];
  [v6 addObserver:self selector:sel_contentCategoryDidChange_ name:*MEMORY[0x263F83428] object:0];

  v7 = [(AIAudiogramIndividualFrequencyInputViewController *)self chartViewController];
  v8 = [v7 view];
  [v8 setUserInteractionEnabled:0];

  BOOL v9 = [(AIAudiogramIndividualFrequencyInputViewController *)self chartViewController];
  v10 = [v9 view];
  [v10 setTranslatesAutoresizingMaskIntoConstraints:0];

  v11 = [(AIAudiogramIndividualFrequencyInputViewController *)self contentView];
  v12 = [(AIAudiogramIndividualFrequencyInputViewController *)self chartViewController];
  v13 = [v12 view];
  [v11 addSubview:v13];

  id v14 = [(AIAudiogramIndividualFrequencyInputViewController *)self chartViewController];
  [(AIAudiogramIndividualFrequencyInputViewController *)self addChildViewController:v14];

  id v15 = [(AIAudiogramIndividualFrequencyInputViewController *)self chartViewController];
  [v15 didMoveToParentViewController:self];

  id v16 = objc_alloc(MEMORY[0x263F82C78]);
  id v17 = objc_msgSend(v16, "initWithFrame:style:", 2, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  [(AIAudiogramIndividualFrequencyInputViewController *)self setTableView:v17];

  id v18 = [(AIAudiogramIndividualFrequencyInputViewController *)self tableView];
  [v18 setDataSource:self];

  v19 = [(AIAudiogramIndividualFrequencyInputViewController *)self tableView];
  [v19 setDelegate:self];

  v20 = [(AIAudiogramIndividualFrequencyInputViewController *)self tableView];
  [v20 setScrollEnabled:0];

  v21 = [(AIAudiogramIndividualFrequencyInputViewController *)self tableView];
  [v21 setTranslatesAutoresizingMaskIntoConstraints:0];

  v22 = [(AIAudiogramIndividualFrequencyInputViewController *)self tableView];
  [v22 setSectionHeaderTopPadding:8.0];

  id v23 = [(AIAudiogramIndividualFrequencyInputViewController *)self tableView];
  [v23 setAllowsSelection:0];

  v24 = [(AIAudiogramIndividualFrequencyInputViewController *)self tableView];
  v25 = [MEMORY[0x263F825C8] systemGroupedBackgroundColor];
  [v24 setBackgroundColor:v25];

  id v26 = [(AIAudiogramIndividualFrequencyInputViewController *)self contentView];
  v27 = [(AIAudiogramIndividualFrequencyInputViewController *)self tableView];
  [v26 addSubview:v27];

  v28 = [(AIAudiogramIndividualFrequencyInputViewController *)self view];
  v29 = [MEMORY[0x263F825C8] systemGroupedBackgroundColor];
  [v28 setBackgroundColor:v29];

  id v30 = objc_alloc(MEMORY[0x263F82BF8]);
  v31 = [(AIAudiogramIndividualFrequencyInputViewController *)self frequencyTitleLabel];
  v105[0] = v31;
  id v32 = [MEMORY[0x263EFF8C0] arrayWithObjects:v105 count:1];
  v33 = (void *)[v30 initWithArrangedSubviews:v32];

  v34 = [MEMORY[0x263F825C8] systemGroupedBackgroundColor];
  [v33 setBackgroundColor:v34];

  [v33 setLayoutMarginsRelativeArrangement:1];
  objc_msgSend(v33, "setLayoutMargins:", 20.0, 16.0, 4.0, 16.0);
  [v33 setTranslatesAutoresizingMaskIntoConstraints:0];
  v35 = [(AIAudiogramIndividualFrequencyInputViewController *)self contentView];
  [v35 addSubview:v33];

  v76 = (void *)MEMORY[0x263F08938];
  v101 = [(AIAudiogramIndividualFrequencyInputViewController *)self chartViewController];
  v100 = [v101 view];
  v98 = [v100 topAnchor];
  v99 = [(AIAudiogramIndividualFrequencyInputViewController *)self contentView];
  v97 = [v99 topAnchor];
  v96 = [v98 constraintEqualToAnchor:v97 constant:-50.0];
  v104[0] = v96;
  v95 = [(AIAudiogramIndividualFrequencyInputViewController *)self chartViewController];
  v94 = [v95 view];
  v92 = [v94 leadingAnchor];
  v93 = [(AIAudiogramIndividualFrequencyInputViewController *)self view];
  v91 = [v93 leadingAnchor];
  v90 = [v92 constraintEqualToAnchor:v91];
  v104[1] = v90;
  v89 = [(AIAudiogramIndividualFrequencyInputViewController *)self chartViewController];
  v88 = [v89 view];
  v85 = [v88 trailingAnchor];
  v86 = [(AIAudiogramIndividualFrequencyInputViewController *)self view];
  v84 = [v86 trailingAnchor];
  v83 = [v85 constraintEqualToAnchor:v84];
  v104[2] = v83;
  v82 = [(AIAudiogramIndividualFrequencyInputViewController *)self chartViewController];
  uint64_t v81 = [v82 view];
  v79 = [v81 heightAnchor];
  uint64_t v80 = [(AIAudiogramIndividualFrequencyInputViewController *)self view];
  uint64_t v78 = [v80 heightAnchor];
  v77 = [v79 constraintEqualToAnchor:v78 multiplier:0.4];
  v104[3] = v77;
  uint64_t v74 = [v33 topAnchor];
  v75 = [(AIAudiogramIndividualFrequencyInputViewController *)self chartViewController];
  uint64_t v73 = [v75 view];
  objc_super v72 = [v73 bottomAnchor];
  id v71 = [v74 constraintEqualToAnchor:v72];
  v104[4] = v71;
  v69 = [v33 leadingAnchor];
  id v70 = [(AIAudiogramIndividualFrequencyInputViewController *)self view];
  v68 = [v70 leadingAnchor];
  v67 = [v69 constraintEqualToAnchor:v68];
  v104[5] = v67;
  v87 = v33;
  v65 = [v33 trailingAnchor];
  v66 = [(AIAudiogramIndividualFrequencyInputViewController *)self view];
  v64 = [v66 trailingAnchor];
  v63 = [v65 constraintEqualToAnchor:v64];
  v104[6] = v63;
  v62 = [(AIAudiogramIndividualFrequencyInputViewController *)self tableView];
  v61 = [v62 topAnchor];
  v60 = [v33 bottomAnchor];
  id v59 = [v61 constraintEqualToAnchor:v60];
  v104[7] = v59;
  v58 = [(AIAudiogramIndividualFrequencyInputViewController *)self tableView];
  id v56 = [v58 leadingAnchor];
  v57 = [(AIAudiogramIndividualFrequencyInputViewController *)self view];
  v55 = [v57 leadingAnchor];
  v54 = [v56 constraintEqualToAnchor:v55];
  v104[8] = v54;
  v53 = [(AIAudiogramIndividualFrequencyInputViewController *)self tableView];
  v52 = [v53 trailingAnchor];
  v36 = [(AIAudiogramIndividualFrequencyInputViewController *)self view];
  v37 = [v36 trailingAnchor];
  v38 = [v52 constraintEqualToAnchor:v37];
  v104[9] = v38;
  v39 = [(AIAudiogramIndividualFrequencyInputViewController *)self tableView];
  v40 = [v39 bottomAnchor];
  v41 = [(AIAudiogramIndividualFrequencyInputViewController *)self contentView];
  v42 = [v41 bottomAnchor];
  v43 = [v40 constraintEqualToAnchor:v42];
  v104[10] = v43;
  v44 = [MEMORY[0x263EFF8C0] arrayWithObjects:v104 count:11];
  [v76 activateConstraints:v44];

  v45 = [(AIAudiogramIndividualFrequencyInputViewController *)self tableView];
  uint64_t v46 = objc_opt_class();
  uint64_t v47 = +[AIAudiogramIndividualFrequencyEarCell reuseIdentifier];
  [v45 registerClass:v46 forCellReuseIdentifier:v47];

  id v48 = [(AIAudiogramIndividualFrequencyInputViewController *)self scrollView];
  [v48 _addScrollViewScrollObserver:self];

  uint64_t v49 = [MEMORY[0x263F08A00] defaultCenter];
  uint64_t v50 = *MEMORY[0x263F837A8];
  v102[0] = MEMORY[0x263EF8330];
  v102[1] = 3221225472;
  v102[2] = __64__AIAudiogramIndividualFrequencyInputViewController_viewDidLoad__block_invoke;
  v102[3] = &unk_265058668;
  v102[4] = self;
  id v51 = (id)[v49 addObserverForName:v50 object:0 queue:0 usingBlock:v102];
}

void __64__AIAudiogramIndividualFrequencyInputViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) activeIndexPath];

  if (v2)
  {
    v3 = *(void **)(a1 + 32);
    id v4 = [v3 activeIndexPath];
    [v3 _scrollToIndexPathIfNecessary:v4 animated:1];
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v21.receiver = self;
  v21.super_class = (Class)AIAudiogramIndividualFrequencyInputViewController;
  [(AIAudiogramIndividualFrequencyInputViewController *)&v21 viewWillAppear:a3];
  id v4 = [(AIAudiogramIndividualFrequencyInputViewController *)self delegate];
  v5 = [v4 getCurrentAudiogram];
  [(AIAudiogramIndividualFrequencyInputViewController *)self setAudiogram:v5];

  v6 = (void *)MEMORY[0x263EFF980];
  v7 = [(AIAudiogramIndividualFrequencyInputViewController *)self audiogram];
  v8 = [v7 sensitivityPoints];
  BOOL v9 = [v6 arrayWithArray:v8];
  [(AIAudiogramIndividualFrequencyInputViewController *)self setSensitivityPoints:v9];

  v10 = [(AIAudiogramIndividualFrequencyInputViewController *)self sensitivityPoints];
  [(AIAudiogramIndividualFrequencyInputViewController *)self _reloadAudiogramWithSensitivityPoints:v10];

  v11 = [(AIAudiogramIndividualFrequencyInputViewController *)self tableView];
  [v11 reloadData];

  if (![(AIAudiogramIndividualFrequencyInputViewController *)self didAddBackgroundLayer])
  {
    v12 = [MEMORY[0x263F157E8] layer];
    id v13 = [MEMORY[0x263F825C8] systemBackgroundColor];
    objc_msgSend(v12, "setBackgroundColor:", objc_msgSend(v13, "CGColor"));

    id v14 = [(AIAudiogramIndividualFrequencyInputViewController *)self view];
    [v14 bounds];
    double v16 = v15;
    id v17 = [(AIAudiogramIndividualFrequencyInputViewController *)self view];
    [v17 bounds];
    objc_msgSend(v12, "setFrame:", 0.0, 0.0, v16, v18 * 0.4);

    v19 = [(AIAudiogramIndividualFrequencyInputViewController *)self view];
    v20 = [v19 layer];
    [v20 insertSublayer:v12 atIndex:0];

    [(AIAudiogramIndividualFrequencyInputViewController *)self setDidAddBackgroundLayer:1];
  }
}

- (void)viewDidLayoutSubviews
{
  [(AIAudiogramIndividualFrequencyInputViewController *)self _updateTableViewHeight];
  v3.receiver = self;
  v3.super_class = (Class)AIAudiogramIndividualFrequencyInputViewController;
  [(OBBaseWelcomeController *)&v3 viewDidLayoutSubviews];
}

- (void)_updateTableViewHeight
{
  [(UITableView *)self->_tableView contentSize];
  double v4 = v3;
  v5 = [(AIAudiogramIndividualFrequencyInputViewController *)self tableViewHeightConstraint];
  if (v5)
  {
  }
  else
  {
    BOOL v9 = [(AIAudiogramIndividualFrequencyInputViewController *)self tableView];

    if (v9)
    {
      v10 = [(AIAudiogramIndividualFrequencyInputViewController *)self tableView];
      v11 = [v10 heightAnchor];
      v12 = [v11 constraintEqualToConstant:v4];
      [(AIAudiogramIndividualFrequencyInputViewController *)self setTableViewHeightConstraint:v12];

      id v13 = [(AIAudiogramIndividualFrequencyInputViewController *)self tableViewHeightConstraint];
      [v13 setActive:1];
      goto LABEL_7;
    }
  }
  v6 = [(AIAudiogramIndividualFrequencyInputViewController *)self tableViewHeightConstraint];
  [v6 constant];
  double v8 = v7;

  if (v4 == v8) {
    return;
  }
  id v13 = [(AIAudiogramIndividualFrequencyInputViewController *)self tableViewHeightConstraint];
  [v13 setConstant:v4];
LABEL_7:
}

- (void)_cancelTapped:(id)a3
{
  id v3 = [(AIAudiogramIndividualFrequencyInputViewController *)self delegate];
  [v3 cancelButtonTapped];
}

- (void)_doneButtonTapped:(id)a3
{
  id v5 = [(AIAudiogramIndividualFrequencyInputViewController *)self delegate];
  double v4 = [(AIAudiogramIndividualFrequencyInputViewController *)self audiogram];
  [v5 dismissCurrentFrequencyInputViewControllerWithAudiogram:v4];
}

- (void)_continueToNextFrequencyInput:(id)a3
{
  id v6 = [(AIAudiogramIndividualFrequencyInputViewController *)self delegate];
  double v4 = [(AIAudiogramIndividualFrequencyInputViewController *)self audiogram];
  id v5 = [(AIAudiogramIndividualFrequencyInputViewController *)self currentFrequency];
  [v6 showNextFrequencyInputViewControllerWithAudiogram:v4 previousFrequency:v5];
}

- (BOOL)_scrollToIndexPathIfNecessary:(id)a3 animated:(BOOL)a4
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = [(AIAudiogramIndividualFrequencyInputViewController *)self tableView];
  [v6 rectForRowAtIndexPath:v5];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;

  double v15 = [(AIAudiogramIndividualFrequencyInputViewController *)self view];
  double v16 = [(AIAudiogramIndividualFrequencyInputViewController *)self tableView];
  double v42 = v10;
  double v43 = v8;
  objc_msgSend(v15, "convertRect:fromView:", v16, v8, v10, v12, v14);
  CGFloat v18 = v17;
  double v20 = v19;
  CGFloat v22 = v21;
  double v24 = v23;

  v25 = [(AIAudiogramIndividualFrequencyInputViewController *)self scrollView];
  [v25 frame];
  double v27 = v20 - v26;

  v28 = [(AIAudiogramIndividualFrequencyInputViewController *)self scrollView];
  [v28 frame];
  double v30 = v29;
  v31 = [(AIAudiogramIndividualFrequencyInputViewController *)self scrollView];
  [v31 contentInset];
  double v33 = v30 - v32;

  double v34 = v24 + v27;
  v35 = AXLogAudiogram();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
  {
    BOOL v36 = v34 > v33 || v27 < 0.0;
    v50.origin.x = v18;
    v50.origin.y = v27;
    v50.size.width = v22;
    v50.size.height = v24;
    v37 = NSStringFromCGRect(v50);
    *(_DWORD *)buf = 67109378;
    BOOL v46 = v36;
    __int16 v47 = 2112;
    id v48 = v37;
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
      v39 = [(AIAudiogramIndividualFrequencyInputViewController *)self scrollView];
      v40 = [(AIAudiogramIndividualFrequencyInputViewController *)self tableView];
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

void __92__AIAudiogramIndividualFrequencyInputViewController__scrollToIndexPathIfNecessary_animated___block_invoke(uint64_t a1)
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
      id v6 = NSStringFromCGPoint(v12);
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
      id v6 = NSStringFromCGPoint(v13);
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

- (void)contentCategoryDidChange:(id)a3
{
  id v3 = [(AIAudiogramIndividualFrequencyInputViewController *)self tableView];
  [v3 reloadData];
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v8 = a4;
  [a3 deselectRowAtIndexPath:v8 animated:1];
  id v6 = [(AIAudiogramIndividualFrequencyInputViewController *)self activeIndexPath];

  if ((unint64_t)[v8 section] <= 1)
  {
    if (v6 == v8) {
      id v7 = 0;
    }
    else {
      id v7 = v8;
    }
    [(AIAudiogramIndividualFrequencyInputViewController *)self setActiveIndexPath:v7];
    [(AIAudiogramIndividualFrequencyInputViewController *)self _scrollToIndexPathIfNecessary:v8 animated:1];
  }
}

- (void)symbolSelectionForFrequencyHasChanged:(int64_t)a3 masked:(BOOL)a4 noneSelected:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  double v9 = -[AIAudiogramIndividualFrequencyInputViewController _earCellForEar:](self, "_earCellForEar:");
  id v15 = v9;
  if (v5)
  {
    double v10 = [(AIAudiogramIndividualFrequencyInputViewController *)self currentFrequency];
    int64_t v11 = [(AIAudiogramIndividualFrequencyInputViewController *)self indexOfFrequencyInSensitivityPoints:v10];

    id v12 = [(AIAudiogramIndividualFrequencyInputViewController *)self newSensitivityPointForHearingLevel:0 ear:a3 updateIndex:v11 masked:v6];
    if (v12)
    {
      if (v11 == -1) {
        [(AIAudiogramIndividualFrequencyInputViewController *)self addSensitivityPoint:v12];
      }
      else {
        [(AIAudiogramIndividualFrequencyInputViewController *)self updateSensitivityPoint:v12 atIndex:v11];
      }
    }
    else if (v11 != -1)
    {
      CGPoint v13 = [(AIAudiogramIndividualFrequencyInputViewController *)self sensitivityPoints];
      [v13 removeObjectAtIndex:v11];
    }
    [(AIAudiogramIndividualFrequencyInputViewController *)self reloadAudiogram];
  }
  else
  {
    id v12 = [v9 hearingLevel];
    -[AIAudiogramIndividualFrequencyInputViewController earCellDidUpdateHearingLevel:forEar:masked:](self, "earCellDidUpdateHearingLevel:forEar:masked:", v12, [v15 ear], v6);
  }

  double v14 = [(AIAudiogramIndividualFrequencyInputViewController *)self symbols];
  [v15 updateSymbols:v14 ear:a3 masked:v6];
}

- (void)plusButtonTapped:(int64_t)a3
{
}

- (void)minusButtonTapped:(int64_t)a3
{
}

- (void)adjustHearingLevel:(int64_t)a3 forEar:(int64_t)a4
{
  id v12 = [(AIAudiogramIndividualFrequencyInputViewController *)self _earCellForEar:a4];
  BOOL v6 = NSNumber;
  id v7 = [v12 hearingLevel];
  [v7 doubleValue];
  double v9 = [v6 numberWithDouble:v8 + (double)a3];
  double v10 = validateHearingLevel(v9);
  [v12 setHearingLevel:v10];

  int64_t v11 = [v12 hearingLevel];
  -[AIAudiogramIndividualFrequencyInputViewController earCellDidUpdateHearingLevel:forEar:masked:](self, "earCellDidUpdateHearingLevel:forEar:masked:", v11, [v12 ear], objc_msgSend(v12, "masked"));
}

- (void)_reloadAudiogramWithSensitivityPoints:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(AIAudiogramIndividualFrequencyInputViewController *)self delegate];
  BOOL v6 = [v5 getPickedDate];

  if ([v4 count])
  {
    uint64_t v12 = 0;
    CGPoint v13 = &v12;
    uint64_t v14 = 0x2050000000;
    id v7 = (void *)getHKAudiogramSampleClass_softClass;
    uint64_t v15 = getHKAudiogramSampleClass_softClass;
    if (!getHKAudiogramSampleClass_softClass)
    {
      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 3221225472;
      v11[2] = __getHKAudiogramSampleClass_block_invoke;
      v11[3] = &unk_265058588;
      v11[4] = &v12;
      __getHKAudiogramSampleClass_block_invoke((uint64_t)v11);
      id v7 = (void *)v13[3];
    }
    id v8 = v7;
    _Block_object_dispose(&v12, 8);
    double v9 = metadataForHKAudiogramSample();
    double v10 = [v8 audiogramSampleWithSensitivityPoints:v4 startDate:v6 endDate:v6 metadata:v9];
    [(AIAudiogramIndividualFrequencyInputViewController *)self setAudiogram:v10];
  }
  else
  {
    [(AIAudiogramIndividualFrequencyInputViewController *)self setAudiogram:0];
  }
  AXPerformBlockOnMainThread();
}

void __91__AIAudiogramIndividualFrequencyInputViewController__reloadAudiogramWithSensitivityPoints___block_invoke(uint64_t a1)
{
  double v2 = [*(id *)(a1 + 32) chartViewController];
  id v3 = [*(id *)(a1 + 32) audiogram];
  [v2 updateStaticAudiogram:v3];

  id v5 = [*(id *)(a1 + 32) audiogram];
  id v4 = [*(id *)(a1 + 32) footerButton];
  [v4 setEnabled:v5 != 0];
}

- (void)keyboardDoneTapped
{
  [(AIAudiogramIndividualFrequencyInputViewController *)self setActiveIndexPath:0];
  id v3 = [(AIAudiogramIndividualFrequencyInputViewController *)self tableView];
  [v3 endEditing:1];
}

- (void)keyboardNegationTapped
{
  id v3 = [(AIAudiogramIndividualFrequencyInputViewController *)self activeIndexPath];

  if (v3)
  {
    id v4 = [(AIAudiogramIndividualFrequencyInputViewController *)self activeIndexPath];
    if ([v4 section]) {
      uint64_t v5 = 2;
    }
    else {
      uint64_t v5 = 1;
    }
    id v12 = [(AIAudiogramIndividualFrequencyInputViewController *)self _earCellForEar:v5];

    BOOL v6 = [v12 hearingLevel];

    if (v6)
    {
      id v7 = NSNumber;
      id v8 = [v12 hearingLevel];
      [v8 doubleValue];
      double v10 = [v7 numberWithDouble:-v9];
      [v12 setHearingLevel:v10];

      int64_t v11 = [v12 hearingLevel];
      -[AIAudiogramIndividualFrequencyInputViewController earCellDidUpdateHearingLevel:forEar:masked:](self, "earCellDidUpdateHearingLevel:forEar:masked:", v11, [v12 ear], objc_msgSend(v12, "masked"));
    }
  }
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = (void *)MEMORY[0x263F088C8];
  id v8 = a4;
  uint64_t v9 = [v8 row];
  uint64_t v10 = [v8 section];

  int64_t v11 = [v7 indexPathForRow:v9 inSection:v10];
  id v12 = objc_opt_new();
  uint64_t v13 = [(AIAudiogramIndividualFrequencyInputViewController *)self numberOfSectionsInTableView:v6];
  if ([(AIAudiogramIndividualFrequencyInputViewController *)self hasRightSymbols]) {
    BOOL v14 = [(AIAudiogramIndividualFrequencyInputViewController *)self numberOfSectionsInTableView:v6] == 1;
  }
  else {
    BOOL v14 = 0;
  }
  uint64_t v15 = [v11 section];
  if (v15 == 1)
  {
    if ([(AIAudiogramIndividualFrequencyInputViewController *)self hasRightSymbols] && v13 >= 1) {
      goto LABEL_16;
    }
  }
  else
  {
    if (!v15)
    {
      if ([(AIAudiogramIndividualFrequencyInputViewController *)self hasLeftSymbols] && v13 >= 1)
      {
        double v16 = self;
        id v17 = v6;
        CGFloat v18 = v11;
        uint64_t v19 = 1;
LABEL_17:
        uint64_t v21 = [(AIAudiogramIndividualFrequencyInputViewController *)v16 earCellForTableView:v17 atIndexPath:v18 withEar:v19];

        id v12 = (void *)v21;
        goto LABEL_18;
      }
      if (!v14) {
        goto LABEL_18;
      }
LABEL_16:
      double v16 = self;
      id v17 = v6;
      CGFloat v18 = v11;
      uint64_t v19 = 2;
      goto LABEL_17;
    }
    double v20 = AXLogAudiogram();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      -[AIAudiogramIndividualFrequencyInputViewController tableView:cellForRowAtIndexPath:](v11, v20);
    }
  }
LABEL_18:

  return v12;
}

- (id)earCellForTableView:(id)a3 atIndexPath:(id)a4 withEar:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v26 = 0;
  double v27 = &v26;
  uint64_t v28 = 0x3032000000;
  double v29 = __Block_byref_object_copy__0;
  double v30 = __Block_byref_object_dispose__0;
  id v31 = 0;
  uint64_t v22 = 0;
  double v23 = &v22;
  uint64_t v24 = 0x2020000000;
  char v25 = 0;
  uint64_t v10 = [(AIAudiogramIndividualFrequencyInputViewController *)self audiogram];

  if (v10)
  {
    int64_t v11 = [(AIAudiogramIndividualFrequencyInputViewController *)self currentFrequency];
    [v11 doubleValue];
    uint64_t v13 = v12;

    BOOL v14 = [(AIAudiogramIndividualFrequencyInputViewController *)self audiogram];
    uint64_t v15 = [v14 sensitivityPoints];
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __93__AIAudiogramIndividualFrequencyInputViewController_earCellForTableView_atIndexPath_withEar___block_invoke;
    v21[3] = &unk_2650586E0;
    v21[6] = v13;
    v21[7] = a5;
    v21[4] = &v26;
    v21[5] = &v22;
    [v15 enumerateObjectsUsingBlock:v21];
  }
  double v16 = +[AIAudiogramIndividualFrequencyEarCell reuseIdentifier];
  id v17 = [v8 dequeueReusableCellWithIdentifier:v16];

  [v17 setHearingLevel:v27[5]];
  [v17 setEar:a5];
  [v17 setMasked:*((unsigned __int8 *)v23 + 24)];
  CGFloat v18 = [(AIAudiogramIndividualFrequencyInputViewController *)self symbols];
  [v17 updateSymbols:v18 ear:a5 masked:*((unsigned __int8 *)v23 + 24)];

  [v17 setDelegate:self];
  uint64_t v19 = [(AIAudiogramIndividualFrequencyInputViewController *)self keyboardToolbar];
  [v17 setKeyboardToolbar:v19];

  [v17 configureLayout];
  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v26, 8);

  return v17;
}

void __93__AIAudiogramIndividualFrequencyInputViewController_earCellForTableView_atIndexPath_withEar___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v6 = a2;
  id v7 = [v6 frequency];
  id v8 = [getHKUnitClass() hertzUnit];
  [v7 doubleValueForUnit:v8];
  double v10 = v9;
  double v11 = *(double *)(a1 + 48);

  if (v10 == v11)
  {
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    uint64_t v12 = objc_msgSend(v6, "tests", 0);
    uint64_t v13 = [v12 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v26;
      while (2)
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v26 != v15) {
            objc_enumerationMutation(v12);
          }
          id v17 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          uint64_t v18 = *(void *)(a1 + 56);
          if (v18 == 1)
          {
            if (![*(id *)(*((void *)&v25 + 1) + 8 * i) side]) {
              goto LABEL_15;
            }
            uint64_t v18 = *(void *)(a1 + 56);
          }
          if (v18 == 2 && [v17 side] == 1)
          {
LABEL_15:
            uint64_t v19 = NSNumber;
            double v20 = [v17 sensitivity];
            uint64_t v21 = [getHKUnitClass() decibelHearingLevelUnit];
            [v20 doubleValueForUnit:v21];
            uint64_t v22 = objc_msgSend(v19, "numberWithDouble:");
            uint64_t v23 = *(void *)(*(void *)(a1 + 32) + 8);
            uint64_t v24 = *(void **)(v23 + 40);
            *(void *)(v23 + 40) = v22;

            *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v17 masked];
            *a4 = 1;
            goto LABEL_16;
          }
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v25 objects:v29 count:16];
        if (v14) {
          continue;
        }
        break;
      }
    }
LABEL_16:
  }
}

- (id)_earCellForEar:(int64_t)a3
{
  uint64_t v5 = [MEMORY[0x263F088C8] indexPathForRow:0 inSection:a3 != 1];
  if (a3 == 2 && ![(AIAudiogramIndividualFrequencyInputViewController *)self hasLeftSymbols])
  {
    uint64_t v6 = [MEMORY[0x263F088C8] indexPathForRow:0 inSection:0];

    uint64_t v5 = (void *)v6;
  }
  id v7 = [(AIAudiogramIndividualFrequencyInputViewController *)self tableView];
  id v8 = [v7 cellForRowAtIndexPath:v5];

  return v8;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 1;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  if (![(AIAudiogramIndividualFrequencyInputViewController *)self hasLeftSymbols]) {
    return 1;
  }
  if ([(AIAudiogramIndividualFrequencyInputViewController *)self hasRightSymbols]) {
    return 2;
  }
  return 1;
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
  return 0;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  return 0.01;
}

- (void)earCellDidUpdateHearingLevel:(id)a3 forEar:(int64_t)a4 masked:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v8 = a3;
  [(AIAudiogramIndividualFrequencyInputViewController *)self setAnalyticsDidMakeAdjustments:1];
  double v9 = AXLogAudiogram();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v23 = 0;
    uint64_t v24 = &v23;
    uint64_t v25 = 0x2020000000;
    double v10 = (void (*)(int64_t, void))getHKAudiogramEarLocalizedDisplayNameForEarSymbolLoc_ptr;
    long long v26 = getHKAudiogramEarLocalizedDisplayNameForEarSymbolLoc_ptr;
    if (!getHKAudiogramEarLocalizedDisplayNameForEarSymbolLoc_ptr)
    {
      *(void *)buf = MEMORY[0x263EF8330];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __getHKAudiogramEarLocalizedDisplayNameForEarSymbolLoc_block_invoke;
      long long v28 = &unk_265058588;
      double v29 = &v23;
      double v11 = (void *)HealthUILibrary();
      uint64_t v12 = dlsym(v11, "HKAudiogramEarLocalizedDisplayNameForEar");
      *(void *)(v29[1] + 24) = v12;
      getHKAudiogramEarLocalizedDisplayNameForEarSymbolLoc_ptr = *(_UNKNOWN **)(v29[1] + 24);
      double v10 = (void (*)(int64_t, void))v24[3];
    }
    _Block_object_dispose(&v23, 8);
    if (!v10)
    {
      metadataForHKAudiogramSample_cold_1();
      __break(1u);
    }
    uint64_t v13 = v10(a4, 0);
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)&uint8_t buf[4] = a4;
    *(_WORD *)&buf[8] = 2112;
    *(void *)&buf[10] = v13;
    _os_log_impl(&dword_23F0D7000, v9, OS_LOG_TYPE_INFO, "Updating %i (%@) ear of audiogram", buf, 0x12u);
  }
  uint64_t v14 = [(AIAudiogramIndividualFrequencyInputViewController *)self currentFrequency];
  int64_t v15 = [(AIAudiogramIndividualFrequencyInputViewController *)self indexOfFrequencyInSensitivityPoints:v14];

  double v16 = AXLogAudiogram();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    id v17 = [(AIAudiogramIndividualFrequencyInputViewController *)self sensitivityPoints];
    uint64_t v18 = [v17 count];
    *(_DWORD *)buf = 134218240;
    *(void *)&uint8_t buf[4] = v15;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = v18;
    _os_log_impl(&dword_23F0D7000, v16, OS_LOG_TYPE_INFO, "Updating audiogram point %li of %li points", buf, 0x16u);
  }
  if (!v8)
  {
    uint64_t v22 = [(AIAudiogramIndividualFrequencyInputViewController *)self _earCellForEar:a4];
    id v19 = v22;
    AXPerformBlockOnMainThreadAfterDelay();

    id v8 = &unk_26F2DB1C0;
  }
  id v20 = [(AIAudiogramIndividualFrequencyInputViewController *)self newSensitivityPointForHearingLevel:v8 ear:a4 updateIndex:v15 masked:v5];
  if (v20)
  {
    if (v15 == -1) {
      [(AIAudiogramIndividualFrequencyInputViewController *)self addSensitivityPoint:v20];
    }
    else {
      [(AIAudiogramIndividualFrequencyInputViewController *)self updateSensitivityPoint:v20 atIndex:v15];
    }
    [(AIAudiogramIndividualFrequencyInputViewController *)self reloadAudiogram];
  }
  else
  {
    uint64_t v21 = AXLogAudiogram();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      -[AIAudiogramIndividualFrequencyInputViewController earCellDidUpdateHearingLevel:forEar:masked:]();
    }
  }
}

uint64_t __96__AIAudiogramIndividualFrequencyInputViewController_earCellDidUpdateHearingLevel_forEar_masked___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setHearingLevel:&unk_26F2DB1C0];
}

- (int64_t)indexOfFrequencyInSensitivityPoints:(id)a3
{
  id v4 = a3;
  uint64_t v15 = 0;
  double v16 = &v15;
  uint64_t v17 = 0x2020000000;
  uint64_t v18 = -1;
  BOOL v5 = [getHKUnitClass() hertzUnit];
  uint64_t v6 = [(AIAudiogramIndividualFrequencyInputViewController *)self sensitivityPoints];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __89__AIAudiogramIndividualFrequencyInputViewController_indexOfFrequencyInSensitivityPoints___block_invoke;
  v11[3] = &unk_265058708;
  id v7 = v5;
  id v12 = v7;
  id v8 = v4;
  id v13 = v8;
  uint64_t v14 = &v15;
  [v6 enumerateObjectsUsingBlock:v11];

  int64_t v9 = v16[3];
  _Block_object_dispose(&v15, 8);

  return v9;
}

void __89__AIAudiogramIndividualFrequencyInputViewController_indexOfFrequencyInSensitivityPoints___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = [a2 frequency];
  [v7 doubleValueForUnit:*(void *)(a1 + 32)];
  double v9 = v8;
  [*(id *)(a1 + 40) doubleValue];
  double v11 = v10;

  if (v9 == v11)
  {
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = a3;
    *a4 = 1;
  }
}

- (id)newSensitivityPointForHearingLevel:(id)a3 ear:(int64_t)a4 updateIndex:(int64_t)a5 masked:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  double v11 = [getHKUnitClass() hertzUnit];
  uint64_t v12 = [getHKUnitClass() decibelHearingLevelUnit];
  id HKQuantityClass = getHKQuantityClass();
  uint64_t v14 = [(AIAudiogramIndividualFrequencyInputViewController *)self currentFrequency];
  [v14 doubleValue];
  uint64_t v15 = objc_msgSend(HKQuantityClass, "quantityWithUnit:doubleValue:", v11);

  v45 = (void *)v12;
  if (v10)
  {
    id v16 = getHKQuantityClass();
    objc_msgSend(v10, "doubleValue", v12);
    uint64_t v17 = objc_msgSend(v16, "quantityWithUnit:doubleValue:", v12);
  }
  else
  {
    uint64_t v17 = 0;
  }
  id v25 = objc_alloc_init(MEMORY[0x263EFF980]);
  if (a4 == 2)
  {
    if (v17)
    {
      id v49 = 0;
      long long v28 = (void *)[objc_alloc((Class)getHKAudiogramSensitivityTestClass()) initWithSensitivity:v17 type:0 masked:v6 side:1 clampingRange:0 error:&v49];
      id v27 = v49;
      if (v28)
      {
        [v25 addObject:v28];
      }
      else
      {
        v35 = AXLogAudiogram();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
          -[AIAudiogramIndividualFrequencyInputViewController newSensitivityPointForHearingLevel:ear:updateIndex:masked:]();
        }
      }
    }
    else
    {
      id v27 = 0;
    }
    if (a5 != -1)
    {
      BOOL v36 = [(AIAudiogramIndividualFrequencyInputViewController *)self sensitivityPoints];
      v37 = [v36 objectAtIndexedSubscript:a5];
      double v32 = [v37 tests];

      v47[0] = MEMORY[0x263EF8330];
      v47[1] = 3221225472;
      v47[2] = __111__AIAudiogramIndividualFrequencyInputViewController_newSensitivityPointForHearingLevel_ear_updateIndex_masked___block_invoke_347;
      v47[3] = &unk_265058730;
      double v33 = &v48;
      id v48 = v25;
      double v34 = v47;
      goto LABEL_27;
    }
  }
  else
  {
    if (a4 != 1)
    {
      id v27 = 0;
      goto LABEL_28;
    }
    if (v17)
    {
      id v52 = 0;
      long long v26 = (void *)[objc_alloc((Class)getHKAudiogramSensitivityTestClass()) initWithSensitivity:v17 type:0 masked:v6 side:0 clampingRange:0 error:&v52];
      id v27 = v52;
      if (v26)
      {
        [v25 addObject:v26];
      }
      else
      {
        double v29 = AXLogAudiogram();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
          -[AIAudiogramIndividualFrequencyInputViewController newSensitivityPointForHearingLevel:ear:updateIndex:masked:]();
        }
      }
    }
    else
    {
      id v27 = 0;
    }
    if (a5 != -1)
    {
      uint64_t v30 = [(AIAudiogramIndividualFrequencyInputViewController *)self sensitivityPoints];
      id v31 = [v30 objectAtIndexedSubscript:a5];
      double v32 = [v31 tests];

      v50[0] = MEMORY[0x263EF8330];
      v50[1] = 3221225472;
      v50[2] = __111__AIAudiogramIndividualFrequencyInputViewController_newSensitivityPointForHearingLevel_ear_updateIndex_masked___block_invoke;
      v50[3] = &unk_265058730;
      double v33 = &v51;
      id v51 = v25;
      double v34 = v50;
LABEL_27:
      objc_msgSend(v32, "enumerateObjectsUsingBlock:", v34, v45);
    }
  }
LABEL_28:
  uint64_t v54 = 0;
  v55 = &v54;
  uint64_t v56 = 0x2050000000;
  BOOL v38 = (void *)getHKAudiogramSensitivityPointClass_softClass;
  uint64_t v57 = getHKAudiogramSensitivityPointClass_softClass;
  if (!getHKAudiogramSensitivityPointClass_softClass)
  {
    v53[0] = MEMORY[0x263EF8330];
    v53[1] = 3221225472;
    v53[2] = __getHKAudiogramSensitivityPointClass_block_invoke;
    v53[3] = &unk_265058588;
    v53[4] = &v54;
    __getHKAudiogramSensitivityPointClass_block_invoke((uint64_t)v53, v18, v19, v20, v21, v22, v23, v24, (uint8_t)v45);
    BOOL v38 = (void *)v55[3];
  }
  id v39 = v38;
  _Block_object_dispose(&v54, 8);
  id v46 = v27;
  v40 = [v39 sensitivityPointWithFrequency:v15 tests:v25 error:&v46];
  id v41 = v46;

  if (v41 || !v40)
  {
    double v43 = AXLogAudiogram();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR)) {
      -[AIAudiogramIndividualFrequencyInputViewController newSensitivityPointForHearingLevel:ear:updateIndex:masked:]();
    }

    id v42 = 0;
  }
  else
  {
    id v42 = v40;
  }

  return v42;
}

void __111__AIAudiogramIndividualFrequencyInputViewController_newSensitivityPointForHearingLevel_ear_updateIndex_masked___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  if ([v7 side] == 1)
  {
    BOOL v6 = [v7 sensitivity];

    if (v6)
    {
      [*(id *)(a1 + 32) addObject:v7];
      *a4 = 1;
    }
  }
}

void __111__AIAudiogramIndividualFrequencyInputViewController_newSensitivityPointForHearingLevel_ear_updateIndex_masked___block_invoke_347(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  if (![v6 side])
  {
    [*(id *)(a1 + 32) addObject:v6];
    *a4 = 1;
  }
}

- (void)addSensitivityPoint:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(AIAudiogramIndividualFrequencyInputViewController *)self sensitivityPoints];
  [v5 addObject:v4];

  id v6 = [(AIAudiogramIndividualFrequencyInputViewController *)self sensitivityPoints];
  [v6 sortUsingComparator:&__block_literal_global];
}

uint64_t __73__AIAudiogramIndividualFrequencyInputViewController_addSensitivityPoint___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  BOOL v5 = [a2 frequency];
  id v6 = [v4 frequency];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

- (void)updateSensitivityPoint:(id)a3 atIndex:(int64_t)a4
{
  id v6 = a3;
  if (a4 < 0
    || ([(AIAudiogramIndividualFrequencyInputViewController *)self sensitivityPoints],
        uint64_t v7 = objc_claimAutoreleasedReturnValue(),
        unint64_t v8 = [v7 count],
        v7,
        v8 <= a4))
  {
    id v10 = AXLogAudiogram();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[AIAudiogramIndividualFrequencyInputViewController updateSensitivityPoint:atIndex:]();
    }
  }
  else
  {
    double v9 = [(AIAudiogramIndividualFrequencyInputViewController *)self sensitivityPoints];
    [v9 setObject:v6 atIndexedSubscript:a4];
  }
}

- (void)reloadAudiogram
{
  id v3 = [(AIAudiogramIndividualFrequencyInputViewController *)self sensitivityPoints];
  [(AIAudiogramIndividualFrequencyInputViewController *)self _reloadAudiogramWithSensitivityPoints:v3];
}

- (void)updateActiveIndexPathForEar:(int64_t)a3 beginEditing:(BOOL)a4
{
  BOOL v4 = a4;
  [MEMORY[0x263F088C8] indexPathForRow:0 inSection:a3 != 1];
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  id v6 = [(AIAudiogramIndividualFrequencyInputViewController *)self activeIndexPath];
  int v7 = [v11 isEqual:v6];

  if (!v4)
  {
    if (!v7)
    {
LABEL_7:
      [(AIAudiogramIndividualFrequencyInputViewController *)self setActiveIndexPath:v11];
      id v10 = [(AIAudiogramIndividualFrequencyInputViewController *)self activeIndexPath];
      [(AIAudiogramIndividualFrequencyInputViewController *)self _scrollToIndexPathIfNecessary:v10 animated:1];

      unint64_t v8 = v11;
      goto LABEL_8;
    }
    id v9 = 0;
LABEL_6:
    [(AIAudiogramIndividualFrequencyInputViewController *)self setActiveIndexPath:v9];
    goto LABEL_7;
  }
  unint64_t v8 = v11;
  id v9 = v11;
  if ((v7 & 1) == 0) {
    goto LABEL_6;
  }
LABEL_8:
}

- (void)earCellDidBeginEditingForEar:(int64_t)a3
{
}

- (void)earCellDidEndEditingForEar:(int64_t)a3
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

- (UILabel)frequencyTitleLabel
{
  return self->_frequencyTitleLabel;
}

- (void)setFrequencyTitleLabel:(id)a3
{
}

- (BOOL)userAddedFrequencyAfterOptical
{
  return self->_userAddedFrequencyAfterOptical;
}

- (void)setUserAddedFrequencyAfterOptical:(BOOL)a3
{
  self->_userAddedFrequencyAfterOptical = a3;
}

- (NSNumber)currentFrequency
{
  return self->_currentFrequency;
}

- (void)setCurrentFrequency:(id)a3
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

- (AIAudiogramKeyboardToolbarForSensitivityPoint)keyboardToolbar
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

- (UIViewController)chartViewController
{
  return self->_chartViewController;
}

- (void)setChartViewController:(id)a3
{
}

- (HKAudiogramSample)audiogram
{
  return self->_audiogram;
}

- (void)setAudiogram:(id)a3
{
}

- (NSMutableArray)sensitivityPoints
{
  return self->_sensitivityPoints;
}

- (void)setSensitivityPoints:(id)a3
{
}

- (NSArray)symbols
{
  return self->_symbols;
}

- (void)setSymbols:(id)a3
{
}

- (BOOL)hasLeftSymbols
{
  return self->_hasLeftSymbols;
}

- (void)setHasLeftSymbols:(BOOL)a3
{
  self->_hasLeftSymbols = a3;
}

- (BOOL)hasRightSymbols
{
  return self->_hasRightSymbols;
}

- (void)setHasRightSymbols:(BOOL)a3
{
  self->_hasRightSymbols = a3;
}

- (BOOL)hasLeftMaskedSymbol
{
  return self->_hasLeftMaskedSymbol;
}

- (void)setHasLeftMaskedSymbol:(BOOL)a3
{
  self->_hasLeftMaskedSymbol = a3;
}

- (BOOL)hasRightMaskedSymbol
{
  return self->_hasRightMaskedSymbol;
}

- (void)setHasRightMaskedSymbol:(BOOL)a3
{
  self->_hasRightMaskedSymbol = a3;
}

- (BOOL)isModal
{
  return self->_isModal;
}

- (void)setIsModal:(BOOL)a3
{
  self->_isModal = a3;
}

- (BOOL)didAddBackgroundLayer
{
  return self->_didAddBackgroundLayer;
}

- (void)setDidAddBackgroundLayer:(BOOL)a3
{
  self->_didAddBackgroundLayer = a3;
}

- (OBTrayButton)footerButton
{
  return self->_footerButton;
}

- (void)setFooterButton:(id)a3
{
}

- (AIAudiogramManualIngestionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (AIAudiogramManualIngestionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
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

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_audiogramConfirmationDelegate);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_footerButton, 0);
  objc_storeStrong((id *)&self->_symbols, 0);
  objc_storeStrong((id *)&self->_sensitivityPoints, 0);
  objc_storeStrong((id *)&self->_audiogram, 0);
  objc_storeStrong((id *)&self->_chartViewController, 0);
  objc_storeStrong((id *)&self->_keyboardToolbar, 0);
  objc_storeStrong((id *)&self->_activeIndexPath, 0);
  objc_storeStrong((id *)&self->_tableViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_currentFrequency, 0);
  objc_storeStrong((id *)&self->_frequencyTitleLabel, 0);
  objc_storeStrong((id *)&self->_initialDate, 0);
  objc_storeStrong((id *)&self->_unitPreferenceController, 0);
}

- (void)tableView:(void *)a1 cellForRowAtIndexPath:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  v3[0] = 67109120;
  v3[1] = [a1 section];
  _os_log_error_impl(&dword_23F0D7000, a2, OS_LOG_TYPE_ERROR, "Unexpected section (%i) creating row for audiogram table view", (uint8_t *)v3, 8u);
}

- (void)earCellDidUpdateHearingLevel:forEar:masked:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_23F0D7000, v0, v1, "Error creating audiogram point", v2, v3, v4, v5, v6);
}

- (void)newSensitivityPointForHearingLevel:ear:updateIndex:masked:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_23F0D7000, v0, v1, "Error creating new sensitivity point", v2, v3, v4, v5, v6);
}

- (void)newSensitivityPointForHearingLevel:ear:updateIndex:masked:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_23F0D7000, v0, v1, "Error creating left sensitivity point", v2, v3, v4, v5, v6);
}

- (void)newSensitivityPointForHearingLevel:ear:updateIndex:masked:.cold.3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_23F0D7000, v0, v1, "Error creating right sensitivity point", v2, v3, v4, v5, v6);
}

- (void)updateSensitivityPoint:atIndex:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_23F0D7000, v0, v1, "Invalid index for updating sensitivity point", v2, v3, v4, v5, v6);
}

@end