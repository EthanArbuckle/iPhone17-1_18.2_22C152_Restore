@interface HUItemTableViewController
+ (BOOL)adoptsDefaultGridLayoutMargins;
+ (unint64_t)updateMode;
- (BOOL)_shouldHideFooterForSection:(int64_t)a3;
- (BOOL)_shouldHideHeaderForSection:(int64_t)a3;
- (BOOL)alwaysUseDeltaTableViewUpdatesAfterViewHasAppeared;
- (BOOL)automaticallyUpdatesViewControllerTitle;
- (BOOL)bypassInitialItemUpdateReload;
- (BOOL)hasFinishedInitialLoad;
- (BOOL)hasForcedLoadingVisibleCells;
- (BOOL)shouldHideFooterBelowSection:(int64_t)a3;
- (BOOL)shouldHideHeaderAboveSection:(int64_t)a3;
- (BOOL)shouldHideSeparatorsForCell:(id)a3 indexPath:(id)a4;
- (BOOL)shouldManageTextFieldForItem:(id)a3;
- (BOOL)shouldPerformUpdateWithAnimationForDiffableDataItemManager:(id)a3;
- (BOOL)shouldUseAlternateCellColor;
- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4;
- (BOOL)textFieldShouldClear:(id)a3;
- (BOOL)textFieldShouldReturn:(id)a3;
- (BOOL)viewHasAppeared;
- (BOOL)visibilityUpdatesEnabled;
- (BOOL)wantsPreferredContentSize;
- (Class)cellClassForItem:(id)a3 indexPath:(id)a4;
- (Class)mappableCellClassForItem:(id)a3 indexPath:(id)a4;
- (HFItem)hu_presentedItem;
- (HFItemManager)itemManager;
- (HUGridLayoutOptions)gridLayoutOptions;
- (HUItemTableViewController)initWithItemManager:(id)a3 tableViewStyle:(int64_t)a4;
- (HUItemTableViewController)initWithStyle:(int64_t)a3;
- (HUItemTableViewScrollDestination)pendingScrollDestination;
- (NACancelable)deferredVisibilityUpdate;
- (NSMapTable)textFieldToCellMap;
- (NSMutableArray)foregroundUpdateFutures;
- (NSMutableSet)internalItemModuleControllers;
- (NSMutableSet)recentlyRemovedItemModuleControllers;
- (NSMutableSet)registeredCellClasses;
- (NSString)description;
- (UIVisualEffectView)backgroundVisualEffectView;
- (double)tableView:(id)a3 estimatedHeightForFooterInSection:(int64_t)a4;
- (double)tableView:(id)a3 estimatedHeightForHeaderInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (id)_itemForTextField:(id)a3;
- (id)_visibleCellForItem:(id)a3;
- (id)buildItemModuleControllerForModule:(id)a3;
- (id)childViewControllersToPreload;
- (id)contentConfigurationForFooterViewAtSectionIndex:(unint64_t)a3;
- (id)contentConfigurationForHeaderViewAtSectionIndex:(unint64_t)a3;
- (id)currentTextForTextField:(id)a3 item:(id)a4;
- (id)defaultTextForTextField:(id)a3 item:(id)a4;
- (id)hu_preloadContent;
- (id)itemManager:(id)a3 futureToUpdateItems:(id)a4 itemUpdateOptions:(id)a5;
- (id)itemModuleControllers;
- (id)itemTableFooterMessage;
- (id)itemTableFooterView;
- (id)itemTableHeaderMessage;
- (id)itemTableHeaderView;
- (id)leadingSwipeActionsForItem:(id)a3;
- (id)moduleController:(id)a3 dismissViewControllerForRequest:(id)a4;
- (id)moduleController:(id)a3 presentViewControllerForRequest:(id)a4;
- (id)moduleController:(id)a3 textFieldForVisibleItem:(id)a4;
- (id)moduleControllerForItem:(id)a3;
- (id)placeholderTextForTextField:(id)a3 item:(id)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 leadingSwipeActionsConfigurationForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (id)tableView:(id)a3 trailingSwipeActionsConfigurationForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (id)textFieldForVisibleItem:(id)a3;
- (id)trailingSwipeActionsForItem:(id)a3;
- (int64_t)_rowAnimationForOperationType:(unint64_t)a3 item:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (unint64_t)appearState;
- (unint64_t)automaticDisablingReasonsForItem:(id)a3;
- (void)_dispatchUpdateForCell:(id)a3 item:(id)a4 indexPath:(id)a5 animated:(BOOL)a6;
- (void)_performCommonUpdateForCell:(id)a3 item:(id)a4 indexPath:(id)a5 animated:(BOOL)a6;
- (void)_scrollToDestination:(id)a3;
- (void)_transformViewControllerForRequest:(id)a3;
- (void)_updateHeadersAndFootersIfNeededAfterPerformingRequest:(id)a3;
- (void)_updateLayoutMarginsForCells:(id)a3;
- (void)_updateMaterials;
- (void)_updatePreferredContentSizeIfNecessary;
- (void)_updateTableHeaderAndFooter;
- (void)_updateTitle;
- (void)cleanupRecentlyRemovedModuleControllers;
- (void)diffableDataItemManager:(id)a3 didUpdateItems:(id)a4 addItems:(id)a5 removeItems:(id)a6;
- (void)executionEnvironmentRunningStateDidChange:(id)a3;
- (void)expandableTextViewCellStateDidChange:(id)a3;
- (void)highlightItemAnimated:(id)a3;
- (void)highlightItemAnimated:(id)a3 duration:(double)a4;
- (void)itemManager:(id)a3 didChangeSourceItem:(id)a4;
- (void)itemManager:(id)a3 didInsertItem:(id)a4 atIndexPath:(id)a5;
- (void)itemManager:(id)a3 didInsertSections:(id)a4;
- (void)itemManager:(id)a3 didMoveItem:(id)a4 fromIndexPath:(id)a5 toIndexPath:(id)a6;
- (void)itemManager:(id)a3 didMoveSection:(int64_t)a4 toSection:(int64_t)a5;
- (void)itemManager:(id)a3 didRemoveItem:(id)a4 atIndexPath:(id)a5;
- (void)itemManager:(id)a3 didRemoveSections:(id)a4;
- (void)itemManager:(id)a3 didUpdateItemModules:(id)a4;
- (void)itemManager:(id)a3 didUpdateResultsForItem:(id)a4 atIndexPath:(id)a5;
- (void)itemManager:(id)a3 didUpdateResultsForSourceItem:(id)a4;
- (void)itemManager:(id)a3 performUpdateRequest:(id)a4;
- (void)itemManagerDidUpdate:(id)a3;
- (void)recursivelyDisableItemUpdates:(BOOL)a3 withReason:(id)a4;
- (void)reloadCellForItems:(id)a3 withDiffableDataSourceReload:(BOOL)a4;
- (void)scrollToItem:(id)a3 animated:(BOOL)a4;
- (void)setAppearState:(unint64_t)a3;
- (void)setAutomaticallyUpdatesViewControllerTitle:(BOOL)a3;
- (void)setBackgroundVisualEffectView:(id)a3;
- (void)setDeferredVisibilityUpdate:(id)a3;
- (void)setForegroundUpdateFutures:(id)a3;
- (void)setGridLayoutOptions:(id)a3;
- (void)setHasFinishedInitialLoad:(BOOL)a3;
- (void)setHasForcedLoadingVisibleCells:(BOOL)a3;
- (void)setItemManager:(id)a3;
- (void)setPendingScrollDestination:(id)a3;
- (void)setShouldUseAlternateCellColor:(BOOL)a3;
- (void)setUpDiffableDataItemManagerIfNeeded;
- (void)setViewHasAppeared:(BOOL)a3;
- (void)setVisibilityUpdatesEnabled:(BOOL)a3;
- (void)setWantsPreferredContentSize:(BOOL)a3;
- (void)tableView:(id)a3 accessoryButtonTappedForRowWithIndexPath:(id)a4;
- (void)tableView:(id)a3 didEndDisplayingCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)textFieldDidBeginEditing:(id)a3;
- (void)textFieldDidChange:(id)a3;
- (void)textFieldDidEndEditing:(id)a3;
- (void)updateCellForItems:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation HUItemTableViewController

- (HUItemTableViewController)initWithItemManager:(id)a3 tableViewStyle:(int64_t)a4
{
  id v7 = a3;
  v22.receiver = self;
  v22.super_class = (Class)HUItemTableViewController;
  v8 = [(HUTableViewController *)&v22 initWithStyle:a4];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_itemManager, a3);
    [(HFItemManager *)v9->_itemManager setDelegate:v9];
    if (![(id)objc_opt_class() updateMode]) {
      [v7 disableExternalUpdatesWithReason:@"HUItemTableViewController_NotVisible"];
    }
    uint64_t v10 = [MEMORY[0x1E4F1CA80] set];
    internalItemModuleControllers = v9->_internalItemModuleControllers;
    v9->_internalItemModuleControllers = (NSMutableSet *)v10;

    uint64_t v12 = [MEMORY[0x1E4F1CA80] set];
    recentlyRemovedItemModuleControllers = v9->_recentlyRemovedItemModuleControllers;
    v9->_recentlyRemovedItemModuleControllers = (NSMutableSet *)v12;

    uint64_t v14 = [MEMORY[0x1E4F1CA80] set];
    registeredCellClasses = v9->_registeredCellClasses;
    v9->_registeredCellClasses = (NSMutableSet *)v14;

    uint64_t v16 = [MEMORY[0x1E4F28E10] weakToWeakObjectsMapTable];
    textFieldToCellMap = v9->_textFieldToCellMap;
    v9->_textFieldToCellMap = (NSMapTable *)v16;

    uint64_t v18 = [MEMORY[0x1E4F1CA48] array];
    foregroundUpdateFutures = v9->_foregroundUpdateFutures;
    v9->_foregroundUpdateFutures = (NSMutableArray *)v18;

    v9->_automaticallyUpdatesViewControllerTitle = 1;
    v20 = [MEMORY[0x1E4F69138] sharedInstance];
    [v20 addObserver:v9];

    [(HUItemTableViewController *)v9 _updateTitle];
  }

  return v9;
}

- (HUItemTableViewController)initWithStyle:(int64_t)a3
{
  v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  v6 = NSStringFromSelector(sel_initWithItemManager_tableViewStyle_);
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUItemTableViewController.m", 130, @"%s is unavailable; use %@ instead",
    "-[HUItemTableViewController initWithStyle:]",
    v6);

  return 0;
}

- (void)setUpDiffableDataItemManagerIfNeeded
{
  id v14 = [(HUItemTableViewController *)self itemManager];
  if ([v14 diffableDataSourceDisabled])
  {
  }
  else
  {
    v3 = [(HUItemTableViewController *)self itemManager];
    v4 = [v3 diffableDataSource];

    if (!v4)
    {
      v5 = [(HUItemTableViewController *)self itemManager];
      v6 = objc_opt_class();

      id v7 = objc_opt_class();
      v8 = [(HUItemTableViewController *)self itemManager];
      objc_initWeak(&location, v8);

      objc_initWeak(&from, self);
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __65__HUItemTableViewController_setUpDiffableDataItemManagerIfNeeded__block_invoke;
      aBlock[3] = &unk_1E6391930;
      objc_copyWeak(&v16, &from);
      objc_copyWeak(v17, &location);
      v17[1] = v6;
      v17[2] = v7;
      v9 = _Block_copy(aBlock);
      uint64_t v10 = [HUTableViewDiffableDataSource alloc];
      v11 = [(HUItemTableViewController *)self tableView];
      uint64_t v12 = [(HUTableViewDiffableDataSource *)v10 initWithTableView:v11 cellProvider:v9 delegate:self];

      [(UITableViewDiffableDataSource *)v12 setDefaultRowAnimation:0];
      v13 = [(HUItemTableViewController *)self itemManager];
      [v13 setDiffableDataSource:v12];

      objc_destroyWeak(v17);
      objc_destroyWeak(&v16);
      objc_destroyWeak(&from);
      objc_destroyWeak(&location);
    }
  }
}

