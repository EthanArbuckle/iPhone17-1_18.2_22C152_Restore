@interface HUSideBarViewController
- (BOOL)collectionView:(id)a3 canMoveItemAtIndexPath:(id)a4;
- (BOOL)hideRoomSection;
- (BOOL)shouldUseDashboardEffects;
- (Class)cellClassForItem:(id)a3 indexPath:(id)a4;
- (HMHome)home;
- (HUSideBarDelegate)sideBarDelegate;
- (HUSideBarViewController)initWithDelegate:(id)a3 forHome:(id)a4;
- (UIView)blurView;
- (id)collectionView:(id)a3 dropSessionDidUpdate:(id)a4 withDestinationIndexPath:(id)a5;
- (id)collectionView:(id)a3 targetIndexPathForMoveOfItemFromOriginalIndexPath:(id)a4 atCurrentIndexPath:(id)a5 toProposedIndexPath:(id)a6;
- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5;
- (int64_t)preferredStatusBarStyle;
- (void)_selectItemAtIndexPath:(id)a3;
- (void)_sendSideBarInteractionEventForItem:(id)a3;
- (void)_updateAppearance;
- (void)_updateBlurView;
- (void)_updateNavigationBar;
- (void)_updateShouldUseDashboardEffects;
- (void)_updateSplitViewSeparator;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 moveItemAtIndexPath:(id)a4 toIndexPath:(id)a5;
- (void)collectionView:(id)a3 performDropWithCoordinator:(id)a4;
- (void)configureCell:(id)a3 forItem:(id)a4;
- (void)didReorderItemWithSortedItemsBySectionID:(id)a3;
- (void)diffableDataItemManager:(id)a3 didUpdateItems:(id)a4 addItems:(id)a5 removeItems:(id)a6;
- (void)home:(id)a3 didAddAccessory:(id)a4;
- (void)home:(id)a3 didRemoveAccessory:(id)a4;
- (void)homeDidUpdateAccessControlForCurrentUser:(id)a3;
- (void)homeDidUpdateApplicationData:(id)a3;
- (void)homeDidUpdateHomeLocationStatus:(id)a3;
- (void)homeDidUpdateToROAR:(id)a3;
- (void)refreshSideBarSelection;
- (void)restrictedGuestAllowedPeriodEnded:(id)a3;
- (void)restrictedGuestAllowedPeriodStarted:(id)a3;
- (void)setBlurView:(id)a3;
- (void)setHideRoomSection:(BOOL)a3;
- (void)setHome:(id)a3;
- (void)setShouldUseDashboardEffects:(BOOL)a3;
- (void)setSideBarDelegate:(id)a3;
- (void)switchToDiscover;
- (void)switchToSelectedHome:(id)a3;
- (void)updateSelectionToItem:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation HUSideBarViewController

- (HUSideBarViewController)initWithDelegate:(id)a3 forHome:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = [[HUSideBarItemManager alloc] initWithDelegate:self];
  v10 = objc_opt_new();
  v18.receiver = self;
  v18.super_class = (Class)HUSideBarViewController;
  v11 = [(HUItemCollectionViewController *)&v18 initWithItemManager:v9 collectionViewLayout:v10];

  if (v11)
  {
    objc_storeWeak((id *)&v11->_sideBarDelegate, v7);
    v12 = [(HUItemCollectionViewController *)v11 itemManager];
    id v13 = (id)[v12 reloadAndUpdateAllItemsFromSenderSelector:a2];

    objc_storeStrong((id *)&v11->_home, a4);
    v14 = [v8 accessories];
    v11->_hideRoomSection = [v14 count] == 0;

    v15 = [MEMORY[0x1E4F691A0] sharedDispatcher];
    [v15 addHomeObserver:v11];

    v16 = HFLocalizedString();
    [(HUSideBarViewController *)v11 setTitle:v16];
  }
  return v11;
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)HUSideBarViewController;
  [(HUItemCollectionViewController *)&v4 viewWillAppear:a3];
  [(HUSideBarViewController *)self _updateSplitViewSeparator];
}

- (void)viewDidAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)HUSideBarViewController;
  [(HUItemCollectionViewController *)&v6 viewDidAppear:a3];
  objc_super v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1BE345000, v4, OS_LOG_TYPE_DEFAULT, "refresh sidebar selection after view did appear", v5, 2u);
  }

  [(HUSideBarViewController *)self refreshSideBarSelection];
}

