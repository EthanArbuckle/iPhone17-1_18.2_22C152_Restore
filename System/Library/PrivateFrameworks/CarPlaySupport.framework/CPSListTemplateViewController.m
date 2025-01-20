@interface CPSListTemplateViewController
+ (BOOL)clientAssistantCellConfiguration:(id)a3 availableWithError:(id *)a4 templateEnvironment:(id)a5;
+ (id)intentIdentifierFromConfigurationEnum:(int64_t)a3;
- (BOOL)_shouldRetainFocusOnWillAppear;
- (BOOL)_wantsNowPlayingButton;
- (BOOL)assistantCellAvailable;
- (BOOL)restoresFocusAfterTransition;
- (CPListTemplate)listTemplate;
- (CPSEmptyView)emptyView;
- (CPSListTemplateViewController)initWithListTemplate:(id)a3 templateDelegate:(id)a4 templateEnvironment:(id)a5;
- (CPSSectionedDataSource)dataSource;
- (CPSTableView)tableView;
- (CPUINowPlayingManager)nowPlayingManager;
- (NSTimer)spinnerStartTimer;
- (NSTimer)spinnerTimeoutTimer;
- (NSUUID)currentSpinningIdentifier;
- (NSUUID)lastFocusedItem;
- (NSUUID)nextSpinningIdentifier;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (id)preferredFocusEnvironments;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (int64_t)_playingIndicatorStateForSnapshot:(id)a3;
- (unint64_t)spinnerState;
- (void)_activateSiriForAssistantItem;
- (void)_activateSiriForMessageItem:(id)a3;
- (void)_addSpinnerToIdentifier:(id)a3;
- (void)_cancelScheduledLoadingSpinner;
- (void)_cellSelectionCompleted:(id)a3;
- (void)_scheduleLoadingSpinnerForIdentifier:(id)a3;
- (void)_scrollViewAccessoryInsetsDidChange:(id)a3;
- (void)_startSpinnerTimerFired:(id)a3 identifier:(id)a4;
- (void)_timeoutSpinnerFired:(id)a3 identifier:(id)a4;
- (void)_updateEmptyView;
- (void)_updatePlayingIndicators;
- (void)_viewDidLoad;
- (void)didSelectMediaButton:(id)a3;
- (void)nowPlayingManager:(id)a3 didUpdateSnapshot:(id)a4;
- (void)reloadItems:(id)a3;
- (void)reloadTemplate:(id)a3;
- (void)scrollToTop;
- (void)setAssistantCellAvailable:(BOOL)a3;
- (void)setButton:(id)a3 enabled:(BOOL)a4;
- (void)setButton:(id)a3 hidden:(BOOL)a4;
- (void)setCurrentSpinningIdentifier:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setEmptyView:(id)a3;
- (void)setLastFocusedItem:(id)a3;
- (void)setNextSpinningIdentifier:(id)a3;
- (void)setNowPlayingManager:(id)a3;
- (void)setSpinnerStartTimer:(id)a3;
- (void)setSpinnerState:(unint64_t)a3;
- (void)setSpinnerTimeoutTimer:(id)a3;
- (void)setTableView:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 didUpdateFocusInContext:(id)a4 withAnimationCoordinator:(id)a5;
- (void)updateAssistantCell;
- (void)updateAssistantCellConfiguration:(id)a3 withCompletion:(id)a4;
- (void)updateAssistantCellTitle;
- (void)updateSectionHeaderImage:(id)a3 forSectionIdentifier:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation CPSListTemplateViewController

- (CPSListTemplateViewController)initWithListTemplate:(id)a3 templateDelegate:(id)a4 templateEnvironment:(id)a5
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  v27 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v25 = 0;
  objc_storeStrong(&v25, a4);
  id v24 = 0;
  objc_storeStrong(&v24, a5);
  v5 = v27;
  v27 = 0;
  v23.receiver = v5;
  v23.super_class = (Class)CPSListTemplateViewController;
  v21 = [(CPSBaseTemplateViewController *)&v23 initWithTemplate:location[0] templateDelegate:v25 templateEnvironment:v24];
  v27 = v21;
  objc_storeStrong((id *)&v27, v21);
  if (v21)
  {
    v15 = [CPSSectionedDataSource alloc];
    id v16 = (id)[location[0] sections];
    uint64_t v6 = -[CPSSectionedDataSource initWithSections:templateEnvironment:](v15, "initWithSections:templateEnvironment:");
    dataSource = v27->_dataSource;
    v27->_dataSource = (CPSSectionedDataSource *)v6;

    [(CPSListTemplateViewController *)v27 updateAssistantCell];
    v18 = [(CPSListTemplateViewController *)v27 listTemplate];
    v17 = [(CPListTemplate *)v18 title];
    -[CPSListTemplateViewController setTitle:](v27, "setTitle:");

    id v22 = CarPlaySupportGeneralLogging();
    if (os_log_type_enabled((os_log_t)v22, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = location[0];
      id v14 = (id)objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(location[0], "sectionCount"));
      id v13 = (id)objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(location[0], "itemCount"));
      __os_log_helper_16_2_3_8_64_8_66_8_66((uint64_t)v28, (uint64_t)v12, (uint64_t)v14, (uint64_t)v13);
      _os_log_impl(&dword_22B689000, (os_log_t)v22, OS_LOG_TYPE_DEFAULT, "Received a list template %@ with %{public}@ sections and %{public}@ items", v28, 0x20u);
    }
    objc_storeStrong(&v22, 0);
    if ([v24 canBecomeNowPlayingApp])
    {
      v8 = (CPUINowPlayingManager *)(id)[v24 nowPlayingManager];
      nowPlayingManager = v27->_nowPlayingManager;
      v27->_nowPlayingManager = v8;

      [(CPUINowPlayingManager *)v27->_nowPlayingManager addNowPlayingObserver:v27];
    }
  }
  v11 = v27;
  objc_storeStrong(&v24, 0);
  objc_storeStrong(&v25, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v27, 0);
  return v11;
}

- (CPListTemplate)listTemplate
{
  v3 = objc_opt_class();
  v4 = [(CPSBaseTemplateViewController *)self associatedTemplate];
  id v5 = CPSSafeCast_17(v3, v4);

  return (CPListTemplate *)v5;
}

- (BOOL)_shouldRetainFocusOnWillAppear
{
  id v3 = (id)[(CPSListTemplateViewController *)self traitCollection];
  uint64_t v4 = [v3 primaryInteractionModel];

  return v4 == 2 || v4 == 8;
}

- (BOOL)_wantsNowPlayingButton
{
  return 1;
}

- (void)_viewDidLoad
{
  v46[4] = *MEMORY[0x263EF8340];
  v45 = self;
  SEL v44 = a2;
  v43.receiver = self;
  v43.super_class = (Class)CPSListTemplateViewController;
  [(CPSBaseTemplateViewController *)&v43 _viewDidLoad];
  id v42 = (id)[(CPSListTemplateViewController *)v45 view];
  id v27 = (id)[MEMORY[0x263F1C550] tableBackgroundColor];
  objc_msgSend(v42, "setBackgroundColor:");

  v26 = [CPSTableView alloc];
  id v41 = -[CPSTableView initWithFrame:style:](v26, "initWithFrame:style:", 0, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  [v41 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v41 setDelegate:v45];
  uint64_t v25 = objc_opt_class();
  aClass = (objc_class *)objc_opt_class();
  objc_super v23 = NSStringFromClass(aClass);
  objc_msgSend(v41, "registerClass:forHeaderFooterViewReuseIdentifier:", v25);

  uint64_t v22 = objc_opt_class();
  v21 = (objc_class *)objc_opt_class();
  v20 = NSStringFromClass(v21);
  objc_msgSend(v41, "registerClass:forHeaderFooterViewReuseIdentifier:", v22);

  [v41 setRowHeight:*MEMORY[0x263F1D600]];
  [v41 setEstimatedRowHeight:*MEMORY[0x263F1D600]];
  [(CPSDataSource *)v45->_dataSource setTableView:v41];
  id v19 = (id)[(CPSListTemplateViewController *)v45 view];
  [v19 addSubview:v41];

  [(CPSListTemplateViewController *)v45 setTableView:v41];
  v18 = (void *)MEMORY[0x263F08938];
  id v17 = (id)[v42 topAnchor];
  id v16 = (id)[v41 topAnchor];
  id v15 = (id)objc_msgSend(v17, "constraintEqualToAnchor:");
  v46[0] = v15;
  id v14 = (id)[v42 safeAreaLayoutGuide];
  id v13 = (id)[v14 bottomAnchor];
  id v12 = (id)[v41 bottomAnchor];
  id v11 = (id)objc_msgSend(v13, "constraintEqualToAnchor:");
  v46[1] = v11;
  id v10 = (id)[v42 leftAnchor];
  id v9 = (id)[v41 leftAnchor];
  id v8 = (id)objc_msgSend(v10, "constraintEqualToAnchor:");
  v46[2] = v8;
  id v7 = (id)[v42 rightAnchor];
  id v6 = (id)[v41 rightAnchor];
  id v5 = (id)objc_msgSend(v7, "constraintEqualToAnchor:");
  v46[3] = v5;
  id v4 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v46 count:4];
  objc_msgSend(v18, "activateConstraints:");

  id v3 = [(CPSListTemplateViewController *)v45 tableView];
  [(CPSTableView *)v3 setAccessibilityIdentifier:@"CPListTemplate"];

  [(CPSDataSource *)v45->_dataSource setRowAnimation:5];
  objc_initWeak(&location, v45);
  uint64_t v34 = MEMORY[0x263EF8330];
  int v35 = -1073741824;
  int v36 = 0;
  v37 = __45__CPSListTemplateViewController__viewDidLoad__block_invoke;
  v38 = &unk_2648A52D8;
  objc_copyWeak(&v39, &location);
  [(CPSDataSource *)v45->_dataSource setCellCreateBlock:&v34];
  uint64_t v28 = MEMORY[0x263EF8330];
  int v29 = -1073741824;
  int v30 = 0;
  v31 = __45__CPSListTemplateViewController__viewDidLoad__block_invoke_2;
  v32 = &unk_2648A5350;
  objc_copyWeak(v33, &location);
  [(CPSDataSource *)v45->_dataSource setCellConfigureBlock:&v28];
  v2 = [(CPSListTemplateViewController *)v45 tableView];
  [(CPSTableView *)v2 reloadData];

  [(CPSListTemplateViewController *)v45 _updateEmptyView];
  objc_destroyWeak(v33);
  objc_destroyWeak(&v39);
  objc_destroyWeak(&location);
  objc_storeStrong(&v41, 0);
  objc_storeStrong(&v42, 0);
}

