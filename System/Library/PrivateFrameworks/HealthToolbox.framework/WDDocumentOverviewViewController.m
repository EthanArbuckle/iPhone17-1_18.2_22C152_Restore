@interface WDDocumentOverviewViewController
- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4;
- (HKDisplayType)displayType;
- (NSMutableArray)reportRowTypes;
- (NSMutableArray)sectionTypes;
- (NSString)sidebarSelectionIdentifier;
- (UIFont)bodyFont;
- (WDDocumentListDataProvider)dataProvider;
- (WDDocumentOverviewViewController)initWithDisplayTypes:(id)a3 profile:(id)a4 title:(id)a5 category:(id)a6 sidebarIdentifier:(id)a7;
- (WDProfile)profile;
- (double)_reportSectionEstimatedRowHeight:(int64_t)a3;
- (double)_reportSectionRowHeight:(int64_t)a3;
- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)_descriptionSectionCellForTableView:(id)a3 row:(int64_t)a4;
- (id)_reportAccessCellForTableView:(id)a3 forIndexPath:(id)a4;
- (id)_reportItemCellForTableView:(id)a3 row:(int64_t)a4;
- (id)_reportSectionCellForTableView:(id)a3 forIndexPath:(id)a4;
- (id)_reportShowAllCellForTableView:(id)a3 forIndexPath:(id)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (int64_t)totalReportCount;
- (void)_contentSizeCategoryDidChange:(id)a3;
- (void)_installSections;
- (void)_pushAccessViewController;
- (void)_pushReportDetailViewControllerForIndexPath:(id)a3;
- (void)_pushShowAllViewController;
- (void)_recomputeTotalReportCount;
- (void)_reloadAllData;
- (void)_selectReportRowForIndexPath:(id)a3;
- (void)_updateActivityForViewDidAppear;
- (void)dealloc;
- (void)setBodyFont:(id)a3;
- (void)setReportRowTypes:(id)a3;
- (void)setSectionTypes:(id)a3;
- (void)setSidebarSelectionIdentifier:(id)a3;
- (void)setTotalReportCount:(int64_t)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)widthDesignationDidChangeWithTraitEnvironment:(id)a3 previousTraitCollection:(id)a4;
@end

@implementation WDDocumentOverviewViewController

- (WDDocumentOverviewViewController)initWithDisplayTypes:(id)a3 profile:(id)a4 title:(id)a5 category:(id)a6 sidebarIdentifier:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a7;
  v22.receiver = self;
  v22.super_class = (Class)WDDocumentOverviewViewController;
  v15 = [(HKTableViewController *)&v22 initWithUsingInsetStyling:1];
  v16 = v15;
  if (v15)
  {
    [(WDDocumentOverviewViewController *)v15 setTitle:v13];
    uint64_t v17 = [v11 objectAtIndexedSubscript:0];
    displayType = v16->_displayType;
    v16->_displayType = (HKDisplayType *)v17;

    objc_storeStrong((id *)&v16->_profile, a4);
    objc_storeStrong((id *)&v16->_sidebarSelectionIdentifier, a7);
    v19 = [(WDSampleListDataProvider *)[WDDocumentListDataProvider alloc] initWithDisplayType:v16->_displayType profile:v16->_profile];
    dataProvider = v16->_dataProvider;
    v16->_dataProvider = v19;

    v16->_totalReportCount = 0;
    [(WDDocumentOverviewViewController *)v16 _installSections];
    [(WDDocumentOverviewViewController *)v16 _reloadAllData];
  }

  return v16;
}

