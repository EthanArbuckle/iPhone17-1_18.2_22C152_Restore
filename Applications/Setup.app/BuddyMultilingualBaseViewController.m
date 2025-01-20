@interface BuddyMultilingualBaseViewController
+ (BOOL)hasItemsToModifyWithDefault:(id)a3 andAvailableData:(id)a4;
+ (BOOL)needsFullscreenPane;
+ (id)cloudConfigSkipKey;
+ (unint64_t)applicableDispositions;
- (BFFFlowItemDelegate)delegate;
- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4;
- (BOOL)tableView:(id)a3 canMoveRowAtIndexPath:(id)a4;
- (BYAnalyticsManager)analyticsManager;
- (BuddyMultilingualBaseViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 actionString:(id)a6;
- (BuddyMultilingualContentAdditionController)dataSelectorController;
- (BuddyMultilingualDataSource)dataSource;
- (BuddyMultilingualDataSource)presentingDataSource;
- (BuddyMultilingualFlowManager)multilingualFlowManager;
- (BuddyMultilingualProvider)provider;
- (NSArray)availableData;
- (NSArray)defaultData;
- (NSArray)startingDataSet;
- (NSString)additionLabel;
- (OBAnimationController)animationController;
- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)_presentableAdditionalDataSource;
- (id)backingStore;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 targetIndexPathForMoveFromRowAtIndexPath:(id)a4 toProposedIndexPath:(id)a5;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (unint64_t)paneForAnalytics;
- (void)_presentAdditionDataSource;
- (void)_presentingControllerDidCancel;
- (void)additionViewControllerCompleted;
- (void)continuePressed;
- (void)performExtendedInitializationWithCompletion:(id)a3;
- (void)presentAdditionViewController;
- (void)setAdditionLabel:(id)a3;
- (void)setAnalyticsManager:(id)a3;
- (void)setAnimationController:(id)a3;
- (void)setAvailableData:(id)a3;
- (void)setDataSelectorController:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setDefaultData:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setMultilingualFlowManager:(id)a3;
- (void)setPresentingDataSource:(id)a3;
- (void)setProvider:(id)a3;
- (void)setStartingDataSet:(id)a3;
- (void)tableView:(id)a3 allowAdditionalDataSelection:(BOOL)a4;
- (void)tableView:(id)a3 appendItem:(id)a4 inSection:(unint64_t)a5;
- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 moveRowAtIndexPath:(id)a4 toIndexPath:(id)a5;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation BuddyMultilingualBaseViewController

- (BuddyMultilingualBaseViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 actionString:(id)a6
{
  id v17 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v15 = 0;
  objc_storeStrong(&v15, a4);
  id v14 = 0;
  objc_storeStrong(&v14, a5);
  id obj = 0;
  objc_storeStrong(&obj, a6);
  id v9 = v17;
  id v17 = 0;
  v12.receiver = v9;
  v12.super_class = (Class)BuddyMultilingualBaseViewController;
  id v17 = [(BuddyMultilingualBaseViewController *)&v12 initWithTitle:location[0] detailText:v15 symbolName:v14 adoptTableViewScrollView:1];
  objc_storeStrong(&v17, v17);
  if (v17) {
    objc_storeStrong((id *)v17 + 11, obj);
  }
  v10 = (BuddyMultilingualBaseViewController *)v17;
  objc_storeStrong(&obj, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong(&v17, 0);
  return v10;
}

- (void)viewDidLoad
{
  v34 = self;
  SEL v33 = a2;
  v32.receiver = self;
  v32.super_class = (Class)BuddyMultilingualBaseViewController;
  [(BuddyMultilingualBaseViewController *)&v32 viewDidLoad];
  v2 = [(BuddyMultilingualBaseViewController *)v34 defaultData];
  BOOL v3 = v2 == 0;

  if (v3) {
    [(BuddyMultilingualBaseViewController *)v34 setDefaultData:&__NSArray0__struct];
  }
  v4 = [(BuddyMultilingualBaseViewController *)v34 availableData];
  BOOL v5 = v4 == 0;

  if (v5) {
    [(BuddyMultilingualBaseViewController *)v34 setAvailableData:&__NSArray0__struct];
  }
  v6 = [BuddyMultilingualDataSource alloc];
  v7 = [(BuddyMultilingualBaseViewController *)v34 defaultData];
  v36 = v7;
  v8 = +[NSArray arrayWithObjects:&v36 count:1];
  id v9 = [(BuddyMultilingualBaseViewController *)v34 additionLabel];
  v10 = [(BuddyMultilingualDataSource *)v6 initWithBackingStore:v8 actionText:v9];
  [(BuddyMultilingualBaseViewController *)v34 setDataSource:v10];

  v11 = [BuddyMultilingualDataSource alloc];
  objc_super v12 = [(BuddyMultilingualBaseViewController *)v34 availableData];
  v35 = v12;
  v13 = +[NSArray arrayWithObjects:&v35 count:1];
  id v14 = [(BuddyMultilingualDataSource *)v11 initWithBackingStore:v13 actionText:&stru_1002B4E18];
  [(BuddyMultilingualBaseViewController *)v34 setPresentingDataSource:v14];

  id v15 = [objc_alloc((Class)UITableView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
  [(BuddyMultilingualBaseViewController *)v34 setTableView:v15];

  v16 = v34;
  id v17 = [(BuddyMultilingualBaseViewController *)v34 tableView];
  [v17 setDelegate:v16];

  v18 = v34;
  id v19 = [(BuddyMultilingualBaseViewController *)v34 tableView];
  [v19 setDataSource:v18];

  id v20 = [(BuddyMultilingualBaseViewController *)v34 tableView];
  [v20 setRowHeight:UITableViewAutomaticDimension];

  id v21 = [(BuddyMultilingualBaseViewController *)v34 tableView];
  [v21 setEstimatedRowHeight:0.0];

  id v22 = [(BuddyMultilingualBaseViewController *)v34 tableView];
  [v22 setAllowsSelectionDuringEditing:1];

  id v23 = [(BuddyMultilingualBaseViewController *)v34 tableView];
  [v23 setEditing:1 animated:1];

  v24 = [(BuddyMultilingualBaseViewController *)v34 dataSource];
  id v25 = [(BuddyMultilingualBaseViewController *)v34 tableView];
  id v26 = [(BuddyMultilingualBaseViewController *)v34 _presentableAdditionalDataSource];
  -[BuddyMultilingualDataSource tableView:allowAdditionalDataSelection:](v24, "tableView:allowAdditionalDataSelection:", v25, [v26 count] != 0);

  id v27 = [(BuddyMultilingualBaseViewController *)v34 backingStore];
  [(BuddyMultilingualBaseViewController *)v34 setStartingDataSet:v27];

  id v31 = +[OBBoldTrayButton boldButton];
  v28 = +[NSBundle mainBundle];
  v29 = [(NSBundle *)v28 localizedStringForKey:@"MULTILINGUAL_CONTINUE" value:&stru_1002B4E18 table:@"Localizable"];
  [v31 setTitle:v29 forState:0];

  [v31 addTarget:v34 action:"continuePressed" forControlEvents:64];
  id v30 = [(BuddyMultilingualBaseViewController *)v34 buttonTray];
  [v30 addButton:v31];

  objc_storeStrong(&v31, 0);
}

- (void)viewWillAppear:(BOOL)a3
{
  v7 = self;
  SEL v6 = a2;
  BOOL v5 = a3;
  v4.receiver = self;
  v4.super_class = (Class)BuddyMultilingualBaseViewController;
  [(BuddyMultilingualBaseViewController *)&v4 viewWillAppear:a3];
  BOOL v3 = [(BuddyMultilingualBaseViewController *)v7 animationController];
  [(OBAnimationController *)v3 startAnimation];
}

- (void)viewDidAppear:(BOOL)a3
{
  v10 = self;
  SEL v9 = a2;
  BOOL v8 = a3;
  v7.receiver = self;
  v7.super_class = (Class)BuddyMultilingualBaseViewController;
  [(BuddyMultilingualBaseViewController *)&v7 viewDidAppear:a3];
  id v3 = [(BuddyMultilingualBaseViewController *)v10 tableView];
  id v4 = [(BuddyMultilingualBaseViewController *)v10 tableView];
  id v5 = [v4 subviews];
  id v6 = [v5 firstObject];
  [v3 bringSubviewToFront:v6];
}

- (void)traitCollectionDidChange:(id)a3
{
  id v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4.receiver = v6;
  v4.super_class = (Class)BuddyMultilingualBaseViewController;
  [(BuddyMultilingualBaseViewController *)&v4 traitCollectionDidChange:location[0]];
  id v3 = [(BuddyMultilingualBaseViewController *)v6 dataSource];
  [(BuddyMultilingualDataSource *)v3 recalculateUnifiedRowHeight];

  objc_storeStrong(location, 0);
}

- (void)continuePressed
{
  unint64_t v2 = [(BuddyMultilingualBaseViewController *)self paneForAnalytics];
  id v3 = [(BuddyMultilingualBaseViewController *)self startingDataSet];
  id v4 = [(BuddyMultilingualBaseViewController *)self backingStore];
  id v5 = [(BuddyMultilingualBaseViewController *)self analyticsManager];
  +[BYMultilingualAnalyticsEvent recordMultilingualPane:v2 startingData:v3 modifiedData:v4 analyticsManager:v5];
}

- (unint64_t)paneForAnalytics
{
  return -1;
}

- (void)presentAdditionViewController
{
}

- (void)additionViewControllerCompleted
{
  unint64_t v2 = [(BuddyMultilingualBaseViewController *)self provider];
  id v3 = [(BuddyMultilingualProvider *)v2 createDataSourceForSelectedItems];
  [(BuddyMultilingualBaseViewController *)self setDefaultData:v3];

  id v4 = [(BuddyMultilingualBaseViewController *)self dataSource];
  id v5 = [(BuddyMultilingualBaseViewController *)self tableView];
  id v6 = [(BuddyMultilingualBaseViewController *)self defaultData];
  SEL v9 = v6;
  objc_super v7 = +[NSArray arrayWithObjects:&v9 count:1];
  [(BuddyMultilingualDataSource *)v4 tableView:v5 setBackingStore:v7];
}

- (void)setProvider:(id)a3
{
  BOOL v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong((id *)&v8->_provider, location[0]);
  id v3 = [(BuddyMultilingualBaseViewController *)v8 provider];
  id v4 = [(BuddyMultilingualProvider *)v3 createDataSourceForPreselectedItems];
  [(BuddyMultilingualBaseViewController *)v8 setDefaultData:v4];

  id v5 = [(BuddyMultilingualBaseViewController *)v8 provider];
  id v6 = [(BuddyMultilingualProvider *)v5 createDataSourceItemsAvailableForAdding];
  [(BuddyMultilingualBaseViewController *)v8 setAvailableData:v6];

  objc_storeStrong(location, 0);
}

- (id)backingStore
{
  unint64_t v2 = [(BuddyMultilingualBaseViewController *)self dataSource];
  id v3 = [(BuddyMultilingualDataSource *)v2 combinedStore];

  return v3;
}

+ (BOOL)needsFullscreenPane
{
  return 1;
}

+ (BOOL)hasItemsToModifyWithDefault:(id)a3 andAvailableData:(id)a4
{
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v15 = 0;
  objc_storeStrong(&v15, a4);
  if ((unint64_t)[location[0] count] <= 1)
  {
    id v13 = 0;
    id v5 = v15;
    objc_super v7 = _NSConcreteStackBlock;
    int v8 = -1073741824;
    int v9 = 0;
    v10 = sub_1000CDF08;
    v11 = &unk_1002B27E0;
    id v12 = location[0];
    id v13 = [v5 indexOfObjectPassingTest:&v7];
    BOOL v17 = v13 != (id)0x7FFFFFFFFFFFFFFFLL;
    int v14 = 1;
    objc_storeStrong(&v12, 0);
  }
  else
  {
    BOOL v17 = 1;
    int v14 = 1;
  }
  objc_storeStrong(&v15, 0);
  objc_storeStrong(location, 0);
  return v17;
}

- (void)_presentAdditionDataSource
{
  id v25 = self;
  location[1] = (id)a2;
  unint64_t v2 = [(BuddyMultilingualBaseViewController *)self dataSelectorController];
  BOOL v3 = v2 == 0;

  if (v3)
  {
    objc_initWeak(location, v25);
    id v4 = [BuddyMultilingualContentAdditionController alloc];
    id v5 = [(BuddyMultilingualBaseViewController *)v25 _presentableAdditionalDataSource];
    v18 = _NSConcreteStackBlock;
    int v19 = -1073741824;
    int v20 = 0;
    id v21 = sub_1000CE26C;
    id v22 = &unk_1002B2808;
    objc_copyWeak(&v23, location);
    id v6 = [(BuddyMultilingualContentAdditionController *)v4 initWithChoseableDataStore:v5 selectionCallback:&v18];
    [(BuddyMultilingualBaseViewController *)v25 setDataSelectorController:v6];

    objc_destroyWeak(&v23);
    objc_destroyWeak(location);
  }
  else
  {
    id v7 = [(BuddyMultilingualBaseViewController *)v25 _presentableAdditionalDataSource];
    int v8 = [(BuddyMultilingualBaseViewController *)v25 dataSelectorController];
    [(BuddyMultilingualContentAdditionController *)v8 setDataStore:v7];
  }
  id v9 = objc_alloc((Class)UIBarButtonItem);
  v10 = +[NSBundle mainBundle];
  v11 = [(NSBundle *)v10 localizedStringForKey:@"MULTILINGUAL_CANCEL" value:&stru_1002B4E18 table:@"Localizable"];
  id v12 = [v9 initWithTitle:v11 style:2 target:v25 action:"_presentingControllerDidCancel"];
  id v13 = [(BuddyMultilingualBaseViewController *)v25 dataSelectorController];
  id v14 = [(BuddyMultilingualContentAdditionController *)v13 navigationItem];
  [v14 setRightBarButtonItem:v12];

  id v15 = objc_alloc((Class)UINavigationController);
  v16 = [(BuddyMultilingualBaseViewController *)v25 dataSelectorController];
  id v17 = [v15 initWithRootViewController:v16];

  [(BuddyMultilingualBaseViewController *)v25 presentViewController:v17 animated:1 completion:0];
  objc_storeStrong(&v17, 0);
}

- (void)_presentingControllerDidCancel
{
}

- (id)_presentableAdditionalDataSource
{
  id v15 = self;
  location[1] = (id)a2;
  location[0] = +[NSMutableArray array];
  memset(__b, 0, sizeof(__b));
  unint64_t v2 = [(BuddyMultilingualBaseViewController *)v15 presentingDataSource];
  id v3 = [(BuddyMultilingualDataSource *)v2 combinedStore];

  id v4 = [v3 countByEnumeratingWithState:__b objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)__b[2];
    do
    {
      for (unint64_t i = 0; i < (unint64_t)v4; ++i)
      {
        if (*(void *)__b[2] != v5) {
          objc_enumerationMutation(v3);
        }
        id v13 = *(id *)(__b[1] + 8 * i);
        id v7 = [(BuddyMultilingualBaseViewController *)v15 dataSource];
        id v8 = [v13 identifier];
        char v9 = ![(BuddyMultilingualDataSource *)v7 containsKey:v8];

        if (v9) {
          [location[0] addObject:v13];
        }
      }
      id v4 = [v3 countByEnumeratingWithState:__b objects:v16 count:16];
    }
    while (v4);
  }

  id v10 = location[0];
  objc_storeStrong(location, 0);
  return v10;
}

+ (id)cloudConfigSkipKey
{
  return 0;
}

+ (unint64_t)applicableDispositions
{
  return 14;
}

- (void)performExtendedInitializationWithCompletion:(id)a3
{
  id v13 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (location[0])
  {
    id v3 = [(BuddyMultilingualBaseViewController *)v13 provider];
    id v11 = [(BuddyMultilingualProvider *)v3 createDataSourceForSelectedItems];

    char v9 = 0;
    unsigned __int8 v4 = 0;
    if (v11)
    {
      id v10 = [(BuddyMultilingualBaseViewController *)v13 multilingualFlowManager];
      char v9 = 1;
      unsigned __int8 v4 = [v10 didMakeSelection];
    }
    if (v9) {

    }
    if (v4) {
      [(BuddyMultilingualBaseViewController *)v13 setDefaultData:v11];
    }
    uint64_t v5 = [(BuddyMultilingualBaseViewController *)v13 defaultData];
    id v8 = +[NSSet setWithArray:v5];

    uint64_t v6 = objc_opt_class();
    id v7 = [(BuddyMultilingualBaseViewController *)v13 availableData];
    LOBYTE(v6) = [(id)v6 hasItemsToModifyWithDefault:v8 andAvailableData:v7];

    (*((void (**)(id, uint64_t))location[0] + 2))(location[0], v6 & 1);
    objc_storeStrong(&v8, 0);
    objc_storeStrong(&v11, 0);
  }
  objc_storeStrong(location, 0);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v8 = 0;
  objc_storeStrong(&v8, a4);
  uint64_t v5 = [(BuddyMultilingualBaseViewController *)v10 dataSource];
  id v6 = [(BuddyMultilingualDataSource *)v5 tableView:location[0] cellForRowAtIndexPath:v8];

  objc_storeStrong(&v8, 0);
  objc_storeStrong(location, 0);

  return v6;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  int64_t v8 = a4;
  uint64_t v5 = [(BuddyMultilingualBaseViewController *)v10 dataSource];
  int64_t v6 = [(BuddyMultilingualDataSource *)v5 tableView:location[0] numberOfRowsInSection:v8];

  objc_storeStrong(location, 0);
  return v6;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  id v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = [(BuddyMultilingualBaseViewController *)v7 dataSource];
  int64_t v4 = [(BuddyMultilingualDataSource *)v3 numberOfSectionsInTableView:location[0]];

  objc_storeStrong(location, 0);
  return v4;
}

- (BOOL)tableView:(id)a3 canMoveRowAtIndexPath:(id)a4
{
  id v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v8 = 0;
  objc_storeStrong(&v8, a4);
  uint64_t v5 = [(BuddyMultilingualBaseViewController *)v10 dataSource];
  unsigned __int8 v6 = [(BuddyMultilingualDataSource *)v5 tableView:location[0] canMoveRowAtIndexPath:v8];

  objc_storeStrong(&v8, 0);
  objc_storeStrong(location, 0);
  return v6 & 1;
}

- (void)tableView:(id)a3 moveRowAtIndexPath:(id)a4 toIndexPath:(id)a5
{
  id v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v9 = 0;
  objc_storeStrong(&v9, a4);
  id v8 = 0;
  objc_storeStrong(&v8, a5);
  id v7 = [(BuddyMultilingualBaseViewController *)v11 dataSource];
  [(BuddyMultilingualDataSource *)v7 tableView:location[0] moveRowAtIndexPath:v9 toIndexPath:v8];

  objc_storeStrong(&v8, 0);
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  id v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v8 = 0;
  objc_storeStrong(&v8, a4);
  uint64_t v5 = [(BuddyMultilingualBaseViewController *)v10 dataSource];
  unsigned __int8 v6 = [(BuddyMultilingualDataSource *)v5 tableView:location[0] canEditRowAtIndexPath:v8];

  objc_storeStrong(&v8, 0);
  objc_storeStrong(location, 0);
  return v6 & 1;
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  id v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  int64_t v9 = a4;
  id v8 = 0;
  objc_storeStrong(&v8, a5);
  if (v9 == 2)
  {
    [(BuddyMultilingualBaseViewController *)v11 tableView:location[0] didSelectRowAtIndexPath:v8];
  }
  else
  {
    id v7 = [(BuddyMultilingualBaseViewController *)v11 dataSource];
    [(BuddyMultilingualDataSource *)v7 tableView:location[0] commitEditingStyle:v9 forRowAtIndexPath:v8];
  }
  objc_storeStrong(&v8, 0);
  objc_storeStrong(location, 0);
}

- (void)tableView:(id)a3 appendItem:(id)a4 inSection:(unint64_t)a5
{
  id v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v9 = 0;
  objc_storeStrong(&v9, a4);
  unint64_t v8 = a5;
  id v7 = [(BuddyMultilingualBaseViewController *)v11 dataSource];
  [(BuddyMultilingualDataSource *)v7 tableView:location[0] appendItem:v9 inSection:v8];

  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
}

- (void)tableView:(id)a3 allowAdditionalDataSelection:(BOOL)a4
{
  unint64_t v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  BOOL v6 = a4;
  uint64_t v5 = [(BuddyMultilingualBaseViewController *)v8 dataSource];
  [(BuddyMultilingualDataSource *)v5 tableView:location[0] allowAdditionalDataSelection:v6];

  objc_storeStrong(location, 0);
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v7 = 0;
  objc_storeStrong(&v7, a4);
  [location[0] deselectRowAtIndexPath:v7 animated:1];
  uint64_t v5 = [(BuddyMultilingualBaseViewController *)v9 dataSource];
  unsigned __int8 v6 = [(BuddyMultilingualDataSource *)v5 rowActionableAtIndexPath:v7];

  if (v6) {
    [(BuddyMultilingualBaseViewController *)v9 presentAdditionViewController];
  }
  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  id v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v9 = 0;
  objc_storeStrong(&v9, a4);
  uint64_t v5 = [(BuddyMultilingualBaseViewController *)v11 dataSource];
  [(BuddyMultilingualDataSource *)v5 unifiedRowHeight];
  double v7 = v6;

  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
  return v7;
}

- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v6 = 0;
  objc_storeStrong(&v6, a4);
  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
  return UITableViewAutomaticDimension;
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  id v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v8 = 0;
  objc_storeStrong(&v8, a4);
  uint64_t v5 = [(BuddyMultilingualBaseViewController *)v10 dataSource];
  int64_t v6 = [(BuddyMultilingualDataSource *)v5 editingStyleForRowAtIndexPath:v8];

  objc_storeStrong(&v8, 0);
  objc_storeStrong(location, 0);
  return v6;
}

- (id)tableView:(id)a3 targetIndexPathForMoveFromRowAtIndexPath:(id)a4 toProposedIndexPath:(id)a5
{
  v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v14 = 0;
  objc_storeStrong(&v14, a4);
  id v13 = 0;
  objc_storeStrong(&v13, a5);
  double v7 = [(BuddyMultilingualBaseViewController *)v16 dataSource];
  LOBYTE(a4) = [(BuddyMultilingualDataSource *)v7 itemReorderableAtIndexPath:v14];

  char v12 = a4 & 1;
  id v8 = [(BuddyMultilingualBaseViewController *)v16 dataSource];
  unsigned __int8 v9 = [(BuddyMultilingualDataSource *)v8 itemReorderableAtIndexPath:v13];

  if (v12 & 1) != 0 && (v9) {
    id v17 = v13;
  }
  else {
    id v17 = v14;
  }
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(location, 0);
  id v10 = v17;

  return v10;
}

- (BuddyMultilingualFlowManager)multilingualFlowManager
{
  return self->_multilingualFlowManager;
}

- (void)setMultilingualFlowManager:(id)a3
{
}

- (BFFFlowItemDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (BFFFlowItemDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSArray)defaultData
{
  return self->_defaultData;
}

- (void)setDefaultData:(id)a3
{
}

- (NSArray)availableData
{
  return self->_availableData;
}

- (void)setAvailableData:(id)a3
{
}

- (BuddyMultilingualProvider)provider
{
  return self->_provider;
}

- (BYAnalyticsManager)analyticsManager
{
  return self->_analyticsManager;
}

- (void)setAnalyticsManager:(id)a3
{
}

- (OBAnimationController)animationController
{
  return self->_animationController;
}

- (void)setAnimationController:(id)a3
{
}

- (BuddyMultilingualDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
}

- (BuddyMultilingualDataSource)presentingDataSource
{
  return self->_presentingDataSource;
}

- (void)setPresentingDataSource:(id)a3
{
}

- (BuddyMultilingualContentAdditionController)dataSelectorController
{
  return self->_dataSelectorController;
}

- (void)setDataSelectorController:(id)a3
{
}

- (NSString)additionLabel
{
  return self->_additionLabel;
}

- (void)setAdditionLabel:(id)a3
{
}

- (NSArray)startingDataSet
{
  return self->_startingDataSet;
}

- (void)setStartingDataSet:(id)a3
{
}

- (void).cxx_destruct
{
}

@end