id __45__CPSListTemplateViewController__viewDidLoad__block_invoke(id *a1, void *a2, void *a3, void *a4)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v17 = 0;
  objc_storeStrong(&v17, a3);
  id v16 = 0;
  objc_storeStrong(&v16, a4);
  id v15 = a1;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v19 = +[_CPUIBaseTableCell cellForTableView:v16];
    int v14 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v19 = +[_CPUIBaseTableCell cellForTableView:v16];
      int v14 = 1;
    }
    else
    {
      id WeakRetained = objc_loadWeakRetained(a1 + 4);
      id v12 = +[_CPUIBaseTableCell cellForTableView:v16];
      id v8 = (id)[WeakRetained templateEnvironment];
      [v8 hasNavigationEntitlement];
      CGSizeMake_9();
      objc_msgSend(v12, "setArtworkSize:", v4, v5);

      id v19 = v12;
      int v14 = 1;
      objc_storeStrong(&v12, 0);
      objc_storeStrong(&WeakRetained, 0);
    }
  }
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(location, 0);
  id v6 = v19;

  return v6;
}

void __45__CPSListTemplateViewController__viewDidLoad__block_invoke_2(id *a1, void *a2, void *a3, void *a4)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v60 = 0;
  objc_storeStrong(&v60, a3);
  id v59 = 0;
  objc_storeStrong(&v59, a4);
  v58[1] = a1;
  v58[0] = 0;
  id v57 = CPListItemIdentifier(v60);
  id WeakRetained = objc_loadWeakRetained(a1 + 4);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    double v4 = objc_opt_class();
    id v5 = CPSSafeCast_17(v4, location[0]);
    id v6 = v58[0];
    v58[0] = v5;

    id v55 = (id)[WeakRetained templateDelegate];
    uint64_t v44 = MEMORY[0x263EF8330];
    int v45 = -1073741824;
    int v46 = 0;
    v47 = __45__CPSListTemplateViewController__viewDidLoad__block_invoke_3;
    v48 = &unk_2648A5300;
    id v49 = v55;
    id v50 = v60;
    id v51 = WeakRetained;
    id v52 = v57;
    id v53 = v59;
    uint64_t v54 = MEMORY[0x230F4C6B0](&v44);
    uint64_t v35 = MEMORY[0x263EF8330];
    int v36 = -1073741824;
    int v37 = 0;
    v38 = __45__CPSListTemplateViewController__viewDidLoad__block_invoke_5;
    id v39 = &unk_2648A5328;
    id v40 = v55;
    id v41 = WeakRetained;
    id v42 = v60;
    uint64_t v43 = MEMORY[0x230F4C6B0](&v35);
    id v25 = v58[0];
    id v21 = v60;
    id v22 = (id)v43;
    id v23 = (id)v54;
    id v28 = (id)[WeakRetained currentSpinningIdentifier];
    char v24 = [v28 isEqual:v57];
    id v27 = (id)[WeakRetained templateEnvironment];
    id v26 = (id)[v27 bundleIdentifier];
    objc_msgSend(v25, "configureWithImageRowItem:selectGridItemBlock:selectTitleBlock:showActivityIndicator:bundleIdentifier:", v21, v22, v23, v24 & 1);

    objc_storeStrong((id *)&v43, 0);
    objc_storeStrong(&v42, 0);
    objc_storeStrong(&v41, 0);
    objc_storeStrong(&v40, 0);
    objc_storeStrong((id *)&v54, 0);
    objc_storeStrong(&v53, 0);
    objc_storeStrong(&v52, 0);
    objc_storeStrong(&v51, 0);
    objc_storeStrong(&v50, 0);
    objc_storeStrong(&v49, 0);
    objc_storeStrong(&v55, 0);
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v34 = v60;
      id v7 = objc_opt_class();
      id v8 = CPSSafeCast_17(v7, location[0]);
      id v9 = v58[0];
      v58[0] = v8;

      [v58[0] configureWithMessageListItem:v34];
      objc_storeStrong(&v34, 0);
    }
    else
    {
      id v10 = objc_opt_class();
      id v33 = CPSSafeCast_17(v10, v60);
      id v11 = objc_opt_class();
      id v32 = CPSSafeCast_17(v11, location[0]);
      id v19 = (id)[WeakRetained templateEnvironment];
      char v20 = 0;
      if ([v19 canBecomeNowPlayingApp]) {
        char v20 = [v33 isPlaying];
      }

      if (v20)
      {
        id v18 = (id)[WeakRetained nowPlayingManager];
        id v17 = (id)[v18 snapshot];
        objc_msgSend(WeakRetained, "_playingIndicatorStateForSnapshot:");
      }
      id v14 = v32;
      id v12 = v33;
      id v16 = (id)[WeakRetained currentSpinningIdentifier];
      char v13 = [v16 isEqual:v57];
      id v15 = (id)[WeakRetained templateEnvironment];
      objc_msgSend(v14, "configureWithListItem:spinning:environment:playbackState:", v12, v13 & 1);

      objc_storeStrong(&v32, 0);
      objc_storeStrong(&v33, 0);
    }
  }
  objc_storeStrong(&WeakRetained, 0);
  objc_storeStrong(&v57, 0);
  objc_storeStrong(v58, 0);
  objc_storeStrong(&v59, 0);
  objc_storeStrong(&v60, 0);
  objc_storeStrong(location, 0);
}

void __45__CPSListTemplateViewController__viewDidLoad__block_invoke_3(uint64_t a1)
{
  if ([*(id *)(a1 + 32) conformsToProtocol:&unk_26DF78730])
  {
    if ([*(id *)(a1 + 40) isEnabled])
    {
      v2 = *(void **)(a1 + 32);
      id v4 = (id)[*(id *)(a1 + 48) listTemplate];
      id v3 = (id)[v4 identifier];
      objc_msgSend(v2, "listTemplateWithIdentifier:didSelectListItemWithIdentifier:completionHandler:");
    }
    else
    {
      id v1 = (id)[*(id *)(a1 + 48) tableView];
      [v1 deselectRowAtIndexPath:*(void *)(a1 + 64) animated:1];
    }
  }
}