- (void)viewDidLoad
{
  v29.receiver = self;
  v29.super_class = (Class)HUSideBarViewController;
  [(HUItemCollectionViewController *)&v29 viewDidLoad];
  v3 = [MEMORY[0x1E4F428B8] clearColor];
  objc_super v4 = [(HUSideBarViewController *)self collectionView];
  [v4 setBackgroundColor:v3];

  v5 = [(HUSideBarViewController *)self collectionView];
  [v5 setAlwaysBounceVertical:1];

  objc_super v6 = [(HUSideBarViewController *)self collectionView];
  [v6 setDelegate:self];

  id v7 = [(HUSideBarViewController *)self collectionView];
  [v7 setDropDelegate:self];

  id v8 = [(HUSideBarViewController *)self collectionView];
  uint64_t v9 = objc_opt_class();
  v10 = (objc_class *)objc_opt_class();
  v11 = NSStringFromClass(v10);
  [v8 registerClass:v9 forCellWithReuseIdentifier:v11];

  v12 = [(HUSideBarViewController *)self collectionView];
  uint64_t v13 = objc_opt_class();
  uint64_t v14 = *MEMORY[0x1E4F43F98];
  v15 = (objc_class *)objc_opt_class();
  v16 = NSStringFromClass(v15);
  [v12 registerClass:v13 forSupplementaryViewOfKind:v14 withReuseIdentifier:v16];

  v17 = [(HUSideBarViewController *)self collectionView];
  [v17 setSelectionFollowsFocus:1];

  id v18 = objc_alloc(MEMORY[0x1E4F42870]);
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __38__HUSideBarViewController_viewDidLoad__block_invoke;
  v28[3] = &unk_1E6385E08;
  v28[4] = self;
  v19 = (void *)[v18 initWithSectionProvider:v28];
  v20 = [(HUSideBarViewController *)self collectionView];
  [v20 setCollectionViewLayout:v19];

  v21 = (UIView *)objc_opt_new();
  blurView = self->_blurView;
  self->_blurView = v21;

  [(UIView *)self->_blurView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(HUSideBarViewController *)self _updateBlurView];
  v23 = [(HUSideBarViewController *)self view];
  [v23 addSubview:self->_blurView];

  v24 = [(HUSideBarViewController *)self view];
  [v24 sendSubviewToBack:self->_blurView];

  v25 = (void *)MEMORY[0x1E4F28DC8];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __38__HUSideBarViewController_viewDidLoad__block_invoke_2;
  v27[3] = &unk_1E6385E30;
  v27[4] = self;
  v26 = __38__HUSideBarViewController_viewDidLoad__block_invoke_2((uint64_t)v27);
  [v25 activateConstraints:v26];
}

id __38__HUSideBarViewController_viewDidLoad__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  objc_super v6 = (void *)[objc_alloc(MEMORY[0x1E4F43110]) initWithAppearanceStyle:3 layoutEnvironment:v5];
  id v7 = [*(id *)(a1 + 32) itemManager];
  id v8 = [v7 titleForSection:a2];

  if ([v8 length]) {
    [v6 setSectionHeaderHeight:*MEMORY[0x1E4F43FA0]];
  }
  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F43108]) initWithConfiguration:v6 layoutEnvironment:v5];

  return v9;
}

id __38__HUSideBarViewController_viewDidLoad__block_invoke_2(uint64_t a1)
{
  v2 = objc_opt_new();
  v3 = [*(id *)(a1 + 32) blurView];
  objc_super v4 = [v3 leadingAnchor];
  id v5 = [*(id *)(a1 + 32) view];
  objc_super v6 = [v5 leadingAnchor];
  id v7 = [v4 constraintEqualToAnchor:v6];
  [v2 addObject:v7];

  id v8 = [*(id *)(a1 + 32) blurView];
  uint64_t v9 = [v8 trailingAnchor];
  v10 = [*(id *)(a1 + 32) view];
  v11 = [v10 trailingAnchor];
  v12 = [v9 constraintEqualToAnchor:v11];
  [v2 addObject:v12];

  uint64_t v13 = [*(id *)(a1 + 32) blurView];
  uint64_t v14 = [v13 bottomAnchor];
  v15 = [*(id *)(a1 + 32) view];
  v16 = [v15 bottomAnchor];
  v17 = [v14 constraintEqualToAnchor:v16];
  [v2 addObject:v17];

  id v18 = [*(id *)(a1 + 32) blurView];
  v19 = [v18 topAnchor];
  v20 = [*(id *)(a1 + 32) view];
  v21 = [v20 topAnchor];
  v22 = [v19 constraintEqualToAnchor:v21];
  [v2 addObject:v22];

  return v2;
}

- (int64_t)preferredStatusBarStyle
{
  return [(HUSideBarViewController *)self shouldUseDashboardEffects];
}

- (void)setHideRoomSection:(BOOL)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (self->_hideRoomSection != a3)
  {
    BOOL v3 = a3;
    self->_hideRoomSection = a3;
    objc_super v6 = [(HUItemCollectionViewController *)self itemManager];
    id v7 = (id)[v6 reloadAndUpdateAllItemsFromSenderSelector:a2];

    if (v3)
    {
      id v8 = [(HUSideBarViewController *)self sideBarDelegate];
      [v8 switchToHomeForTabIdentifier:*MEMORY[0x1E4F684F8]];

      uint64_t v9 = [(HUItemCollectionViewController *)self itemManager];
      v10 = [(HUItemCollectionViewController *)self itemManager];
      v11 = [v10 homeItem];
      v12 = [v9 indexPathForItem:v11];

      uint64_t v13 = [(HUSideBarViewController *)self collectionView];
      [v13 selectItemAtIndexPath:v12 animated:0 scrollPosition:0];

      uint64_t v14 = HFLogForCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v15 = [v12 section];
        uint64_t v16 = [v12 row];
        v17 = [(HUItemCollectionViewController *)self itemManager];
        id v18 = [v17 homeItem];
        int v19 = 134218498;
        uint64_t v20 = v15;
        __int16 v21 = 2048;
        uint64_t v22 = v16;
        __int16 v23 = 2112;
        v24 = v18;
        _os_log_impl(&dword_1BE345000, v14, OS_LOG_TYPE_DEFAULT, "switch to home tab since room section should now be hidden, select sidebar section: %ld row: %ld for selected item: %@", (uint8_t *)&v19, 0x20u);
      }
    }
  }
}