id __65__HUItemTableViewController_setUpDiffableDataItemManagerIfNeeded__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (!WeakRetained)
  {
    v11 = HFLogForCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    {
      id v15 = objc_loadWeakRetained((id *)(a1 + 40));
      uint64_t v16 = *(void *)(a1 + 48);
      uint64_t v17 = *(void *)(a1 + 56);
      int v20 = 138413826;
      id v21 = v9;
      __int16 v22 = 2112;
      id v23 = v8;
      __int16 v24 = 2112;
      id v25 = v15;
      __int16 v26 = 2112;
      uint64_t v27 = v16;
      __int16 v28 = 2112;
      id v29 = v7;
      __int16 v30 = 2112;
      id v31 = 0;
      __int16 v32 = 2112;
      uint64_t v33 = v17;
      _os_log_fault_impl(&dword_1BE345000, v11, OS_LOG_TYPE_FAULT, "Attempting to get cell for item: %@ at index %@ in itemManager: %@ type: %@ for tableView: %@ when the tableViewController: %@ has dealloc already type: %@", (uint8_t *)&v20, 0x48u);
    }
  }
  id v12 = [WeakRetained tableView:v7 cellForRowAtIndexPath:v8];
  if (!v12)
  {
    v13 = HFLogForCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    {
      id v18 = objc_loadWeakRetained((id *)(a1 + 40));
      uint64_t v19 = *(void *)(a1 + 48);
      int v20 = 138413570;
      id v21 = v9;
      __int16 v22 = 2112;
      id v23 = v8;
      __int16 v24 = 2112;
      id v25 = v18;
      __int16 v26 = 2112;
      uint64_t v27 = v19;
      __int16 v28 = 2112;
      id v29 = v7;
      __int16 v30 = 2112;
      id v31 = WeakRetained;
      _os_log_fault_impl(&dword_1BE345000, v13, OS_LOG_TYPE_FAULT, "Failed to get cell for item: %@ at index %@ in itemManager: %@ type: %@ for tableView: %@ tableViewController: %@", (uint8_t *)&v20, 0x3Eu);
    }
    id v12 = objc_alloc_init(MEMORY[0x1E4F42EA0]);
  }

  return v12;
}

- (void)viewDidLoad
{
  v21.receiver = self;
  v21.super_class = (Class)HUItemTableViewController;
  [(HUTableViewController *)&v21 viewDidLoad];
  [(HUItemTableViewController *)self setUpDiffableDataItemManagerIfNeeded];
  v4 = [(HUItemTableViewController *)self tableView];
  uint64_t v5 = objc_opt_class();
  v6 = (objc_class *)objc_opt_class();
  id v7 = NSStringFromClass(v6);
  [v4 registerClass:v5 forHeaderFooterViewReuseIdentifier:v7];

  id v8 = [(HUItemTableViewController *)self tableView];
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = (objc_class *)objc_opt_class();
  v11 = NSStringFromClass(v10);
  [v8 registerClass:v9 forHeaderFooterViewReuseIdentifier:v11];

  id v12 = [(HUItemTableViewController *)self tableView];
  [v12 setSeparatorStyle:0];

  double v13 = *MEMORY[0x1E4F43D20];
  id v14 = [(HUItemTableViewController *)self tableView];
  [v14 setEstimatedRowHeight:v13];

  double v15 = *MEMORY[0x1E4F43D18];
  uint64_t v16 = [(HUItemTableViewController *)self tableView];
  [v16 setRowHeight:v15];

  uint64_t v17 = objc_msgSend(MEMORY[0x1E4F428B8], "hf_keyColor");
  id v18 = [(HUItemTableViewController *)self tableView];
  [v18 setTintColor:v17];

  if ([(id)objc_opt_class() updateMode] == 1)
  {
    uint64_t v19 = [(HUItemTableViewController *)self itemManager];
    id v20 = (id)[v19 reloadAndUpdateAllItemsFromSenderSelector:a2];
  }
  [(HUItemTableViewController *)self _updateTableHeaderAndFooter];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  [(HUItemTableViewController *)self setAppearState:1];
  uint64_t v5 = [(HUItemTableViewController *)self gridLayoutOptions];
  [v5 viewSize];
  double v7 = v6;
  double v9 = v8;
  uint64_t v10 = [(HUItemTableViewController *)self view];
  [v10 frame];
  double v12 = v11;
  double v14 = v13;

  if (v7 != v12 || v9 != v14)
  {
    uint64_t v16 = [(HUItemTableViewController *)self view];
    [v16 frame];
    uint64_t v19 = +[HUGridLayoutOptions defaultOptionsForViewSize:](HUGridLayoutOptions, "defaultOptionsForViewSize:", v17, v18);
    [(HUItemTableViewController *)self setGridLayoutOptions:v19];
  }
  if (![(id)objc_opt_class() updateMode])
  {
    id v20 = [(HUTableViewController *)self childViewControllersAtViewWillDisappearTime];
    objc_super v21 = (void *)[v20 copy];

    __int16 v22 = [MEMORY[0x1E4F7A0F0] schedulerWithDispatchQueue:MEMORY[0x1E4F14428]];
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __44__HUItemTableViewController_viewWillAppear___block_invoke;
    v28[3] = &unk_1E638E298;
    v28[4] = self;
    id v29 = v21;
    id v23 = v21;
    __int16 v24 = [v22 performCancelableBlock:v28];
    [(HUItemTableViewController *)self setDeferredVisibilityUpdate:v24];
  }
  v27.receiver = self;
  v27.super_class = (Class)HUItemTableViewController;
  [(HUTableViewController *)&v27 viewWillAppear:v3];
  id v25 = [(HUItemTableViewController *)self pendingScrollDestination];

  if (v25)
  {
    __int16 v26 = [(HUItemTableViewController *)self pendingScrollDestination];
    [(HUItemTableViewController *)self _scrollToDestination:v26];

    [(HUItemTableViewController *)self setPendingScrollDestination:0];
  }
  [(HUItemTableViewController *)self _updateMaterials];
}

void __44__HUItemTableViewController_viewWillAppear___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (([*(id *)(a1 + 32) visibilityUpdatesEnabled] & 1) == 0)
  {
    v2 = [*(id *)(a1 + 32) itemManager];
    [v2 endDisableExternalUpdatesWithReason:@"HUItemTableViewController_NotVisible"];

    [*(id *)(a1 + 32) setVisibilityUpdatesEnabled:1];
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        double v8 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if (objc_msgSend(v8, "conformsToProtocol:", &unk_1F19C08E8, (void)v10))
        {
          double v9 = [v8 itemManager];
          [v9 endDisableExternalUpdatesWithReason:@"HUItemTableViewController_ParentNotVisible"];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  [(HUItemTableViewController *)self setAppearState:2];
  [(HUItemTableViewController *)self setViewHasAppeared:1];
  v6.receiver = self;
  v6.super_class = (Class)HUItemTableViewController;
  [(HUTableViewController *)&v6 viewDidAppear:v3];
  uint64_t v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 addObserver:self selector:sel_textFieldDidChange_ name:*MEMORY[0x1E4F43E28] object:0];
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  [(HUItemTableViewController *)self setAppearState:3];
  if (![(id)objc_opt_class() updateMode])
  {
    if ([(HUItemTableViewController *)self visibilityUpdatesEnabled])
    {
      uint64_t v5 = [(HUItemTableViewController *)self itemManager];
      [v5 disableExternalUpdatesWithReason:@"HUItemTableViewController_NotVisible"];

      [(HUItemTableViewController *)self setVisibilityUpdatesEnabled:0];
    }
    objc_super v6 = [(HUItemTableViewController *)self deferredVisibilityUpdate];
    [v6 cancel];

    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    double v7 = [(HUItemTableViewController *)self childViewControllers];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v18 != v10) {
            objc_enumerationMutation(v7);
          }
          long long v12 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          if ([v12 conformsToProtocol:&unk_1F19C08E8])
          {
            long long v13 = [v12 itemManager];
            [v13 disableExternalUpdatesWithReason:@"HUItemTableViewController_ParentNotVisible"];
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v9);
    }
  }
  double v14 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v14 removeObserver:self name:*MEMORY[0x1E4F43E28] object:0];

  uint64_t v15 = [(HUItemTableViewController *)self view];
  [v15 endEditing:1];

  v16.receiver = self;
  v16.super_class = (Class)HUItemTableViewController;
  [(HUTableViewController *)&v16 viewWillDisappear:v3];
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  [(HUItemTableViewController *)self setAppearState:0];
  v5.receiver = self;
  v5.super_class = (Class)HUItemTableViewController;
  [(HUTableViewController *)&v5 viewDidDisappear:v3];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)HUItemTableViewController;
  id v7 = a4;
  -[HUItemTableViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __80__HUItemTableViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v8[3] = &unk_1E6385548;
  v8[4] = self;
  [v7 animateAlongsideTransition:v8 completion:0];
}

void __80__HUItemTableViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) view];
  [v5 frame];
  uint64_t v4 = +[HUGridLayoutOptions defaultOptionsForViewSize:](HUGridLayoutOptions, "defaultOptionsForViewSize:", v2, v3);
  [*(id *)(a1 + 32) setGridLayoutOptions:v4];
}

- (void)viewWillLayoutSubviews
{
  v9.receiver = self;
  v9.super_class = (Class)HUItemTableViewController;
  [(HUTableViewController *)&v9 viewWillLayoutSubviews];
  double v3 = [(HUItemTableViewController *)self tableView];
  uint64_t v4 = [v3 tableHeaderView];
  id v5 = [(HUItemTableViewController *)self tableView];
  [v5 bounds];
  objc_msgSend(v4, "hu_autoSizeByConstrainingWidth:", CGRectGetWidth(v10));

  objc_super v6 = [(HUItemTableViewController *)self tableView];
  id v7 = [v6 tableFooterView];
  uint64_t v8 = [(HUItemTableViewController *)self tableView];
  [v8 bounds];
  objc_msgSend(v7, "hu_autoSizeByConstrainingWidth:", CGRectGetWidth(v11));
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)HUItemTableViewController;
  [(HUTableViewController *)&v3 viewDidLayoutSubviews];
  [(HUItemTableViewController *)self _updatePreferredContentSizeIfNecessary];
}

- (void)setGridLayoutOptions:(id)a3
{
  id v9 = a3;
  if (([v9 isEqual:self->_gridLayoutOptions] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_gridLayoutOptions, a3);
    id v5 = [(HUItemTableViewController *)self tableView];
    objc_super v6 = [v5 window];

    if (v6)
    {
      id v7 = [(HUItemTableViewController *)self tableView];
      uint64_t v8 = [v7 visibleCells];
      [(HUItemTableViewController *)self _updateLayoutMarginsForCells:v8];
    }
  }
}

- (void)setWantsPreferredContentSize:(BOOL)a3
{
  if (self->_wantsPreferredContentSize != a3)
  {
    self->_wantsPreferredContentSize = a3;
    [(HUItemTableViewController *)self _updatePreferredContentSizeIfNecessary];
  }
}

- (BOOL)bypassInitialItemUpdateReload
{
  return 0;
}

- (BOOL)alwaysUseDeltaTableViewUpdatesAfterViewHasAppeared
{
  return 0;
}

- (id)itemModuleControllers
{
  return self->_internalItemModuleControllers;
}

- (id)buildItemModuleControllerForModule:(id)a3
{
  return 0;
}

- (Class)cellClassForItem:(id)a3 indexPath:(id)a4
{
  objc_super v6 = [(HUItemTableViewController *)self itemModuleControllers];
  uint64_t v7 = [v6 count];

  if (!v7)
  {
    uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"HUItemTableViewController.m", 362, @"%s is an abstract method that must be overriden by subclass %@", "-[HUItemTableViewController cellClassForItem:indexPath:]", objc_opt_class() object file lineNumber description];
  }
  return 0;
}

- (Class)mappableCellClassForItem:(id)a3 indexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 conformsToProtocol:&unk_1F1A0DE88]) {
    uint64_t v8 = v6;
  }
  else {
    uint64_t v8 = 0;
  }
  id v9 = v8;
  CGRect v10 = v9;
  if (v9) {
    [v9 mapsToViewClass];
  }
  else {
  CGRect v11 = [(HUItemTableViewController *)self cellClassForItem:v6 indexPath:v7];
  }

  return (Class)v11;
}

- (BOOL)shouldManageTextFieldForItem:(id)a3
{
  id v4 = a3;
  id v5 = [(HUItemTableViewController *)self moduleControllerForItem:v4];
  id v6 = v5;
  if (v5) {
    char v7 = [v5 shouldManageTextFieldForItem:v4];
  }
  else {
    char v7 = 0;
  }

  return v7;
}

- (id)currentTextForTextField:(id)a3 item:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(HUItemTableViewController *)self moduleControllerForItem:v7];
  id v9 = v8;
  if (v8)
  {
    CGRect v10 = [v8 currentTextForTextField:v6 item:v7];
  }
  else
  {
    CGRect v10 = 0;
  }

  return v10;
}