void __45__CPSListTemplateViewController__viewDidLoad__block_invoke_5(id *a1, uint64_t a2)
{
  if ([a1[4] conformsToProtocol:&unk_26DF78730])
  {
    id v2 = a1[4];
    id v5 = (id)[a1[5] listTemplate];
    id v4 = (id)[v5 identifier];
    id v3 = (id)[a1[6] identifier];
    objc_msgSend(v2, "listTemplateWithIdentifier:didSelectImageAtIndex:inImageRowItemWithIdentifier:", v4, a2);
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  id v8 = self;
  SEL v7 = a2;
  BOOL v6 = a3;
  v5.receiver = self;
  v5.super_class = (Class)CPSListTemplateViewController;
  [(CPSBaseTemplateViewController *)&v5 viewWillAppear:a3];
  if (![(CPSListTemplateViewController *)v8 _shouldRetainFocusOnWillAppear])
  {
    id v4 = [(CPSListTemplateViewController *)v8 tableView];
    id location = (id)[v4 indexPathForSelectedRow];
    if (location) {
      [v4 deselectRowAtIndexPath:location animated:v6];
    }
    objc_storeStrong(&location, 0);
    objc_storeStrong(&v4, 0);
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  id v8 = self;
  SEL v7 = a2;
  BOOL v6 = a3;
  v5.receiver = self;
  v5.super_class = (Class)CPSListTemplateViewController;
  [(CPSBaseTemplateViewController *)&v5 viewDidAppear:a3];
  id v3 = [(CPSBaseTemplateViewController *)v8 templateEnvironment];
  BOOL v4 = [(CPSTemplateEnvironment *)v3 canBecomeNowPlayingApp];

  if (v4) {
    [(CPSListTemplateViewController *)v8 _updatePlayingIndicators];
  }
}

- (void)_updateEmptyView
{
  v46[4] = *MEMORY[0x263EF8340];
  int v45 = self;
  SEL v44 = a2;
  BOOL v43 = 0;
  v38 = [(CPSListTemplateViewController *)self dataSource];
  char v41 = 0;
  BOOL v39 = 0;
  if (![(CPSSectionedDataSource *)v38 numberOfItems])
  {
    id v42 = [(CPSListTemplateViewController *)v45 dataSource];
    char v41 = 1;
    BOOL v39 = [(CPSSectionedDataSource *)v42 numberOfEnhancedSections] == 0;
  }
  if (v41) {

  }
  BOOL v43 = v39;
  if (v39)
  {
    id v2 = [(CPSListTemplateViewController *)v45 emptyView];
    BOOL v34 = v2 != 0;

    if (!v34)
    {
      id v3 = [CPSEmptyView alloc];
      id v40 = -[CPSEmptyView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
      [(CPSListTemplateViewController *)v45 setEmptyView:v40];
      id v10 = [(CPSListTemplateViewController *)v45 tableView];
      [(CPSTableView *)v10 setHidden:1];

      id v11 = (id)[(CPSListTemplateViewController *)v45 view];
      [v11 addSubview:v40];

      id v12 = (void *)MEMORY[0x263F08938];
      id v33 = (id)[(CPSEmptyView *)v40 topAnchor];
      id v32 = (id)[(CPSListTemplateViewController *)v45 view];
      id v31 = (id)[v32 safeAreaLayoutGuide];
      id v30 = (id)[v31 topAnchor];
      id v29 = (id)objc_msgSend(v33, "constraintEqualToAnchor:");
      v46[0] = v29;
      id v28 = (id)[(CPSEmptyView *)v40 leadingAnchor];
      id v27 = (id)[(CPSListTemplateViewController *)v45 view];
      id v26 = (id)[v27 safeAreaLayoutGuide];
      id v25 = (id)[v26 leadingAnchor];
      id v24 = (id)objc_msgSend(v28, "constraintEqualToAnchor:");
      v46[1] = v24;
      id v23 = (id)[(CPSEmptyView *)v40 trailingAnchor];
      id v22 = (id)[(CPSListTemplateViewController *)v45 view];
      id v21 = (id)[v22 safeAreaLayoutGuide];
      id v20 = (id)[v21 trailingAnchor];
      id v19 = (id)objc_msgSend(v23, "constraintEqualToAnchor:");
      v46[2] = v19;
      id v18 = (id)[(CPSEmptyView *)v40 bottomAnchor];
      id v17 = (id)[(CPSListTemplateViewController *)v45 view];
      id v16 = (id)[v17 safeAreaLayoutGuide];
      id v15 = (id)[v16 bottomAnchor];
      id v14 = (id)objc_msgSend(v18, "constraintEqualToAnchor:");
      v46[3] = v14;
      id v13 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v46 count:4];
      objc_msgSend(v12, "activateConstraints:");

      objc_storeStrong((id *)&v40, 0);
    }
    BOOL v6 = [(CPSListTemplateViewController *)v45 emptyView];
    objc_super v5 = [(CPSListTemplateViewController *)v45 listTemplate];
    BOOL v4 = [(CPListTemplate *)v5 emptyViewTitleVariants];
    -[CPSEmptyView setTitleVariants:](v6, "setTitleVariants:");

    id v9 = [(CPSListTemplateViewController *)v45 emptyView];
    id v8 = [(CPSListTemplateViewController *)v45 listTemplate];
    SEL v7 = [(CPListTemplate *)v8 emptyViewSubtitleVariants];
    -[CPSEmptyView setSubtitleVariants:](v9, "setSubtitleVariants:");
  }
  else
  {
    int v37 = [(CPSListTemplateViewController *)v45 emptyView];

    if (v37)
    {
      int v36 = [(CPSListTemplateViewController *)v45 emptyView];
      [(CPSEmptyView *)v36 removeFromSuperview];

      [(CPSListTemplateViewController *)v45 setEmptyView:0];
    }
    uint64_t v35 = [(CPSListTemplateViewController *)v45 tableView];
    [(CPSTableView *)v35 setHidden:0];
  }
}

- (void)_addSpinnerToIdentifier:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v25 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v15 = location[0];
  id v16 = [(CPSListTemplateViewController *)v25 nextSpinningIdentifier];
  char v17 = objc_msgSend(v15, "isEqual:");

  if (v17)
  {
    id v22 = CarPlaySupportGeneralLogging();
    os_log_type_t v21 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v22, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_2_1_8_66((uint64_t)v26, (uint64_t)location[0]);
      _os_log_impl(&dword_22B689000, (os_log_t)v22, v21, "Adding spinner to list item %{public}@", v26, 0xCu);
    }
    objc_storeStrong(&v22, 0);
    id v13 = [(CPSListTemplateViewController *)v25 currentSpinningIdentifier];
    id v20 = (id)[(NSUUID *)v13 copy];

    id v14 = [(CPSListTemplateViewController *)v25 nextSpinningIdentifier];
    -[CPSListTemplateViewController setCurrentSpinningIdentifier:](v25, "setCurrentSpinningIdentifier:");

    [(CPSListTemplateViewController *)v25 setNextSpinningIdentifier:0];
    id v19 = (id)[MEMORY[0x263EFF9C0] set];
    id v18 = 0;
    if (v20)
    {
      id v12 = [(CPSListTemplateViewController *)v25 dataSource];
      id v3 = [(CPSSectionedDataSource *)v12 indexPathForItemWithIdentifier:location[0]];
      id v4 = v18;
      id v18 = v3;

      if (v18) {
        [v19 addObject:v18];
      }
    }
    id v11 = [(CPSListTemplateViewController *)v25 currentSpinningIdentifier];

    if (v11)
    {
      id v10 = [(CPSListTemplateViewController *)v25 dataSource];
      id v9 = [(CPSListTemplateViewController *)v25 currentSpinningIdentifier];
      id v5 = -[CPSSectionedDataSource indexPathForItemWithIdentifier:](v10, "indexPathForItemWithIdentifier:");
      id v6 = v18;
      id v18 = v5;

      if (v18) {
        [v19 addObject:v18];
      }
    }
    else
    {
      [(CPSListTemplateViewController *)v25 setCurrentSpinningIdentifier:0];
    }
    if ([v19 count])
    {
      id v8 = [(CPSListTemplateViewController *)v25 dataSource];
      id v7 = (id)[v19 allObjects];
      -[CPSDataSource reloadItemsAtIndexPaths:](v8, "reloadItemsAtIndexPaths:");
    }
    objc_storeStrong(&v18, 0);
    objc_storeStrong(&v19, 0);
    objc_storeStrong(&v20, 0);
    int v23 = 0;
  }
  else
  {
    int v23 = 1;
  }
  objc_storeStrong(location, 0);
}

- (void)_scheduleLoadingSpinnerForIdentifier:(id)a3
{
  int v23 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  [(CPSListTemplateViewController *)v23 setNextSpinningIdentifier:location[0]];
  objc_initWeak(&from, v23);
  if (![(CPSListTemplateViewController *)v23 spinnerState])
  {
    id v6 = (void *)MEMORY[0x263EFFA20];
    uint64_t v14 = MEMORY[0x263EF8330];
    int v15 = -1073741824;
    int v16 = 0;
    char v17 = __70__CPSListTemplateViewController__scheduleLoadingSpinnerForIdentifier___block_invoke;
    id v18 = &unk_2648A5378;
    objc_copyWeak(&v20, &from);
    id v19 = location[0];
    id v5 = (id)[v6 scheduledTimerWithTimeInterval:0 repeats:&v14 block:0.2];
    -[CPSListTemplateViewController setSpinnerStartTimer:](v23, "setSpinnerStartTimer:");

    id v4 = (void *)MEMORY[0x263EFFA20];
    uint64_t v7 = MEMORY[0x263EF8330];
    int v8 = -1073741824;
    int v9 = 0;
    id v10 = __70__CPSListTemplateViewController__scheduleLoadingSpinnerForIdentifier___block_invoke_2;
    id v11 = &unk_2648A5378;
    objc_copyWeak(&v13, &from);
    id v12 = location[0];
    id v3 = (id)[v4 scheduledTimerWithTimeInterval:0 repeats:&v7 block:10.0];
    [(CPSListTemplateViewController *)v23 setSpinnerTimeoutTimer:"setSpinnerTimeoutTimer:"];

    [(CPSListTemplateViewController *)v23 setSpinnerState:1];
    objc_storeStrong(&v12, 0);
    objc_destroyWeak(&v13);
    objc_storeStrong(&v19, 0);
    objc_destroyWeak(&v20);
  }
  objc_destroyWeak(&from);
  objc_storeStrong(location, 0);
}

void __70__CPSListTemplateViewController__scheduleLoadingSpinnerForIdentifier___block_invoke(uint64_t a1, void *a2)
{
  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v3[1] = (id)a1;
  v3[0] = objc_loadWeakRetained((id *)(a1 + 40));
  [v3[0] _startSpinnerTimerFired:location[0] identifier:*(void *)(a1 + 32)];
  objc_storeStrong(v3, 0);
  objc_storeStrong(location, 0);
}

void __70__CPSListTemplateViewController__scheduleLoadingSpinnerForIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v3[1] = (id)a1;
  v3[0] = objc_loadWeakRetained((id *)(a1 + 40));
  [v3[0] _timeoutSpinnerFired:location[0] identifier:*(void *)(a1 + 32)];
  objc_storeStrong(v3, 0);
  objc_storeStrong(location, 0);
}

- (void)_startSpinnerTimerFired:(id)a3 identifier:(id)a4
{
  uint64_t v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v5 = 0;
  objc_storeStrong(&v5, a4);
  [(CPSListTemplateViewController *)v7 setSpinnerStartTimer:0];
  [(CPSListTemplateViewController *)v7 setSpinnerState:2];
  [(CPSListTemplateViewController *)v7 _addSpinnerToIdentifier:v5];
  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
}