- (void)updateSelectionToItem:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HUItemCollectionViewController *)self itemManager];
  objc_super v6 = [v5 indexPathForItem:v4];

  if (v6)
  {
    id v7 = [(HUSideBarViewController *)self collectionView];
    [v7 selectItemAtIndexPath:v6 animated:0 scrollPosition:0];

    id v8 = HFLogForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 134218498;
      uint64_t v13 = [v6 section];
      __int16 v14 = 2048;
      uint64_t v15 = [v6 row];
      __int16 v16 = 2112;
      id v17 = v4;
      uint64_t v9 = "select sidebar section: %ld row: %ld for selected item: %@";
      v10 = v8;
      uint32_t v11 = 32;
LABEL_6:
      _os_log_impl(&dword_1BE345000, v10, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v12, v11);
    }
  }
  else
  {
    id v8 = HFLogForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412290;
      uint64_t v13 = (uint64_t)v4;
      uint64_t v9 = "invalid indexPath for item: %@";
      v10 = v8;
      uint32_t v11 = 12;
      goto LABEL_6;
    }
  }
}

- (void)switchToSelectedHome:(id)a3
{
  id v10 = a3;
  id v4 = [(HUSideBarViewController *)self home];
  char v5 = [v4 isEqual:v10];

  if ((v5 & 1) == 0)
  {
    [(HUSideBarViewController *)self setHome:v10];
    objc_super v6 = [v10 accessories];
    if ([v6 count]) {
      uint64_t v7 = objc_msgSend(v10, "hf_shouldBlockCurrentUserFromHome");
    }
    else {
      uint64_t v7 = 1;
    }
    [(HUSideBarViewController *)self setHideRoomSection:v7];

    id v8 = objc_msgSend(v10, "hf_reorderableRoomsList");
    uint64_t v9 = [(HUItemCollectionViewController *)self itemManager];
    [v9 setReorderableRoomList:v8];
  }
}

- (void)refreshSideBarSelection
{
  BOOL v3 = [(HUItemCollectionViewController *)self itemManager];
  id v4 = +[HUSideBarSelectionManager sharedManager];
  char v5 = [v4 currentSelectedItem];
  id v7 = [v3 indexPathForItem:v5];

  objc_super v6 = [(HUSideBarViewController *)self collectionView];
  [v6 selectItemAtIndexPath:v7 animated:0 scrollPosition:0];
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)HUSideBarViewController;
  id v6 = a4;
  [(HUItemCollectionViewController *)&v7 collectionView:a3 didSelectItemAtIndexPath:v6];
  -[HUSideBarViewController _selectItemAtIndexPath:](self, "_selectItemAtIndexPath:", v6, v7.receiver, v7.super_class);
}

- (void)_selectItemAtIndexPath:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = [(HUItemCollectionViewController *)self itemManager];
  id v6 = [v5 displayedItemAtIndexPath:v4];

  objc_opt_class();
  id v7 = v6;
  if (objc_opt_isKindOfClass()) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }
  id v9 = v8;

  if (v9)
  {
    id v10 = [(HUSideBarViewController *)self sideBarDelegate];
    uint32_t v11 = [v9 room];
    [v10 switchToRoom:v11];

    int v12 = HFLogForCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = [v9 room];
      int v33 = 136315394;
      v34 = "-[HUSideBarViewController _selectItemAtIndexPath:]";
      __int16 v35 = 2112;
      v36 = v13;
      _os_log_impl(&dword_1BE345000, v12, OS_LOG_TYPE_DEFAULT, "(%s) user select room tab %@", (uint8_t *)&v33, 0x16u);
    }
  }
  objc_opt_class();
  id v14 = v7;
  if (objc_opt_isKindOfClass()) {
    uint64_t v15 = v14;
  }
  else {
    uint64_t v15 = 0;
  }
  id v16 = v15;

  if (v16)
  {
    id v17 = [(HUSideBarViewController *)self sideBarDelegate];
    uint64_t v18 = [v16 accessoryTypeGroup];
    [v17 switchToAccessoryTypeGroup:v18];

    int v19 = HFLogForCategory();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v20 = [v16 accessoryTypeGroup];
      int v33 = 136315394;
      v34 = "-[HUSideBarViewController _selectItemAtIndexPath:]";
      __int16 v35 = 2112;
      v36 = v20;
      _os_log_impl(&dword_1BE345000, v19, OS_LOG_TYPE_DEFAULT, "(%s) user select accessory type group %@", (uint8_t *)&v33, 0x16u);
    }
  }
  objc_opt_class();
  id v21 = v14;
  if (objc_opt_isKindOfClass()) {
    uint64_t v22 = v21;
  }
  else {
    uint64_t v22 = 0;
  }
  id v23 = v22;

  if (v23)
  {
    if (![v23 type])
    {
      v24 = [(HUSideBarViewController *)self sideBarDelegate];
      uint64_t v25 = (void *)*MEMORY[0x1E4F684F8];
      [v24 switchToHomeForTabIdentifier:*MEMORY[0x1E4F684F8]];

      v26 = HFLogForCategory();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        int v33 = 136315394;
        v34 = "-[HUSideBarViewController _selectItemAtIndexPath:]";
        __int16 v35 = 2112;
        v36 = v25;
        _os_log_impl(&dword_1BE345000, v26, OS_LOG_TYPE_DEFAULT, "(%s) user select tab: %@", (uint8_t *)&v33, 0x16u);
      }
    }
    if ([v23 type] == 1)
    {
      v27 = [(HUSideBarViewController *)self sideBarDelegate];
      v28 = (void *)*MEMORY[0x1E4F68500];
      [v27 switchToHomeForTabIdentifier:*MEMORY[0x1E4F68500]];

      objc_super v29 = HFLogForCategory();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        int v33 = 136315394;
        v34 = "-[HUSideBarViewController _selectItemAtIndexPath:]";
        __int16 v35 = 2112;
        v36 = v28;
        _os_log_impl(&dword_1BE345000, v29, OS_LOG_TYPE_DEFAULT, "(%s) user select tab: %@", (uint8_t *)&v33, 0x16u);
      }
    }
    if ([v23 type] == 2)
    {
      v30 = [(HUSideBarViewController *)self sideBarDelegate];
      v31 = (void *)*MEMORY[0x1E4F684F0];
      [v30 switchToHomeForTabIdentifier:*MEMORY[0x1E4F684F0]];

      v32 = HFLogForCategory();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        int v33 = 136315394;
        v34 = "-[HUSideBarViewController _selectItemAtIndexPath:]";
        __int16 v35 = 2112;
        v36 = v31;
        _os_log_impl(&dword_1BE345000, v32, OS_LOG_TYPE_DEFAULT, "(%s) user select tab: %@", (uint8_t *)&v33, 0x16u);
      }
    }
  }
  [(HUSideBarViewController *)self _sendSideBarInteractionEventForItem:v21];
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  uint32_t v11 = [(HUItemCollectionViewController *)self itemManager];
  int v12 = objc_msgSend(v11, "titleForSection:", objc_msgSend(v8, "section"));

  objc_opt_class();
  uint64_t v13 = (objc_class *)objc_opt_class();
  id v14 = NSStringFromClass(v13);
  uint64_t v15 = [v10 dequeueReusableSupplementaryViewOfKind:v9 withReuseIdentifier:v14 forIndexPath:v8];

  if (objc_opt_isKindOfClass()) {
    id v16 = v15;
  }
  else {
    id v16 = 0;
  }
  id v17 = v16;

  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __88__HUSideBarViewController_collectionView_viewForSupplementaryElementOfKind_atIndexPath___block_invoke;
  v20[3] = &unk_1E6385E58;
  id v21 = v12;
  uint64_t v22 = self;
  id v18 = v12;
  [v17 _setContentViewConfigurationProvider:v20];

  return v17;
}