- (void)viewDidLoad
{
  v16[1] = *MEMORY[0x263EF8340];
  v15.receiver = self;
  v15.super_class = (Class)WDDocumentOverviewViewController;
  [(HKTableViewController *)&v15 viewDidLoad];
  objc_initWeak(&location, self);
  dataProvider = self->_dataProvider;
  uint64_t v9 = MEMORY[0x263EF8330];
  uint64_t v10 = 3221225472;
  id v11 = __47__WDDocumentOverviewViewController_viewDidLoad__block_invoke;
  id v12 = &unk_26458DC70;
  objc_copyWeak(&v13, &location);
  [(WDSampleListDataProvider *)dataProvider startCollectingDataWithUpdateHandler:&v9];
  v4 = [(WDDocumentOverviewViewController *)self tableView];
  [v4 registerClass:objc_opt_class() forCellReuseIdentifier:@"accessDataIdentifier"];
  v5 = [MEMORY[0x263F08A00] defaultCenter];
  [v5 addObserver:self selector:sel__contentSizeCategoryDidChange_ name:*MEMORY[0x263F1D158] object:0];

  v16[0] = objc_opt_class();
  v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:1];
  id v7 = (id)[(WDDocumentOverviewViewController *)self registerForTraitChanges:v6 withTarget:self action:sel_widthDesignationDidChangeWithTraitEnvironment_previousTraitCollection_];

  v8 = [(WDDocumentOverviewViewController *)self navigationItem];
  [v8 _setSupportsTwoLineLargeTitles:1];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __47__WDDocumentOverviewViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __47__WDDocumentOverviewViewController_viewDidLoad__block_invoke_2;
  block[3] = &unk_26458DC70;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x263EF83A0], block);
  objc_destroyWeak(&v2);
}

void __47__WDDocumentOverviewViewController_viewDidLoad__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _reloadAllData];
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  [(WDDocumentOverviewViewController *)self _updateActivityForViewDidAppear];
  v5.receiver = self;
  v5.super_class = (Class)WDDocumentOverviewViewController;
  [(WDDocumentOverviewViewController *)&v5 viewDidAppear:v3];
}

- (void)dealloc
{
  BOOL v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)WDDocumentOverviewViewController;
  [(WDDocumentOverviewViewController *)&v4 dealloc];
}

- (void)widthDesignationDidChangeWithTraitEnvironment:(id)a3 previousTraitCollection:(id)a4
{
  objc_super v5 = [a3 traitCollection];
  uint64_t v6 = [v5 valueForNSIntegerTrait:objc_opt_class()];

  [MEMORY[0x263F466A0] edgeInsetsForWidthDesignation:v6];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  objc_super v15 = [(WDDocumentOverviewViewController *)self tableView];
  objc_msgSend(v15, "_setSectionContentInset:", 0.0, v10, 0.0, v14);

  v16 = [(WDDocumentOverviewViewController *)self navigationItem];
  [v16 largeTitleInsets];
  if (v10 == v20 && v8 == v17 && v14 == v19)
  {
    double v23 = v18;

    if (v12 == v23) {
      return;
    }
  }
  else
  {
  }
  v24 = [(WDDocumentOverviewViewController *)self navigationItem];
  objc_msgSend(v24, "setLargeTitleInsets:", v8, v10, v12, v14);

  id v26 = [(WDDocumentOverviewViewController *)self navigationController];
  v25 = [v26 navigationBar];
  [v25 setNeedsLayout];
}

- (void)_recomputeTotalReportCount
{
  BOOL v3 = [MEMORY[0x263F0A598] documentTypeForIdentifier:*MEMORY[0x263F09520]];
  id v4 = objc_alloc(MEMORY[0x263F0A6C0]);
  objc_super v5 = [MEMORY[0x263EFFA08] setWithObject:v3];
  uint64_t v9 = MEMORY[0x263EF8330];
  uint64_t v10 = 3221225472;
  double v11 = __62__WDDocumentOverviewViewController__recomputeTotalReportCount__block_invoke;
  double v12 = &unk_26458DCE8;
  double v13 = self;
  id v14 = v3;
  id v6 = v3;
  double v7 = (void *)[v4 initWithSampleTypes:v5 predicate:0 resultsHandler:&v9];

  double v8 = [(WDProfile *)self->_profile healthStore];
  [v8 executeQuery:v7];
}

