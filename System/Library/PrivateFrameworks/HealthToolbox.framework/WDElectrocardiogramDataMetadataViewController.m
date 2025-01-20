@interface WDElectrocardiogramDataMetadataViewController
- (BOOL)_addSectionIfNonNull:(id)a3;
- (BOOL)actionsEnabled;
- (BOOL)electrocardiogramMetadataViewShouldShowShareRow:(id)a3;
- (BOOL)firstViewDidLayoutSubviews;
- (HKDataMetadataViewControllerDelegate)delegate;
- (HKElectrocardiogram)sample;
- (HRElectrocardiogramReportGenerator)reportGenerator;
- (NSMutableArray)sections;
- (WDElectrocardiogramDataMetadataViewController)initWithSample:(id)a3 delegate:(id)a4 mode:(int64_t)a5 activeAlgorithmVersion:(id)a6;
- (WDElectrocardiogramReportDataSource)reportDataSource;
- (id)_electrocardiogramMetadataContainerView;
- (id)accessibilityIdentifier;
- (id)electrocardiogramMetadataView:(id)a3 regulatedBodyTextForSample:(id)a4;
- (id)featureVersionFromUpdateVersion:(id)a3;
- (id)identifierBundle;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int64_t)_fetchActiveAlgorithmVersionWithHealthStore:(id)a3;
- (int64_t)activeAlgorithmVersion;
- (int64_t)mode;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)sampleAlgorithmVersion;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (unint64_t)supportedInterfaceOrientations;
- (void)_loadSections;
- (void)_localeOrDisplayTypeChange:(id)a3;
- (void)_reloadElectrocardiogramMetadataTableHeaderView;
- (void)dealloc;
- (void)deleteSampleTriggeredBySection:(id)a3;
- (void)deletionSectionDidSelectRow:(id)a3;
- (void)electrocardiogramMetadataViewDidTapDetailButton:(id)a3;
- (void)presentPDFViewController;
- (void)setActionsEnabled:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setFirstViewDidLayoutSubviews:(BOOL)a3;
- (void)setMode:(int64_t)a3;
- (void)setReportDataSource:(id)a3;
- (void)setReportGenerator:(id)a3;
- (void)setSample:(id)a3;
- (void)setSections:(id)a3;
- (void)shareButtonTapped:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewControllerDidLeaveAdaptiveModal;
- (void)viewControllerWillEnterAdaptiveModal;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation WDElectrocardiogramDataMetadataViewController

- (WDElectrocardiogramDataMetadataViewController)initWithSample:(id)a3 delegate:(id)a4 mode:(int64_t)a5 activeAlgorithmVersion:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  v30.receiver = self;
  v30.super_class = (Class)WDElectrocardiogramDataMetadataViewController;
  v14 = [(HKTableViewController *)&v30 initWithUsingInsetStyling:1];
  v15 = v14;
  if (v14)
  {
    v14->_firstViewDidLayoutSubviews = 1;
    objc_storeStrong((id *)&v14->_sample, a3);
    objc_storeWeak((id *)&v15->_delegate, v12);
    v16 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    sections = v15->_sections;
    v15->_sections = v16;

    v15->_actionsEnabled = 1;
    v15->_mode = a5;
    if (v13)
    {
      v15->_activeAlgorithmVersion = [v13 integerValue];
    }
    else
    {
      v18 = [(WDElectrocardiogramDataMetadataViewController *)v15 delegate];
      v19 = [v18 healthStore];
      v15->_activeAlgorithmVersion = [(WDElectrocardiogramDataMetadataViewController *)v15 _fetchActiveAlgorithmVersionWithHealthStore:v19];
    }
    v20 = [WDElectrocardiogramReportDataSource alloc];
    v21 = [(WDElectrocardiogramDataMetadataViewController *)v15 delegate];
    v22 = [v21 healthStore];
    uint64_t v23 = [(WDElectrocardiogramReportDataSource *)v20 initWithSample:v11 healthStore:v22 activeAlgorithmVersion:v15->_activeAlgorithmVersion];
    reportDataSource = v15->_reportDataSource;
    v15->_reportDataSource = (WDElectrocardiogramReportDataSource *)v23;

    uint64_t v25 = [objc_alloc(MEMORY[0x263F476C0]) initWithDataSource:v15->_reportDataSource];
    reportGenerator = v15->_reportGenerator;
    v15->_reportGenerator = (HRElectrocardiogramReportGenerator *)v25;

    v27 = [MEMORY[0x263F08A00] defaultCenter];
    [v27 addObserver:v15 selector:sel__localeOrDisplayTypeChange_ name:*MEMORY[0x263EFF458] object:0];

    v28 = [MEMORY[0x263F08A00] defaultCenter];
    [v28 addObserver:v15 selector:sel__localeOrDisplayTypeChange_ name:*MEMORY[0x263F46338] object:0];
  }
  return v15;
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)WDElectrocardiogramDataMetadataViewController;
  [(WDElectrocardiogramDataMetadataViewController *)&v4 dealloc];
}