- (id)defaultTextForTextField:(id)a3 item:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(HUItemTableViewController *)self moduleControllerForItem:v7];
  id v9 = v8;
  if (v8)
  {
    CGRect v10 = [v8 defaultTextForTextField:v6 item:v7];
  }
  else
  {
    CGRect v10 = 0;
  }

  return v10;
}

- (id)placeholderTextForTextField:(id)a3 item:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(HUItemTableViewController *)self moduleControllerForItem:v6];
  id v9 = v8;
  if (v8) {
    [v8 placeholderTextForTextField:v7 item:v6];
  }
  else {
  CGRect v10 = [(HUItemTableViewController *)self defaultTextForTextField:v7 item:v6];
  }

  return v10;
}

- (BOOL)shouldHideSeparatorsForCell:(id)a3 indexPath:(id)a4
{
  id v4 = a3;
  if ([v4 conformsToProtocol:&unk_1F1A10288]) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;
  id v7 = v6;
  if (v6)
  {
    char isKindOfClass = [v6 prefersSeparatorsHidden];
LABEL_9:
    char v9 = isKindOfClass;
    goto LABEL_10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    goto LABEL_9;
  }
  char v9 = 1;
LABEL_10:

  return v9 & 1;
}

- (void)setAutomaticallyUpdatesViewControllerTitle:(BOOL)a3
{
  if (self->_automaticallyUpdatesViewControllerTitle != a3)
  {
    self->_automaticallyUpdatesViewControllerTitle = a3;
    if (a3) {
      [(HUItemTableViewController *)self _updateTitle];
    }
  }
}

- (BOOL)shouldHideHeaderAboveSection:(int64_t)a3
{
  return 0;
}

- (BOOL)shouldHideFooterBelowSection:(int64_t)a3
{
  return 0;
}

+ (BOOL)adoptsDefaultGridLayoutMargins
{
  return 0;
}

- (unint64_t)automaticDisablingReasonsForItem:(id)a3
{
  return -1;
}

- (id)itemTableHeaderMessage
{
  return 0;
}

- (id)itemTableFooterMessage
{
  return 0;
}

- (id)itemTableHeaderView
{
  objc_super v3 = [(HUItemTableViewController *)self itemTableHeaderMessage];
  if (v3)
  {
    objc_opt_class();
    id v4 = [(HUItemTableViewController *)self tableView];
    id v5 = [v4 tableHeaderView];
    if (objc_opt_isKindOfClass()) {
      id v6 = v5;
    }
    else {
      id v6 = 0;
    }
    id v7 = v6;

    if (!v7) {
      id v5 = [[HUItemTableHeaderFooterView alloc] initWithReuseIdentifier:0];
    }
    [(HUItemTableHeaderFooterView *)v5 setAttributedMessage:v3];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)itemTableFooterView
{
  objc_super v3 = [(HUItemTableViewController *)self itemTableFooterMessage];
  if (v3)
  {
    objc_opt_class();
    id v4 = [(HUItemTableViewController *)self tableView];
    id v5 = [v4 tableFooterView];
    if (objc_opt_isKindOfClass()) {
      id v6 = v5;
    }
    else {
      id v6 = 0;
    }
    id v7 = v6;

    if (!v7) {
      id v5 = [[HUItemTableHeaderFooterView alloc] initWithReuseIdentifier:0];
    }
    [(HUItemTableHeaderFooterView *)v5 setAttributedMessage:v3];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)childViewControllersToPreload
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (id)leadingSwipeActionsForItem:(id)a3
{
  return 0;
}

- (id)trailingSwipeActionsForItem:(id)a3
{
  return 0;
}

- (id)contentConfigurationForHeaderViewAtSectionIndex:(unint64_t)a3
{
  id v5 = [(HUItemTableViewController *)self itemManager];
  id v6 = [v5 titleForSection:a3];

  id v7 = [(HUItemTableViewController *)self itemManager];
  uint64_t v8 = [v7 itemSectionForSectionIndex:a3];

  if (!v6
    || ([v8 headerAccessoryButtonTitle], (uint64_t v9 = objc_claimAutoreleasedReturnValue()) != 0)
    && (CGRect v10 = (void *)v9,
        [v8 headerAccessoryButtonDelegate],
        CGRect v11 = objc_claimAutoreleasedReturnValue(),
        v11,
        v10,
        v11))
  {
    long long v12 = 0;
    goto LABEL_14;
  }
  long long v13 = [(HUItemTableViewController *)self tableView];
  uint64_t v14 = [v13 style];

  if (v14 == 2)
  {
    uint64_t v15 = [MEMORY[0x1E4F42B58] prominentInsetGroupedHeaderConfiguration];
  }
  else if (v14 == 1)
  {
    uint64_t v15 = [MEMORY[0x1E4F42B58] groupedHeaderConfiguration];
  }
  else
  {
    if (v14)
    {
      long long v12 = 0;
      goto LABEL_13;
    }
    uint64_t v15 = [MEMORY[0x1E4F42B58] plainHeaderConfiguration];
  }
  long long v12 = (void *)v15;
LABEL_13:
  [v12 setText:v6];
LABEL_14:

  return v12;
}

- (id)contentConfigurationForFooterViewAtSectionIndex:(unint64_t)a3
{
  id v5 = [(HUItemTableViewController *)self itemManager];
  id v6 = [v5 footerTitleForSection:a3];

  if (!v6)
  {
    CGRect v10 = 0;
    goto LABEL_10;
  }
  id v7 = [(HUItemTableViewController *)self tableView];
  uint64_t v8 = [v7 style];

  if ((unint64_t)(v8 - 1) >= 2)
  {
    if (v8)
    {
      CGRect v10 = 0;
      goto LABEL_9;
    }
    uint64_t v9 = [MEMORY[0x1E4F42B58] plainFooterConfiguration];
  }
  else
  {
    uint64_t v9 = [MEMORY[0x1E4F42B58] groupedFooterConfiguration];
  }
  CGRect v10 = (void *)v9;
LABEL_9:
  [v10 setText:v6];
LABEL_10:

  return v10;
}

- (id)moduleControllerForItem:(id)a3
{
  id v4 = a3;
  id v5 = [(HUItemTableViewController *)self itemModuleControllers];
  id v6 = [(HUItemTableViewController *)self recentlyRemovedItemModuleControllers];
  id v7 = [v5 setByAddingObjectsFromSet:v6];

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __53__HUItemTableViewController_moduleControllerForItem___block_invoke;
  v11[3] = &unk_1E638E378;
  id v12 = v4;
  id v8 = v4;
  uint64_t v9 = objc_msgSend(v7, "na_firstObjectPassingTest:", v11);

  return v9;
}

uint64_t __53__HUItemTableViewController_moduleControllerForItem___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 module];
  if ([v4 containsItem:*(void *)(a1 + 32)])
  {
    uint64_t v5 = 1;
  }
  else
  {
    id v6 = [*(id *)(a1 + 32) moduleIdentifier];
    id v7 = [v3 moduleIdentifier];
    uint64_t v5 = [v6 isEqualToString:v7];
  }
  return v5;
}

- (void)cleanupRecentlyRemovedModuleControllers
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v3 = [(HUItemTableViewController *)self recentlyRemovedItemModuleControllers];
  id v4 = (void *)[v3 copy];

  uint64_t v5 = [(HUItemTableViewController *)self itemManager];
  id v6 = [v5 allItems];
  id v7 = objc_msgSend(v6, "na_map:", &__block_literal_global_274);

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v8 = v4;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v25 objects:v35 count:16];
  CGRect v11 = v8;
  if (!v9)
  {
LABEL_15:

    goto LABEL_16;
  }
  uint64_t v12 = v9;
  char v13 = 0;
  uint64_t v14 = *(void *)v26;
  *(void *)&long long v10 = 138412802;
  long long v24 = v10;
  do
  {
    for (uint64_t i = 0; i != v12; ++i)
    {
      if (*(void *)v26 != v14) {
        objc_enumerationMutation(v8);
      }
      objc_super v16 = *(void **)(*((void *)&v25 + 1) + 8 * i);
      long long v17 = objc_msgSend(v16, "moduleIdentifier", v24, (void)v25);
      char v18 = [v7 containsObject:v17];

      if ((v18 & 1) == 0)
      {
        long long v19 = HFLogForCategory();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          long long v20 = [v16 moduleIdentifier];
          *(_DWORD *)buf = v24;
          __int16 v30 = self;
          __int16 v31 = 2112;
          __int16 v32 = v16;
          __int16 v33 = 2112;
          uint64_t v34 = v20;
          _os_log_impl(&dword_1BE345000, v19, OS_LOG_TYPE_DEFAULT, "%@: Finishing removal of module controller %@ (%@) because no items refer to it anymore", buf, 0x20u);
        }
        objc_super v21 = [(HUItemTableViewController *)self recentlyRemovedItemModuleControllers];
        [v21 removeObject:v16];

        char v13 = 1;
      }
    }
    uint64_t v12 = [v8 countByEnumeratingWithState:&v25 objects:v35 count:16];
  }
  while (v12);

  if (v13)
  {
    CGRect v11 = HFLogForCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v22 = [(HUItemTableViewController *)self recentlyRemovedItemModuleControllers];
      id v23 = objc_msgSend(v22, "na_map:", &__block_literal_global_133_0);
      *(_DWORD *)buf = 138412546;
      __int16 v30 = self;
      __int16 v31 = 2112;
      __int16 v32 = v23;
      _os_log_impl(&dword_1BE345000, v11, OS_LOG_TYPE_DEFAULT, "%@: Module controllers awaiting removal remaining: %@", buf, 0x16u);
    }
    goto LABEL_15;
  }
LABEL_16:
}

uint64_t __68__HUItemTableViewController_cleanupRecentlyRemovedModuleControllers__block_invoke(uint64_t a1, void *a2)
{
  return [a2 moduleIdentifier];
}

uint64_t __68__HUItemTableViewController_cleanupRecentlyRemovedModuleControllers__block_invoke_130(uint64_t a1, void *a2)
{
  return [a2 moduleIdentifier];
}

- (id)textFieldForVisibleItem:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HUItemTableViewController *)self itemManager];
  id v6 = [v5 indexPathForItem:v4];

  if (v6)
  {
    id v7 = [(HUItemTableViewController *)self tableView];
    id v8 = [v7 cellForRowAtIndexPath:v6];

    id v9 = v8;
    if ([v9 conformsToProtocol:&unk_1F19E8A08]) {
      long long v10 = v9;
    }
    else {
      long long v10 = 0;
    }
    id v11 = v10;

    uint64_t v12 = [v11 textField];
  }
  else
  {
    uint64_t v12 = 0;
  }

  return v12;
}

- (NSString)description
{
  id v3 = [MEMORY[0x1E4F7A0D0] builderWithObject:self];
  id v4 = [(HUItemTableViewController *)self itemManager];
  uint64_t v5 = [v4 sourceItem];
  id v6 = (id)[v3 appendObject:v5 withName:@"sourceItem"];

  id v7 = [v3 build];

  return (NSString *)v7;
}

- (void)_updateMaterials
{
  if ([MEMORY[0x1E4F69758] shouldUseProxHandOffMaterials])
  {
    id v3 = [(HUItemTableViewController *)self traitCollection];
    uint64_t v4 = [v3 userInterfaceStyle];

    if (v4 == 2) {
      uint64_t v5 = 19;
    }
    else {
      uint64_t v5 = 14;
    }
    id v20 = [MEMORY[0x1E4F427D8] effectWithStyle:v5];
    id v6 = [MEMORY[0x1E4F428B8] clearColor];
    id v7 = [(HUItemTableViewController *)self parentViewController];
    NSClassFromString(&cfstr_Huquickcontrol_81.isa);
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      id v9 = [MEMORY[0x1E4F42FE8] effectForBlurEffect:v20 style:6];
      long long v10 = (void *)[objc_alloc(MEMORY[0x1E4F43028]) initWithEffect:v9];
      [(HUItemTableViewController *)self setBackgroundVisualEffectView:v10];

      id v11 = [(HUItemTableViewController *)self backgroundVisualEffectView];
      uint64_t v12 = [(HUItemTableViewController *)self tableView];
      [v12 setBackgroundView:v11];

      char v13 = [(HUItemTableViewController *)self tableView];
      [v13 setSeparatorEffect:v9];

      uint64_t v14 = [MEMORY[0x1E4F428B8] colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.6];

      id v6 = (void *)v14;
    }
    uint64_t v15 = (objc_class *)objc_opt_class();
    if (v15 == NSClassFromString(&cfstr_Huservicedetai_123.isa))
    {
      uint64_t v16 = [MEMORY[0x1E4F428B8] colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.1];

      id v6 = (void *)v16;
    }
    long long v17 = [(HUItemTableViewController *)self view];
    [v17 setBackgroundColor:v6];

    char v18 = [(HUItemTableViewController *)self tableView];
    [v18 setBackgroundColor:v6];

    long long v19 = [(HUItemTableViewController *)self backgroundVisualEffectView];
    [v19 setEffect:v20];
  }
}