id __88__HUSideBarViewController_collectionView_viewForSupplementaryElementOfKind_atIndexPath___block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x1E4F430B8] outlineRootParentCellConfiguration];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = [v2 textLabel];
  [v4 setText:v3];

  if ([*(id *)(a1 + 40) shouldUseDashboardEffects]) {
    [MEMORY[0x1E4F428B8] whiteColor];
  }
  else {
  char v5 = [MEMORY[0x1E4F428B8] labelColor];
  }
  id v6 = [v2 textLabel];
  [v6 setTextColor:v5];

  return v2;
}

- (BOOL)collectionView:(id)a3 canMoveItemAtIndexPath:(id)a4
{
  return 0;
}

- (id)collectionView:(id)a3 targetIndexPathForMoveOfItemFromOriginalIndexPath:(id)a4 atCurrentIndexPath:(id)a5 toProposedIndexPath:(id)a6
{
  id v8 = a4;
  id v9 = a6;
  uint64_t v10 = [v9 section];
  uint64_t v11 = [v8 section];
  int v12 = v9;
  if (v10 != v11)
  {
    uint64_t v13 = [(HUSideBarViewController *)self collectionView];
    [v13 setDropDelegate:self];

    int v12 = v8;
  }
  id v14 = v12;

  return v14;
}

- (void)collectionView:(id)a3 moveItemAtIndexPath:(id)a4 toIndexPath:(id)a5
{
  id v27 = a4;
  id v7 = a5;
  objc_opt_class();
  id v8 = [(HUItemCollectionViewController *)self itemManager];
  id v9 = [v8 displayedItemAtIndexPath:v27];
  if (objc_opt_isKindOfClass()) {
    uint64_t v10 = v9;
  }
  else {
    uint64_t v10 = 0;
  }
  id v11 = v10;

  if (v11)
  {
    int v12 = [(HUItemCollectionViewController *)self itemManager];
    uint64_t v13 = [v12 reorderableRoomList];

    id v14 = objc_alloc(MEMORY[0x1E4F1CA48]);
    uint64_t v15 = [(HUItemCollectionViewController *)self itemManager];
    id v16 = [v15 roomItems];
    id v17 = (void *)[v14 initWithArray:v16];

    unint64_t v18 = [v17 count];
    if (v18 > [v7 row])
    {
      unint64_t v19 = [v17 count];
      if (v19 > [v27 row])
      {
        objc_msgSend(v17, "removeObjectAtIndex:", objc_msgSend(v27, "row"));
        objc_msgSend(v17, "insertObject:atIndex:", v11, objc_msgSend(v7, "row"));
        uint64_t v20 = (void *)[v13 mutableCopy];
        [v20 setSortedHomeKitItems:v17];
        id v21 = [(HUItemCollectionViewController *)self itemManager];
        [v21 setReorderableRoomList:v20];

        [(HUItemCollectionViewController *)self setSuppressCollectionViewUpdatesForReorderCommit:1];
        uint64_t v22 = [(HUItemCollectionViewController *)self itemManager];
        objc_msgSend(v22, "sortDisplayedItemsInSection:", objc_msgSend(v27, "section"));

        [(HUItemCollectionViewController *)self setSuppressCollectionViewUpdatesForReorderCommit:0];
        id v23 = [(HUItemCollectionViewController *)self itemManager];
        v24 = [v20 saveWithSender:v23];
        id v25 = (id)[v24 addFailureBlock:&__block_literal_global_16];
      }
    }
  }
  v26 = [(HUSideBarViewController *)self collectionView];
  [v26 setDropDelegate:self];
}

void __74__HUSideBarViewController_collectionView_moveItemAtIndexPath_toIndexPath___block_invoke(uint64_t a1, void *a2)
{
  v2 = (void *)MEMORY[0x1E4F69110];
  id v3 = a2;
  id v4 = [v2 sharedHandler];
  [v4 logError:v3 operationDescription:@"ReorderItems"];
}