- (int64_t)_fetchActiveAlgorithmVersionWithHealthStore:(id)a3
{
  id v10 = 0;
  v3 = [MEMORY[0x263F0A348] versionWithHealthStore:a3 error:&v10];
  id v4 = v10;
  v5 = v4;
  if (v3) {
    BOOL v6 = v4 == 0;
  }
  else {
    BOOL v6 = 0;
  }
  if (v6)
  {
    int64_t v8 = [v3 integerValue];
  }
  else
  {
    if (v4)
    {
      _HKInitializeLogging();
      v7 = *MEMORY[0x263F09920];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09920], OS_LOG_TYPE_ERROR)) {
        -[WDElectrocardiogramDataMetadataViewController _fetchActiveAlgorithmVersionWithHealthStore:](v7);
      }
    }
    int64_t v8 = *MEMORY[0x263F0AA58];
  }

  return v8;
}

- (void)_localeOrDisplayTypeChange:(id)a3
{
  [(WDElectrocardiogramDataMetadataViewController *)self _loadSections];
  id v4 = [(WDElectrocardiogramDataMetadataViewController *)self tableView];
  [v4 reloadData];
}

- (id)identifierBundle
{
  return (id)[NSString healthAccessibilityIdentifier:1 suffix:@"SessionDetails"];
}

- (void)viewDidLoad
{
  v17.receiver = self;
  v17.super_class = (Class)WDElectrocardiogramDataMetadataViewController;
  [(HKTableViewController *)&v17 viewDidLoad];
  v3 = WDBundle();
  id v4 = [v3 localizedStringForKey:@"ECG_DETAIL" value:&stru_26D2EA890 table:@"WellnessDashboard-Localizable-Cinnamon"];
  v5 = HKConditionallyRedactedHeartRhythmString();
  [(WDElectrocardiogramDataMetadataViewController *)self setTitle:v5];

  if ([(WDElectrocardiogramDataMetadataViewController *)self mode] != 2)
  {
    BOOL v6 = (void *)[objc_alloc(MEMORY[0x263F1C468]) initWithBarButtonSystemItem:9 target:self action:sel_shareButtonTapped_];
    v7 = [(WDElectrocardiogramDataMetadataViewController *)self identifierBundle];
    int64_t v8 = [v7 stringByAppendingString:@".shareButton"];
    [v6 setAccessibilityIdentifier:v8];

    v9 = [(WDElectrocardiogramDataMetadataViewController *)self navigationItem];
    [v9 setRightBarButtonItem:v6];
  }
  double v10 = *MEMORY[0x263F1D600];
  id v11 = [(WDElectrocardiogramDataMetadataViewController *)self tableView];
  [v11 setRowHeight:v10];

  id v12 = [(WDElectrocardiogramDataMetadataViewController *)self tableView];
  [v12 setEstimatedRowHeight:64.0];

  id v13 = [(WDElectrocardiogramDataMetadataViewController *)self tableView];
  [v13 _setSectionContentInsetFollowsLayoutMargins:1];

  double v14 = *MEMORY[0x263F463A8];
  v15 = [(WDElectrocardiogramDataMetadataViewController *)self tableView];
  [v15 _setSectionCornerRadius:v14];

  [(WDElectrocardiogramDataMetadataViewController *)self _loadSections];
  v16 = [(WDElectrocardiogramDataMetadataViewController *)self tableView];
  [v16 reloadData];

  [(WDElectrocardiogramDataMetadataViewController *)self _reloadElectrocardiogramMetadataTableHeaderView];
}