- (void)_dispatchUpdateForCell:(id)a3 item:(id)a4 indexPath:(id)a5 animated:(BOOL)a6
{
  BOOL v6 = a6;
  id v14 = a5;
  id v10 = a4;
  id v11 = a3;
  [(HUItemTableViewController *)self _performCommonUpdateForCell:v11 item:v10 indexPath:v14 animated:v6];
  uint64_t v12 = [(HUItemTableViewController *)self moduleControllerForItem:v10];
  char v13 = v12;
  if (v12) {
    [v12 updateCell:v11 forItem:v10 animated:v6];
  }
  else {
    [(HUItemTableViewController *)self updateCell:v11 forItem:v10 indexPath:v14 animated:v6];
  }
}

- (void)_performCommonUpdateForCell:(id)a3 item:(id)a4 indexPath:(id)a5 animated:(BOOL)a6
{
  BOOL v6 = a6;
  v47[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  v47[0] = v9;
  id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v47 count:1];
  [(HUItemTableViewController *)self _updateLayoutMarginsForCells:v11];

  if ([v9 conformsToProtocol:&unk_1F19E3620])
  {
    id v12 = v9;
    unint64_t v13 = [(HUItemTableViewController *)self automaticDisablingReasonsForItem:v10];
    id v14 = [(HUItemTableViewController *)self itemManager];
    uint64_t v15 = [v14 home];
    char v16 = objc_msgSend(v15, "hf_currentUserIsAdministrator");

    if (v16)
    {
      LODWORD(v17) = 0;
    }
    else
    {
      char v18 = [v10 latestResults];
      long long v19 = [v18 objectForKeyedSubscript:*MEMORY[0x1E4F68A70]];

      if (v19) {
        LODWORD(v17) = [v19 BOOLValue];
      }
      else {
        uint64_t v17 = (v13 >> 1) & 1;
      }
    }
    id v20 = [v10 latestResults];
    objc_super v21 = [v20 objectForKeyedSubscript:*MEMORY[0x1E4F68A08]];
    char v22 = [v21 BOOLValue];

    if ((v22 & 1) != 0 || v17)
    {
      [v12 setDisabled:1];
      id v23 = [(HUItemTableViewController *)self moduleControllerForItem:v10];
      long long v24 = v23;
      if (v23 && ([v23 canSelectDisabledItem:v10] & 1) != 0) {
        uint64_t v25 = 3;
      }
      else {
        uint64_t v25 = 0;
      }
      [v12 setSelectionStyle:v25];
    }
    else
    {
      [v12 setDisabled:0];
      [v12 setSelectionStyle:3];
    }
  }
  if ([v9 conformsToProtocol:&unk_1F19E8A08]
    && [(HUItemTableViewController *)self shouldManageTextFieldForItem:v10])
  {
    id v26 = v9;
    uint64_t v27 = [(HUItemTableViewController *)self moduleControllerForItem:v10];
    long long v28 = (void *)v27;
    if (v27) {
      id v29 = (HUItemTableViewController *)v27;
    }
    else {
      id v29 = self;
    }
    __int16 v30 = v29;

    __int16 v31 = [v26 textField];
    __int16 v32 = [(HUItemTableViewController *)v30 defaultTextForTextField:v31 item:v10];

    __int16 v33 = [v26 textField];
    uint64_t v34 = [(HUItemTableViewController *)v30 currentTextForTextField:v33 item:v10];

    v35 = [v26 textField];
    uint64_t v36 = [(HUItemTableViewController *)v30 placeholderTextForTextField:v35 item:v10];

    v37 = [v26 textField];
    [v37 setPlaceholder:v36];

    if (v34) {
      v38 = v34;
    }
    else {
      v38 = v32;
    }
    v39 = [v26 textField];
    [v39 setText:v38];

    v40 = [v26 textField];
    BOOL v41 = [v40 keyboardType] != 7;

    v42 = [v26 textField];
    [v42 setAutocapitalizationType:v41];
  }
  if ([v9 conformsToProtocol:&unk_1F19D2698])
  {
    id v43 = v9;
    if (objc_opt_respondsToSelector()) {
      [v43 setResizingDelegate:self];
    }
    [v43 updateUIWithAnimation:v6];
  }
  if ([v9 conformsToProtocol:&unk_1F1A1EE20])
  {
    id v44 = v9;
    v45 = [v10 latestResults];
    v46 = [v45 objectForKeyedSubscript:*MEMORY[0x1E4F68A20]];

    [v44 setCanBeSelected:v46 == 0];
  }
}

- (id)_visibleCellForItem:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v5 = [(HUItemTableViewController *)self tableView];
  BOOL v6 = [v5 indexPathsForVisibleRows];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        id v12 = [(HUItemTableViewController *)self itemManager];
        id v13 = [v12 displayedItemAtIndexPath:v11];

        if (v13 == v4)
        {
          uint64_t v15 = [(HUItemTableViewController *)self tableView];
          id v14 = [v15 cellForRowAtIndexPath:v11];

          goto LABEL_11;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  id v14 = 0;
LABEL_11:

  return v14;
}

- (id)_itemForTextField:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HUItemTableViewController *)self textFieldToCellMap];
  BOOL v6 = [v5 objectForKey:v4];

  id v7 = v6;
  if ([v7 conformsToProtocol:&unk_1F19D2698]) {
    uint64_t v8 = v7;
  }
  else {
    uint64_t v8 = 0;
  }
  id v9 = v8;

  id v10 = [v9 item];

  if (v10)
  {
    uint64_t v11 = [v9 item];
  }
  else
  {
    id v12 = [(HUItemTableViewController *)self tableView];
    id v13 = [v12 indexPathForCell:v7];

    if (v13)
    {
      id v14 = [(HUItemTableViewController *)self itemManager];
      uint64_t v11 = [v14 displayedItemAtIndexPath:v13];
    }
    else
    {
      uint64_t v11 = 0;
    }
  }

  return v11;
}

- (void)_updateTitle
{
  id v10 = [(HUItemTableViewController *)self itemManager];
  uint64_t v3 = [v10 sourceItem];
  if (v3)
  {
    id v4 = (void *)v3;
    BOOL v5 = [(HUItemTableViewController *)self automaticallyUpdatesViewControllerTitle];

    if (!v5) {
      return;
    }
    id v10 = [(HUItemTableViewController *)self itemManager];
    BOOL v6 = [v10 sourceItem];
    id v7 = [v6 latestResults];
    uint64_t v8 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F68AB8]];
    id v9 = [(HUItemTableViewController *)self navigationItem];
    [v9 setTitle:v8];
  }
}

- (void)_updateTableHeaderAndFooter
{
  uint64_t v3 = [(HUItemTableViewController *)self tableView];
  uint64_t v4 = [v3 tableHeaderView];

  BOOL v5 = [(HUItemTableViewController *)self tableView];
  uint64_t v6 = [v5 tableFooterView];

  uint64_t v7 = [(HUItemTableViewController *)self itemTableHeaderView];
  if (v7 | v4)
  {
    id v9 = [(HUItemTableViewController *)self tableView];
    [v9 setTableHeaderView:v7];

    id v10 = [(HUItemTableViewController *)self tableView];
    [v10 bounds];
    objc_msgSend((id)v7, "hu_autoSizeByConstrainingWidth:", CGRectGetWidth(v17));

    uint64_t v8 = [(HUItemTableViewController *)self tableView];
    [v8 setTableHeaderView:v7];
  }
  else
  {
    uint64_t v8 = HFLogForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1BE345000, v8, OS_LOG_TYPE_DEBUG, "Header View not set; skipping", buf, 2u);
    }
  }

  uint64_t v11 = [(HUItemTableViewController *)self itemTableFooterView];
  if (v11 | v6)
  {
    id v12 = [(HUItemTableViewController *)self tableView];
    [v12 setTableFooterView:v11];

    id v13 = [(HUItemTableViewController *)self tableView];
    [v13 bounds];
    objc_msgSend((id)v11, "hu_autoSizeByConstrainingWidth:", CGRectGetWidth(v18));

    id v14 = [(HUItemTableViewController *)self tableView];
    [v14 setTableFooterView:v11];
  }
  else
  {
    id v14 = HFLogForCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)uint64_t v15 = 0;
      _os_log_debug_impl(&dword_1BE345000, v14, OS_LOG_TYPE_DEBUG, "Footer View not set; skipping", v15, 2u);
    }
  }
}

- (BOOL)_shouldHideHeaderForSection:(int64_t)a3
{
  BOOL v5 = [(HUItemTableViewController *)self itemManager];
  uint64_t v6 = [v5 displayedSectionIdentifierForSectionIndex:a3];

  uint64_t v7 = [(HUItemTableViewController *)self itemManager];
  uint64_t v8 = [v7 displayedItemsInSectionWithIdentifier:v6];

  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  char v16 = __57__HUItemTableViewController__shouldHideHeaderForSection___block_invoke;
  CGRect v17 = &unk_1E6387098;
  CGRect v18 = self;
  id v19 = v6;
  id v9 = v6;
  if ((objc_msgSend(v8, "na_any:", &v14) & 1) != 0
    || -[HUItemTableViewController shouldHideHeaderAboveSection:](self, "shouldHideHeaderAboveSection:", a3, v14, v15, v16, v17, v18, v19))
  {
    BOOL v10 = 1;
  }
  else if (a3 >= 1 {
         && [(HUItemTableViewController *)self shouldHideFooterBelowSection:a3 - 1])
  }
  {
    id v12 = [(HUItemTableViewController *)self tableView];
    id v13 = [(HUItemTableViewController *)self tableView:v12 titleForHeaderInSection:a3];
    BOOL v10 = v13 == 0;
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

uint64_t __57__HUItemTableViewController__shouldHideHeaderForSection___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = [*(id *)(a1 + 32) moduleControllerForItem:a2];
  uint64_t v4 = [v3 shouldHideHeaderAboveSectionWithIdentifier:*(void *)(a1 + 40)];

  return v4;
}

- (BOOL)_shouldHideFooterForSection:(int64_t)a3
{
  BOOL v5 = [(HUItemTableViewController *)self itemManager];
  uint64_t v6 = [v5 displayedSectionIdentifierForSectionIndex:a3];

  uint64_t v7 = [(HUItemTableViewController *)self itemManager];
  uint64_t v8 = [v7 displayedItemsInSectionWithIdentifier:v6];

  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  CGRect v17 = __57__HUItemTableViewController__shouldHideFooterForSection___block_invoke;
  CGRect v18 = &unk_1E6387098;
  id v19 = self;
  id v20 = v6;
  id v9 = v6;
  if ((objc_msgSend(v8, "na_any:", &v15) & 1) != 0
    || -[HUItemTableViewController shouldHideFooterBelowSection:](self, "shouldHideFooterBelowSection:", a3, v15, v16, v17, v18, v19, v20))
  {
    BOOL v10 = 1;
  }
  else
  {
    uint64_t v11 = [(HUItemTableViewController *)self tableView];
    if ([v11 numberOfSections] - 1 > a3
      && [(HUItemTableViewController *)self shouldHideHeaderAboveSection:a3 + 1])
    {
      id v12 = [(HUItemTableViewController *)self tableView];
      id v13 = [(HUItemTableViewController *)self tableView:v12 titleForFooterInSection:a3];
      BOOL v10 = v13 == 0;
    }
    else
    {
      BOOL v10 = 0;
    }
  }
  return v10;
}

uint64_t __57__HUItemTableViewController__shouldHideFooterForSection___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = [*(id *)(a1 + 32) moduleControllerForItem:a2];
  uint64_t v4 = [v3 shouldHideFooterBelowSectionWithIdentifier:*(void *)(a1 + 40)];

  return v4;
}

- (void)_updateLayoutMarginsForCells:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(id)objc_opt_class() adoptsDefaultGridLayoutMargins])
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v5 = v4;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v22 != v8) {
            objc_enumerationMutation(v5);
          }
          BOOL v10 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          objc_msgSend(v10, "layoutMargins", (void)v21);
          double v12 = v11;
          double v14 = v13;
          uint64_t v15 = [(HUItemTableViewController *)self gridLayoutOptions];
          [v15 sectionLeadingMargin];
          double v17 = v16;

          CGRect v18 = [(HUItemTableViewController *)self gridLayoutOptions];
          [v18 sectionTrailingMargin];
          double v20 = v19;

          objc_msgSend(v10, "setLayoutMargins:", v12, v17, v14, v20);
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v7);
    }
  }
}