- (void)didReorderItemWithSortedItemsBySectionID:(id)a3
{
  id v4 = a3;
  char v5 = [(HUItemCollectionViewController *)self itemManager];
  id v14 = [v5 reorderableRoomList];

  id v6 = (void *)[v14 mutableCopy];
  id v7 = [v4 objectForKeyedSubscript:@"room"];

  id v8 = objc_msgSend(v7, "na_map:", &__block_literal_global_35_1);

  [v6 setSortedHomeKitItems:v8];
  id v9 = [(HUItemCollectionViewController *)self itemManager];
  [v9 setReorderableRoomList:v6];

  uint64_t v10 = [(HUItemCollectionViewController *)self itemManager];
  id v11 = [v6 saveWithSender:v10];
  id v12 = (id)[v11 addFailureBlock:&__block_literal_global_82];

  uint64_t v13 = [(HUSideBarViewController *)self collectionView];
  [v13 setDropDelegate:self];
}

id __68__HUSideBarViewController_didReorderItemWithSortedItemsBySectionID___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 conformsToProtocol:&unk_1F19E4798]) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }
  id v4 = v3;

  return v4;
}

void __68__HUSideBarViewController_didReorderItemWithSortedItemsBySectionID___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = (void *)MEMORY[0x1E4F69110];
  id v3 = a2;
  id v4 = [v2 sharedHandler];
  [v4 logError:v3 operationDescription:@"ReorderItems"];
}

- (Class)cellClassForItem:(id)a3 indexPath:(id)a4
{
  return (Class)objc_opt_class();
}

- (void)configureCell:(id)a3 forItem:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v22.receiver = self;
  v22.super_class = (Class)HUSideBarViewController;
  [(HUItemCollectionViewController *)&v22 configureCell:v6 forItem:v7];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = @"square.split.bottomrightquarter";
  }
  else
  {
    id v9 = [v7 latestResults];
    id v8 = [v9 objectForKeyedSubscript:*MEMORY[0x1E4F68A00]];
  }
  uint64_t v10 = [MEMORY[0x1E4F42A80] _systemImageNamed:v8 shape:-1 fill:0];
  id v11 = v10;
  if (v10)
  {
    id v12 = v10;
  }
  else
  {
    id v12 = [MEMORY[0x1E4F42A80] _systemImageNamed:v8];
  }
  uint64_t v13 = v12;

  id v14 = [v13 _imageThatSuppressesAccessibilityHairlineThickening];

  uint64_t v15 = [MEMORY[0x1E4F42B58] sidebarCellConfiguration];
  [v15 setImage:v14];
  id v16 = [v7 latestResults];
  id v17 = [v16 objectForKeyedSubscript:*MEMORY[0x1E4F68AB8]];
  [v15 setText:v17];

  [v6 setContentConfiguration:v15];
  if ([MEMORY[0x1E4F69758] isAMac]) {
    [MEMORY[0x1E4F427B0] clearConfiguration];
  }
  else {
  unint64_t v18 = [MEMORY[0x1E4F427B0] listSidebarCellConfiguration];
  }
  [v6 setBackgroundConfiguration:v18];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __49__HUSideBarViewController_configureCell_forItem___block_invoke;
  aBlock[3] = &unk_1E6385EC0;
  aBlock[4] = self;
  unint64_t v19 = (void (**)(void *, id, void *))_Block_copy(aBlock);
  [v6 setConfigurationUpdateHandler:v19];
  uint64_t v20 = [v6 configurationState];
  v19[2](v19, v6, v20);
}

void __49__HUSideBarViewController_configureCell_forItem___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v34 = a2;
  id v5 = a3;
  id v6 = [v34 contentConfiguration];
  id v7 = [v6 updatedConfigurationForState:v5];

  id v8 = [v34 backgroundConfiguration];
  id v9 = [v8 updatedConfigurationForState:v5];

  LODWORD(v8) = [MEMORY[0x1E4F69758] isAMac];
  char v10 = [*(id *)(a1 + 32) shouldUseDashboardEffects];
  if (v8)
  {
    if (v10)
    {
      id v11 = [MEMORY[0x1E4F428B8] systemWhiteColor];
      id v12 = [v7 textProperties];
      [v12 setColor:v11];

      uint64_t v13 = [MEMORY[0x1E4F428B8] systemWhiteColor];
      id v14 = [v7 imageProperties];
      [v14 setTintColor:v13];

      uint64_t v15 = [MEMORY[0x1E4F428B8] clearColor];
      [v9 setBackgroundColor:v15];

      if ([v5 isSelected])
      {
        id v16 = [MEMORY[0x1E4F427D8] effectWithStyle:19];
        [v9 setVisualEffect:v16];

LABEL_29:
        [v9 setCornerRadius:6.49350977];
        goto LABEL_30;
      }
    }
    else
    {
      id v17 = [MEMORY[0x1E4F428B8] labelColor];
      unint64_t v18 = [v7 textProperties];
      [v18 setColor:v17];

      unint64_t v19 = [MEMORY[0x1E4F428B8] labelColor];
      uint64_t v20 = [v7 imageProperties];
      [v20 setTintColor:v19];

      if ([v5 isSelected])
      {
        id v21 = [*(id *)(a1 + 32) traitCollection];
        if ([v21 userInterfaceStyle] == 2) {
          [MEMORY[0x1E4F428B8] darkGrayColor];
        }
        else {
        int v33 = [MEMORY[0x1E4F428B8] lightGrayColor];
        }
        [v9 setBackgroundColor:v33];
      }
      else
      {
        id v21 = [MEMORY[0x1E4F428B8] clearColor];
        [v9 setBackgroundColor:v21];
      }
    }
    [v9 setVisualEffect:0];
    goto LABEL_29;
  }
  if (v10)
  {
    if ([v5 isSelected]) {
      [MEMORY[0x1E4F428B8] blackColor];
    }
    else {
    v24 = [MEMORY[0x1E4F428B8] whiteColor];
    }
    id v25 = [v7 textProperties];
    [v25 setColor:v24];

    if ([v5 isSelected]) {
      [MEMORY[0x1E4F428B8] blackColor];
    }
    else {
    v28 = [MEMORY[0x1E4F428B8] whiteColor];
    }
    objc_super v29 = [v7 imageProperties];
    [v29 setTintColor:v28];

    v30 = [MEMORY[0x1E4F428B8] clearColor];
    [v9 setBackgroundColor:v30];

    if ([v5 isSelected])
    {
      v31 = [MEMORY[0x1E4F427D8] effectWithStyle:14];
      [v9 setVisualEffect:v31];

      goto LABEL_30;
    }
  }
  else
  {
    objc_super v22 = [MEMORY[0x1E4F428B8] labelColor];
    id v23 = [v7 textProperties];
    [v23 setColor:v22];

    if ([v5 isSelected]) {
      [MEMORY[0x1E4F428B8] labelColor];
    }
    else {
    v26 = [v34 tintColor];
    }
    id v27 = [v7 imageProperties];
    [v27 setTintColor:v26];

    if ([v5 isSelected])
    {
      [v9 setBackgroundColor:0];
    }
    else
    {
      v32 = [MEMORY[0x1E4F428B8] clearColor];
      [v9 setBackgroundColor:v32];
    }
  }
  [v9 setVisualEffect:0];