- (void)_timeoutSpinnerFired:(id)a3 identifier:(id)a4
{
  uint64_t v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v5 = 0;
  objc_storeStrong(&v5, a4);
  [(CPSListTemplateViewController *)v7 setSpinnerTimeoutTimer:0];
  [(CPSListTemplateViewController *)v7 setSpinnerState:0];
  [(CPSListTemplateViewController *)v7 _cellSelectionCompleted:v5];
  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
}

- (void)_cancelScheduledLoadingSpinner
{
  id v2 = [(CPSListTemplateViewController *)self spinnerStartTimer];
  [(NSTimer *)v2 invalidate];

  id v3 = [(CPSListTemplateViewController *)self spinnerTimeoutTimer];
  [(NSTimer *)v3 invalidate];

  -[CPSListTemplateViewController setSpinnerStartTimer:](self, "setSpinnerStartTimer:");
  [(CPSListTemplateViewController *)self setSpinnerTimeoutTimer:0];
  [(CPSListTemplateViewController *)self setSpinnerState:0];
}

- (void)_cellSelectionCompleted:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  int v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  [(CPSListTemplateViewController *)v9 setCurrentSpinningIdentifier:0];
  if (location[0] && [(CPSListTemplateViewController *)v9 spinnerState] == 2)
  {
    id v5 = [(CPSListTemplateViewController *)v9 dataSource];
    id v7 = [(CPSSectionedDataSource *)v5 indexPathForItemWithIdentifier:location[0]];

    os_log_t oslog = (os_log_t)CarPlaySupportGeneralLogging();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_2_2_8_66_8_66((uint64_t)v11, (uint64_t)location[0], (uint64_t)v7);
      _os_log_impl(&dword_22B689000, oslog, OS_LOG_TYPE_DEFAULT, "Removing spinner from item %{public}@ at index path %{public}@", v11, 0x16u);
    }
    objc_storeStrong((id *)&oslog, 0);
    if (v7)
    {
      id v4 = [(CPSListTemplateViewController *)v9 dataSource];
      id v10 = v7;
      id v3 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:&v10 count:1];
      -[CPSDataSource reloadItemsAtIndexPaths:](v4, "reloadItemsAtIndexPaths:");
    }
    objc_storeStrong(&v7, 0);
  }
  [(CPSListTemplateViewController *)v9 _cancelScheduledLoadingSpinner];
  objc_storeStrong(location, 0);
}

- (BOOL)restoresFocusAfterTransition
{
  return 0;
}

- (void)updateAssistantCell
{
  [(CPSListTemplateViewController *)self updateAssistantCellTitle];
  dataSource = self->_dataSource;
  id v4 = [(CPSListTemplateViewController *)self listTemplate];
  id v3 = [(CPListTemplate *)v4 assistantCellConfiguration];
  [(CPSSectionedDataSource *)dataSource setAssistantCellVisibility:[(CPAssistantCellConfiguration *)v3 visibility]];

  id v5 = self->_dataSource;
  id v7 = [(CPSListTemplateViewController *)self listTemplate];
  id v6 = [(CPListTemplate *)v7 assistantCellConfiguration];
  [(CPSSectionedDataSource *)v5 setAssistantCellPosition:[(CPAssistantCellConfiguration *)v6 position]];
}

- (void)updateAssistantCellTitle
{
  id v20 = self;
  id location[2] = (id)a2;
  char v17 = [(CPSListTemplateViewController *)self listTemplate];
  int v16 = [(CPListTemplate *)v17 assistantCellConfiguration];
  id v18 = [(CPAssistantCellConfiguration *)v16 assistantAction];

  location[1] = v18;
  location[0] = +[CPSListTemplateViewController intentIdentifierFromConfigurationEnum:v18];
  if ([location[0] isEqualToString:@"INPlayMediaIntent"])
  {
    uint64_t v14 = [(CPSBaseTemplateViewController *)v20 templateEnvironment];
    id v13 = [(CPSTemplateEnvironment *)v14 bundleIdentifier];
    BOOL v15 = [(NSString *)v13 isEqualToString:*MEMORY[0x263F31338]];

    if (v15)
    {
      dataSource = v20->_dataSource;
      id v12 = CPSLocalizedStringForKey(@"ASSISTANTCELL_TITLE_PODCASTS");
      -[CPSSectionedDataSource setAssistantCellTitle:](dataSource, "setAssistantCellTitle:");
    }
    else
    {
      int v9 = [(CPSBaseTemplateViewController *)v20 templateEnvironment];
      int v8 = [(CPSTemplateEnvironment *)v9 bundleIdentifier];
      BOOL v10 = [(NSString *)v8 isEqualToString:*MEMORY[0x263F31330]];

      if (v10)
      {
        id v6 = v20->_dataSource;
        id v7 = CPSLocalizedStringForKey(@"ASSISTANTCELL_TITLE_CLASSICAL");
        -[CPSSectionedDataSource setAssistantCellTitle:](v6, "setAssistantCellTitle:");
      }
      else
      {
        id v4 = v20->_dataSource;
        id v5 = CPSLocalizedStringForKey(@"ASSISTANTCELL_TITLE_AUDIO");
        -[CPSSectionedDataSource setAssistantCellTitle:](v4, "setAssistantCellTitle:");
      }
    }
  }
  else if ([location[0] isEqualToString:@"INStartCallIntent"])
  {
    id v2 = v20->_dataSource;
    id v3 = CPSLocalizedStringForKey(@"ASSISTANTCELL_TITLE_COMMUNICATION");
    -[CPSSectionedDataSource setAssistantCellTitle:](v2, "setAssistantCellTitle:");
  }
  objc_storeStrong(location, 0);
}

- (void)updateSectionHeaderImage:(id)a3 forSectionIdentifier:(id)a4
{
  int v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v14 = 0;
  objc_storeStrong(&v14, a4);
  queue = MEMORY[0x263EF83A0];
  uint64_t v6 = MEMORY[0x263EF8330];
  int v7 = -1073741824;
  int v8 = 0;
  int v9 = __79__CPSListTemplateViewController_updateSectionHeaderImage_forSectionIdentifier___block_invoke;
  BOOL v10 = &unk_2648A4AD0;
  id v11 = v16;
  id v12 = v14;
  id v13 = location[0];
  dispatch_async(queue, &v6);

  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong((id *)&v11, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(location, 0);
}

void __79__CPSListTemplateViewController_updateSectionHeaderImage_forSectionIdentifier___block_invoke(uint64_t a1)
{
  v20[2] = (id)a1;
  v20[1] = (id)a1;
  id v10 = (id)[*(id *)(a1 + 32) dataSource];
  v20[0] = (id)[v10 sectionWithIdentifier:*(void *)(a1 + 40)];

  id v11 = objc_opt_class();
  id v13 = (id)[*(id *)(a1 + 32) tableView];
  id v12 = (id)objc_msgSend(v13, "headerViewForSection:", objc_msgSend(v20[0], "index"));
  id v19 = CPSSafeCast_17(v11, v12);

  if (*(void *)(a1 + 48))
  {
    if ([v20[0] sectionHeaderStyle] == 2)
    {
      id v1 = objc_opt_class();
      id v18 = CPSSafeCast_17(v1, v19);
      [v20[0] setHeaderImage:*(void *)(a1 + 48)];
      [v18 setImage:*(void *)(a1 + 48)];
      objc_storeStrong(&v18, 0);
    }
    else
    {
      [v20[0] setSectionHeaderStyle:2];
      [v20[0] setHeaderImage:*(void *)(a1 + 48)];
      id v9 = (id)[*(id *)(a1 + 32) tableView];
      id v8 = (id)objc_msgSend(MEMORY[0x263F088D0], "indexSetWithIndex:", objc_msgSend(v19, "sectionIndex"));
      objc_msgSend(v9, "_reloadSectionHeaderFooters:withRowAnimation:");
    }
  }
  else
  {
    id v6 = (id)[v20[0] headerSubtitle];
    char v16 = 0;
    BOOL v7 = 1;
    if (![v6 length])
    {
      id v17 = (id)[v20[0] headerButton];
      char v16 = 1;
      BOOL v7 = v17 != 0;
    }
    if (v16) {

    }
    if (v7)
    {
      id v2 = objc_opt_class();
      id v15 = CPSSafeCast_17(v2, v19);
      objc_msgSend(v20[0], "setHeaderImage:");
      [v15 setImage:0];
      objc_storeStrong(&v15, 0);
    }
    else
    {
      id v3 = (id)[v20[0] header];
      objc_msgSend(v20[0], "setSectionHeaderStyle:", objc_msgSend(v3, "length") != 0);

      [v20[0] setHeaderImage:0];
      id v5 = (id)[*(id *)(a1 + 32) tableView];
      id v4 = (id)objc_msgSend(MEMORY[0x263F088D0], "indexSetWithIndex:", objc_msgSend(v19, "sectionIndex"));
      objc_msgSend(v5, "_reloadSectionHeaderFooters:withRowAnimation:");
    }
  }
  objc_storeStrong(&v19, 0);
  objc_storeStrong(v20, 0);
}

- (void)setButton:(id)a3 enabled:(BOOL)a4
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0);
}

- (void)setButton:(id)a3 hidden:(BOOL)a4
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0);
}

- (void)reloadTemplate:(id)a3
{
  id v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  queue = MEMORY[0x263EF83A0];
  uint64_t v4 = MEMORY[0x263EF8330];
  int v5 = -1073741824;
  int v6 = 0;
  BOOL v7 = __48__CPSListTemplateViewController_reloadTemplate___block_invoke;
  id v8 = &unk_2648A3990;
  id v9 = location[0];
  id v10 = v12;
  dispatch_async(queue, &v4);

  objc_storeStrong((id *)&v10, 0);
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
}