- (void)_updatePreferredContentSizeIfNecessary
{
  [(HUItemTableViewController *)self preferredContentSize];
  double v4 = v3;
  double v6 = v5;
  if ([(HUItemTableViewController *)self wantsPreferredContentSize])
  {
    if ([(HUItemTableViewController *)self isViewLoaded])
    {
      uint64_t v7 = [(HUItemTableViewController *)self tableView];
      [v7 _contentSize];
      -[HUItemTableViewController setPreferredContentSize:](self, "setPreferredContentSize:");
    }
  }
  else
  {
    -[HUItemTableViewController setPreferredContentSize:](self, "setPreferredContentSize:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
  }
  [(HUItemTableViewController *)self preferredContentSize];
  if (v4 != v9 || v6 != v8)
  {
    id v11 = [(HUItemTableViewController *)self tableView];
    [v11 setNeedsUpdateConstraints];
  }
}

- (void)_updateHeadersAndFootersIfNeededAfterPerformingRequest:(id)a3
{
  id v4 = a3;
  double v5 = [v4 changes];
  double v6 = [v5 groupOperations];
  uint64_t v7 = [v6 count];

  if (v7)
  {
    id v8 = objc_alloc_init(MEMORY[0x1E4F28E60]);
    double v9 = (void *)MEMORY[0x1E4F1CAD0];
    BOOL v10 = [v4 changes];
    id v11 = [v10 groupOperations];
    double v12 = objc_msgSend(v11, "na_map:", &__block_literal_global_185);
    double v13 = [v9 setWithArray:v12];

    double v14 = [v4 changes];
    uint64_t v15 = [v14 groupOperations];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __84__HUItemTableViewController__updateHeadersAndFootersIfNeededAfterPerformingRequest___block_invoke_2;
    v19[3] = &unk_1E6391978;
    v19[4] = self;
    id v20 = v13;
    id v21 = v8;
    id v16 = v8;
    id v17 = v13;
    objc_msgSend(v15, "na_each:", v19);

    CGRect v18 = [(HUItemTableViewController *)self tableView];
    [v18 _reloadSectionHeaderFooters:v16 withRowAnimation:100];
  }
}

id __84__HUItemTableViewController__updateHeadersAndFootersIfNeededAfterPerformingRequest___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  double v3 = [v2 fromIndex];
  if (v3)
  {
    id v4 = 0;
  }
  else
  {
    id v4 = [v2 toIndex];
  }

  return v4;
}

void __84__HUItemTableViewController__updateHeadersAndFootersIfNeededAfterPerformingRequest___block_invoke_2(uint64_t a1, void *a2)
{
  id v12 = a2;
  double v3 = [v12 fromIndex];

  id v4 = [v12 toIndex];
  double v5 = v4;
  if (v3)
  {

    if (v5)
    {
      double v6 = *(void **)(a1 + 48);
      uint64_t v7 = [v12 toIndex];
      objc_msgSend(v6, "addIndex:", objc_msgSend(v7, "integerValue"));
    }
  }
  else
  {
    uint64_t v8 = [v4 integerValue] + 1;

    double v9 = [*(id *)(a1 + 32) tableView];
    if (v8 >= [v9 numberOfSections])
    {
    }
    else
    {
      BOOL v10 = *(void **)(a1 + 40);
      id v11 = [NSNumber numberWithInteger:v8];
      LOBYTE(v10) = [v10 containsObject:v11];

      if ((v10 & 1) == 0) {
        [*(id *)(a1 + 48) addIndex:v8];
      }
    }
  }
}

- (void)_scrollToDestination:(id)a3
{
  id v8 = a3;
  id v4 = [(HUItemTableViewController *)self itemManager];
  double v5 = [v8 item];
  double v6 = [v4 indexPathForItem:v5];

  if (v6)
  {
    uint64_t v7 = [(HUItemTableViewController *)self tableView];
    objc_msgSend(v7, "scrollToRowAtIndexPath:atScrollPosition:animated:", v6, 1, objc_msgSend(v8, "isAnimated"));
  }
  else
  {
    uint64_t v7 = [v8 item];
    NSLog(&cfstr_CouldNotFindIt.isa, v7);
  }
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  double v3 = [(HUItemTableViewController *)self itemManager];
  int64_t v4 = [v3 numberOfSections];

  return v4;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  double v5 = [(HUItemTableViewController *)self itemManager];
  double v6 = [v5 displayedItemsInSection:a4];
  int64_t v7 = [v6 count];

  return v7;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  int64_t v7 = [(HUItemTableViewController *)self itemManager];
  id v8 = [v7 displayedItemAtIndexPath:v6];

  double v9 = [(HUItemTableViewController *)self moduleControllerForItem:v8];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __61__HUItemTableViewController_tableView_cellForRowAtIndexPath___block_invoke;
  v27[3] = &unk_1E638E308;
  id v10 = v9;
  id v28 = v10;
  id v11 = v8;
  id v29 = v11;
  __int16 v30 = self;
  id v12 = v6;
  id v31 = v12;
  double v13 = (objc_class *)__61__HUItemTableViewController_tableView_cellForRowAtIndexPath___block_invoke((uint64_t)v27);
  if (!v13)
  {
    uint64_t v26 = [MEMORY[0x1E4F28B00] currentHandler];
    [v26 handleFailureInMethod:a2, self, @"HUItemTableViewController.m", 986, @"No cell class specified for item: %@", v11 object file lineNumber description];
  }
  double v14 = [(HUItemTableViewController *)self registeredCellClasses];
  char v15 = [v14 containsObject:v13];

  if ((v15 & 1) == 0)
  {
    id v16 = [(HUItemTableViewController *)self tableView];
    id v17 = NSStringFromClass(v13);
    [v16 registerClass:v13 forCellReuseIdentifier:v17];

    CGRect v18 = [(HUItemTableViewController *)self registeredCellClasses];
    [v18 addObject:v13];
  }
  double v19 = [(HUItemTableViewController *)self tableView];
  id v20 = NSStringFromClass(v13);
  id v21 = [v19 dequeueReusableCellWithIdentifier:v20 forIndexPath:v12];

  if ([v21 conformsToProtocol:&unk_1F19D2698]) {
    [v21 setItem:v11];
  }
  BOOL v22 = [(HUItemTableViewController *)self shouldHideSeparatorsForCell:v21 indexPath:v12];
  long long v23 = [NSNumber numberWithInteger:!v22];
  objc_msgSend(v21, "hu_setForcedSeparatorStyle:", v23);

  if ([(HUItemTableViewController *)self shouldUseAlternateCellColor])
  {
    long long v24 = [MEMORY[0x1E4F428B8] systemGroupedBackgroundColor];
    [v21 setBackgroundColor:v24];
  }
  if (v10) {
    [v10 setupCell:v21 forItem:v11];
  }
  else {
    [(HUItemTableViewController *)self setupCell:v21 forItem:v11 indexPath:v12];
  }
  [(HUItemTableViewController *)self _dispatchUpdateForCell:v21 item:v11 indexPath:v12 animated:0];

  return v21;
}

id __61__HUItemTableViewController_tableView_cellForRowAtIndexPath___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 32)) {
    [*(id *)(a1 + 32) cellClassForItem:*(void *)(a1 + 40)];
  }
  else {
  v1 = [*(id *)(a1 + 48) mappableCellClassForItem:*(void *)(a1 + 40) indexPath:*(void *)(a1 + 56)];
  }

  return v1;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  id v6 = [(HUItemTableViewController *)self itemManager];
  int64_t v7 = [v6 itemSectionForSectionIndex:a4];

  uint64_t v8 = [(HUItemTableViewController *)self contentConfigurationForHeaderViewAtSectionIndex:a4];
  if (v8 && (v9 = (void *)v8, int v10 = [v7 forceShowHeaderTitle], v9, !v10))
  {
    id v12 = 0;
  }
  else
  {
    id v11 = [(HUItemTableViewController *)self itemManager];
    id v12 = [v11 titleForSection:a4];
  }

  return v12;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  id v6 = [(HUItemTableViewController *)self contentConfigurationForFooterViewAtSectionIndex:a4];

  if (v6)
  {
    int64_t v7 = 0;
  }
  else
  {
    uint64_t v8 = [(HUItemTableViewController *)self itemManager];
    int64_t v7 = [v8 footerTitleForSection:a4];
  }

  return v7;
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = [(HUItemTableViewController *)self itemManager];
  int64_t v7 = [v6 displayedItemAtIndexPath:v5];

  uint64_t v8 = [(HUItemTableViewController *)self moduleControllerForItem:v7];
  double v9 = [(HUItemTableViewController *)self tableView];
  int v10 = [v9 cellForRowAtIndexPath:v5];

  if (v10
    && [v10 conformsToProtocol:&unk_1F19E3620]
    && [v10 isDisabled])
  {
    if (!v8)
    {
      BOOL v12 = 0;
      goto LABEL_10;
    }
    char v11 = [v8 canSelectDisabledItem:v7];
  }
  else
  {
    if (!v8)
    {
      BOOL v12 = 1;
      goto LABEL_10;
    }
    char v11 = [v8 canSelectItem:v7];
  }
  BOOL v12 = v11;
LABEL_10:

  return v12;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (objc_msgSend((id)+[HUItemTableViewController superclass](HUItemTableViewController, "superclass"), "instancesRespondToSelector:", a2))
  {
    v14.receiver = self;
    v14.super_class = (Class)HUItemTableViewController;
    [(HUItemTableViewController *)&v14 tableView:v7 didSelectRowAtIndexPath:v8];
  }
  double v9 = [(HUItemTableViewController *)self itemManager];
  int v10 = [v9 displayedItemAtIndexPath:v8];

  char v11 = HFLogForCategory();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v16 = self;
    __int16 v17 = 2112;
    CGRect v18 = v10;
    _os_log_impl(&dword_1BE345000, v11, OS_LOG_TYPE_DEFAULT, "%@: User tapped item: %@", buf, 0x16u);
  }

  BOOL v12 = [(HUItemTableViewController *)self moduleControllerForItem:v10];
  double v13 = v12;
  if (v12 && ![v12 didSelectItem:v10]) {
    [v7 deselectRowAtIndexPath:v8 animated:1];
  }
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v16.receiver = self;
  v16.super_class = (Class)HUItemTableViewController;
  [(HUTableViewController *)&v16 tableView:a3 willDisplayCell:v8 forRowAtIndexPath:v9];
  if ([v8 conformsToProtocol:&unk_1F19E8A08])
  {
    int v10 = [(HUItemTableViewController *)self itemManager];
    char v11 = [v10 displayedItemAtIndexPath:v9];

    if (v11 && [(HUItemTableViewController *)self shouldManageTextFieldForItem:v11])
    {
      id v12 = v8;
      double v13 = [v12 textField];
      [v13 setDelegate:self];

      objc_super v14 = [(HUItemTableViewController *)self textFieldToCellMap];
      char v15 = [v12 textField];
      [v14 setObject:v12 forKey:v15];
    }
  }
}