- (void)viewDidLayoutSubviews
{
  v6.receiver = self;
  v6.super_class = (Class)WDElectrocardiogramDataMetadataViewController;
  [(WDElectrocardiogramDataMetadataViewController *)&v6 viewDidLayoutSubviews];
  if ([(WDElectrocardiogramDataMetadataViewController *)self firstViewDidLayoutSubviews])
  {
    [(WDElectrocardiogramDataMetadataViewController *)self setFirstViewDidLayoutSubviews:0];
    v3 = [(WDElectrocardiogramDataMetadataViewController *)self tableView];
    id v4 = [v3 tableHeaderView];
    v5 = [(WDElectrocardiogramDataMetadataViewController *)self tableView];
    [v5 setTableHeaderView:v4];
  }
}

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

- (BOOL)_addSectionIfNonNull:(id)a3
{
  if (a3)
  {
    id v5 = a3;
    objc_super v6 = [(WDElectrocardiogramDataMetadataViewController *)self sections];
    [v6 addObject:v5];
  }
  return a3 != 0;
}

- (void)_loadSections
{
  v53[2] = *MEMORY[0x263EF8340];
  v3 = [(WDElectrocardiogramDataMetadataViewController *)self sections];
  [v3 removeAllObjects];

  id v4 = [(WDElectrocardiogramDataMetadataViewController *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    id v5 = [(WDElectrocardiogramDataMetadataViewController *)self delegate];
    objc_super v6 = [v5 displayTypeController];
  }
  else
  {
    objc_super v6 = 0;
  }

  v7 = [(WDElectrocardiogramDataMetadataViewController *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    int64_t v8 = [(WDElectrocardiogramDataMetadataViewController *)self delegate];
    v9 = [v8 unitController];
  }
  else
  {
    v9 = 0;
  }

  double v10 = [(WDElectrocardiogramDataMetadataViewController *)self sections];
  id v11 = objc_alloc(MEMORY[0x263F466B0]);
  id v12 = [(WDElectrocardiogramDataMetadataViewController *)self sample];
  id v13 = (void *)[v11 initWithSample:v12 displayTypeController:v6 unitController:v9];
  [v10 addObject:v13];

  double v14 = objc_msgSend(MEMORY[0x263EFFA40], "hk_heartRhythmDefaults");
  BOOL v15 = (objc_msgSend(v14, "hk_hfeModeEnabled") & 1) == 0
     && [(WDElectrocardiogramDataMetadataViewController *)self mode] != 2;

  int64_t v16 = [(WDElectrocardiogramDataMetadataViewController *)self mode];
  if (v15)
  {
    id v17 = objc_alloc(MEMORY[0x263F466B8]);
    v18 = [(WDElectrocardiogramDataMetadataViewController *)self sample];
    v19 = (void *)[v17 initWithSample:v18];

    v20 = [(WDElectrocardiogramDataMetadataViewController *)self sample];
    v21 = [v20 sourceRevision];
    v22 = [v21 version];

    int64_t v23 = [(WDElectrocardiogramDataMetadataViewController *)self sampleAlgorithmVersion];
    v24 = (void *)[objc_alloc(MEMORY[0x263F46740]) initWithSourceVersion:v22 algorithmVersion:v23];
    if (v24)
    {
      int64_t v46 = v16;
      v51 = v6;
      uint64_t v25 = [(WDElectrocardiogramDataMetadataViewController *)self sample];
      v26 = [v25 metadata];
      v27 = [v26 objectForKey:*MEMORY[0x263F0AB68]];

      v49 = v22;
      v50 = v9;
      v47 = v27;
      if (v27)
      {
        id v48 = v27;
        -[WDElectrocardiogramDataMetadataViewController featureVersionFromUpdateVersion:](self, "featureVersionFromUpdateVersion:");
      }
      else
      {
        id v48 = [v24 updateVersion];
        [v24 featureVersion];
      v28 = };
      v29 = HKHealthKitFrameworkBundle();
      objc_super v30 = [v29 localizedStringForKey:@"SOURCE_FEATURE_VERSION_TITLE" value:&stru_26D2EA890 table:@"Localizable-Cinnamon"];
      v31 = HKConditionallyRedactedHeartRhythmString();
      v53[0] = *MEMORY[0x263F0AA88];
      uint64_t v32 = v53[0];
      v53[1] = @"FeatureVersion";
      v33 = [MEMORY[0x263EFF8C0] arrayWithObjects:v53 count:2];
      v34 = HKUIJoinStringsForAutomationIdentifier();
      [v19 addText:v28 detail:v31 baseIdentifier:v34];

      v35 = HKHealthKitFrameworkBundle();
      v36 = [v35 localizedStringForKey:@"SOURCE_UPDATE_VERSION_TITLE" value:&stru_26D2EA890 table:@"Localizable-Cinnamon"];
      v37 = HKConditionallyRedactedHeartRhythmString();
      v52[0] = v32;
      v52[1] = @"UpdateVersion";
      v38 = [MEMORY[0x263EFF8C0] arrayWithObjects:v52 count:2];
      v39 = HKUIJoinStringsForAutomationIdentifier();
      [v19 addText:v48 detail:v37 baseIdentifier:v39];

      v9 = v50;
      objc_super v6 = v51;
      v22 = v49;
      int64_t v16 = v46;
    }
    [(WDElectrocardiogramDataMetadataViewController *)self _addSectionIfNonNull:v19];
  }
  if (!v16)
  {
    id v40 = objc_alloc(MEMORY[0x263F466A8]);
    v41 = WDBundle();
    v42 = [v41 localizedStringForKey:@"DELETE_ECG_SAMPLE_CELL_TITLE" value:&stru_26D2EA890 table:@"WellnessDashboard-Localizable-Cinnamon"];
    v43 = HKConditionallyRedactedHeartRhythmString();
    v44 = (void *)[v40 initWithTitle:v43];

    [v44 setDelegate:self];
    v45 = [(WDElectrocardiogramDataMetadataViewController *)self sections];
    [v45 addObject:v44];
  }
}

- (void)_reloadElectrocardiogramMetadataTableHeaderView
{
  id v18 = [(WDElectrocardiogramDataMetadataViewController *)self _electrocardiogramMetadataContainerView];
  v3 = [(WDElectrocardiogramDataMetadataViewController *)self tableView];
  [v3 setTableHeaderView:v18];

  id v4 = [v18 widthAnchor];
  id v5 = [(WDElectrocardiogramDataMetadataViewController *)self tableView];
  objc_super v6 = [v5 widthAnchor];
  v7 = [v4 constraintEqualToAnchor:v6];
  [v7 setActive:1];

  int64_t v8 = [v18 centerXAnchor];
  v9 = [(WDElectrocardiogramDataMetadataViewController *)self tableView];
  double v10 = [v9 centerXAnchor];
  id v11 = [v8 constraintEqualToAnchor:v10];
  [v11 setActive:1];

  id v12 = [v18 topAnchor];
  id v13 = [(WDElectrocardiogramDataMetadataViewController *)self tableView];
  double v14 = [v13 topAnchor];
  BOOL v15 = [v12 constraintEqualToAnchor:v14];
  [v15 setActive:1];

  int64_t v16 = [(WDElectrocardiogramDataMetadataViewController *)self tableView];
  id v17 = [v16 tableHeaderView];
  [v17 layoutIfNeeded];
}

- (id)_electrocardiogramMetadataContainerView
{
  id v3 = objc_alloc(MEMORY[0x263F1CB60]);
  id v4 = objc_msgSend(v3, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  [v4 setTranslatesAutoresizingMaskIntoConstraints:0];
  int64_t v5 = [(WDElectrocardiogramDataMetadataViewController *)self activeAlgorithmVersion];
  if (v5 == *MEMORY[0x263F0AA58]
    || (int64_t v6 = [(WDElectrocardiogramDataMetadataViewController *)self activeAlgorithmVersion],
        v6 == *MEMORY[0x263F0AA50]))
  {
    v7 = 0;
  }
  else
  {
    BOOL v8 = [(WDElectrocardiogramDataMetadataViewController *)self mode] != 2;
    BOOL v9 = [(WDElectrocardiogramDataMetadataViewController *)self mode] != 2;
    BOOL v10 = [(WDElectrocardiogramDataMetadataViewController *)self mode] != 0;
    id v11 = objc_alloc(MEMORY[0x263F46728]);
    id v12 = [(WDElectrocardiogramDataMetadataViewController *)self sample];
    v7 = objc_msgSend(v11, "initWithSample:activeAlgorithmVersion:displayGraph:allowExportToPDF:isSharedData:delegate:", v12, -[WDElectrocardiogramDataMetadataViewController activeAlgorithmVersion](self, "activeAlgorithmVersion"), v8, v9, v10, self);
  }
  [v4 addSubview:v7];
  objc_msgSend(v7, "hk_alignConstraintsWithView:", v4);

  return v4;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  id v3 = [(WDElectrocardiogramDataMetadataViewController *)self sections];
  int64_t v4 = [v3 count];

  return v4;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  int64_t v5 = [(WDElectrocardiogramDataMetadataViewController *)self sections];
  int64_t v6 = [v5 objectAtIndexedSubscript:a4];

  v7 = [v6 sectionTitle];

  return v7;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  int64_t v5 = [(WDElectrocardiogramDataMetadataViewController *)self sections];
  int64_t v6 = [v5 objectAtIndexedSubscript:a4];

  v7 = [v6 sectionFooter];

  return v7;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  int64_t v5 = [(WDElectrocardiogramDataMetadataViewController *)self sections];
  int64_t v6 = [v5 objectAtIndexedSubscript:a4];

  int64_t v7 = [v6 numberOfRowsInSection];
  return v7;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  BOOL v8 = [(WDElectrocardiogramDataMetadataViewController *)self sections];
  BOOL v9 = objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v6, "section"));

  uint64_t v10 = [v6 row];
  id v11 = [v9 cellForIndex:v10 tableView:v7];

  return v11;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a4;
  [a3 deselectRowAtIndexPath:v6 animated:1];
  id v7 = [(WDElectrocardiogramDataMetadataViewController *)self sections];
  objc_msgSend(v7, "objectAtIndexedSubscript:", objc_msgSend(v6, "section"));
  id v10 = (id)objc_claimAutoreleasedReturnValue();

  uint64_t v8 = [v6 row];
  BOOL v9 = [(WDElectrocardiogramDataMetadataViewController *)self navigationController];
  [v10 selectCellForIndex:v8 navigationController:v9 animated:1];
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(WDElectrocardiogramDataMetadataViewController *)self sections];
  objc_msgSend(v11, "objectAtIndexedSubscript:", objc_msgSend(v8, "section"));
  id v13 = (id)objc_claimAutoreleasedReturnValue();

  uint64_t v12 = [v8 row];
  [v13 willDisplayCell:v9 forIndex:v12 tableView:v10];
}