void __62__WDDocumentOverviewViewController__recomputeTotalReportCount__block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a4;
  if (a3)
  {
    double v7 = [a3 objectForKeyedSubscript:*(void *)(a1 + 40)];
    uint64_t v8 = [v7 integerValue];

    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __62__WDDocumentOverviewViewController__recomputeTotalReportCount__block_invoke_302;
    v10[3] = &unk_26458DCC0;
    v10[4] = *(void *)(a1 + 32);
    v10[5] = v8;
    dispatch_async(MEMORY[0x263EF83A0], v10);
  }
  else
  {
    _HKInitializeLogging();
    uint64_t v9 = (void *)*MEMORY[0x263F09968];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09968], OS_LOG_TYPE_ERROR)) {
      __62__WDDocumentOverviewViewController__recomputeTotalReportCount__block_invoke_cold_1(a1, v9, (uint64_t)v6);
    }
  }
}

void __62__WDDocumentOverviewViewController__recomputeTotalReportCount__block_invoke_302(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 1072) = *(void *)(a1 + 40);
  id v1 = [*(id *)(a1 + 32) tableView];
  [v1 reloadData];
}

- (void)_reloadAllData
{
  BOOL v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v4 = [(WDSampleListDataProvider *)self->_dataProvider numberOfObjectsForSection:0];
  if (v4 >= 1)
  {
    if (v4 >= 3) {
      uint64_t v5 = 3;
    }
    else {
      uint64_t v5 = v4;
    }
    do
    {
      [(NSMutableArray *)v3 addObject:&unk_26D2FD2D8];
      --v5;
    }
    while (v5);
  }
  [(NSMutableArray *)v3 addObject:&unk_26D2FD2F0];
  [(NSMutableArray *)v3 addObject:&unk_26D2FD308];
  reportRowTypes = self->_reportRowTypes;
  self->_reportRowTypes = v3;

  [(WDDocumentOverviewViewController *)self _recomputeTotalReportCount];
  id v7 = [(WDDocumentOverviewViewController *)self tableView];
  [v7 reloadData];
}

- (void)_installSections
{
  BOOL v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
  sectionTypes = self->_sectionTypes;
  self->_sectionTypes = v3;

  [(NSMutableArray *)self->_sectionTypes addObject:&unk_26D2FD2D8];
  uint64_t v5 = self->_sectionTypes;

  [(NSMutableArray *)v5 addObject:&unk_26D2FD2F0];
}

- (UIFont)bodyFont
{
  bodyFont = self->_bodyFont;
  if (!bodyFont)
  {
    objc_msgSend(MEMORY[0x263F1C658], "hk_preferredFontForTextStyle:", *MEMORY[0x263F1D260]);
    uint64_t v4 = (UIFont *)objc_claimAutoreleasedReturnValue();
    uint64_t v5 = self->_bodyFont;
    self->_bodyFont = v4;

    bodyFont = self->_bodyFont;
  }

  return bodyFont;
}

- (id)_reportShowAllCellForTableView:(id)a3 forIndexPath:(id)a4
{
  uint64_t v5 = objc_msgSend(a3, "dequeueReusableCellWithIdentifier:", @"showAllDataIdentifier", a4);
  if (!v5)
  {
    uint64_t v5 = (void *)[objc_alloc(MEMORY[0x263F1CA48]) initWithStyle:1 reuseIdentifier:@"showAllDataIdentifier"];
    [v5 setAccessoryType:1];
  }
  id v6 = [v5 textLabel];
  id v7 = WDBundle();
  uint64_t v8 = [v7 localizedStringForKey:@"SHOW_ALL_RECORDS" value:&stru_26D2EA890 table:@"WellnessDashboard-Localizable"];
  [v6 setText:v8];

  uint64_t v9 = [v5 textLabel];
  [v9 setAccessibilityIdentifier:@"UIA.Health.CDA.ShowAllRecords"];

  if (self->_totalReportCount < 1)
  {
    double v11 = [v5 detailTextLabel];
    [v11 setText:&stru_26D2EA890];
  }
  else
  {
    uint64_t v10 = objc_msgSend(NSNumber, "numberWithInteger:");
    double v11 = HKLocalizedStringForNumberWithTemplate();

    double v12 = [v5 detailTextLabel];
    [v12 setText:v11];
  }
  double v13 = [v5 textLabel];
  id v14 = [(WDDocumentOverviewViewController *)self bodyFont];
  [v13 setFont:v14];

  objc_super v15 = [v5 detailTextLabel];
  v16 = [(WDDocumentOverviewViewController *)self bodyFont];
  [v15 setFont:v16];

  return v5;
}