- (void)tableView:(id)a3 didEndDisplayingCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v16.receiver = self;
  v16.super_class = (Class)HUItemTableViewController;
  [(HUTableViewController *)&v16 tableView:a3 didEndDisplayingCell:v8 forRowAtIndexPath:v9];
  if ([v8 conformsToProtocol:&unk_1F19E8A08])
  {
    int v10 = [(HUItemTableViewController *)self itemManager];
    char v11 = [v10 displayedItemAtIndexPath:v9];

    if (v11 && [(HUItemTableViewController *)self shouldManageTextFieldForItem:v11])
    {
      id v12 = v8;
      double v13 = [v12 textField];
      [v13 setDelegate:0];

      objc_super v14 = [(HUItemTableViewController *)self textFieldToCellMap];
      char v15 = [v12 textField];

      [v14 removeObjectForKey:v15];
    }
  }
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v6 = a3;
  if ([(HUItemTableViewController *)self _shouldHideHeaderForSection:a4])
  {
    id v7 = objc_alloc(MEMORY[0x1E4F42FF0]);
    id v8 = objc_msgSend(v7, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  }
  else
  {
    id v8 = 0;
  }
  id v9 = [(HUItemTableViewController *)self itemManager];
  int v10 = [v9 itemSectionForSectionIndex:a4];

  char v11 = [(HUItemTableViewController *)self contentConfigurationForHeaderViewAtSectionIndex:a4];
  uint64_t v12 = [v10 headerAccessoryButtonTitle];
  if (v12
    && (double v13 = (void *)v12,
        [v10 headerAccessoryButtonDelegate],
        objc_super v14 = objc_claimAutoreleasedReturnValue(),
        v14,
        v13,
        v14))
  {
    char v15 = (objc_class *)objc_opt_class();
    objc_super v16 = NSStringFromClass(v15);
    __int16 v17 = [v6 dequeueReusableHeaderFooterViewWithIdentifier:v16];

    [v17 setItemSection:v10];
    CGRect v18 = [(HUItemTableViewController *)self tableView];
    uint64_t v19 = [(HUItemTableViewController *)self tableView:v18 titleForHeaderInSection:a4];
    id v20 = [v17 textLabel];
    [v20 setText:v19];

    [v17 updateUIWithAnimation:0];
  }
  else
  {
    if (!v11) {
      goto LABEL_10;
    }
    id v21 = (objc_class *)objc_opt_class();
    BOOL v22 = NSStringFromClass(v21);
    __int16 v17 = [v6 dequeueReusableHeaderFooterViewWithIdentifier:v22];

    [v17 setContentConfiguration:v11];
  }

  id v8 = v17;
LABEL_10:

  return v8;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  id v6 = a3;
  id v7 = [(HUItemTableViewController *)self itemManager];
  id v8 = [v7 attributedFooterTitleForSection:a4];

  id v9 = [(HUItemTableViewController *)self contentConfigurationForFooterViewAtSectionIndex:a4];
  if (v9)
  {
    int v10 = (objc_class *)objc_opt_class();
    char v11 = NSStringFromClass(v10);
    uint64_t v12 = [v6 dequeueReusableHeaderFooterViewWithIdentifier:v11];

    [(HUItemTableSectionHeaderFooterView *)v12 setContentConfiguration:v9];
  }
  else if (v8)
  {
    uint64_t v12 = [v6 dequeueReusableHeaderFooterViewWithIdentifier:@"footerReuseIdentifier"];
    if (!v12) {
      uint64_t v12 = [[HUItemTableSectionHeaderFooterView alloc] initWithReuseIdentifier:@"footerReuseIdentifier"];
    }
    double v13 = [(HUItemTableViewController *)self itemManager];
    objc_super v14 = [v13 displayedSectionIdentifierForSectionIndex:a4];
    char v15 = [(HUItemTableSectionHeaderFooterView *)v12 messageTextView];
    [v15 setIdentifier:v14];

    [(HUItemTableSectionHeaderFooterView *)v12 setType:1];
    [(HUItemTableSectionHeaderFooterView *)v12 setMessage:v8];
    objc_super v16 = [(HUItemTableSectionHeaderFooterView *)v12 messageTextView];
    [v16 setDelegate:self];

    __int16 v17 = [(HUItemTableSectionHeaderFooterView *)v12 messageTextView];
    CGRect v18 = [v17 textDragInteraction];
    [v18 setEnabled:0];
  }
  else
  {
    uint64_t v12 = 0;
  }
  if ([(HUItemTableViewController *)self _shouldHideFooterForSection:a4])
  {
    id v19 = objc_alloc(MEMORY[0x1E4F42FF0]);
    uint64_t v20 = objc_msgSend(v19, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));

    uint64_t v12 = (HUItemTableSectionHeaderFooterView *)v20;
  }

  return v12;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  double v4 = *MEMORY[0x1E4F43D18];
  BOOL v5 = [(HUItemTableViewController *)self _shouldHideHeaderForSection:a4];
  double result = 2.22507386e-308;
  if (!v5) {
    return v4;
  }
  return result;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  double v4 = *MEMORY[0x1E4F43D18];
  BOOL v5 = [(HUItemTableViewController *)self _shouldHideFooterForSection:a4];
  double result = 2.22507386e-308;
  if (!v5) {
    return v4;
  }
  return result;
}

- (double)tableView:(id)a3 estimatedHeightForHeaderInSection:(int64_t)a4
{
  double v4 = *MEMORY[0x1E4F43D18];
  BOOL v5 = [(HUItemTableViewController *)self _shouldHideHeaderForSection:a4];
  double result = 2.22507386e-308;
  if (!v5) {
    return v4;
  }
  return result;
}

- (double)tableView:(id)a3 estimatedHeightForFooterInSection:(int64_t)a4
{
  double v4 = *MEMORY[0x1E4F43D18];
  BOOL v5 = [(HUItemTableViewController *)self _shouldHideFooterForSection:a4];
  double result = 2.22507386e-308;
  if (!v5) {
    return v4;
  }
  return result;
}

- (void)tableView:(id)a3 accessoryButtonTappedForRowWithIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = [(HUItemTableViewController *)self itemManager];
  id v9 = [v6 displayedItemAtIndexPath:v5];

  id v7 = [(HUItemTableViewController *)self moduleControllerForItem:v9];
  id v8 = v7;
  if (v7) {
    [v7 accessoryButtonTappedForItem:v9];
  }
}

- (id)tableView:(id)a3 leadingSwipeActionsConfigurationForRowAtIndexPath:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = [(HUItemTableViewController *)self itemManager];
  id v7 = [v6 displayedItemAtIndexPath:v5];

  id v8 = HFLogForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412546;
    objc_super v14 = self;
    __int16 v15 = 2112;
    objc_super v16 = v7;
    _os_log_impl(&dword_1BE345000, v8, OS_LOG_TYPE_DEFAULT, "%@: User swiped for leading actions on item: %@", (uint8_t *)&v13, 0x16u);
  }

  id v9 = [(HUItemTableViewController *)self moduleControllerForItem:v7];
  int v10 = v9;
  if (!v9) {
    id v9 = self;
  }
  char v11 = [v9 leadingSwipeActionsForItem:v7];

  return v11;
}

- (id)tableView:(id)a3 trailingSwipeActionsConfigurationForRowAtIndexPath:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = [(HUItemTableViewController *)self itemManager];
  id v7 = [v6 displayedItemAtIndexPath:v5];

  id v8 = HFLogForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412546;
    objc_super v14 = self;
    __int16 v15 = 2112;
    objc_super v16 = v7;
    _os_log_impl(&dword_1BE345000, v8, OS_LOG_TYPE_DEFAULT, "%@: User swiped for trailing actions on item: %@", (uint8_t *)&v13, 0x16u);
  }

  id v9 = [(HUItemTableViewController *)self moduleControllerForItem:v7];
  int v10 = v9;
  if (!v9) {
    id v9 = self;
  }
  char v11 = [v9 trailingSwipeActionsForItem:v7];

  return v11;
}

- (void)diffableDataItemManager:(id)a3 didUpdateItems:(id)a4 addItems:(id)a5 removeItems:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  [(HUItemTableViewController *)self itemManagerDidUpdate:a3];
  [(HUItemTableViewController *)self cleanupRecentlyRemovedModuleControllers];
  if ([v10 count] || objc_msgSend(v11, "count") || objc_msgSend(v12, "count"))
  {
    uint64_t v18 = MEMORY[0x1E4F143A8];
    uint64_t v19 = 3221225472;
    uint64_t v20 = __89__HUItemTableViewController_diffableDataItemManager_didUpdateItems_addItems_removeItems___block_invoke;
    id v21 = &unk_1E63850E0;
    id v22 = v10;
    long long v23 = self;
    int v13 = (void (**)(void))_Block_copy(&v18);
    objc_super v14 = [(HUItemTableViewController *)self itemManager];
    BOOL v15 = [(HUItemTableViewController *)self shouldPerformUpdateWithAnimationForDiffableDataItemManager:v14];

    if (v15)
    {
      objc_super v16 = [(HUItemTableViewController *)self tableView];
      [v16 beginUpdates];

      v13[2](v13);
      uint64_t v17 = [(HUItemTableViewController *)self tableView];
      [v17 endUpdates];
    }
    else
    {
      v13[2](v13);
    }
  }
}

uint64_t __89__HUItemTableViewController_diffableDataItemManager_didUpdateItems_addItems_removeItems___block_invoke(uint64_t a1)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __89__HUItemTableViewController_diffableDataItemManager_didUpdateItems_addItems_removeItems___block_invoke_2;
  v3[3] = &unk_1E63889F8;
  v1 = *(void **)(a1 + 32);
  v3[4] = *(void *)(a1 + 40);
  return objc_msgSend(v1, "na_each:", v3);
}

void __89__HUItemTableViewController_diffableDataItemManager_didUpdateItems_addItems_removeItems___block_invoke_2(uint64_t a1, void *a2)
{
  id v7 = a2;
  double v3 = [*(id *)(a1 + 32) itemManager];
  double v4 = [v3 indexPathForItem:v7];

  id v5 = [*(id *)(a1 + 32) tableView];
  id v6 = [v5 cellForRowAtIndexPath:v4];

  if (v6) {
    [*(id *)(a1 + 32) _dispatchUpdateForCell:v6 item:v7 indexPath:v4 animated:1];
  }
}

- (void)itemManagerDidUpdate:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  [(HUItemTableViewController *)self _updatePreferredContentSizeIfNecessary];
  if (![(HUItemTableViewController *)self hasFinishedInitialLoad])
  {
    [(HUItemTableViewController *)self setHasFinishedInitialLoad:1];
    double v4 = HFLogForCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = (objc_class *)objc_opt_class();
      id v6 = NSStringFromClass(v5);
      int v7 = 138412290;
      id v8 = v6;
      _os_log_impl(&dword_1BE345000, v4, OS_LOG_TYPE_DEFAULT, "%@: finished initial load", (uint8_t *)&v7, 0xCu);
    }
  }
}

- (BOOL)shouldPerformUpdateWithAnimationForDiffableDataItemManager:(id)a3
{
  double v3 = [(HUItemTableViewController *)self view];
  double v4 = [v3 window];
  BOOL v5 = v4 != 0;

  return v5;
}

- (int64_t)_rowAnimationForOperationType:(unint64_t)a3 item:(id)a4
{
  id v6 = a4;
  int v7 = [(HUItemTableViewController *)self moduleControllerForItem:v6];
  id v8 = v7;
  if (v7) {
    int64_t v9 = [v7 rowAnimationForOperationType:a3 item:v6 suggestedAnimation:0];
  }
  else {
    int64_t v9 = 0;
  }

  return v9;
}

- (id)itemManager:(id)a3 futureToUpdateItems:(id)a4 itemUpdateOptions:(id)a5
{
  id v6 = a5;
  int v7 = [MEMORY[0x1E4F69138] sharedInstance];
  if (![v7 runningState])
  {

    goto LABEL_7;
  }
  id v8 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F68720]];
  char v9 = [v8 BOOLValue];

  if (v9)
  {
LABEL_7:
    id v11 = [MEMORY[0x1E4F7A0D8] futureWithResult:MEMORY[0x1E4F1CC38]];
    goto LABEL_8;
  }
  id v10 = HFLogForCategory();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)objc_super v14 = 0;
    _os_log_impl(&dword_1BE345000, v10, OS_LOG_TYPE_DEFAULT, "Delaying full item update until the application is active", v14, 2u);
  }

  id v11 = objc_alloc_init(MEMORY[0x1E4F7A0D8]);
  id v12 = [(HUItemTableViewController *)self foregroundUpdateFutures];
  [v12 addObject:v11];

LABEL_8:

  return v11;
}

- (void)itemManager:(id)a3 performUpdateRequest:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  if ([(HUItemTableViewController *)self viewHasAppeared]
    && -[HUItemTableViewController alwaysUseDeltaTableViewUpdatesAfterViewHasAppeared](self, "alwaysUseDeltaTableViewUpdatesAfterViewHasAppeared")|| -[HUItemTableViewController bypassInitialItemUpdateReload](self, "bypassInitialItemUpdateReload")|| ([v6 isInitialUpdate] & 1) == 0&& (-[HUItemTableViewController isViewLoaded](self, "isViewLoaded") & 1) != 0)
  {
    if (![(HUItemTableViewController *)self hasForcedLoadingVisibleCells])
    {
      int v7 = [(HUItemTableViewController *)self tableView];
      id v8 = (id)[v7 visibleCells];

      [(HUItemTableViewController *)self setHasForcedLoadingVisibleCells:1];
    }
    char v9 = [(HUItemTableViewController *)self tableView];
    [v9 beginUpdates];

    [v6 performWithOptions:0];
    id v10 = [(HUItemTableViewController *)self tableView];
    [v10 endUpdates];

    [(HUItemTableViewController *)self _updateHeadersAndFootersIfNeededAfterPerformingRequest:v6];
  }
  else
  {
    [v6 performWithOptions:1];
    if ([(HUItemTableViewController *)self isViewLoaded])
    {
      id v11 = [(HUItemTableViewController *)self tableView];
      [v11 reloadData];
    }
  }
  [(HUItemTableViewController *)self itemManagerDidUpdate:v12];
}