LABEL_30:
  [v34 setContentConfiguration:v7];
  [v34 setBackgroundConfiguration:v9];
}

- (void)diffableDataItemManager:(id)a3 didUpdateItems:(id)a4 addItems:(id)a5 removeItems:(id)a6
{
  v10.receiver = self;
  v10.super_class = (Class)HUSideBarViewController;
  [(HUItemCollectionViewController *)&v10 diffableDataItemManager:a3 didUpdateItems:a4 addItems:a5 removeItems:a6];
  id v7 = [(HUSideBarViewController *)self collectionView];
  id v8 = [v7 indexPathsForSelectedItems];
  uint64_t v9 = [v8 count];

  if (!v9) {
    [(HUSideBarViewController *)self refreshSideBarSelection];
  }
}

- (void)homeDidUpdateApplicationData:(id)a3
{
  id v5 = objc_msgSend(a3, "hf_reorderableRoomsList");
  id v6 = [(HUItemCollectionViewController *)self itemManager];
  [v6 setReorderableRoomList:v5];

  id v8 = [(HUItemCollectionViewController *)self itemManager];
  id v7 = (id)[v8 reloadAndUpdateAllItemsFromSenderSelector:a2];
}

- (void)home:(id)a3 didAddAccessory:(id)a4
{
  id v5 = [a3 accessories];
  -[HUSideBarViewController setHideRoomSection:](self, "setHideRoomSection:", [v5 count] == 0);
}

- (void)home:(id)a3 didRemoveAccessory:(id)a4
{
  id v5 = [a3 accessories];
  -[HUSideBarViewController setHideRoomSection:](self, "setHideRoomSection:", [v5 count] == 0);
}

- (void)homeDidUpdateToROAR:(id)a3
{
  uint64_t v4 = objc_msgSend(a3, "hf_shouldBlockCurrentUserFromHome");

  [(HUSideBarViewController *)self setHideRoomSection:v4];
}

- (void)homeDidUpdateAccessControlForCurrentUser:(id)a3
{
  id v4 = a3;
  id v5 = [(HUSideBarViewController *)self home];
  id v8 = v4;
  if (v5 == v8)
  {

    id v7 = v8;
    goto LABEL_6;
  }
  if (!v5)
  {

    goto LABEL_8;
  }
  int v6 = [v5 isEqual:v8];

  id v7 = v8;
  if (v6)
  {
LABEL_6:
    -[HUSideBarViewController setHideRoomSection:](self, "setHideRoomSection:", objc_msgSend(v7, "hf_shouldBlockCurrentRestrictedGuestFromHome"));
LABEL_8:
    id v7 = v8;
  }
}

- (void)homeDidUpdateHomeLocationStatus:(id)a3
{
  id v4 = a3;
  id v5 = [(HUSideBarViewController *)self home];
  id v8 = v4;
  if (v5 == v8)
  {

    id v7 = v8;
    goto LABEL_6;
  }
  if (!v5)
  {

    goto LABEL_8;
  }
  int v6 = [v5 isEqual:v8];

  id v7 = v8;
  if (v6)
  {
LABEL_6:
    -[HUSideBarViewController setHideRoomSection:](self, "setHideRoomSection:", objc_msgSend(v7, "hf_shouldBlockCurrentRestrictedGuestFromHome"));
LABEL_8:
    id v7 = v8;
  }
}

- (void)restrictedGuestAllowedPeriodStarted:(id)a3
{
  id v4 = a3;
  id v5 = [(HUSideBarViewController *)self home];
  id v6 = [v5 currentUser];
  id v7 = v4;
  id v9 = v7;
  if (v6 == v7)
  {

    goto LABEL_6;
  }
  if (!v6)
  {

    goto LABEL_8;
  }
  char v8 = [v6 isEqual:v7];

  if (v8)
  {
LABEL_6:
    id v5 = [(HUSideBarViewController *)self home];
    -[HUSideBarViewController setHideRoomSection:](self, "setHideRoomSection:", objc_msgSend(v5, "hf_shouldBlockCurrentRestrictedGuestFromHome"));
LABEL_8:
  }
}