- (id)_reportAccessCellForTableView:(id)a3 forIndexPath:(id)a4
{
  uint64_t v5 = [a3 dequeueReusableCellWithIdentifier:@"accessDataIdentifier" forIndexPath:a4];
  [v5 setAccessoryType:1];
  id v6 = [v5 textLabel];
  id v7 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.HealthUI"];
  uint64_t v8 = [v7 localizedStringForKey:@"SHARE_DATA_TITLE" value:&stru_26D2EA890 table:@"HealthUI-Localizable"];
  [v6 setText:v8];

  uint64_t v9 = [v5 textLabel];
  uint64_t v10 = [(WDDocumentOverviewViewController *)self bodyFont];
  [v9 setFont:v10];

  return v5;
}

- (id)_reportItemCellForTableView:(id)a3 row:(int64_t)a4
{
  dataProvider = self->_dataProvider;
  id v7 = a3;
  uint64_t v8 = [(WDSampleListDataProvider *)dataProvider objectAtIndex:a4 forSection:0];
  uint64_t v9 = [MEMORY[0x263F088C8] indexPathForRow:a4 inSection:0];
  uint64_t v10 = [(WDDocumentListDataProvider *)self->_dataProvider customCellForObject:v8 indexPath:v9 tableView:v7];

  return v10;
}

- (id)_reportSectionCellForTableView:(id)a3 forIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v7 row];
  uint64_t v9 = [(NSMutableArray *)self->_reportRowTypes objectAtIndexedSubscript:v8];
  uint64_t v10 = [v9 integerValue];
  switch(v10)
  {
    case 2:
      uint64_t v11 = [(WDDocumentOverviewViewController *)self _reportAccessCellForTableView:v6 forIndexPath:v7];
      goto LABEL_7;
    case 1:
      uint64_t v11 = [(WDDocumentOverviewViewController *)self _reportShowAllCellForTableView:v6 forIndexPath:v7];
      goto LABEL_7;
    case 0:
      uint64_t v11 = [(WDDocumentOverviewViewController *)self _reportItemCellForTableView:v6 row:v8];
LABEL_7:
      double v12 = (void *)v11;
      goto LABEL_9;
  }
  double v12 = 0;
LABEL_9:

  return v12;
}

- (id)_descriptionSectionCellForTableView:(id)a3 row:(int64_t)a4
{
  uint64_t v4 = [[WDDisplayTypeDescriptionTableViewCell alloc] initWithDisplayType:self->_displayType showAttributionText:1 reuseIdentifier:@"descriptionCellReuse"];

  return v4;
}

- (void)_pushReportDetailViewControllerForIndexPath:(id)a3
{
  id v5 = [(WDSampleListDataProvider *)self->_dataProvider viewControllerForItemAtIndexPath:a3];
  uint64_t v4 = [v5 navigationItem];
  [v4 setLargeTitleDisplayMode:2];

  [(WDDocumentOverviewViewController *)self showAdaptively:v5 sender:self];
}

- (void)_pushShowAllViewController
{
  displayType = self->_displayType;
  profile = self->_profile;
  id v5 = [(WDProfile *)profile unitController];
  id v8 = [(HKDisplayType *)displayType wd_listViewControllerDataProviderWithProfile:profile unitController:v5];

  id v6 = [[WDDataListViewController alloc] initWithDisplayType:self->_displayType profile:self->_profile dataProvider:v8 usingInsetStyling:1];
  id v7 = [(WDDataListViewController *)v6 navigationItem];
  [v7 setLargeTitleDisplayMode:2];

  [(WDDocumentOverviewViewController *)self showAdaptively:v6 sender:self];
}