- (void)deletionSectionDidSelectRow:(id)a3
{
  id v4 = a3;
  if ([(WDElectrocardiogramDataMetadataViewController *)self actionsEnabled])
  {
    int64_t v5 = (void *)MEMORY[0x263F1C3F8];
    id v6 = WDBundle();
    id v7 = [v6 localizedStringForKey:@"DELETE_ECG_SAMPLE_ACTION_SHEET_TITLE" value:&stru_26D2EA890 table:@"WellnessDashboard-Localizable-Cinnamon"];
    id v8 = HKConditionallyRedactedHeartRhythmString();
    id v9 = [v5 alertControllerWithTitle:v8 message:0 preferredStyle:0];

    id v10 = (void *)MEMORY[0x263F1C3F0];
    id v11 = WDBundle();
    uint64_t v12 = [v11 localizedStringForKey:@"CANCEL" value:&stru_26D2EA890 table:@"WellnessDashboard-Localizable"];
    id v13 = [v10 actionWithTitle:v12 style:1 handler:0];
    [v9 addAction:v13];

    double v14 = (void *)MEMORY[0x263F1C3F0];
    BOOL v15 = WDBundle();
    int64_t v16 = [v15 localizedStringForKey:@"DELETE_ECG_SAMPLE_BUTTON_TITLE" value:&stru_26D2EA890 table:@"WellnessDashboard-Localizable-Cinnamon"];
    id v17 = HKConditionallyRedactedHeartRhythmString();
    uint64_t v19 = MEMORY[0x263EF8330];
    uint64_t v20 = 3221225472;
    v21 = __77__WDElectrocardiogramDataMetadataViewController_deletionSectionDidSelectRow___block_invoke;
    v22 = &unk_26458DE98;
    int64_t v23 = self;
    id v24 = v4;
    id v18 = [v14 actionWithTitle:v17 style:2 handler:&v19];
    objc_msgSend(v9, "addAction:", v18, v19, v20, v21, v22, v23);

    [(WDElectrocardiogramDataMetadataViewController *)self presentViewController:v9 animated:1 completion:0];
  }
}

