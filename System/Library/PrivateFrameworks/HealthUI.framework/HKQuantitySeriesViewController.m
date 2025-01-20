@interface HKQuantitySeriesViewController
- (HKQuantitySeriesDataProvider)dataProvider;
- (UITableView)tableView;
- (void)loadView;
- (void)setDataProvider:(id)a3;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)setTableView:(id)a3;
- (void)viewDidLoad;
- (void)willMoveToParentViewController:(id)a3;
@end

@implementation HKQuantitySeriesViewController

- (void)viewDidLoad
{
  v11.receiver = self;
  v11.super_class = (Class)HKQuantitySeriesViewController;
  [(HKQuantitySeriesViewController *)&v11 viewDidLoad];
  v3 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  v4 = [v3 localizedStringForKey:@"QUANTITY_SERIES_TITLE" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
  [(HKQuantitySeriesViewController *)self setTitle:v4];

  v5 = [(HKQuantitySeriesViewController *)self editButtonItem];
  v6 = [(HKQuantitySeriesViewController *)self navigationItem];
  [v6 setRightBarButtonItem:v5];

  objc_initWeak(&location, self);
  v7 = [(HKQuantitySeriesViewController *)self dataProvider];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __45__HKQuantitySeriesViewController_viewDidLoad__block_invoke;
  v8[3] = &unk_1E6D51C48;
  objc_copyWeak(&v9, &location);
  [v7 queryForSubsamples:v8];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __45__HKQuantitySeriesViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__HKQuantitySeriesViewController_viewDidLoad__block_invoke_2;
  block[3] = &unk_1E6D51C48;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x1E4F14428], block);
  objc_destroyWeak(&v2);
}

void __45__HKQuantitySeriesViewController_viewDidLoad__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained tableView];
  [v1 reloadData];
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKQuantitySeriesViewController;
  -[HKQuantitySeriesViewController setEditing:animated:](&v9, sel_setEditing_animated_);
  if (!v5)
  {
    v7 = [(HKQuantitySeriesViewController *)self dataProvider];
    [v7 commitDeletionsIfNeeded];
  }
  v8 = [(HKQuantitySeriesViewController *)self tableView];
  [v8 setEditing:v5 animated:v4];
}

- (void)willMoveToParentViewController:(id)a3
{
  id v3 = [(HKQuantitySeriesViewController *)self dataProvider];
  [v3 commitDeletionsIfNeeded];
}

- (void)loadView
{
  v18.receiver = self;
  v18.super_class = (Class)HKQuantitySeriesViewController;
  [(HKQuantitySeriesViewController *)&v18 loadView];
  id v3 = objc_alloc(MEMORY[0x1E4FB1D00]);
  BOOL v4 = objc_msgSend(v3, "initWithFrame:style:", 2, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [(HKQuantitySeriesViewController *)self setTableView:v4];

  BOOL v5 = [(HKQuantitySeriesViewController *)self tableView];
  uint64_t v6 = objc_opt_class();
  v7 = +[HKQuantitySeriesTableViewCell reuseIdentifier];
  [v5 registerClass:v6 forCellReuseIdentifier:v7];

  v8 = [(HKQuantitySeriesViewController *)self tableView];
  [v8 setEstimatedRowHeight:44.0];

  double v9 = *MEMORY[0x1E4FB2F28];
  v10 = [(HKQuantitySeriesViewController *)self tableView];
  [v10 setRowHeight:v9];

  objc_super v11 = [(HKQuantitySeriesViewController *)self dataProvider];
  v12 = [(HKQuantitySeriesViewController *)self tableView];
  [v12 setDataSource:v11];

  v13 = [(HKQuantitySeriesViewController *)self dataProvider];
  v14 = [(HKQuantitySeriesViewController *)self tableView];
  [v14 setDelegate:v13];

  v15 = [(HKQuantitySeriesViewController *)self tableView];
  [v15 setAllowsMultipleSelection:1];

  v16 = [(HKQuantitySeriesViewController *)self tableView];
  [v16 setAllowsSelection:0];

  v17 = [(HKQuantitySeriesViewController *)self tableView];
  [(HKQuantitySeriesViewController *)self setView:v17];
}

- (HKQuantitySeriesDataProvider)dataProvider
{
  return self->_dataProvider;
}

- (void)setDataProvider:(id)a3
{
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (void)setTableView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_dataProvider, 0);
}

@end