- (void)_pushAccessViewController
{
  objc_msgSend(MEMORY[0x263F466E8], "categoryWithID:", -[HKDisplayType categoryIdentifier](self->_displayType, "categoryIdentifier"));
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  BOOL v3 = [WDDisplayTypeDataSourcesTableViewController alloc];
  displayType = self->_displayType;
  id v5 = [(WDProfile *)self->_profile sourceOrderController];
  id v6 = [(WDDisplayTypeDataSourcesTableViewController *)v3 initWithDisplayType:displayType displayCategory:v8 sourceOrderController:v5 profile:self->_profile];

  id v7 = [(WDDisplayTypeDataSourcesTableViewController *)v6 navigationItem];
  [v7 setLargeTitleDisplayMode:2];

  [(WDDocumentOverviewViewController *)self showAdaptively:v6 sender:self];
}

- (void)_selectReportRowForIndexPath:(id)a3
{
  id v6 = a3;
  uint64_t v4 = -[NSMutableArray objectAtIndexedSubscript:](self->_reportRowTypes, "objectAtIndexedSubscript:", [v6 row]);
  uint64_t v5 = [v4 integerValue];
  switch(v5)
  {
    case 2:
      [(WDDocumentOverviewViewController *)self _pushAccessViewController];
      break;
    case 1:
      [(WDDocumentOverviewViewController *)self _pushShowAllViewController];
      break;
    case 0:
      [(WDDocumentOverviewViewController *)self _pushReportDetailViewControllerForIndexPath:v6];
      break;
  }
}

- (double)_reportSectionRowHeight:(int64_t)a3
{
  uint64_t v4 = [(NSMutableArray *)self->_reportRowTypes objectAtIndexedSubscript:a3];
  uint64_t v5 = [v4 integerValue];
  if (v5 == 2 || v5 == 1)
  {
    double v6 = *MEMORY[0x263F1D600];
  }
  else
  {
    double v6 = 0.0;
    if (!v5)
    {
      [(WDDocumentListDataProvider *)self->_dataProvider customCellHeight];
      double v6 = v7;
    }
  }

  return v6;
}

- (double)_reportSectionEstimatedRowHeight:(int64_t)a3
{
  uint64_t v4 = [(NSMutableArray *)self->_reportRowTypes objectAtIndexedSubscript:a3];
  uint64_t v5 = [v4 integerValue];
  if (v5 == 2 || v5 == 1)
  {
    double v6 = 44.0;
  }
  else
  {
    double v6 = 0.0;
    if (!v5)
    {
      [(WDDocumentListDataProvider *)self->_dataProvider customEstimatedCellHeight];
      double v6 = v7;
    }
  }

  return v6;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return [(NSMutableArray *)self->_sectionTypes count];
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  uint64_t v4 = [(NSMutableArray *)self->_sectionTypes objectAtIndexedSubscript:a4];
  uint64_t v5 = [v4 integerValue];
  if (v5 == 1)
  {
    double v6 = *MEMORY[0x263F1D600];
  }
  else
  {
    double v6 = 0.0;
    if (!v5)
    {
      HKUIOnePixel();
      double v6 = v7;
    }
  }

  return v6;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  uint64_t v5 = [(NSMutableArray *)self->_sectionTypes objectAtIndexedSubscript:a4];
  uint64_t v6 = [v5 integerValue];
  if (v6 == 1)
  {
    int64_t v7 = 1;
  }
  else if (v6)
  {
    int64_t v7 = 0;
  }
  else
  {
    int64_t v7 = [(NSMutableArray *)self->_reportRowTypes count];
  }

  return v7;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v7 section];
  uint64_t v9 = [v7 row];
  uint64_t v10 = [(NSMutableArray *)self->_sectionTypes objectAtIndexedSubscript:v8];
  uint64_t v11 = [v10 integerValue];
  if (v11 == 1)
  {
    uint64_t v12 = [(WDDocumentOverviewViewController *)self _descriptionSectionCellForTableView:v6 row:v9];
    goto LABEL_5;
  }
  if (!v11)
  {
    uint64_t v12 = [(WDDocumentOverviewViewController *)self _reportSectionCellForTableView:v6 forIndexPath:v7];
LABEL_5:
    double v13 = (void *)v12;
    goto LABEL_7;
  }
  double v13 = 0;