uint64_t __48__CPSListTemplateViewController_reloadTemplate___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id location[2] = (id)a1;
  location[1] = (id)a1;
  location[0] = CarPlaySupportGeneralLogging();
  if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_2_1_8_64((uint64_t)v6, *(void *)(a1 + 32));
    _os_log_impl(&dword_22B689000, (os_log_t)location[0], OS_LOG_TYPE_DEFAULT, "Received update for list template %@", v6, 0xCu);
  }
  objc_storeStrong(location, 0);
  [*(id *)(a1 + 40) setCurrentSpinningIdentifier:0];
  [*(id *)(a1 + 40) _updateTemplate:*(void *)(a1 + 32)];
  [*(id *)(a1 + 40) updateAssistantCell];
  id v3 = (id)[*(id *)(a1 + 40) dataSource];
  id v2 = (id)[*(id *)(a1 + 32) sections];
  objc_msgSend(v3, "updateSections:");

  return [*(id *)(a1 + 40) _updateEmptyView];
}

- (void)updateAssistantCellConfiguration:(id)a3 withCompletion:(id)a4
{
  char v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v14 = 0;
  objc_storeStrong(&v14, a4);
  queue = MEMORY[0x263EF83A0];
  uint64_t v6 = MEMORY[0x263EF8330];
  int v7 = -1073741824;
  int v8 = 0;
  id v9 = __81__CPSListTemplateViewController_updateAssistantCellConfiguration_withCompletion___block_invoke;
  id v10 = &unk_2648A4310;
  id v11 = v16;
  id v12 = location[0];
  id v13 = v14;
  dispatch_async(queue, &v6);

  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong((id *)&v11, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(location, 0);
}

void __81__CPSListTemplateViewController_updateAssistantCellConfiguration_withCompletion___block_invoke(uint64_t a1)
{
  v10[2] = (id)a1;
  v10[1] = (id)a1;
  v10[0] = 0;
  uint64_t v5 = *(void *)(a1 + 40);
  id v9 = 0;
  id v7 = (id)[*(id *)(a1 + 32) templateEnvironment];
  BOOL v6 = +[CPSListTemplateViewController clientAssistantCellConfiguration:availableWithError:templateEnvironment:](CPSListTemplateViewController, "clientAssistantCellConfiguration:availableWithError:templateEnvironment:", v5, &v9);
  objc_storeStrong(v10, v9);
  [*(id *)(a1 + 32) setAssistantCellAvailable:v6];

  if ([*(id *)(a1 + 32) assistantCellAvailable])
  {
    uint64_t v3 = *(void *)(a1 + 40);
    id v4 = (id)[*(id *)(a1 + 32) listTemplate];
    [v4 setAssistantCellConfiguration:v3];

    [*(id *)(a1 + 32) updateAssistantCell];
  }
  uint64_t v2 = *(void *)(a1 + 48);
  char v1 = [*(id *)(a1 + 32) assistantCellAvailable];
  (*(void (**)(uint64_t, void, id))(v2 + 16))(v2, v1 & 1, v10[0]);
  objc_storeStrong(v10, 0);
}

- (void)reloadItems:(id)a3
{
  id v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  queue = MEMORY[0x263EF83A0];
  uint64_t v4 = MEMORY[0x263EF8330];
  int v5 = -1073741824;
  int v6 = 0;
  id v7 = __45__CPSListTemplateViewController_reloadItems___block_invoke;
  int v8 = &unk_2648A3990;
  id v9 = location[0];
  id v10 = v12;
  dispatch_async(queue, &v4);

  objc_storeStrong((id *)&v10, 0);
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
}

void __45__CPSListTemplateViewController_reloadItems___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id location[2] = (id)a1;
  location[1] = (id)a1;
  location[0] = CarPlaySupportGeneralLogging();
  os_log_type_t v12 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = (id)[*(id *)(a1 + 40) listTemplate];
    __os_log_helper_16_2_2_8_64_8_64((uint64_t)v14, v3, (uint64_t)v4);
    _os_log_impl(&dword_22B689000, (os_log_t)location[0], v12, "Received items to reload %@ for list template %@", v14, 0x16u);
  }
  objc_storeStrong(location, 0);
  objc_msgSend(*(id *)(a1 + 40), "setCurrentSpinningIdentifier:");
  char v1 = *(void **)(a1 + 32);
  uint64_t v6 = MEMORY[0x263EF8330];
  int v7 = -1073741824;
  int v8 = 0;
  id v9 = __45__CPSListTemplateViewController_reloadItems___block_invoke_177;
  id v10 = &unk_2648A53A0;
  id v11 = *(id *)(a1 + 40);
  [v1 enumerateObjectsUsingBlock:&v6];
  id v2 = (id)[*(id *)(a1 + 40) dataSource];
  [v2 reloadItems:*(void *)(a1 + 32)];

  [*(id *)(a1 + 40) _updateEmptyView];
  objc_storeStrong(&v11, 0);
}

void __45__CPSListTemplateViewController_reloadItems___block_invoke_177(id *a1, void *a2, void *a3, void *a4)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v14[3] = a3;
  v14[2] = a4;
  v14[1] = a1;
  id v11 = (id)[a1[4] listTemplate];
  v14[0] = (id)[v11 indexPathForItem:location[0]];

  if (v14[0])
  {
    id v6 = (id)[a1[4] listTemplate];
    id v5 = (id)[v6 sections];
    id v13 = (id)objc_msgSend(v5, "objectAtIndexedSubscript:", objc_msgSend(v14[0], "section"));

    id v7 = v13;
    uint64_t v4 = [v14[0] row];
    [v7 replaceItemAtIndex:v4 withItem:location[0]];
    objc_storeStrong(&v13, 0);
  }
  else
  {
    id v12 = CarPlaySupportGeneralLogging();
    if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_INFO))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v16, (uint64_t)location[0]);
      _os_log_impl(&dword_22B689000, (os_log_t)v12, OS_LOG_TYPE_INFO, "Unable to match an index path for item %@", v16, 0xCu);
    }
    objc_storeStrong(&v12, 0);
  }
  objc_storeStrong(v14, 0);
  objc_storeStrong(location, 0);
}

- (void)scrollToTop
{
  id v5 = self;
  v4[1] = (id)a2;
  id v2 = [(CPSListTemplateViewController *)self dataSource];
  BOOL v3 = [(CPSSectionedDataSource *)v2 numberOfItems] <= 0;

  if (!v3)
  {
    v4[0] = (id)objc_msgSend(MEMORY[0x263F088C8], "indexPathForRow:inSection:", 0);
    [(CPSTableView *)v5->_tableView scrollToRowAtIndexPath:v4[0] atScrollPosition:1 animated:1];
    objc_storeStrong(v4, 0);
  }
}

- (void)_scrollViewAccessoryInsetsDidChange:(id)a3
{
  os_log_type_t v21 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v12 = [(CPSBaseTemplateViewController *)v21 templateEnvironment];
  BOOL v13 = [(CPSTemplateEnvironment *)v12 rightHandDrive];

  uint64_t v3 = 3;
  if (!v13) {
    uint64_t v3 = 5;
  }
  uint64_t v19 = v3;
  id v14 = [(CPSListTemplateViewController *)v21 tableView];

  id v9 = (id)[(CPSListTemplateViewController *)v21 navigationController];
  id v8 = (id)[v9 navigationBar];
  [v8 layoutMargins];

  UIEdgeInsetsMake_2();
  double v15 = v4;
  double v16 = v5;
  double v17 = v6;
  double v18 = v7;
  id v11 = (id)[(CPSListTemplateViewController *)v21 navigationController];
  id v10 = (id)[v11 navigationBar];
  objc_msgSend(v10, "setLayoutMargins:", v15, v16, v17, v18);

  objc_storeStrong(location, 0);
}