- (void)restrictedGuestAllowedPeriodEnded:(id)a3
{
  id v4 = a3;
  id v5 = [(HUSideBarViewController *)self home];
  id v6 = [v5 currentUser];
  id v7 = v4;
  id v9 = v7;
  if (v6 == v7)
  {

    goto LABEL_6;
  }
  if (!v6)
  {

    goto LABEL_8;
  }
  char v8 = [v6 isEqual:v7];

  if (v8)
  {
LABEL_6:
    id v5 = [(HUSideBarViewController *)self home];
    -[HUSideBarViewController setHideRoomSection:](self, "setHideRoomSection:", objc_msgSend(v5, "hf_shouldBlockCurrentRestrictedGuestFromHome"));
LABEL_8:
  }
}

- (id)collectionView:(id)a3 dropSessionDidUpdate:(id)a4 withDestinationIndexPath:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  if (!v8)
  {
    id v16 = (void *)[objc_alloc(MEMORY[0x1E4F42888]) initWithDropOperation:0];
    goto LABEL_10;
  }
  id v9 = [(HUItemCollectionViewController *)self itemManager];
  objc_super v10 = [v9 displayedItemAtIndexPath:v8];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_8;
  }
  id v11 = [(HUSideBarViewController *)self home];
  int v12 = objc_msgSend(v11, "hf_currentUserIsAdministrator");

  if (!v12) {
    goto LABEL_8;
  }
  uint64_t v13 = [v7 items];
  id v14 = [v13 firstObject];
  uint64_t v15 = [v14 localObject];

  if (![v15 conformsToProtocol:&unk_1F1A3D558])
  {

LABEL_8:
    id v16 = (void *)[objc_alloc(MEMORY[0x1E4F42888]) initWithDropOperation:1];
    goto LABEL_9;
  }
  id v16 = (void *)[objc_alloc(MEMORY[0x1E4F42888]) initWithDropOperation:3 intent:2];

LABEL_9:
LABEL_10:

  return v16;
}

- (void)collectionView:(id)a3 performDropWithCoordinator:(id)a4
{
  id v5 = a4;
  id v6 = [v5 proposal];
  uint64_t v7 = [v6 operation];

  if (v7 == 3)
  {
    objc_opt_class();
    id v8 = [v5 items];
    id v9 = [v8 firstObject];
    objc_super v10 = [v9 dragItem];
    id v11 = [v10 localObject];
    if (objc_opt_isKindOfClass()) {
      int v12 = v11;
    }
    else {
      int v12 = 0;
    }
    id v13 = v12;

    if ([v13 conformsToProtocol:&unk_1F1A3D558])
    {
      id v14 = v13;
      objc_opt_class();
      uint64_t v15 = [(HUItemCollectionViewController *)self itemManager];
      id v16 = [v5 destinationIndexPath];
      id v17 = [v15 displayedItemAtIndexPath:v16];
      if (objc_opt_isKindOfClass()) {
        unint64_t v18 = v17;
      }
      else {
        unint64_t v18 = 0;
      }
      id v19 = v18;

      id v20 = objc_alloc(MEMORY[0x1E4F69478]);
      id v21 = [v19 room];
      objc_super v22 = [v19 home];

      id v23 = (void *)[v20 initWithExistingObject:v21 inHome:v22];
      v24 = [v14 accessories];

      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __69__HUSideBarViewController_collectionView_performDropWithCoordinator___block_invoke;
      v27[3] = &unk_1E6385EE8;
      id v28 = v23;
      id v25 = v23;
      objc_msgSend(v24, "na_each:", v27);

      id v26 = (id)[v25 commitItem];
    }
  }
}

uint64_t __69__HUSideBarViewController_collectionView_performDropWithCoordinator___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addAccessory:a2];
}

- (void)switchToDiscover
{
  id v3 = [(HUItemCollectionViewController *)self itemManager];
  id v4 = [v3 discoverItem];

  if (!v4)
  {
    id v5 = HFLogForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v11 = 0;
      _os_log_error_impl(&dword_1BE345000, v5, OS_LOG_TYPE_ERROR, "trying to select the discover tab, but there is no discover item", v11, 2u);
    }
  }
  id v6 = [(HUItemCollectionViewController *)self itemManager];
  uint64_t v7 = [(HUItemCollectionViewController *)self itemManager];
  id v8 = [v7 discoverItem];
  id v9 = [v6 indexPathForItem:v8];

  objc_super v10 = [(HUSideBarViewController *)self collectionView];
  [v10 selectItemAtIndexPath:v9 animated:0 scrollPosition:0];
}

- (void)setShouldUseDashboardEffects:(BOOL)a3
{
  if (self->_shouldUseDashboardEffects != a3)
  {
    self->_shouldUseDashboardEffects = a3;
    [(HUSideBarViewController *)self _updateAppearance];
  }
}

- (void)_updateShouldUseDashboardEffects
{
  id v3 = +[HUSideBarSelectionManager sharedManager];
  id v4 = [v3 currentTabIdentifier];
  id v5 = v4;
  if (v4)
  {
    id v7 = v4;
  }
  else
  {
    id v6 = [MEMORY[0x1E4F695B8] sharedInstance];
    id v7 = [v6 selectedHomeAppTabIdentifier];
  }
  -[HUSideBarViewController setShouldUseDashboardEffects:](self, "setShouldUseDashboardEffects:", [v7 isEqualToString:*MEMORY[0x1E4F684F8]]);
}