- (void)itemManager:(id)a3 didUpdateResultsForItem:(id)a4 atIndexPath:(id)a5
{
  id v10 = a4;
  id v7 = a5;
  id v8 = [(HUItemTableViewController *)self tableView];
  char v9 = [v8 cellForRowAtIndexPath:v7];

  if (v9) {
    [(HUItemTableViewController *)self _dispatchUpdateForCell:v9 item:v10 indexPath:v7 animated:1];
  }
}

- (void)itemManager:(id)a3 didRemoveItem:(id)a4 atIndexPath:(id)a5
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v7 = a5;
  int64_t v8 = [(HUItemTableViewController *)self _rowAnimationForOperationType:2 item:a4];
  char v9 = [(HUItemTableViewController *)self tableView];
  v11[0] = v7;
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];

  [v9 deleteRowsAtIndexPaths:v10 withRowAnimation:v8];
}

- (void)itemManager:(id)a3 didInsertItem:(id)a4 atIndexPath:(id)a5
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v7 = a5;
  int64_t v8 = [(HUItemTableViewController *)self _rowAnimationForOperationType:1 item:a4];
  char v9 = [(HUItemTableViewController *)self tableView];
  v11[0] = v7;
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];

  [v9 insertRowsAtIndexPaths:v10 withRowAnimation:v8];
}

- (void)itemManager:(id)a3 didMoveItem:(id)a4 fromIndexPath:(id)a5 toIndexPath:(id)a6
{
  id v14 = a4;
  id v9 = a5;
  id v10 = a6;
  id v11 = [(HUItemTableViewController *)self tableView];
  id v12 = [v11 cellForRowAtIndexPath:v9];

  if (v12) {
    [(HUItemTableViewController *)self _dispatchUpdateForCell:v12 item:v14 indexPath:v9 animated:1];
  }
  int v13 = [(HUItemTableViewController *)self tableView];
  [v13 moveRowAtIndexPath:v9 toIndexPath:v10];
}

- (void)itemManager:(id)a3 didRemoveSections:(id)a4
{
  id v5 = a4;
  id v6 = [(HUItemTableViewController *)self tableView];
  [v6 deleteSections:v5 withRowAnimation:0];
}

- (void)itemManager:(id)a3 didInsertSections:(id)a4
{
  id v5 = a4;
  id v6 = [(HUItemTableViewController *)self tableView];
  [v6 insertSections:v5 withRowAnimation:0];
}

- (void)itemManager:(id)a3 didMoveSection:(int64_t)a4 toSection:(int64_t)a5
{
  id v7 = [(HUItemTableViewController *)self tableView];
  [v7 moveSection:a4 toSection:a5];
}

- (void)itemManager:(id)a3 didUpdateResultsForSourceItem:(id)a4
{
  [(HUItemTableViewController *)self _updateTitle];

  [(HUItemTableViewController *)self _updateTableHeaderAndFooter];
}

- (void)itemManager:(id)a3 didChangeSourceItem:(id)a4
{
  [(HUItemTableViewController *)self _updateTitle];

  [(HUItemTableViewController *)self _updateTableHeaderAndFooter];
}

- (void)itemManager:(id)a3 didUpdateItemModules:(id)a4
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = [(HUItemTableViewController *)self itemModuleControllers];
  uint64_t v7 = objc_msgSend(v6, "na_map:", &__block_literal_global_212);

  int64_t v8 = (void *)MEMORY[0x1E4F69570];
  __int16 v32 = v5;
  id v9 = [MEMORY[0x1E4F1CAD0] setWithArray:v5];
  id v31 = (void *)v7;
  id v10 = [v8 diffFromSet:v7 toSet:v9];

  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v11 = [v10 additions];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v39 objects:v50 count:16];
  int v13 = &OBJC_IVAR___HUEditRoomViewController__roomBuilder;
  if (v12)
  {
    uint64_t v14 = v12;
    uint64_t v15 = *(void *)v40;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v40 != v15) {
          objc_enumerationMutation(v11);
        }
        uint64_t v17 = *(void *)(*((void *)&v39 + 1) + 8 * i);
        uint64_t v18 = [(HUItemTableViewController *)self buildItemModuleControllerForModule:v17];
        uint64_t v19 = v18;
        if (v18)
        {
          [v18 setHost:self];
          [v19 setHostType:1];
          [(NSMutableSet *)self->_internalItemModuleControllers addObject:v19];
        }
        else
        {
          NSLog(&cfstr_NoModuleContro_0.isa, v17, self);
        }
      }
      uint64_t v14 = [v11 countByEnumeratingWithState:&v39 objects:v50 count:16];
    }
    while (v14);
  }

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  obuint64_t j = [v10 deletions];
  uint64_t v20 = [obj countByEnumeratingWithState:&v35 objects:v49 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v36;
    do
    {
      for (uint64_t j = 0; j != v21; ++j)
      {
        if (*(void *)v36 != v22) {
          objc_enumerationMutation(obj);
        }
        uint64_t v24 = *(void *)(*((void *)&v35 + 1) + 8 * j);
        uint64_t v25 = v13[989];
        uint64_t v26 = *(Class *)((char *)&self->super.super.super.super.super.isa + v25);
        v34[0] = MEMORY[0x1E4F143A8];
        v34[1] = 3221225472;
        v34[2] = __62__HUItemTableViewController_itemManager_didUpdateItemModules___block_invoke_2;
        v34[3] = &unk_1E638E378;
        v34[4] = v24;
        uint64_t v27 = objc_msgSend(v26, "na_firstObjectPassingTest:", v34);
        if (v27)
        {
          id v28 = v13;
          [*(id *)((char *)&self->super.super.super.super.super.isa + v25) removeObject:v27];
          id v29 = HFLogForCategory();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            __int16 v30 = [v27 moduleIdentifier];
            *(_DWORD *)buf = 138412802;
            id v44 = self;
            __int16 v45 = 2112;
            v46 = v27;
            __int16 v47 = 2112;
            v48 = v30;
            _os_log_impl(&dword_1BE345000, v29, OS_LOG_TYPE_DEFAULT, "%@: Starting removal of module controller %@ (%@) because module was deleted. Adding to recently removed for safety", buf, 0x20u);
          }
          [(NSMutableSet *)self->_recentlyRemovedItemModuleControllers addObject:v27];
          int v13 = v28;
        }
      }
      uint64_t v21 = [obj countByEnumeratingWithState:&v35 objects:v49 count:16];
    }
    while (v21);
  }
}

uint64_t __62__HUItemTableViewController_itemManager_didUpdateItemModules___block_invoke(uint64_t a1, void *a2)
{
  return [a2 module];
}

BOOL __62__HUItemTableViewController_itemManager_didUpdateItemModules___block_invoke_2(uint64_t a1, void *a2)
{
  double v3 = [a2 module];
  BOOL v4 = v3 == *(void **)(a1 + 32);

  return v4;
}

- (void)expandableTextViewCellStateDidChange:(id)a3
{
  id v3 = [(HUItemTableViewController *)self tableView];
  [v3 reloadData];
}

- (void)highlightItemAnimated:(id)a3
{
}

- (void)highlightItemAnimated:(id)a3 duration:(double)a4
{
  id v6 = a3;
  if (_MergedGlobals_2_2 != -1) {
    dispatch_once(&_MergedGlobals_2_2, &__block_literal_global_221);
  }
  id v7 = (id)qword_1EA12E1B8;
  int64_t v8 = [(HUItemTableViewController *)self itemManager];
  id v9 = [v8 allItems];
  int v10 = [v9 containsObject:v6];

  if (v10)
  {
    id v11 = [(HUItemTableViewController *)self tableView];
    uint64_t v12 = [(HUItemTableViewController *)self itemManager];
    int v13 = [v12 indexPathForItem:v6];
    uint64_t v14 = [v11 cellForRowAtIndexPath:v13];

    if (v14)
    {
      objc_initWeak(&location, v14);
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __60__HUItemTableViewController_highlightItemAnimated_duration___block_invoke_3;
      v15[3] = &unk_1E638C858;
      objc_copyWeak(v17, &location);
      dispatch_queue_t v16 = (dispatch_queue_t)v7;
      v17[1] = *(id *)&a4;
      dispatch_async(v16, v15);

      objc_destroyWeak(v17);
      objc_destroyWeak(&location);
    }
  }
}

void __60__HUItemTableViewController_highlightItemAnimated_duration___block_invoke_2()
{
  id v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.Home.itemTableViewController.highlightQueue", v2);
  v1 = (void *)qword_1EA12E1B8;
  qword_1EA12E1B8 = (uint64_t)v0;
}

void __60__HUItemTableViewController_highlightItemAnimated_duration___block_invoke_3(id *a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__HUItemTableViewController_highlightItemAnimated_duration___block_invoke_4;
  block[3] = &unk_1E638C858;
  objc_copyWeak(v4, a1 + 5);
  id v3 = a1[4];
  v4[1] = a1[6];
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(v4);
}

void __60__HUItemTableViewController_highlightItemAnimated_duration___block_invoke_4(uint64_t a1)
{
  id v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained setHighlighted:1 animated:1];

  BOOL v4 = *(NSObject **)(a1 + 32);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __60__HUItemTableViewController_highlightItemAnimated_duration___block_invoke_5;
  v5[3] = &unk_1E6386BC0;
  v6[1] = *(id *)(a1 + 48);
  objc_copyWeak(v6, v2);
  dispatch_async(v4, v5);
  objc_destroyWeak(v6);
}

void __60__HUItemTableViewController_highlightItemAnimated_duration___block_invoke_5(uint64_t a1)
{
  [MEMORY[0x1E4F29060] sleepForTimeInterval:*(double *)(a1 + 40)];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__HUItemTableViewController_highlightItemAnimated_duration___block_invoke_6;
  block[3] = &unk_1E63862A0;
  objc_copyWeak(&v3, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x1E4F14428], block);
  objc_destroyWeak(&v3);
}

void __60__HUItemTableViewController_highlightItemAnimated_duration___block_invoke_6(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setHighlighted:0 animated:1];
}

- (void)scrollToItem:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [[HUItemTableViewScrollDestination alloc] initWithItem:v6 animated:v4];

  if ([(HUItemTableViewController *)self appearState] == 1
    || [(HUItemTableViewController *)self appearState] == 2)
  {
    [(HUItemTableViewController *)self _scrollToDestination:v7];
  }
  else
  {
    [(HUItemTableViewController *)self setPendingScrollDestination:v7];
  }
}

- (void)textFieldDidBeginEditing:(id)a3
{
  id v7 = a3;
  BOOL v4 = -[HUItemTableViewController _itemForTextField:](self, "_itemForTextField:");
  id v5 = [(HUItemTableViewController *)self moduleControllerForItem:v4];
  id v6 = v5;
  if (v4 && v5)
  {
    [v5 textFieldDidBeginEditing:v7 item:v4];
  }
  else if (!v4)
  {
    goto LABEL_7;
  }
  if ([(HUItemTableViewController *)self shouldManageTextFieldForItem:v4]) {
    [(HUItemTableViewController *)self textFieldDidBeginEditing:v7 item:v4];
  }
LABEL_7:
}

- (BOOL)textFieldShouldClear:(id)a3
{
  id v4 = a3;
  id v5 = [(HUItemTableViewController *)self _itemForTextField:v4];
  id v6 = [(HUItemTableViewController *)self moduleControllerForItem:v5];
  id v7 = v6;
  if (v5)
  {
    if ([v6 shouldManageTextFieldForItem:v5]) {
      [v7 textDidChange:&stru_1F18F92B8 forTextField:v4 item:v5];
    }
    if ([(HUItemTableViewController *)self shouldManageTextFieldForItem:v5]) {
      [(HUItemTableViewController *)self textDidChange:&stru_1F18F92B8 forTextField:v4 item:v5];
    }
  }

  return 1;
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  return 1;
}

- (void)textFieldDidEndEditing:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HUItemTableViewController *)self _itemForTextField:v4];
  id v6 = HFLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [v4 text];
    int v10 = 138412546;
    id v11 = v5;
    __int16 v12 = 2112;
    int v13 = v7;
    _os_log_impl(&dword_1BE345000, v6, OS_LOG_TYPE_DEFAULT, "User finished editing text field for %@, entered: %@", (uint8_t *)&v10, 0x16u);
  }
  int64_t v8 = [(HUItemTableViewController *)self moduleControllerForItem:v5];
  id v9 = v8;
  if (v5)
  {
    if ([v8 shouldManageTextFieldForItem:v5]) {
      [v9 textFieldDidEndEditing:v4 item:v5];
    }
    if ([(HUItemTableViewController *)self shouldManageTextFieldForItem:v5]) {
      [(HUItemTableViewController *)self textFieldDidEndEditing:v4 item:v5];
    }
  }
}