- (void)tableView:(id)a3 didUpdateFocusInContext:(id)a4 withAnimationCoordinator:(id)a5
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v10 = 0;
  objc_storeStrong(&v10, a4);
  id v9 = 0;
  objc_storeStrong(&v9, a5);
  id v8 = (id)[v10 nextFocusedIndexPath];
  id v7 = (id)[location[0] indexPathForSelectedRow];
  if (v7 && v8 && ([v7 isEqual:v8] & 1) == 0) {
    [location[0] deselectRowAtIndexPath:v7 animated:0];
  }
  objc_storeStrong(&v7, 0);
  objc_storeStrong(&v8, 0);
  objc_storeStrong(&v9, 0);
  objc_storeStrong(&v10, 0);
  objc_storeStrong(location, 0);
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  os_log_type_t v21 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  int64_t v19 = a4;
  id v11 = [(CPSSectionedDataSource *)v21->_dataSource assistantCellIndexPath];
  char v17 = 0;
  BOOL v12 = 0;
  if (v11)
  {
    double v18 = [(CPSSectionedDataSource *)v21->_dataSource assistantCellIndexPath];
    char v17 = 1;
    BOOL v12 = [(NSIndexPath *)v18 section] == v19;
  }
  if (v17) {

  }
  if (v12)
  {
    double v22 = 0.0;
    int v16 = 1;
  }
  else
  {
    id v9 = [(CPSListTemplateViewController *)v21 dataSource];
    id v15 = [(CPSSectionedDataSource *)v9 sectionAtIndex:v19];

    id v14 = (id)[v15 header];
    if ([v14 length])
    {
      id v7 = [(CPSListTemplateViewController *)v21 dataSource];
      id v6 = [(CPSSectionedDataSource *)v7 sectionAtIndex:v19];
      uint64_t v8 = [v6 sectionHeaderStyle];

      if (v8)
      {
        if (v8 == 1)
        {
          if (v19 < 1) {
            uint64_t v5 = *MEMORY[0x263F1D600];
          }
          else {
            uint64_t v5 = 0x4042000000000000;
          }
          uint64_t v13 = v5;
        }
        else if (v8 == 2)
        {
          uint64_t v13 = 0x4046000000000000;
        }
        else
        {
          uint64_t v13 = 0;
        }
      }
      else
      {
        uint64_t v13 = 0;
      }
      double v22 = *(double *)&v13;
      int v16 = 1;
    }
    else
    {
      double v22 = 0.0;
      int v16 = 1;
    }
    objc_storeStrong(&v14, 0);
    objc_storeStrong(&v15, 0);
  }
  objc_storeStrong(location, 0);
  return v22;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  v77[1] = *MEMORY[0x263EF8340];
  v71 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  int64_t v69 = a4;
  id v49 = [(CPSListTemplateViewController *)v71 dataSource];
  BOOL v50 = a4 < [(CPSSectionedDataSource *)v49 numberOfSections];

  if (v50)
  {
    v47 = [(CPSListTemplateViewController *)v71 dataSource];
    id v67 = [(CPSSectionedDataSource *)v47 sectionAtIndex:v69];

    [v67 setIndex:v69];
    uint64_t v66 = [v67 sectionHeaderStyle];
    id v65 = 0;
    if (v66 == 1)
    {
      id v64 = (id)[v67 header];
      id v45 = location[0];
      double v4 = (objc_class *)objc_opt_class();
      int v46 = NSStringFromClass(v4);
      id v5 = (id)objc_msgSend(v45, "dequeueReusableHeaderFooterViewWithIdentifier:");
      id v6 = v65;
      id v65 = v5;

      id v63 = (id)[v65 viewWithTag:tableView_viewForHeaderInSection__headerTitleTag];
      if (!v63)
      {
        int v23 = (void *)MEMORY[0x263F1C660];
        uint64_t v22 = *MEMORY[0x263F1D268];
        id v24 = (id)[(CPSListTemplateViewController *)v71 traitCollection];
        id v62 = (id)objc_msgSend(v23, "preferredFontDescriptorWithTextStyle:compatibleWithTraitCollection:", v22);

        uint64_t v76 = *MEMORY[0x263F1D350];
        id v25 = (id)[NSNumber numberWithDouble:*MEMORY[0x263F1D340]];
        v77[0] = v25;
        id v61 = (id)objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", v77, &v76);

        id v26 = v62;
        uint64_t v74 = *MEMORY[0x263F1D210];
        id v75 = v61;
        id v27 = (id)[NSDictionary dictionaryWithObjects:&v75 forKeys:&v74 count:1];
        id v7 = (id)objc_msgSend(v26, "fontDescriptorByAddingAttributes:");
        id v8 = v62;
        id v62 = v7;

        id v9 = objc_alloc(MEMORY[0x263F1C768]);
        id v10 = objc_msgSend(v9, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
        id v11 = v63;
        id v63 = v10;

        id v28 = (id)[MEMORY[0x263F1C550] labelColor];
        objc_msgSend(v63, "setTextColor:");

        [v63 setTag:tableView_viewForHeaderInSection__headerTitleTag];
        id v29 = (id)[MEMORY[0x263F1C658] fontWithDescriptor:v62 size:0.0];
        objc_msgSend(v63, "setFont:");

        id v30 = (id)[v65 contentView];
        [v30 addSubview:v63];

        [v63 setTranslatesAutoresizingMaskIntoConstraints:0];
        id v31 = (void *)MEMORY[0x263F08938];
        id v44 = (id)[v63 bottomAnchor];
        id v43 = (id)[v65 contentView];
        id v42 = (id)[v43 bottomAnchor];
        id v41 = (id)objc_msgSend(v44, "constraintEqualToAnchor:");
        v73[0] = v41;
        id v40 = (id)[v63 leadingAnchor];
        id v39 = (id)[v65 contentView];
        id v38 = (id)[v39 leadingAnchor];
        id v37 = (id)objc_msgSend(v40, "constraintEqualToAnchor:constant:", 6.0);
        v73[1] = v37;
        id v36 = (id)[v63 trailingAnchor];
        id v35 = (id)[v65 contentView];
        id v34 = (id)[v35 trailingAnchor];
        id v33 = (id)objc_msgSend(v36, "constraintEqualToAnchor:constant:", -6.0);
        v73[2] = v33;
        id v32 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v73 count:3];
        objc_msgSend(v31, "activateConstraints:");

        objc_storeStrong(&v61, 0);
        objc_storeStrong(&v62, 0);
      }
      [v63 setText:v64];
      objc_storeStrong(&v63, 0);
      objc_storeStrong(&v64, 0);
    }
    else if (v66 == 2)
    {
      id v16 = location[0];
      BOOL v12 = (objc_class *)objc_opt_class();
      char v17 = NSStringFromClass(v12);
      id v60 = (id)objc_msgSend(v16, "dequeueReusableHeaderFooterViewWithIdentifier:");

      id v18 = (id)[v67 header];
      objc_msgSend(v60, "setTitle:");

      long long v59 = *MEMORY[0x263EFC990];
      long long v58 = v59;
      [v60 setImageSize:v59];
      id v19 = (id)[v67 headerImage];
      objc_msgSend(v60, "setImage:");

      id v20 = (id)[v67 headerSubtitle];
      objc_msgSend(v60, "setSubtitle:");

      id v21 = v60;
      uint64_t v51 = MEMORY[0x263EF8330];
      int v52 = -1073741824;
      int v53 = 0;
      uint64_t v54 = __66__CPSListTemplateViewController_tableView_viewForHeaderInSection___block_invoke;
      id v55 = &unk_2648A53C8;
      v56 = v71;
      id v57 = v67;
      [v21 configureButton:&v51];
      objc_storeStrong(&v65, v60);
      objc_storeStrong(&v57, 0);
      objc_storeStrong((id *)&v56, 0);
      objc_storeStrong(&v60, 0);
    }
    id v15 = (id)[v67 identifier];
    objc_msgSend(v65, "setIdentifier:");

    [v65 setSectionIndex:v69];
    [v65 setAccessibilityIdentifier:@"CPListSection"];
    id v72 = v65;
    int v68 = 1;
    objc_storeStrong(&v65, 0);
    objc_storeStrong(&v67, 0);
  }
  else
  {
    id v72 = 0;
    int v68 = 1;
  }
  objc_storeStrong(location, 0);
  uint64_t v13 = v72;

  return v13;
}

void __66__CPSListTemplateViewController_tableView_viewForHeaderInSection___block_invoke(uint64_t a1, void *a2)
{
  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  [location[0] addTarget:*(void *)(a1 + 32) action:sel_didSelectMediaButton_ forControlEvents:64];
  id v4 = (id)[*(id *)(a1 + 40) headerButton];
  id v3 = (id)[v4 identifier];
  objc_msgSend(location[0], "setIdentifier:");

  id v5 = (id)[*(id *)(a1 + 40) headerButton];
  char v2 = [v5 isEnabled];
  [location[0] setEnabled:v2 & 1];

  id v7 = location[0];
  id v9 = (id)[*(id *)(a1 + 40) headerButton];
  id v8 = (id)[v9 image];
  objc_msgSend(v7, "setImage:forState:");

  objc_storeStrong(location, 0);
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  int v46 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v44 = 0;
  objc_storeStrong(&v44, a4);
  id v22 = v44;
  id v21 = [(CPSListTemplateViewController *)v46 dataSource];
  id v19 = [(CPSSectionedDataSource *)v21 assistantCellIndexPath];
  char v20 = objc_msgSend(v22, "isEqual:");

  if ((v20 & 1) == 0)
  {
    id v18 = [(CPSListTemplateViewController *)v46 dataSource];
    id v42 = [(CPSSectionedDataSource *)v18 itemAtIndexPath:v44];

    id v41 = CPListItemIdentifier(v42);
    id v40 = CarPlaySupportGeneralLogging();
    os_log_type_t v39 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v40, OS_LOG_TYPE_DEFAULT))
    {
      id v17 = v44;
      id v16 = [(CPSListTemplateViewController *)v46 listTemplate];
      __os_log_helper_16_2_3_8_66_8_66_8_64((uint64_t)v47, (uint64_t)v17, (uint64_t)v42, (uint64_t)v16);
      _os_log_impl(&dword_22B689000, (os_log_t)v40, v39, "Selected index path %{public}@, item %{public}@ in list template %@", v47, 0x20u);
    }
    objc_storeStrong(&v40, 0);
    if (([v42 isEnabled] & 1) == 0)
    {
      [location[0] deselectRowAtIndexPath:v44 animated:1];
      int v43 = 1;
LABEL_25:
      objc_storeStrong(&v41, 0);
      objc_storeStrong(&v42, 0);
      goto LABEL_26;
    }
    id v38 = [(CPSBaseTemplateViewController *)v46 templateDelegate];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v37 = CarPlaySupportGeneralLogging();
      os_log_type_t v36 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled((os_log_t)v37, OS_LOG_TYPE_DEFAULT))
      {
        id v14 = v37;
        os_log_type_t v15 = v36;
        __os_log_helper_16_0_0(v35);
        _os_log_impl(&dword_22B689000, v14, v15, "Activating Siri for message item.", v35, 2u);
      }
      objc_storeStrong(&v37, 0);
      uint64_t v13 = objc_opt_class();
      id v34 = CPSSafeCast_17(v13, v42);
      [location[0] deselectRowAtIndexPath:v44 animated:1];
      [(CPSListTemplateViewController *)v46 _activateSiriForMessageItem:v34];
      int v43 = 1;
      objc_storeStrong(&v34, 0);
      goto LABEL_24;
    }
    objc_initWeak(&from, v46);
    char v32 = 0;
    objc_opt_class();
    char isKindOfClass = 1;
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
    }
    char v32 = isKindOfClass & 1;
    if (isKindOfClass)
    {
      id v11 = [(CPSListTemplateViewController *)v46 currentSpinningIdentifier];

      if (v11)
      {
        int v43 = 1;
LABEL_23:
        objc_destroyWeak(&from);
LABEL_24:
        objc_storeStrong(&v38, 0);
        goto LABEL_25;
      }
      [(CPSListTemplateViewController *)v46 _cancelScheduledLoadingSpinner];
      [(CPSListTemplateViewController *)v46 _scheduleLoadingSpinnerForIdentifier:v41];
    }
    id v31 = (id)[location[0] indexPathForSelectedRow];
    id v10 = [(CPSListTemplateViewController *)v46 dataSource];
    id v9 = [(CPSSectionedDataSource *)v10 itemAtIndexPath:v31];
    id v8 = CPListItemIdentifier(v9);
    -[CPSListTemplateViewController setLastFocusedItem:](v46, "setLastFocusedItem:");

    if (v31 && ([v31 isEqual:v44] & 1) == 0) {
      [location[0] deselectRowAtIndexPath:v31 animated:1];
    }
    if ([v38 conformsToProtocol:&unk_26DF78730])
    {
      id v7 = v38;
      id v6 = [(CPSListTemplateViewController *)v46 listTemplate];
      id v4 = (id)[(CPListTemplate *)v6 identifier];
      id v5 = v41;
      uint64_t v24 = MEMORY[0x263EF8330];
      int v25 = -1073741824;
      int v26 = 0;
      id v27 = __67__CPSListTemplateViewController_tableView_didSelectRowAtIndexPath___block_invoke;
      id v28 = &unk_2648A4C68;
      objc_copyWeak(&v30, &from);
      id v29 = v41;
      [v7 listTemplateWithIdentifier:v4 didSelectListItemWithIdentifier:v5 completionHandler:&v24];

      objc_storeStrong(&v29, 0);
      objc_destroyWeak(&v30);
    }
    objc_storeStrong(&v31, 0);
    int v43 = 0;
    goto LABEL_23;
  }
  [location[0] deselectRowAtIndexPath:v44 animated:1];
  [(CPSListTemplateViewController *)v46 _activateSiriForAssistantItem];
  int v43 = 1;