- (void)_updateBlurView
{
  v15[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_opt_class();
  id v4 = [(HUSideBarViewController *)self blurView];
  if (!v4) {
    goto LABEL_7;
  }
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v4;
  if (!v5)
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    id v8 = objc_msgSend(NSString, "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    [v7 handleFailureInFunction:v8, @"NSObject+NAAdditions.h", 54, @"Expected class of %@ but was %@", v3, objc_opt_class() file lineNumber description];

LABEL_7:
    id v6 = 0;
  }

  if ([(HUSideBarViewController *)self shouldUseDashboardEffects])
  {
    id v9 = objc_msgSend(MEMORY[0x1E4F43020], "hu_dashboardBarEffects");
    [v6 setBackgroundEffects:v9];

    [v6 setContentEffects:MEMORY[0x1E4F1CBF0]];
  }
  else
  {
    objc_super v10 = [MEMORY[0x1E4F427D8] effectWithStyle:9];
    id v11 = [MEMORY[0x1E4F42FE8] effectForBlurEffect:v10 style:4];
    [v6 setBackgroundColor:0];
    v15[0] = v10;
    int v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
    [v6 setBackgroundEffects:v12];

    id v14 = v11;
    id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v14 count:1];
    [v6 setContentEffects:v13];
  }
}

- (void)_updateNavigationBar
{
  v14[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_opt_new();
  if ([(HUSideBarViewController *)self shouldUseDashboardEffects])
  {
    id v4 = objc_msgSend(MEMORY[0x1E4F43020], "hu_dashboardBarEffects");
    [v3 setBackgroundEffects:v4];

    uint64_t v13 = *MEMORY[0x1E4F42510];
    uint64_t v5 = v13;
    id v6 = [MEMORY[0x1E4F428B8] systemWhiteColor];
    v14[0] = v6;
    id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
    [v3 setTitleTextAttributes:v7];

    uint64_t v11 = v5;
    id v8 = [MEMORY[0x1E4F428B8] systemWhiteColor];
    int v12 = v8;
    id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v12 forKeys:&v11 count:1];
    [v3 setLargeTitleTextAttributes:v9];
  }
  objc_super v10 = [(HUSideBarViewController *)self navigationItem];
  [v10 setStandardAppearance:v3];
}

- (void)_updateSplitViewSeparator
{
  if ([(HUSideBarViewController *)self shouldUseDashboardEffects]) {
    float v3 = 0.001;
  }
  else {
    float v3 = 1.0;
  }
  id v5 = [(HUSideBarViewController *)self splitViewController];
  *(float *)&double v4 = v3;
  [v5 setGutterWidth:v4];
}

- (void)_updateAppearance
{
  [(HUSideBarViewController *)self _updateBlurView];
  [(HUSideBarViewController *)self _updateNavigationBar];
  [(HUSideBarViewController *)self _updateSplitViewSeparator];
  float v3 = [(HUSideBarViewController *)self collectionView];
  double v4 = [v3 preparedCells];
  objc_msgSend(v4, "na_each:", &__block_literal_global_137);

  id v6 = [(HUSideBarViewController *)self collectionView];
  id v5 = [v6 visibleSupplementaryViewsOfKind:*MEMORY[0x1E4F43F98]];
  objc_msgSend(v5, "na_each:", &__block_literal_global_140);
}

uint64_t __44__HUSideBarViewController__updateAppearance__block_invoke(uint64_t a1, void *a2)
{
  return [a2 setNeedsUpdateConfiguration];
}

void __44__HUSideBarViewController__updateAppearance__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  id v5 = v2;
  if (objc_opt_isKindOfClass()) {
    float v3 = v5;
  }
  else {
    float v3 = 0;
  }
  id v4 = v3;

  [v4 _setNeedsConfigurationStateUpdate];
}

- (void)_sendSideBarInteractionEventForItem:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  objc_msgSend(v4, "na_safeSetObject:forKey:", v3, *MEMORY[0x1E4F681B8]);
  objc_opt_class();
  id v15 = v3;
  if (objc_opt_isKindOfClass()) {
    id v5 = v15;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;

  if (v6)
  {
    id v7 = NSString;
    id v8 = (objc_class *)objc_opt_class();
    id v9 = NSStringFromClass(v8);
    objc_super v10 = HUSideBarStaticItemTypeString([v6 type]);
    uint64_t v11 = [v7 stringWithFormat:@"%@-%@", v9, v10];
  }
  else
  {
    uint64_t v11 = 0;
  }
  objc_msgSend(v4, "na_safeSetObject:forKey:", v11, *MEMORY[0x1E4F681C0]);
  if ([MEMORY[0x1E4F69758] isAnIPad])
  {
    int v12 = NSNumber;
    uint64_t v13 = [MEMORY[0x1E4F42948] currentDevice];
    id v14 = objc_msgSend(v12, "numberWithInteger:", objc_msgSend(v13, "orientation"));
    objc_msgSend(v4, "na_safeSetObject:forKey:", v14, *MEMORY[0x1E4F68180]);
  }
  [MEMORY[0x1E4F68EE0] sendEvent:37 withData:v4];
}

- (BOOL)shouldUseDashboardEffects
{
  return self->_shouldUseDashboardEffects;
}

- (UIView)blurView
{
  return self->_blurView;
}

- (void)setBlurView:(id)a3
{
}

- (HUSideBarDelegate)sideBarDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sideBarDelegate);

  return (HUSideBarDelegate *)WeakRetained;
}

- (void)setSideBarDelegate:(id)a3
{
}

- (HMHome)home
{
  return self->_home;
}

- (void)setHome:(id)a3
{
}

- (BOOL)hideRoomSection
{
  return self->_hideRoomSection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_home, 0);
  objc_destroyWeak((id *)&self->_sideBarDelegate);

  objc_storeStrong((id *)&self->_blurView, 0);
}

@end