uint64_t __77__WDElectrocardiogramDataMetadataViewController_deletionSectionDidSelectRow___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) deleteSampleTriggeredBySection:*(void *)(a1 + 40)];
}

- (id)accessibilityIdentifier
{
  v2 = [(WDElectrocardiogramDataMetadataViewController *)self identifierBundle];
  id v3 = [v2 stringByAppendingString:@".DeleteRecordingButton"];

  return v3;
}

- (void)electrocardiogramMetadataViewDidTapDetailButton:(id)a3
{
  id v4 = (void *)MEMORY[0x263F476B8];
  int64_t v5 = [(WDElectrocardiogramDataMetadataViewController *)self sample];
  id v6 = [(WDElectrocardiogramDataMetadataViewController *)self reportDataSource];
  objc_msgSend(v4, "electrocardiogramPossibleResultsViewControllerForSample:forAlgorithmVersion:", v5, objc_msgSend(v6, "activeAlgorithmVersion"));
  id v9 = (id)objc_claimAutoreleasedReturnValue();

  [v9 setLeftButtonType:3];
  id v7 = (void *)[objc_alloc(MEMORY[0x263F46858]) initWithRootViewController:v9];
  id v8 = [(WDElectrocardiogramDataMetadataViewController *)self navigationController];
  [v8 presentViewController:v7 animated:1 completion:0];
}