LABEL_26:
  objc_storeStrong(&v44, 0);
  objc_storeStrong(location, 0);
}

void __67__CPSListTemplateViewController_tableView_didSelectRowAtIndexPath___block_invoke(id *a1)
{
  v9[2] = a1;
  v9[1] = a1;
  queue = MEMORY[0x263EF83A0];
  uint64_t v3 = MEMORY[0x263EF8330];
  int v4 = -1073741824;
  int v5 = 0;
  id v6 = __67__CPSListTemplateViewController_tableView_didSelectRowAtIndexPath___block_invoke_2;
  id v7 = &unk_2648A4C68;
  objc_copyWeak(v9, a1 + 5);
  id v8 = a1[4];
  dispatch_async(queue, &v3);

  objc_storeStrong(&v8, 0);
  objc_destroyWeak(v9);
}

void __67__CPSListTemplateViewController_tableView_didSelectRowAtIndexPath___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _cellSelectionCompleted:*(void *)(a1 + 32)];
}

- (void)didSelectMediaButton:(id)a3
{
  id v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v6 = (id)[location[0] identifier];
  int v4 = [(CPSBaseTemplateViewController *)v8 templateDelegate];
  char v5 = [(CPTemplateDelegate *)v4 conformsToProtocol:&unk_26DF72840];

  if (v5)
  {
    uint64_t v3 = [(CPSBaseTemplateViewController *)v8 templateDelegate];
    [(CPTemplateDelegate *)v3 handleActionForControlIdentifier:v6];
  }
  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
}

- (void)_activateSiriForMessageItem:(id)a3
{
  id v31 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v29 = 0;
  id v25 = (id)[location[0] text];
  char v27 = 0;
  BOOL v26 = 0;
  if (v25)
  {
    id v28 = (id)[location[0] phoneOrEmailAddress];
    char v27 = 1;
    BOOL v26 = v28 != 0;
  }
  if (v27) {

  }
  if (v26)
  {
    char v20 = (void *)MEMORY[0x263F6C760];
    uint64_t v24 = [(CPSBaseTemplateViewController *)v31 templateEnvironment];
    int v23 = [(CPSTemplateEnvironment *)v24 bundleIdentifier];
    id v22 = (id)[location[0] text];
    id v21 = (id)[location[0] phoneOrEmailAddress];
    id v3 = (id)objc_msgSend(v20, "messageComposeNewThreadDirectActionWithAppBundleId:fullName:phoneOrEmailAddress:", v23, v22);
    id v4 = v29;
    id v29 = v3;
  }
  else
  {
    id v18 = (id)[location[0] leadingConfiguration];
    char v19 = [v18 isUnread];

    if (v19)
    {
      id v14 = (void *)MEMORY[0x263F6C760];
      id v17 = [(CPSBaseTemplateViewController *)v31 templateEnvironment];
      id v16 = [(CPSTemplateEnvironment *)v17 bundleIdentifier];
      id v15 = (id)[location[0] conversationIdentifier];
      id v5 = (id)objc_msgSend(v14, "messageReadDirectActionWithAppBundleId:conversationGUID:", v16);
      id v6 = v29;
      id v29 = v5;
    }
    else
    {
      id v10 = (void *)MEMORY[0x263F6C760];
      uint64_t v13 = [(CPSBaseTemplateViewController *)v31 templateEnvironment];
      BOOL v12 = [(CPSTemplateEnvironment *)v13 bundleIdentifier];
      id v11 = (id)[location[0] conversationIdentifier];
      id v7 = (id)objc_msgSend(v10, "messageReplyDirectActionWithAppBundleId:conversationGUID:", v12);
      id v8 = v29;
      id v29 = v7;
    }
  }
  id v9 = [(CPSBaseTemplateViewController *)v31 viewControllerDelegate];
  [(CPSTemplateViewControllerDelegate *)v9 templateViewController:v31 shouldActivateSiriWithDirectActionContext:v29];

  objc_storeStrong(&v29, 0);
  objc_storeStrong(location, 0);
}

- (void)_activateSiriForAssistantItem
{
  int v23 = self;
  SEL v22 = a2;
  v21[8] = 0;
  *(void *)id v21 = [(CPSListTemplateViewController *)self assistantCellAvailable];
  id v16 = [(CPSListTemplateViewController *)v23 listTemplate];
  id v15 = [(CPListTemplate *)v16 assistantCellConfiguration];
  id v17 = [(CPAssistantCellConfiguration *)v15 assistantAction];

  v20[1] = v17;
  v20[0] = +[CPSListTemplateViewController intentIdentifierFromConfigurationEnum:v17];
  id v18 = [(CPSBaseTemplateViewController *)v23 templateEnvironment];
  char v19 = 0;
  if ([(CPSTemplateEnvironment *)v18 hasAudioEntitlement]) {
    char v19 = v21[0];
  }

  if (v19)
  {
    if ([v20[0] isEqualToString:@"INPlayMediaIntent"])
    {
      BOOL v12 = (void *)MEMORY[0x263F6C760];
      id v14 = [(CPSBaseTemplateViewController *)v23 templateEnvironment];
      uint64_t v13 = [(CPSTemplateEnvironment *)v14 bundleIdentifier];
      id v2 = (id)objc_msgSend(v12, "musicSearchDirectActionWithAppBundleId:");
      id v3 = *(void **)&v21[1];
      *(void *)&v21[1] = v2;
    }
  }
  else
  {
    id v10 = [(CPSBaseTemplateViewController *)v23 templateEnvironment];
    char v11 = 0;
    if ([(CPSTemplateEnvironment *)v10 hasCommunicationEntitlement]) {
      char v11 = v21[0];
    }

    if (v11)
    {
      if ([v20[0] isEqualToString:@"INStartCallIntent"])
      {
        id v7 = (void *)MEMORY[0x263F6C760];
        id v9 = [(CPSBaseTemplateViewController *)v23 templateEnvironment];
        id v8 = [(CPSTemplateEnvironment *)v9 bundleIdentifier];
        id v4 = (id)objc_msgSend(v7, "phoneCallDirectActionWithAppBundleId:");
        id v5 = *(void **)&v21[1];
        *(void *)&v21[1] = v4;
      }
    }
    else
    {
      objc_storeStrong((id *)&v21[1], 0);
    }
  }
  if (*(void *)&v21[1])
  {
    id v6 = [(CPSBaseTemplateViewController *)v23 viewControllerDelegate];
    [(CPSTemplateViewControllerDelegate *)v6 templateViewController:v23 shouldActivateSiriWithDirectActionContext:*(void *)&v21[1]];
  }
  objc_storeStrong(v20, 0);
  objc_storeStrong((id *)&v21[1], 0);
}

+ (id)intentIdentifierFromConfigurationEnum:(int64_t)a3
{
  id location[3] = a1;
  id location[2] = (id)a2;
  location[1] = (id)a3;
  location[0] = 0;
  if (a3)
  {
    if (a3 == 1) {
      objc_storeStrong(location, @"INStartCallIntent");
    }
  }
  else
  {
    objc_storeStrong(location, @"INPlayMediaIntent");
  }
  id v4 = location[0];
  objc_storeStrong(location, 0);

  return v4;
}