LABEL_7:

  return v13;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  id v7 = -[NSMutableArray objectAtIndexedSubscript:](self->_sectionTypes, "objectAtIndexedSubscript:", [v6 section]);
  if (![v7 integerValue]) {
    [(WDDocumentOverviewViewController *)self _selectReportRowForIndexPath:v6];
  }
  [v8 deselectRowAtIndexPath:v6 animated:1];
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [v5 section];
  uint64_t v7 = [v5 row];

  id v8 = [(NSMutableArray *)self->_sectionTypes objectAtIndexedSubscript:v6];
  uint64_t v9 = [v8 integerValue];
  if (v9 == 1)
  {
    double v10 = *MEMORY[0x263F1D600];
  }
  else
  {
    double v10 = 0.0;
    if (!v9)
    {
      [(WDDocumentOverviewViewController *)self _reportSectionRowHeight:v7];
      double v10 = v11;
    }
  }

  return v10;
}

- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [v5 section];
  uint64_t v7 = [v5 row];

  id v8 = [(NSMutableArray *)self->_sectionTypes objectAtIndexedSubscript:v6];
  uint64_t v9 = [v8 integerValue];
  if (v9 == 1)
  {
    +[WDDisplayTypeDescriptionTableViewCell minimumHeight];
    goto LABEL_5;
  }
  double v10 = 0.0;
  if (!v9)
  {
    [(WDDocumentOverviewViewController *)self _reportSectionEstimatedRowHeight:v7];
LABEL_5:
    double v10 = v11;
  }

  return v10;
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  uint64_t v4 = -[NSMutableArray objectAtIndexedSubscript:](self->_sectionTypes, "objectAtIndexedSubscript:", objc_msgSend(a4, "section", a3));
  BOOL v5 = [v4 integerValue] == 0;

  return v5;
}

- (void)_updateActivityForViewDidAppear
{
  id v4 = [(WDProfile *)self->_profile userActivityManager];
  BOOL v3 = [(WDDocumentOverviewViewController *)self title];
  [v4 changeActivityForResponder:self activityDictionary:0 title:v3 keywords:0];
}

- (void)_contentSizeCategoryDidChange:(id)a3
{
  bodyFont = self->_bodyFont;
  self->_bodyFont = 0;

  id v5 = [(WDDocumentOverviewViewController *)self tableView];
  [v5 reloadData];
}

- (HKDisplayType)displayType
{
  return self->_displayType;
}

- (WDProfile)profile
{
  return self->_profile;
}

- (WDDocumentListDataProvider)dataProvider
{
  return self->_dataProvider;
}

- (NSMutableArray)sectionTypes
{
  return self->_sectionTypes;
}

- (void)setSectionTypes:(id)a3
{
}

- (NSMutableArray)reportRowTypes
{
  return self->_reportRowTypes;
}

- (void)setReportRowTypes:(id)a3
{
}

- (int64_t)totalReportCount
{
  return self->_totalReportCount;
}

- (void)setTotalReportCount:(int64_t)a3
{
  self->_totalReportCount = a3;
}

- (void)setBodyFont:(id)a3
{
}

- (NSString)sidebarSelectionIdentifier
{
  return self->_sidebarSelectionIdentifier;
}

- (void)setSidebarSelectionIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sidebarSelectionIdentifier, 0);
  objc_storeStrong((id *)&self->_bodyFont, 0);
  objc_storeStrong((id *)&self->_reportRowTypes, 0);
  objc_storeStrong((id *)&self->_sectionTypes, 0);
  objc_storeStrong((id *)&self->_dataProvider, 0);
  objc_storeStrong((id *)&self->_profile, 0);

  objc_storeStrong((id *)&self->_displayType, 0);
}

void __62__WDDocumentOverviewViewController__recomputeTotalReportCount__block_invoke_cold_1(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v4 = a2;
  int v6 = 138543618;
  id v7 = (id)objc_opt_class();
  __int16 v8 = 2114;
  uint64_t v9 = a3;
  id v5 = v7;
  _os_log_error_impl(&dword_2210D2000, v4, OS_LOG_TYPE_ERROR, "%{public}@: Error counting document samples: %{public}@", (uint8_t *)&v6, 0x16u);
}

@end