- (id)electrocardiogramMetadataView:(id)a3 regulatedBodyTextForSample:(id)a4
{
  id v5 = a4;
  BOOL v6 = [(WDElectrocardiogramDataMetadataViewController *)self mode] != 0;
  id v7 = [(WDElectrocardiogramDataMetadataViewController *)self reportDataSource];
  id v8 = objc_msgSend(v5, "hrui_classificationShortBodyTextWithActiveAlgorithmVersion:isSharedData:", objc_msgSend(v7, "activeAlgorithmVersion"), v6);

  return v8;
}

- (BOOL)electrocardiogramMetadataViewShouldShowShareRow:(id)a3
{
  return 1;
}

- (void)setActionsEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  self->_actionsEnabled = a3;
  id v5 = [(WDElectrocardiogramDataMetadataViewController *)self navigationItem];
  id v4 = [v5 rightBarButtonItem];
  [v4 setEnabled:v3];
}

- (void)shareButtonTapped:(id)a3
{
  v21[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(WDElectrocardiogramDataMetadataViewController *)self reportGenerator];
  BOOL v6 = [v5 generatePDF];

  id v7 = [WDElectrocardiogramActivityItemSource alloc];
  id v8 = [(WDElectrocardiogramDataMetadataViewController *)self sample];
  id v9 = [v8 startDate];
  id v10 = [(WDElectrocardiogramDataMetadataViewController *)self reportDataSource];
  id v11 = [v10 firstName];
  uint64_t v12 = [(WDElectrocardiogramDataMetadataViewController *)self reportDataSource];
  id v13 = [v12 lastName];
  double v14 = [(WDElectrocardiogramActivityItemSource *)v7 initWithPDFData:v6 sampleDate:v9 firstName:v11 lastName:v13 provenance:0];

  if (v14)
  {
    id v15 = objc_alloc(MEMORY[0x263F1C3E8]);
    v21[0] = v14;
    int64_t v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v21 count:1];
    id v17 = (void *)[v15 initWithActivityItems:v16 applicationActivities:0];

    id v18 = [v17 popoverPresentationController];
    [v18 setSourceItem:v4];

    uint64_t v20 = *MEMORY[0x263F1CFC0];
    uint64_t v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v20 count:1];
    [v17 setExcludedActivityTypes:v19];

    [(WDElectrocardiogramDataMetadataViewController *)self presentViewController:v17 animated:1 completion:0];
  }
}

