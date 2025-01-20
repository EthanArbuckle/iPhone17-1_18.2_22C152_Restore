@interface WDClinicalSettingsViewAnalyticsDataViewController
- (HKHealthRecordsStore)healthRecordsStore;
- (NSArray)filePaths;
- (_UIContentUnavailableView)noDataView;
- (id)description;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (unint64_t)supportedInterfaceOrientations;
- (void)fetchClinicalOptInDataCollectionFilePaths;
- (void)setFilePaths:(id)a3;
- (void)setHealthRecordsStore:(id)a3;
- (void)setNoDataView:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
@end

@implementation WDClinicalSettingsViewAnalyticsDataViewController

- (void)viewDidLoad
{
  v13.receiver = self;
  v13.super_class = (Class)WDClinicalSettingsViewAnalyticsDataViewController;
  [(WDClinicalSettingsViewAnalyticsDataViewController *)&v13 viewDidLoad];
  v3 = HRLocalizedString(@"CLINICAL_ACCOUNTS_SETTINGS_VIEW_ANALYTICS_DATA_TITLE");
  [(WDClinicalSettingsViewAnalyticsDataViewController *)self setTitle:v3];

  v4 = [(WDClinicalSettingsViewAnalyticsDataViewController *)self tableView];
  uint64_t v5 = objc_opt_class();
  v6 = +[WDClinicalSettingsViewAnalyticsDataViewControllerFileCell defaultReuseIdentifier];
  [v4 registerClass:v5 forCellReuseIdentifier:v6];

  id v7 = objc_alloc(MEMORY[0x1E4FB2070]);
  v8 = HRLocalizedString(@"CLINICAL_ACCOUNTS_SETTINGS_VIEW_ANALYTICS_DATA_NO_DATA");
  v9 = objc_msgSend(v7, "initWithFrame:title:style:", v8, 0, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [(WDClinicalSettingsViewAnalyticsDataViewController *)self setNoDataView:v9];

  v10 = [(WDClinicalSettingsViewAnalyticsDataViewController *)self noDataView];
  [v10 setHidden:1];

  v11 = [(WDClinicalSettingsViewAnalyticsDataViewController *)self noDataView];
  v12 = [(WDClinicalSettingsViewAnalyticsDataViewController *)self tableView];
  [v12 setBackgroundView:v11];

  [(WDClinicalSettingsViewAnalyticsDataViewController *)self fetchClinicalOptInDataCollectionFilePaths];
}

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

- (void)fetchClinicalOptInDataCollectionFilePaths
{
  objc_initWeak(&location, self);
  v3 = [(WDClinicalSettingsViewAnalyticsDataViewController *)self healthRecordsStore];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __94__WDClinicalSettingsViewAnalyticsDataViewController_fetchClinicalOptInDataCollectionFilePaths__block_invoke;
  v4[3] = &unk_1E644AB98;
  objc_copyWeak(&v5, &location);
  v4[4] = self;
  [v3 fetchClinicalOptInDataCollectionFilePathsWithCompletion:v4];

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __94__WDClinicalSettingsViewAnalyticsDataViewController_fetchClinicalOptInDataCollectionFilePaths__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [MEMORY[0x1E4F28F08] mainQueue];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __94__WDClinicalSettingsViewAnalyticsDataViewController_fetchClinicalOptInDataCollectionFilePaths__block_invoke_2;
  v10[3] = &unk_1E644A808;
  objc_copyWeak(&v13, (id *)(a1 + 40));
  id v8 = v5;
  uint64_t v9 = *(void *)(a1 + 32);
  id v11 = v8;
  uint64_t v12 = v9;
  [v7 addOperationWithBlock:v10];

  objc_destroyWeak(&v13);
}

void __94__WDClinicalSettingsViewAnalyticsDataViewController_fetchClinicalOptInDataCollectionFilePaths__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained setFilePaths:v2];

  id v4 = [*(id *)(a1 + 40) tableView];
  [v4 reloadData];
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v5 = [(WDClinicalSettingsViewAnalyticsDataViewController *)self filePaths];
  int64_t v6 = [v5 count];

  id v7 = [(WDClinicalSettingsViewAnalyticsDataViewController *)self tableView];
  id v8 = v7;
  if (v6)
  {
    [v7 setSeparatorStyle:1];

    uint64_t v9 = [(WDClinicalSettingsViewAnalyticsDataViewController *)self noDataView];
    v10 = v9;
    uint64_t v11 = 1;
  }
  else
  {
    [v7 setSeparatorStyle:0];

    uint64_t v9 = [(WDClinicalSettingsViewAnalyticsDataViewController *)self noDataView];
    v10 = v9;
    uint64_t v11 = 0;
  }
  [v9 setHidden:v11];

  return v6;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = +[WDClinicalSettingsViewAnalyticsDataViewControllerFileCell defaultReuseIdentifier];
  uint64_t v9 = [v7 dequeueReusableCellWithIdentifier:v8];

  v10 = (void *)MEMORY[0x1E4F1CB10];
  uint64_t v11 = [(WDClinicalSettingsViewAnalyticsDataViewController *)self filePaths];
  uint64_t v12 = [v6 row];

  id v13 = [v11 objectAtIndexedSubscript:v12];
  v14 = [v10 fileURLWithPath:v13];
  [v9 setFileURL:v14];

  return v9;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v12 = [a3 cellForRowAtIndexPath:a4];
  id v5 = objc_alloc_init(MEMORY[0x1E4F67AD8]);
  id v6 = [v12 fileURL];
  id v7 = [v6 lastPathComponent];
  [v5 setTitle:v7];

  id v8 = NSString;
  uint64_t v9 = [v12 fileURL];
  v10 = [v8 stringWithContentsOfURL:v9 encoding:4 error:0];
  [v5 setDetailText:v10];

  uint64_t v11 = [(WDClinicalSettingsViewAnalyticsDataViewController *)self navigationController];
  [v11 pushViewController:v5 animated:1];
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  id v6 = [(WDClinicalSettingsViewAnalyticsDataViewController *)self filePaths];
  id v7 = [v3 stringWithFormat:@"<%@:%p %@>", v5, self, v6];

  return v7;
}

- (HKHealthRecordsStore)healthRecordsStore
{
  return self->_healthRecordsStore;
}

- (void)setHealthRecordsStore:(id)a3
{
}

- (NSArray)filePaths
{
  return (NSArray *)objc_getProperty(self, a2, 1032, 1);
}

- (void)setFilePaths:(id)a3
{
}

- (_UIContentUnavailableView)noDataView
{
  return (_UIContentUnavailableView *)objc_getProperty(self, a2, 1040, 1);
}

- (void)setNoDataView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_noDataView, 0);
  objc_storeStrong((id *)&self->_filePaths, 0);
  objc_storeStrong((id *)&self->_healthRecordsStore, 0);
}

@end