- (void)textFieldDidChange:(id)a3
{
  id v9 = [a3 object];
  id v4 = -[HUItemTableViewController _itemForTextField:](self, "_itemForTextField:");
  id v5 = [(HUItemTableViewController *)self moduleControllerForItem:v4];
  id v6 = v5;
  if (v4)
  {
    if ([v5 shouldManageTextFieldForItem:v4])
    {
      id v7 = [v9 text];
      [v6 textDidChange:v7 forTextField:v9 item:v4];
    }
    if ([(HUItemTableViewController *)self shouldManageTextFieldForItem:v4])
    {
      int64_t v8 = [v9 text];
      [(HUItemTableViewController *)self textDidChange:v8 forTextField:v9 item:v4];
    }
  }
}

- (id)hu_preloadContent
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if ([(HUItemTableViewController *)self hasFinishedInitialLoad])
  {
    id v3 = [MEMORY[0x1E4F7A0D8] futureWithNoResult];
  }
  else
  {
    id v4 = [(HUItemTableViewController *)self itemManager];
    char v5 = [v4 diffableDataSourceDisabled];

    if ((v5 & 1) == 0) {
      [(HUItemTableViewController *)self loadViewIfNeeded];
    }
    if (![(id)objc_opt_class() updateMode]
      && ![(HUItemTableViewController *)self visibilityUpdatesEnabled])
    {
      id v6 = [(HUItemTableViewController *)self itemManager];
      [v6 endDisableExternalUpdatesWithReason:@"HUItemTableViewController_NotVisible"];

      [(HUItemTableViewController *)self setVisibilityUpdatesEnabled:1];
    }
    id v7 = [(HUItemTableViewController *)self itemManager];
    int v8 = [v7 diffableDataSourceDisabled];

    if (v8) {
      [(HUItemTableViewController *)self loadViewIfNeeded];
    }
    id v9 = (void *)MEMORY[0x1E4F1CA48];
    int v10 = [(HUItemTableViewController *)self itemManager];
    id v11 = [v10 firstFastUpdateFuture];
    __int16 v12 = [v9 arrayWithObject:v11];

    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    int v13 = [(HUItemTableViewController *)self childViewControllersToPreload];
    uint64_t v14 = [v13 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v23 != v16) {
            objc_enumerationMutation(v13);
          }
          uint64_t v18 = objc_msgSend(*(id *)(*((void *)&v22 + 1) + 8 * i), "hu_preloadContent");
          objc_msgSend(v12, "na_safeAddObject:", v18);
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v15);
    }

    uint64_t v19 = (void *)MEMORY[0x1E4F7A0D8];
    uint64_t v20 = [MEMORY[0x1E4F7A0F0] mainThreadScheduler];
    id v3 = [v19 combineAllFutures:v12 ignoringErrors:1 scheduler:v20];
  }

  return v3;
}

- (void)executionEnvironmentRunningStateDidChange:(id)a3
{
  if (![a3 runningState])
  {
    id v4 = HFLogForCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl(&dword_1BE345000, v4, OS_LOG_TYPE_DEFAULT, "Proceeding with full item update(s)", v6, 2u);
    }

    char v5 = [(HUItemTableViewController *)self foregroundUpdateFutures];
    objc_msgSend(v5, "na_each:", &__block_literal_global_230);
  }
}

uint64_t __71__HUItemTableViewController_executionEnvironmentRunningStateDidChange___block_invoke(uint64_t a1, void *a2)
{
  return [a2 finishWithResult:MEMORY[0x1E4F1CC38]];
}

- (HFItem)hu_presentedItem
{
  id v2 = [(HUItemTableViewController *)self itemManager];
  id v3 = [v2 sourceItem];

  return (HFItem *)v3;
}

+ (unint64_t)updateMode
{
  return 0;
}

- (void)recursivelyDisableItemUpdates:(BOOL)a3 withReason:(id)a4
{
  BOOL v4 = a3;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = [(HUItemTableViewController *)self itemManager];
  int v8 = v7;
  if (v4) {
    [v7 disableExternalUpdatesWithReason:v6];
  }
  else {
    [v7 endDisableExternalUpdatesWithReason:v6];
  }

  id v9 = (void *)MEMORY[0x1E4F1CA80];
  int v10 = [(HUItemTableViewController *)self childViewControllers];
  id v11 = [v9 setWithArray:v10];

  __int16 v12 = [(HUItemTableViewController *)self childViewControllersToPreload];
  [v11 addObjectsFromArray:v12];

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v13 = v11;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v20 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        if (objc_msgSend(v18, "conformsToProtocol:", &unk_1F19C08E8, (void)v19)) {
          [v18 recursivelyDisableItemUpdates:v4 withReason:v6];
        }
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v15);
  }
}

- (id)moduleController:(id)a3 presentViewControllerForRequest:(id)a4
{
  id v5 = a4;
  [(HUItemTableViewController *)self _transformViewControllerForRequest:v5];
  id v6 = [(UIViewController *)self hu_performPresentationRequest:v5];

  return v6;
}

- (void)_transformViewControllerForRequest:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  id v5 = [v4 viewController];

  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v18 = v6;

  id v7 = v18;
  if (v18)
  {
    uint64_t v8 = [v18 preferredStyle];
    id v7 = v18;
    if (!v8)
    {
      uint64_t v9 = [v18 popoverPresentationController];
      id v7 = v18;
      if (v9)
      {
        int v10 = (void *)v9;
        id v11 = [v18 popoverPresentationController];
        __int16 v12 = [v11 sourceView];

        id v7 = v18;
        if (!v12)
        {
          id v13 = [(HUItemTableViewController *)self tableView];
          uint64_t v14 = [v13 indexPathForSelectedRow];

          if (v14)
          {
            uint64_t v15 = [(HUItemTableViewController *)self tableView];
            uint64_t v16 = [v15 cellForRowAtIndexPath:v14];

            if (!v16)
            {
              uint64_t v16 = [(HUItemTableViewController *)self tableView];
            }
            uint64_t v17 = [v18 popoverPresentationController];
            [v17 setSourceView:v16];
          }
          id v7 = v18;
        }
      }
    }
  }
}

- (id)moduleController:(id)a3 dismissViewControllerForRequest:(id)a4
{
  return [(UIViewController *)self hu_performDismissalRequest:a4];
}

- (id)moduleController:(id)a3 textFieldForVisibleItem:(id)a4
{
  return [(HUItemTableViewController *)self textFieldForVisibleItem:a4];
}

- (void)updateCellForItems:(id)a3
{
  id v4 = a3;
  id v5 = [(HUItemTableViewController *)self itemManager];
  int v6 = [v5 diffableDataSourceDisabled];

  if (v6)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __48__HUItemTableViewController_updateCellForItems___block_invoke;
    v10[3] = &unk_1E638E3C0;
    v10[4] = self;
    uint64_t v7 = objc_msgSend(v4, "na_map:", v10);

    uint64_t v8 = [(HUItemTableViewController *)self tableView];
    [v8 reloadRowsAtIndexPaths:v7 withRowAnimation:5];

    id v4 = (id)v7;
  }
  else
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __48__HUItemTableViewController_updateCellForItems___block_invoke_2;
    v9[3] = &unk_1E63889F8;
    v9[4] = self;
    objc_msgSend(v4, "na_each:", v9);
  }
}

id __48__HUItemTableViewController_updateCellForItems___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 itemManager];
  id v5 = [v4 indexPathForItem:v3];

  return v5;
}

void __48__HUItemTableViewController_updateCellForItems___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v7 = [v3 itemManager];
  id v5 = [*(id *)(a1 + 32) itemManager];
  int v6 = [v5 indexPathForItem:v4];
  [v3 itemManager:v7 didUpdateResultsForItem:v4 atIndexPath:v6];
}

- (void)reloadCellForItems:(id)a3 withDiffableDataSourceReload:(BOOL)a4
{
  id v5 = a3;
  int v6 = [(HUItemTableViewController *)self itemManager];
  int v7 = [v6 diffableDataSourceDisabled];

  if (v7)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    void v11[2] = __77__HUItemTableViewController_reloadCellForItems_withDiffableDataSourceReload___block_invoke;
    v11[3] = &unk_1E638E3C0;
    void v11[4] = self;
    uint64_t v8 = objc_msgSend(v5, "na_map:", v11);
    uint64_t v9 = [(HUItemTableViewController *)self tableView];
    [v9 reloadRowsAtIndexPaths:v8 withRowAnimation:5];
  }
  else
  {
    int v10 = [(HUItemTableViewController *)self itemManager];
    [v10 reloadUIRepresentationForItems:v5 withAnimation:0];
  }
}

id __77__HUItemTableViewController_reloadCellForItems_withDiffableDataSourceReload___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 itemManager];
  id v5 = [v4 indexPathForItem:v3];

  return v5;
}

- (BOOL)wantsPreferredContentSize
{
  return self->_wantsPreferredContentSize;
}

- (unint64_t)appearState
{
  return self->_appearState;
}

- (void)setAppearState:(unint64_t)a3
{
  self->_appearState = a3;
}

- (BOOL)viewHasAppeared
{
  return self->_viewHasAppeared;
}

- (void)setViewHasAppeared:(BOOL)a3
{
  self->_viewHasAppeared = a3;
}

- (BOOL)hasForcedLoadingVisibleCells
{
  return self->_hasForcedLoadingVisibleCells;
}

- (void)setHasForcedLoadingVisibleCells:(BOOL)a3
{
  self->_hasForcedLoadingVisibleCells = a3;
}

- (HUItemTableViewScrollDestination)pendingScrollDestination
{
  return self->_pendingScrollDestination;
}

- (void)setPendingScrollDestination:(id)a3
{
}

- (HFItemManager)itemManager
{
  return self->_itemManager;
}

- (void)setItemManager:(id)a3
{
}

- (NSMutableSet)internalItemModuleControllers
{
  return self->_internalItemModuleControllers;
}

- (NSMutableSet)recentlyRemovedItemModuleControllers
{
  return self->_recentlyRemovedItemModuleControllers;
}

- (BOOL)hasFinishedInitialLoad
{
  return self->_hasFinishedInitialLoad;
}

- (void)setHasFinishedInitialLoad:(BOOL)a3
{
  self->_hasFinishedInitialLoad = a3;
}

- (NSMutableArray)foregroundUpdateFutures
{
  return self->_foregroundUpdateFutures;
}

- (void)setForegroundUpdateFutures:(id)a3
{
}

- (NSMutableSet)registeredCellClasses
{
  return self->_registeredCellClasses;
}

- (BOOL)automaticallyUpdatesViewControllerTitle
{
  return self->_automaticallyUpdatesViewControllerTitle;
}

- (BOOL)visibilityUpdatesEnabled
{
  return self->_visibilityUpdatesEnabled;
}

- (void)setVisibilityUpdatesEnabled:(BOOL)a3
{
  self->_visibilityUpdatesEnabled = a3;
}

- (NACancelable)deferredVisibilityUpdate
{
  return self->_deferredVisibilityUpdate;
}

- (void)setDeferredVisibilityUpdate:(id)a3
{
}

- (NSMapTable)textFieldToCellMap
{
  return self->_textFieldToCellMap;
}

- (HUGridLayoutOptions)gridLayoutOptions
{
  return self->_gridLayoutOptions;
}

- (UIVisualEffectView)backgroundVisualEffectView
{
  return self->_backgroundVisualEffectView;
}

- (void)setBackgroundVisualEffectView:(id)a3
{
}

- (BOOL)shouldUseAlternateCellColor
{
  return self->_shouldUseAlternateCellColor;
}

- (void)setShouldUseAlternateCellColor:(BOOL)a3
{
  self->_shouldUseAlternateCellColor = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundVisualEffectView, 0);
  objc_storeStrong((id *)&self->_gridLayoutOptions, 0);
  objc_storeStrong((id *)&self->_textFieldToCellMap, 0);
  objc_storeStrong((id *)&self->_deferredVisibilityUpdate, 0);
  objc_storeStrong((id *)&self->_registeredCellClasses, 0);
  objc_storeStrong((id *)&self->_foregroundUpdateFutures, 0);
  objc_storeStrong((id *)&self->_recentlyRemovedItemModuleControllers, 0);
  objc_storeStrong((id *)&self->_internalItemModuleControllers, 0);
  objc_storeStrong((id *)&self->_itemManager, 0);

  objc_storeStrong((id *)&self->_pendingScrollDestination, 0);
}

@end