- (void)presentPDFViewController
{
  if ([(WDElectrocardiogramDataMetadataViewController *)self actionsEnabled])
  {
    BOOL v3 = [(WDElectrocardiogramDataMetadataViewController *)self reportGenerator];
    id v14 = [v3 generatePDF];

    id v4 = [WDElectrocardiogramPDFViewController alloc];
    id v5 = [(WDElectrocardiogramDataMetadataViewController *)self sample];
    BOOL v6 = [v5 startDate];
    id v7 = [(WDElectrocardiogramDataMetadataViewController *)self reportDataSource];
    id v8 = [v7 firstName];
    id v9 = [(WDElectrocardiogramDataMetadataViewController *)self reportDataSource];
    id v10 = [v9 lastName];
    id v11 = [(WDElectrocardiogramPDFViewController *)v4 initWithPDFData:v14 sampleDate:v6 firstName:v8 lastName:v10];

    uint64_t v12 = (void *)[objc_alloc(MEMORY[0x263F1C7F8]) initWithRootViewController:v11];
    [(WDElectrocardiogramDataMetadataViewController *)self presentViewController:v12 animated:1 completion:0];
    id v13 = [MEMORY[0x263F476E0] sharedManager];
    [v13 trackElectrocardiogramPDFViewed];
  }
}

- (void)deleteSampleTriggeredBySection:(id)a3
{
  [a3 setEnabled:0];
  [(WDElectrocardiogramDataMetadataViewController *)self setActionsEnabled:0];
  id v4 = [(WDElectrocardiogramDataMetadataViewController *)self delegate];
  id v5 = [v4 healthStore];
  BOOL v6 = [(WDElectrocardiogramDataMetadataViewController *)self sample];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __80__WDElectrocardiogramDataMetadataViewController_deleteSampleTriggeredBySection___block_invoke;
  v7[3] = &unk_26458DC48;
  v7[4] = self;
  [v5 deleteObject:v6 options:3 withCompletion:v7];
}

void __80__WDElectrocardiogramDataMetadataViewController_deleteSampleTriggeredBySection___block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __80__WDElectrocardiogramDataMetadataViewController_deleteSampleTriggeredBySection___block_invoke_2;
  block[3] = &unk_26458DC98;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __80__WDElectrocardiogramDataMetadataViewController_deleteSampleTriggeredBySection___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) navigationController];
  BOOL v3 = [v2 presentingViewController];

  id v4 = *(void **)(a1 + 32);
  if (v3)
  {
    [v4 dismissViewControllerAnimated:1 completion:0];
  }
  else
  {
    id v6 = [v4 navigationController];
    id v5 = (id)[v6 popViewControllerAnimated:1];
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  id v8 = a3;
  if (!v8) {
    goto LABEL_3;
  }
  id v4 = [(WDElectrocardiogramDataMetadataViewController *)self traitCollection];
  id v5 = [v4 preferredContentSizeCategory];
  id v6 = [v8 preferredContentSizeCategory];
  char v7 = [v5 isEqualToString:v6];

  if ((v7 & 1) == 0) {
LABEL_3:
  }
    [(WDElectrocardiogramDataMetadataViewController *)self _reloadElectrocardiogramMetadataTableHeaderView];
}