+ (BOOL)clientAssistantCellConfiguration:(id)a3 availableWithError:(id *)a4 templateEnvironment:(id)a5
{
  v35[1] = *MEMORY[0x263EF8340];
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  char v27 = a4;
  id v26 = 0;
  objc_storeStrong(&v26, a5);
  id v25 = 0;
  if ([v26 hasAudioEntitlement])
  {
    char v19 = (void *)MEMORY[0x263EFFA08];
    v35[0] = @"INPlayMediaIntent";
    id v20 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v35 count:1];
    id v5 = (id)objc_msgSend(v19, "setWithArray:");
    id v6 = v25;
    id v25 = v5;

LABEL_8:
    id v23 = +[CPSListTemplateViewController intentIdentifierFromConfigurationEnum:](CPSListTemplateViewController, "intentIdentifierFromConfigurationEnum:", [location[0] assistantAction]);
    if ([v25 containsObject:v23])
    {
      char v29 = [v26 applicationSupportsIntentWithIdentifier:v23 error:v27] & 1;
      int v24 = 1;
    }
    else
    {
      if (v27)
      {
        BOOL v12 = (void *)MEMORY[0x263F087E8];
        uint64_t v30 = *MEMORY[0x263F08320];
        id v14 = (id)[NSString stringWithFormat:@"Intent of type %@ is not supported for this app category", v23];
        id v31 = v14;
        id v13 = (id)[NSDictionary dictionaryWithObjects:&v31 forKeys:&v30 count:1];
        id v10 = (id)objc_msgSend(v12, "errorWithDomain:code:userInfo:", @"CPSErrorDomain", -1);
        id *v27 = v10;
      }
      char v29 = 0;
      int v24 = 1;
    }
    objc_storeStrong(&v23, 0);
    goto LABEL_14;
  }
  if ([v26 hasCommunicationEntitlement])
  {
    id v17 = (void *)MEMORY[0x263EFFA08];
    id v34 = @"INStartCallIntent";
    id v18 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:&v34 count:1];
    id v7 = (id)objc_msgSend(v17, "setWithArray:");
    id v8 = v25;
    id v25 = v7;

    goto LABEL_8;
  }
  if (v27)
  {
    id v15 = (void *)MEMORY[0x263F087E8];
    uint64_t v32 = *MEMORY[0x263F08320];
    id v33 = @"Attempting to set an Assistant Cell on an unsupported app category. Assistant Cells are only supported on apps with an audio or communication entitlement.";
    id v16 = (id)[NSDictionary dictionaryWithObjects:&v33 forKeys:&v32 count:1];
    id v9 = (id)objc_msgSend(v15, "errorWithDomain:code:userInfo:", @"CPSErrorDomain", -1);
    id *v27 = v9;
  }
  char v29 = 0;
  int v24 = 1;
LABEL_14:
  objc_storeStrong(&v25, 0);
  objc_storeStrong(&v26, 0);
  objc_storeStrong(location, 0);
  return v29 & 1;
}

- (void)nowPlayingManager:(id)a3 didUpdateSnapshot:(id)a4
{
  id v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v5 = 0;
  objc_storeStrong(&v5, a4);
  [(CPSListTemplateViewController *)v7 _updatePlayingIndicators];
  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
}

- (int64_t)_playingIndicatorStateForSnapshot:(id)a3
{
  id v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v5 = (id)[location[0] bundleIdentifier];
  id v4 = [(CPSBaseTemplateViewController *)v9 templateEnvironment];
  id v6 = [(CPSTemplateEnvironment *)v4 bundleIdentifier];
  BOOL v7 = 0;
  if (objc_msgSend(v5, "isEqualToString:")) {
    BOOL v7 = [location[0] state] == 2;
  }

  if (v7) {
    int64_t v10 = 1;
  }
  else {
    int64_t v10 = 2;
  }
  objc_storeStrong(location, 0);
  return v10;
}

- (void)_updatePlayingIndicators
{
  BOOL v12 = self;
  v11[1] = (id)a2;
  id v2 = [(CPSListTemplateViewController *)self nowPlayingManager];
  v11[0] = (id)[(CPUINowPlayingManager *)v2 snapshot];

  int64_t v10 = [(CPSListTemplateViewController *)v12 _playingIndicatorStateForSnapshot:v11[0]];
  queue = MEMORY[0x263EF83A0];
  uint64_t v4 = MEMORY[0x263EF8330];
  int v5 = -1073741824;
  int v6 = 0;
  BOOL v7 = __57__CPSListTemplateViewController__updatePlayingIndicators__block_invoke;
  id v8 = &unk_2648A4388;
  v9[0] = v12;
  v9[1] = v10;
  dispatch_async(queue, &v4);

  objc_storeStrong(v9, 0);
  objc_storeStrong(v11, 0);
}

void __57__CPSListTemplateViewController__updatePlayingIndicators__block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  uint64_t v21 = a1;
  uint64_t v20 = a1;
  memset(__b, 0, sizeof(__b));
  id v13 = (id)[*(id *)(a1 + 32) tableView];
  id obj = (id)[v13 visibleCells];

  uint64_t v15 = [obj countByEnumeratingWithState:__b objects:v22 count:16];
  if (v15)
  {
    uint64_t v9 = *(void *)__b[2];
    uint64_t v10 = 0;
    unint64_t v11 = v15;
    while (1)
    {
      uint64_t v8 = v10;
      if (*(void *)__b[2] != v9) {
        objc_enumerationMutation(obj);
      }
      char v19 = *(void **)(__b[1] + 8 * v10);
      char v1 = objc_opt_class();
      id v17 = CPSSafeCast_17(v1, v19);
      if (v17)
      {
        id v3 = objc_opt_class();
        id v7 = (id)[*(id *)(a1 + 32) dataSource];
        id v6 = (id)[*(id *)(a1 + 32) tableView];
        id v5 = (id)[v6 indexPathForCell:v17];
        id v4 = (id)objc_msgSend(v7, "itemAtIndexPath:");
        id location = CPSSafeCast_17(v3, v4);

        if ([location isPlaying])
        {
          id v2 = (id)[v17 nowPlayingIndicator];
          [v2 setPlaybackState:*(void *)(a1 + 40)];
        }
        objc_storeStrong(&location, 0);
      }
      objc_storeStrong(&v17, 0);
      ++v10;
      if (v8 + 1 >= v11)
      {
        uint64_t v10 = 0;
        unint64_t v11 = [obj countByEnumeratingWithState:__b objects:v22 count:16];
        if (!v11) {
          break;
        }
      }
    }
  }
}

- (id)preferredFocusEnvironments
{
  v16[1] = *MEMORY[0x263EF8340];
  id v14 = self;
  v13[1] = (id)a2;
  v13[0] = 0;
  uint64_t v9 = [(CPSListTemplateViewController *)self lastFocusedItem];

  if (v9)
  {
    id v7 = [(CPSListTemplateViewController *)v14 dataSource];
    id v6 = [(CPSListTemplateViewController *)v14 lastFocusedItem];
    id v12 = -[CPSSectionedDataSource indexPathForItemWithIdentifier:](v7, "indexPathForItemWithIdentifier:");

    uint64_t v8 = [(CPSListTemplateViewController *)v14 tableView];
    id v2 = (id)[(CPSTableView *)v8 cellForRowAtIndexPath:v12];
    id v3 = v13[0];
    v13[0] = v2;

    objc_storeStrong(&v12, 0);
  }
  if (v13[0])
  {
    v16[0] = v13[0];
    id v15 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:1];
  }
  else
  {
    v10.receiver = v14;
    v10.super_class = (Class)CPSListTemplateViewController;
    id v15 = [(CPSListTemplateViewController *)&v10 preferredFocusEnvironments];
  }
  int v11 = 1;
  objc_storeStrong(v13, 0);
  id v4 = v15;

  return v4;
}

- (CPSSectionedDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
}

- (NSUUID)currentSpinningIdentifier
{
  return self->_currentSpinningIdentifier;
}

- (void)setCurrentSpinningIdentifier:(id)a3
{
}

- (NSUUID)nextSpinningIdentifier
{
  return self->_nextSpinningIdentifier;
}

- (void)setNextSpinningIdentifier:(id)a3
{
}

- (unint64_t)spinnerState
{
  return self->_spinnerState;
}

- (void)setSpinnerState:(unint64_t)a3
{
  self->_spinnerState = a3;
}

- (NSTimer)spinnerStartTimer
{
  return self->_spinnerStartTimer;
}

- (void)setSpinnerStartTimer:(id)a3
{
}

- (NSTimer)spinnerTimeoutTimer
{
  return self->_spinnerTimeoutTimer;
}

- (void)setSpinnerTimeoutTimer:(id)a3
{
}

- (CPSTableView)tableView
{
  return self->_tableView;
}

- (void)setTableView:(id)a3
{
}

- (CPUINowPlayingManager)nowPlayingManager
{
  return self->_nowPlayingManager;
}

- (void)setNowPlayingManager:(id)a3
{
}

- (CPSEmptyView)emptyView
{
  return self->_emptyView;
}

- (void)setEmptyView:(id)a3
{
}

- (NSUUID)lastFocusedItem
{
  return self->_lastFocusedItem;
}

- (void)setLastFocusedItem:(id)a3
{
}

- (BOOL)assistantCellAvailable
{
  return self->_assistantCellAvailable;
}

- (void)setAssistantCellAvailable:(BOOL)a3
{
  self->_assistantCellAvailable = a3;
}

- (void).cxx_destruct
{
}

@end