- (int64_t)sampleAlgorithmVersion
{
  v2 = [(WDElectrocardiogramDataMetadataViewController *)self sample];
  BOOL v3 = [v2 _algorithmVersion];

  if (v3) {
    int64_t v4 = [v3 integerValue];
  }
  else {
    int64_t v4 = 1;
  }

  return v4;
}

- (id)featureVersionFromUpdateVersion:(id)a3
{
  BOOL v3 = [a3 componentsSeparatedByString:@"."];
  int64_t v4 = (void *)[v3 mutableCopy];

  if ((unint64_t)[v4 count] >= 2) {
    [v4 removeLastObject];
  }
  id v5 = [v4 componentsJoinedByString:@"."];

  return v5;
}

- (void)viewControllerWillEnterAdaptiveModal
{
  objc_initWeak(&location, self);
  id v3 = objc_alloc(MEMORY[0x263F1C468]);
  int64_t v4 = (void *)MEMORY[0x263F1C3C0];
  uint64_t v10 = MEMORY[0x263EF8330];
  uint64_t v11 = 3221225472;
  uint64_t v12 = __85__WDElectrocardiogramDataMetadataViewController_viewControllerWillEnterAdaptiveModal__block_invoke;
  id v13 = &unk_26458DD38;
  objc_copyWeak(&v14, &location);
  id v5 = [v4 actionWithHandler:&v10];
  id v6 = objc_msgSend(v3, "initWithBarButtonSystemItem:primaryAction:", 0, v5, v10, v11, v12, v13);

  char v7 = [(WDElectrocardiogramDataMetadataViewController *)self identifierBundle];
  id v8 = [v7 stringByAppendingString:@".doneButton"];
  [v6 setAccessibilityIdentifier:v8];

  id v9 = [(WDElectrocardiogramDataMetadataViewController *)self navigationItem];
  [v9 setLeftBarButtonItem:v6];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __85__WDElectrocardiogramDataMetadataViewController_viewControllerWillEnterAdaptiveModal__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained dismissViewControllerAnimated:1 completion:0];
}

- (void)viewControllerDidLeaveAdaptiveModal
{
  id v2 = [(WDElectrocardiogramDataMetadataViewController *)self navigationItem];
  [v2 setLeftBarButtonItem:0];
}

- (HKElectrocardiogram)sample
{
  return self->_sample;
}

- (void)setSample:(id)a3
{
}

- (BOOL)firstViewDidLayoutSubviews
{
  return self->_firstViewDidLayoutSubviews;
}

- (void)setFirstViewDidLayoutSubviews:(BOOL)a3
{
  self->_firstViewDidLayoutSubviews = a3;
}

- (int64_t)activeAlgorithmVersion
{
  return self->_activeAlgorithmVersion;
}

- (HKDataMetadataViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HKDataMetadataViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSMutableArray)sections
{
  return self->_sections;
}

- (void)setSections:(id)a3
{
}

- (WDElectrocardiogramReportDataSource)reportDataSource
{
  return self->_reportDataSource;
}

- (void)setReportDataSource:(id)a3
{
}

- (HRElectrocardiogramReportGenerator)reportGenerator
{
  return self->_reportGenerator;
}

- (void)setReportGenerator:(id)a3
{
}

- (int64_t)mode
{
  return self->_mode;
}

- (void)setMode:(int64_t)a3
{
  self->_mode = a3;
}

- (BOOL)actionsEnabled
{
  return self->_actionsEnabled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reportGenerator, 0);
  objc_storeStrong((id *)&self->_reportDataSource, 0);
  objc_storeStrong((id *)&self->_sections, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_sample, 0);
}

- (void)_fetchActiveAlgorithmVersionWithHealthStore:(os_log_t)log .cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136446210;
  id v2 = "-[WDElectrocardiogramDataMetadataViewController _fetchActiveAlgorithmVersionWithHealthStore:]";
  _os_log_error_impl(&dword_2210D2000, log, OS_LOG_TYPE_ERROR, "%{public}s: Failed to fetch active algorithm version.", (uint8_t *)&v1, 0xCu);
}

@end