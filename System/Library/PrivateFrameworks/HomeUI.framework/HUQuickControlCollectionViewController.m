@interface HUQuickControlCollectionViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)disableItemUpdatesForOverrideCharacteristicValueChanges;
- (BOOL)isUserInteractionEnabled;
- (Class)cellClassForItem:(id)a3 indexPath:(id)a4;
- (HULayoutAnchorProviding)preferredFrameLayoutGuide;
- (HUQuickControlCollectionViewController)initWithItemManager:(id)a3;
- (HUQuickControlCollectionViewController)initWithItemManager:(id)a3 collectionViewLayout:(id)a4;
- (HUQuickControlCollectionViewControllerLayoutOptions)layoutOptions;
- (HUQuickControlContentCharacteristicWritingDelegate)characteristicWritingDelegate;
- (HUQuickControlContentCharacteristicWritingUpdateAdapter)characteristicWritingAdapter;
- (HUQuickControlContentHosting)quickControlHost;
- (NSMapTable)viewControllersKeyedByItem;
- (NSSet)affectedCharacteristics;
- (double)heightForSupplementaryViewAtIndexPath:(id)a3;
- (id)_allContentViewControllers;
- (id)_allViewControllers;
- (id)_controlItemsForItem:(id)a3;
- (id)_createCellContainerForViewController:(id)a3 forItem:(id)a4;
- (id)_viewControllerForItem:(id)a3;
- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5;
- (id)intrinsicSizeDescriptorForItemAtIndexPath:(id)a3 itemSize:(unint64_t)a4;
- (id)overrideValueForCharacteristic:(id)a3;
- (id)viewForTouchContinuation;
- (unint64_t)_determineReachabilityForIndexPath:(id)a3;
- (unint64_t)_titlePositionForItem:(id)a3;
- (void)_fetchReachabilityStateForMediaAccessory:(id)a3 accessType:(unint64_t)a4 itemSectionIdentifier:(id)a5;
- (void)_handleCoordinationReachableStatusChanged:(id)a3;
- (void)_propagateInteractiveContentStateForChildViewControllers:(id)a3;
- (void)_reconfigureLayoutOptions;
- (void)_setReachabilityForHeaderForIdentifier:(id)a3 to:(BOOL)a4;
- (void)accessoryDidUpdateControllable:(id)a3;
- (void)configureCell:(id)a3 forItem:(id)a4;
- (void)diffableDataItemManager:(id)a3 didUpdateItems:(id)a4 addItems:(id)a5 removeItems:(id)a6;
- (void)invalidateContentViewLayout;
- (void)itemManager:(id)a3 didRemoveItem:(id)a4 atIndexPath:(id)a5;
- (void)itemManager:(id)a3 didUpdateResultsForItem:(id)a4 atIndexPath:(id)a5;
- (void)loadView;
- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3;
- (void)setCharacteristicWritingDelegate:(id)a3;
- (void)setDisableItemUpdatesForOverrideCharacteristicValueChanges:(BOOL)a3;
- (void)setLayoutOptions:(id)a3;
- (void)setPreferredFrameLayoutGuide:(id)a3;
- (void)setQuickControlHost:(id)a3;
- (void)setUserInteractionEnabled:(BOOL)a3;
- (void)shouldHideQuickControlHeaderButton:(BOOL)a3 forSectionIdentifier:(id)a4;
- (void)shouldHideQuickControlHeaderText:(BOOL)a3 forSectionIdentifier:(id)a4;
- (void)viewDidLoad;
- (void)viewLayoutMarginsDidChange;
- (void)viewWillDismiss;
@end

@implementation HUQuickControlCollectionViewController

- (HUQuickControlCollectionViewController)initWithItemManager:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(HUQuickControlCollectionViewLayout);
  v13.receiver = self;
  v13.super_class = (Class)HUQuickControlCollectionViewController;
  v6 = [(HUItemCollectionViewController *)&v13 initWithItemManager:v4 collectionViewLayout:v5];
  if (v6)
  {
    uint64_t v7 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
    viewControllersKeyedByItem = v6->_viewControllersKeyedByItem;
    v6->_viewControllersKeyedByItem = (NSMapTable *)v7;

    v9 = [[HUQuickControlContentCharacteristicWritingUpdateAdapter alloc] initWithItemManager:v4];
    characteristicWritingAdapter = v6->_characteristicWritingAdapter;
    v6->_characteristicWritingAdapter = v9;

    v6->_disableItemUpdatesForOverrideCharacteristicValueChanges = 0;
    v11 = [MEMORY[0x1E4F691A0] sharedDispatcher];
    [v11 addAccessoryObserver:v6];
  }
  return v6;
}

- (HUQuickControlCollectionViewController)initWithItemManager:(id)a3 collectionViewLayout:(id)a4
{
  v6 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4);
  uint64_t v7 = NSStringFromSelector(sel_initWithItemManager_);
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUQuickControlCollectionViewController.m", 84, @"%s is unavailable; use %@ instead",
    "-[HUQuickControlCollectionViewController initWithItemManager:collectionViewLayout:]",
    v7);

  return 0;
}

- (void)loadView
{
  v19.receiver = self;
  v19.super_class = (Class)HUQuickControlCollectionViewController;
  [(HUQuickControlCollectionViewController *)&v19 loadView];
  v3 = [HUQuickControlCollectionView alloc];
  id v4 = [(HUQuickControlCollectionViewController *)self collectionViewLayout];
  v5 = -[HUQuickControlCollectionView initWithFrame:collectionViewLayout:](v3, "initWithFrame:collectionViewLayout:", v4, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [(HUQuickControlCollectionViewController *)self setCollectionView:v5];

  v6 = [HUQuickControlGridLayoutManager alloc];
  uint64_t v7 = [(HUQuickControlCollectionViewController *)self collectionView];
  v8 = [(HUItemCollectionViewController *)self itemManager];
  v9 = [(HUQuickControlCollectionViewController *)self layoutOptions];
  v10 = [(HUQuickControlGridLayoutManager *)v6 initWithCollectionView:v7 itemManager:v8 layoutOptions:v9];
  v11 = [(HUQuickControlCollectionViewController *)self collectionViewLayout];
  [v11 setLayoutManager:v10];

  v12 = [(HUQuickControlCollectionViewController *)self collectionView];
  objc_super v13 = [v12 heightAnchor];
  v14 = [(HUQuickControlCollectionViewController *)self view];
  [v14 frame];
  v16 = [v13 constraintEqualToConstant:v15];
  v17 = [(HUQuickControlCollectionViewController *)self collectionViewLayout];
  [v17 setHeightConstraint:v16];

  v18 = [(HUQuickControlCollectionViewController *)self collectionView];
  [v18 registerClass:objc_opt_class() forSupplementaryViewOfKind:*MEMORY[0x1E4F43758] withReuseIdentifier:@"HUQuickControlSectionHeaderViewReuseIdentifier"];
}

- (void)viewDidLoad
{
  v19.receiver = self;
  v19.super_class = (Class)HUQuickControlCollectionViewController;
  [(HUItemCollectionViewController *)&v19 viewDidLoad];
  int v5 = [MEMORY[0x1E4F69758] shouldUseControlCenterMaterials];
  char v6 = v5;
  if (v5)
  {
    [MEMORY[0x1E4F428B8] clearColor];
  }
  else
  {
    v2 = [(HUQuickControlCollectionViewController *)self view];
    v3 = [v2 traitCollection];
    +[HUQuickControlUtilities backgroundColorForUserInterfaceStyle:](HUQuickControlUtilities, "backgroundColorForUserInterfaceStyle:", [v3 userInterfaceStyle]);
  uint64_t v7 = };
  v8 = [(HUQuickControlCollectionViewController *)self view];
  [v8 setBackgroundColor:v7];

  if ((v6 & 1) == 0)
  {

    uint64_t v7 = v2;
  }

  v9 = [(HUQuickControlCollectionViewController *)self collectionView];
  [v9 setBackgroundColor:0];

  v10 = [(HUQuickControlCollectionViewController *)self collectionView];
  [v10 setShowsHorizontalScrollIndicator:0];

  v11 = [(HUQuickControlCollectionViewController *)self collectionView];
  [v11 setDelaysContentTouches:1];

  v12 = [(HUQuickControlCollectionViewController *)self view];
  [v12 frame];
  double v15 = +[HUQuickControlCollectionViewControllerLayoutOptions defaultOptionsForViewSize:](HUQuickControlCollectionViewControllerLayoutOptions, "defaultOptionsForViewSize:", v13, v14);
  [(HUQuickControlCollectionViewController *)self setLayoutOptions:v15];

  [(HUQuickControlCollectionViewController *)self _reconfigureLayoutOptions];
  [(HUItemCollectionViewController *)self setWantsPreferredContentSize:1];
  v16 = [(HUQuickControlCollectionViewController *)self collectionViewLayout];
  v17 = [v16 heightConstraint];
  [v17 setActive:1];

  v18 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v18 addObserver:self selector:sel__handleCoordinationReachableStatusChanged_ name:*MEMORY[0x1E4F683F8] object:0];
}

- (void)viewWillDismiss
{
  objc_opt_class();
  v3 = [(HUItemCollectionViewController *)self itemManager];
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  [v5 tearDown];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)viewLayoutMarginsDidChange
{
  v13.receiver = self;
  v13.super_class = (Class)HUQuickControlCollectionViewController;
  [(HUQuickControlCollectionViewController *)&v13 viewLayoutMarginsDidChange];
  v3 = [(HUQuickControlCollectionViewController *)self view];
  [v3 layoutMargins];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  v12 = [(HUQuickControlCollectionViewController *)self collectionViewLayout];
  objc_msgSend(v12, "setContentInset:", v5, v7, v9, v11);
}

- (void)setDisableItemUpdatesForOverrideCharacteristicValueChanges:(BOOL)a3
{
  if (self->_disableItemUpdatesForOverrideCharacteristicValueChanges != a3)
  {
    self->_disableItemUpdatesForOverrideCharacteristicValueChanges = a3;
    BOOL v3 = !a3;
    id v4 = [(HUQuickControlCollectionViewController *)self characteristicWritingAdapter];
    [v4 setShouldIssueItemUpdatesOnCharacteristicOverrideValueChanges:v3];
  }
}

- (HULayoutAnchorProviding)preferredFrameLayoutGuide
{
  preferredFrameLayoutGuide = self->_preferredFrameLayoutGuide;
  if (preferredFrameLayoutGuide)
  {
    BOOL v3 = preferredFrameLayoutGuide;
  }
  else
  {
    BOOL v3 = [(HUQuickControlCollectionViewController *)self view];
  }

  return v3;
}

- (void)setLayoutOptions:(id)a3
{
  id v5 = a3;
  id v9 = v5;
  if (!v5)
  {
    BOOL v3 = [(HUQuickControlCollectionViewController *)self view];
    [v3 frame];
    +[HUQuickControlCollectionViewControllerLayoutOptions defaultOptionsForViewSize:](HUQuickControlCollectionViewControllerLayoutOptions, "defaultOptionsForViewSize:", v6, v7);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_storeStrong((id *)&self->_layoutOptions, v5);
  if (!v9)
  {
  }
  double v8 = [(HUQuickControlCollectionViewController *)self collectionViewLayout];
  [v8 setLayoutOptions:v9];

  if ([(HUQuickControlCollectionViewController *)self isViewLoaded]) {
    [(HUQuickControlCollectionViewController *)self _reconfigureLayoutOptions];
  }
}

- (Class)cellClassForItem:(id)a3 indexPath:(id)a4
{
  return (Class)objc_opt_class();
}

- (void)configureCell:(id)a3 forItem:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)HUQuickControlCollectionViewController;
  [(HUItemCollectionViewController *)&v18 configureCell:v6 forItem:v7];
  id v8 = v6;
  id v9 = [(HUQuickControlCollectionViewController *)self _viewControllerForItem:v7];
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  double v14 = __64__HUQuickControlCollectionViewController_configureCell_forItem___block_invoke;
  double v15 = &unk_1E638AF18;
  v16 = self;
  id v17 = v7;
  id v10 = v7;
  double v11 = __64__HUQuickControlCollectionViewController_configureCell_forItem___block_invoke((uint64_t)&v12);
  objc_msgSend(v9, "setTitle:", v11, v12, v13, v14, v15, v16);

  [v8 setViewController:v9];
}

id __64__HUQuickControlCollectionViewController_configureCell_forItem___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) itemManager];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) itemManager];
    uint64_t v5 = [v4 titleForItem:*(void *)(a1 + 40)];
    goto LABEL_5;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [*(id *)(a1 + 40) latestResults];
    uint64_t v5 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F68980]];
LABEL_5:
    id v6 = (void *)v5;

    if (v6) {
      goto LABEL_7;
    }
  }
  id v7 = [*(id *)(a1 + 40) latestResults];
  id v6 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F68AB8]];

LABEL_7:

  return v6;
}

- (void)itemManager:(id)a3 didUpdateResultsForItem:(id)a4 atIndexPath:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (objc_msgSend((id)+[HUQuickControlCollectionViewController superclass](HUQuickControlCollectionViewController, "superclass"), "instancesRespondToSelector:", a2))
  {
    v16.receiver = self;
    v16.super_class = (Class)HUQuickControlCollectionViewController;
    [(HUItemCollectionViewController *)&v16 itemManager:v9 didUpdateResultsForItem:v10 atIndexPath:v11];
  }
  uint64_t v12 = [(HUQuickControlCollectionViewController *)self viewControllersKeyedByItem];
  uint64_t v13 = [v12 objectForKey:v10];
  double v14 = [v13 contentViewController];

  double v15 = [(HUQuickControlCollectionViewController *)self _controlItemsForItem:v10];
  [v14 quickControlItemUpdater:self didUpdateResultsForControlItems:v15];
}

- (void)itemManager:(id)a3 didRemoveItem:(id)a4 atIndexPath:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (objc_msgSend((id)+[HUQuickControlCollectionViewController superclass](HUQuickControlCollectionViewController, "superclass"), "instancesRespondToSelector:", a2))
  {
    v13.receiver = self;
    v13.super_class = (Class)HUQuickControlCollectionViewController;
    [(HUItemCollectionViewController *)&v13 itemManager:v9 didRemoveItem:v10 atIndexPath:v11];
  }
  uint64_t v12 = [(HUQuickControlCollectionViewController *)self viewControllersKeyedByItem];
  [v12 removeObjectForKey:v10];
}

- (void)diffableDataItemManager:(id)a3 didUpdateItems:(id)a4 addItems:(id)a5 removeItems:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v19.receiver = self;
  v19.super_class = (Class)HUQuickControlCollectionViewController;
  [(HUItemCollectionViewController *)&v19 diffableDataItemManager:v10 didUpdateItems:v11 addItems:v12 removeItems:v13];
  objc_initWeak(&location, self);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __102__HUQuickControlCollectionViewController_diffableDataItemManager_didUpdateItems_addItems_removeItems___block_invoke;
  v16[3] = &unk_1E6389908;
  objc_copyWeak(&v17, &location);
  objc_msgSend(v11, "na_each:", v16);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __102__HUQuickControlCollectionViewController_diffableDataItemManager_didUpdateItems_addItems_removeItems___block_invoke_2;
  v14[3] = &unk_1E6389908;
  objc_copyWeak(&v15, &location);
  objc_msgSend(v13, "na_each:", v14);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

void __102__HUQuickControlCollectionViewController_diffableDataItemManager_didUpdateItems_addItems_removeItems___block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  id v4 = [WeakRetained viewControllersKeyedByItem];
  uint64_t v5 = [v4 objectForKey:v3];
  id v6 = [v5 contentViewController];

  id v7 = [WeakRetained _controlItemsForItem:v3];

  [v6 quickControlItemUpdater:WeakRetained didUpdateResultsForControlItems:v7];
}

void __102__HUQuickControlCollectionViewController_diffableDataItemManager_didUpdateItems_addItems_removeItems___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  id v4 = [WeakRetained viewControllersKeyedByItem];
  [v4 removeObjectForKey:v3];
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v6 = a5;
  id v7 = [(HUItemCollectionViewController *)self itemManager];
  id v8 = objc_msgSend(v7, "titleForSection:", objc_msgSend(v6, "section"));

  id v9 = [(HUQuickControlCollectionViewController *)self collectionView];
  id v10 = [v9 dequeueReusableSupplementaryViewOfKind:*MEMORY[0x1E4F43758] withReuseIdentifier:@"HUQuickControlSectionHeaderViewReuseIdentifier" forIndexPath:v6];

  id v11 = [(HUItemCollectionViewController *)self itemManager];
  id v12 = objc_msgSend(v11, "attributedTitleForSection:", objc_msgSend(v6, "section"));

  if (v12)
  {
    [v10 setAttributedTitleText:v12];
  }
  else
  {
    if (!v8) {
      NSLog(&cfstr_AskedForHeader.isa, v6);
    }
    [v10 setTitleText:v8];
  }
  objc_opt_class();
  id v13 = [(HUItemCollectionViewController *)self itemManager];
  if (objc_opt_isKindOfClass()) {
    double v14 = v13;
  }
  else {
    double v14 = 0;
  }
  id v15 = v14;

  if (v15)
  {
    v36 = v12;
    v37 = v8;
    objc_super v16 = objc_msgSend(v15, "itemSectionForSectionIndex:", objc_msgSend(v6, "section"));
    id v17 = [v16 headerAccessoryButtonTitle];
    [v10 setAccessoryButtonTitleText:v17];

    objc_super v18 = [v16 headerAccessoryButtonDelegate];

    if (!v18)
    {
      objc_super v19 = [v16 items];
      v20 = [v19 firstObject];
      v21 = [(HUQuickControlCollectionViewController *)self _viewControllerForItem:v20];
      v22 = [v21 contentViewController];
      if ([v22 conformsToProtocol:&unk_1F1A15088]) {
        v23 = v22;
      }
      else {
        v23 = 0;
      }
      [v16 setHeaderAccessoryButtonDelegate:v23];

      v24 = HFLogForCategory();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315906;
        v39 = "-[HUQuickControlCollectionViewController collectionView:viewForSupplementaryElementOfKind:atIndexPath:]";
        __int16 v40 = 2112;
        v41 = self;
        __int16 v42 = 2112;
        id v43 = v6;
        __int16 v44 = 2112;
        v45 = v16;
        _os_log_error_impl(&dword_1BE345000, v24, OS_LOG_TYPE_ERROR, "%s(%@) headerAccessoryButtonDelegate should not be nil (indexPath = %@ / section = %@)", buf, 0x2Au);
      }
    }
    v25 = [v16 headerAccessoryButtonDelegate];
    [v10 setAccessoryButtonTarget:v25];

    [v10 setItemSection:v16];
    objc_msgSend(v10, "setHideAccessoryButton:", objc_msgSend(v16, "hideAccessoryButton"));
    objc_msgSend(v10, "setHideHeaderText:", objc_msgSend(v16, "hideHeaderText"));
    v26 = [(HUItemCollectionViewController *)self itemManager];
    v27 = [v26 displayedItemAtIndexPath:v6];

    v28 = [v27 latestResults];
    v29 = [v28 objectForKeyedSubscript:*MEMORY[0x1E4F68C40]];

    if (v29) {
      unint64_t v30 = [v29 category] == 1;
    }
    else {
      unint64_t v30 = [(HUQuickControlCollectionViewController *)self _determineReachabilityForIndexPath:v6];
    }
    v31 = HFLogForCategory();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      v32 = [NSNumber numberWithUnsignedInteger:v30];
      *(_DWORD *)buf = 136315650;
      v39 = "-[HUQuickControlCollectionViewController collectionView:viewForSupplementaryElementOfKind:atIndexPath:]";
      __int16 v40 = 2112;
      v41 = self;
      __int16 v42 = 2112;
      id v43 = v32;
      _os_log_impl(&dword_1BE345000, v31, OS_LOG_TYPE_DEFAULT, "%s(%@) Setting  reachabilityState = %@ ", buf, 0x20u);
    }
    [v10 updateUIForReachabilityState:v30];

    id v12 = v36;
    id v8 = v37;
  }
  v33 = [v15 allDisplayedItems];
  uint64_t v34 = [v33 count];

  if (v34 == 1) {
    [v10 setHideSeparator:1];
  }

  return v10;
}

- (unint64_t)_determineReachabilityForIndexPath:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(HUItemCollectionViewController *)self itemManager];
  id v6 = [v5 displayedItemAtIndexPath:v4];

  objc_opt_class();
  id v7 = [(HUItemCollectionViewController *)self itemManager];
  if (objc_opt_isKindOfClass()) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }
  id v9 = v8;

  uint64_t v10 = [v4 section];
  id v11 = [v9 itemSectionForSectionIndex:v10];
  objc_opt_class();
  id v12 = v6;
  if (objc_opt_isKindOfClass()) {
    id v13 = v12;
  }
  else {
    id v13 = 0;
  }
  id v14 = v13;

  if (v14)
  {
    id v15 = HFLogForCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      objc_super v16 = [v14 mediaProfileContainer];
      int v28 = 136315650;
      v29 = "-[HUQuickControlCollectionViewController _determineReachabilityForIndexPath:]";
      __int16 v30 = 2112;
      v31 = self;
      __int16 v32 = 2112;
      v33 = v16;
      _os_log_impl(&dword_1BE345000, v15, OS_LOG_TYPE_DEFAULT, "%s(%@) Fetching  reachability for MediaAccessory = %@ ", (uint8_t *)&v28, 0x20u);
    }
    id v17 = [v14 mediaProfileContainer];
    objc_super v18 = [v11 identifier];
    [(HUQuickControlCollectionViewController *)self _fetchReachabilityStateForMediaAccessory:v17 accessType:0 itemSectionIdentifier:v18];

    unint64_t v19 = 1;
  }
  else
  {
    unint64_t v19 = 2;
  }
  objc_opt_class();
  id v20 = v12;
  if (objc_opt_isKindOfClass()) {
    v21 = v20;
  }
  else {
    v21 = 0;
  }
  id v22 = v21;

  if (v22)
  {
    v23 = [v22 mediaProfileContainer];
    v24 = [v11 identifier];
    unint64_t v19 = 1;
    [(HUQuickControlCollectionViewController *)self _fetchReachabilityStateForMediaAccessory:v23 accessType:1 itemSectionIdentifier:v24];
  }
  v25 = HFLogForCategory();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    v26 = [NSNumber numberWithUnsignedInteger:v19];
    int v28 = 136315650;
    v29 = "-[HUQuickControlCollectionViewController _determineReachabilityForIndexPath:]";
    __int16 v30 = 2112;
    v31 = self;
    __int16 v32 = 2112;
    v33 = v26;
    _os_log_impl(&dword_1BE345000, v25, OS_LOG_TYPE_DEFAULT, "%s(%@) Returning reachabilityState = %@ ", (uint8_t *)&v28, 0x20u);
  }
  return v19;
}

- (void)_fetchReachabilityStateForMediaAccessory:(id)a3 accessType:(unint64_t)a4 itemSectionIdentifier:(id)a5
{
  id v8 = a5;
  id v9 = [a3 accessories];
  uint64_t v10 = [v9 anyObject];
  if (!v10) {
    NSLog(&cfstr_AccessoryCanTB.isa);
  }
  id v11 = +[HUAlarmsAndTimersAccessUtility canAccess:v10 for:a4 withManager:0];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __116__HUQuickControlCollectionViewController__fetchReachabilityStateForMediaAccessory_accessType_itemSectionIdentifier___block_invoke;
  v14[3] = &unk_1E638AEC0;
  void v14[4] = self;
  id v15 = v8;
  id v12 = v8;
  id v13 = (id)[v11 flatMap:v14];
}

id __116__HUQuickControlCollectionViewController__fetchReachabilityStateForMediaAccessory_accessType_itemSectionIdentifier___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    int v9 = 136315906;
    uint64_t v10 = "-[HUQuickControlCollectionViewController _fetchReachabilityStateForMediaAccessory:accessType:itemSectionIdenti"
          "fier:]_block_invoke";
    __int16 v11 = 2112;
    uint64_t v12 = v5;
    __int16 v13 = 2112;
    uint64_t v14 = v6;
    __int16 v15 = 1024;
    int v16 = [v3 BOOLValue];
    _os_log_impl(&dword_1BE345000, v4, OS_LOG_TYPE_DEFAULT, "%s(%@) Updating reachability for section %@ to %{BOOL}d", (uint8_t *)&v9, 0x26u);
  }

  objc_msgSend(*(id *)(a1 + 32), "_setReachabilityForHeaderForIdentifier:to:", *(void *)(a1 + 40), objc_msgSend(v3, "BOOLValue"));
  id v7 = [MEMORY[0x1E4F7A0D8] futureWithNoResult];

  return v7;
}

- (void)_setReachabilityForHeaderForIdentifier:(id)a3 to:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [(HUQuickControlCollectionViewController *)self collectionView];
  id v8 = [v7 visibleSupplementaryViewsOfKind:*MEMORY[0x1E4F43758]];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __84__HUQuickControlCollectionViewController__setReachabilityForHeaderForIdentifier_to___block_invoke;
  v15[3] = &unk_1E638AF40;
  id v9 = v6;
  id v16 = v9;
  uint64_t v10 = objc_msgSend(v8, "na_firstObjectPassingTest:", v15);

  if (!v10)
  {
    __int16 v11 = HFLogForCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      objc_super v18 = "-[HUQuickControlCollectionViewController _setReachabilityForHeaderForIdentifier:to:]";
      __int16 v19 = 2112;
      id v20 = self;
      __int16 v21 = 2112;
      id v22 = v9;
      _os_log_error_impl(&dword_1BE345000, v11, OS_LOG_TYPE_ERROR, "%s(%@) Could not find section %@", buf, 0x20u);
    }
  }
  if (v4) {
    uint64_t v12 = 2;
  }
  else {
    uint64_t v12 = 1;
  }
  __int16 v13 = HFLogForCategory();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = [NSNumber numberWithUnsignedInteger:v12];
    *(_DWORD *)buf = 136315650;
    objc_super v18 = "-[HUQuickControlCollectionViewController _setReachabilityForHeaderForIdentifier:to:]";
    __int16 v19 = 2112;
    id v20 = self;
    __int16 v21 = 2112;
    id v22 = v14;
    _os_log_impl(&dword_1BE345000, v13, OS_LOG_TYPE_DEFAULT, "%s(%@) Setting  reachabilityState = %@ ", buf, 0x20u);
  }
  [v10 updateUIForReachabilityState:v12];
}

uint64_t __84__HUQuickControlCollectionViewController__setReachabilityForHeaderForIdentifier_to___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  id v4 = v3;
  if (objc_opt_isKindOfClass()) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  id v6 = v5;

  id v7 = [v6 itemSection];
  id v8 = [v7 identifier];
  uint64_t v9 = [v8 isEqualToString:*(void *)(a1 + 32)];

  return v9;
}

- (void)_handleCoordinationReachableStatusChanged:(id)a3
{
  id v14 = a3;
  id v4 = [v14 userInfo];
  uint64_t v5 = *MEMORY[0x1E4F683F0];
  uint64_t v6 = [v4 objectForKey:*MEMORY[0x1E4F683F0]];
  if (v6)
  {
    id v7 = (void *)v6;
    id v8 = [v14 userInfo];
    uint64_t v9 = *MEMORY[0x1E4F683E8];
    uint64_t v10 = [v8 objectForKey:*MEMORY[0x1E4F683E8]];

    if (!v10) {
      goto LABEL_5;
    }
    id v4 = [v14 userInfo];
    __int16 v11 = [v4 objectForKey:v5];
    uint64_t v12 = [v14 userInfo];
    __int16 v13 = [v12 objectForKey:v9];
    -[HUQuickControlCollectionViewController _setReachabilityForHeaderForIdentifier:to:](self, "_setReachabilityForHeaderForIdentifier:to:", v11, [v13 BOOLValue]);
  }
LABEL_5:
}

- (id)_controlItemsForItem:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  id v5 = v4;
  if (objc_opt_isKindOfClass()) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  id v7 = v6;

  if (v7)
  {
    id v8 = [MEMORY[0x1E4F1CAD0] setWithObject:v7];
  }
  else
  {
    uint64_t v9 = [(HUItemCollectionViewController *)self itemManager];
    id v8 = [v9 childItemsForItem:v5 ofClass:objc_opt_class()];
  }

  return v8;
}

- (void)_reconfigureLayoutOptions
{
  id v3 = [(HUQuickControlCollectionViewController *)self viewControllersKeyedByItem];
  id v4 = [v3 keyEnumerator];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __67__HUQuickControlCollectionViewController__reconfigureLayoutOptions__block_invoke;
  v5[3] = &unk_1E63889F8;
  v5[4] = self;
  objc_msgSend(v4, "na_each:", v5);
}

void __67__HUQuickControlCollectionViewController__reconfigureLayoutOptions__block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 viewControllersKeyedByItem];
  id v7 = [v5 objectForKey:v4];

  uint64_t v6 = [*(id *)(a1 + 32) _titlePositionForItem:v4];
  [v7 setTitlePosition:v6];
}

- (unint64_t)_titlePositionForItem:(id)a3
{
  id v3 = [(HUQuickControlCollectionViewController *)self layoutOptions];
  unint64_t v4 = [v3 titlePosition];

  return v4;
}

- (id)_viewControllerForItem:(id)a3
{
  id v4 = a3;
  id v5 = [(HUQuickControlCollectionViewController *)self viewControllersKeyedByItem];
  uint64_t v6 = [v5 objectForKey:v4];

  if (!v6)
  {
    id v7 = [(HUItemCollectionViewController *)self itemManager];
    char v8 = objc_opt_respondsToSelector();

    if ((v8 & 1) != 0
      && ([(HUItemCollectionViewController *)self itemManager],
          uint64_t v9 = objc_claimAutoreleasedReturnValue(),
          [v9 quickControlContextForItem:v4],
          uint64_t v10 = objc_claimAutoreleasedReturnValue(),
          v9,
          v10))
    {
      id v11 = objc_alloc((Class)[v10 quickControlClass]);
      uint64_t v12 = [v10 controlItems];
      __int16 v13 = [v10 home];
      id v14 = [v10 itemUpdater];
      __int16 v15 = objc_msgSend(v11, "initWithControlItems:home:itemUpdater:controlOrientation:preferredControl:", v12, v13, v14, objc_msgSend(v10, "controlOrientation"), objc_msgSend(v10, "preferredControl"));

      objc_msgSend(v15, "setPreferredControl:", objc_msgSend(v10, "preferredControl"));
      objc_msgSend(v15, "setControlOrientation:", objc_msgSend(v10, "controlOrientation"));
      id v16 = [(HUItemCollectionViewController *)self itemManager];
      uint64_t v17 = [v16 indexPathForItem:v4];

      objc_super v18 = [(HUItemCollectionViewController *)self itemManager];
      __int16 v19 = objc_msgSend(v18, "itemSectionForSectionIndex:", objc_msgSend(v17, "section"));

      id v20 = v15;
      if ([(HUQuickControlViewControllerConfiguration *)v20 conformsToProtocol:&unk_1F1A15088])__int16 v21 = v20; {
      else
      }
        __int16 v21 = 0;
      id v22 = v21;

      [v19 setHeaderAccessoryButtonDelegate:v22];
      uint64_t v6 = [(HUQuickControlCollectionViewController *)self _createCellContainerForViewController:v20 forItem:v4];
    }
    else
    {
      uint64_t v23 = [(HUQuickControlCollectionViewController *)self _controlItemsForItem:v4];
      v24 = [HUQuickControlViewControllerConfiguration alloc];
      v25 = [(HUItemCollectionViewController *)self itemManager];
      v26 = [v25 home];
      v27 = [(HUQuickControlViewControllerConfiguration *)v24 initWithHome:v26];

      [(HUQuickControlViewControllerConfiguration *)v27 setItemUpdater:self];
      [(HUQuickControlViewControllerConfiguration *)v27 setCopyItems:0];
      v51 = v27;
      v52 = (void *)v23;
      uint64_t v17 = objc_msgSend(MEMORY[0x1E4F69098], "hu_preferredQuickControlGroupContextForControlItems:configuration:", v23, v27);
      v49 = [v17 primaryQuickControlContext];
      id v47 = objc_alloc((Class)[v49 quickControlClass]);
      v48 = [v17 primaryQuickControlContext];
      [v48 controlItems];
      int v28 = v50 = v4;
      v29 = [v17 primaryQuickControlContext];
      __int16 v30 = [v29 home];
      v31 = [v17 primaryQuickControlContext];
      __int16 v32 = [v31 itemUpdater];
      v33 = [v17 primaryQuickControlContext];
      uint64_t v34 = [v33 controlOrientation];
      v35 = [v17 primaryQuickControlContext];
      uint64_t v36 = objc_msgSend(v47, "initWithControlItems:home:itemUpdater:controlOrientation:preferredControl:", v28, v30, v32, v34, objc_msgSend(v35, "preferredControl"));

      __int16 v19 = (void *)v36;
      v37 = [v17 primaryQuickControlContext];
      objc_msgSend(v19, "setPreferredControl:", objc_msgSend(v37, "preferredControl"));

      v38 = [v17 primaryQuickControlContext];
      objc_msgSend(v19, "setControlOrientation:", objc_msgSend(v38, "controlOrientation"));

      if (v19)
      {
        v39 = [(HUItemCollectionViewController *)self itemManager];
        __int16 v40 = [v39 indexPathForItem:v50];

        v41 = [(HUItemCollectionViewController *)self itemManager];
        __int16 v42 = objc_msgSend(v41, "itemSectionForSectionIndex:", objc_msgSend(v40, "section"));

        id v43 = v19;
        if ([v43 conformsToProtocol:&unk_1F1A15088]) {
          __int16 v44 = v43;
        }
        else {
          __int16 v44 = 0;
        }
        id v45 = v44;

        [v42 setHeaderAccessoryButtonDelegate:v45];
        uint64_t v6 = [(HUQuickControlCollectionViewController *)self _createCellContainerForViewController:v43 forItem:v50];

        id v4 = v50;
      }
      else
      {
        uint64_t v6 = 0;
        id v4 = v50;
      }
      id v20 = v51;
      uint64_t v10 = v52;
    }
  }

  return v6;
}

- (id)_createCellContainerForViewController:(id)a3 forItem:(id)a4
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  char v8 = [[HUQuickControlCollectionViewCellContainerViewController alloc] initWithContentViewController:v7];

  [(HUQuickControlCollectionViewCellContainerViewController *)v8 setTitlePosition:[(HUQuickControlCollectionViewController *)self _titlePositionForItem:v6]];
  uint64_t v9 = [(HUQuickControlCollectionViewController *)self viewControllersKeyedByItem];
  [v9 setObject:v8 forKey:v6];

  v12[0] = v8;
  uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
  [(HUQuickControlCollectionViewController *)self _propagateInteractiveContentStateForChildViewControllers:v10];

  return v8;
}

- (void)_propagateInteractiveContentStateForChildViewControllers:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = [*(id *)(*((void *)&v13 + 1) + 8 * v8) contentViewController];
        uint64_t v10 = [(HUQuickControlCollectionViewController *)self characteristicWritingAdapter];
        [v9 setCharacteristicWritingDelegate:v10];

        id v11 = [(HUQuickControlCollectionViewController *)self quickControlHost];
        [v9 setQuickControlHost:v11];

        objc_msgSend(v9, "setUserInteractionEnabled:", -[HUQuickControlCollectionViewController isUserInteractionEnabled](self, "isUserInteractionEnabled"));
        uint64_t v12 = [v9 childVCThatRequiresHelper];
        [v12 setQuickControlContentHelper:self];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }
}

- (id)_allViewControllers
{
  v2 = [(HUQuickControlCollectionViewController *)self viewControllersKeyedByItem];
  id v3 = [v2 objectEnumerator];
  id v4 = [v3 allObjects];

  return v4;
}

- (id)_allContentViewControllers
{
  v2 = [(HUQuickControlCollectionViewController *)self _allViewControllers];
  id v3 = objc_msgSend(v2, "na_map:", &__block_literal_global_117);

  return v3;
}

uint64_t __68__HUQuickControlCollectionViewController__allContentViewControllers__block_invoke(uint64_t a1, void *a2)
{
  return [a2 contentViewController];
}

- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)HUQuickControlCollectionViewController;
  [(HUQuickControlCollectionViewController *)&v6 preferredContentSizeDidChangeForChildContentContainer:a3];
  id v4 = [(HUQuickControlCollectionViewController *)self transitionCoordinator];

  if (!v4)
  {
    uint64_t v5 = [(HUQuickControlCollectionViewController *)self collectionViewLayout];
    [v5 invalidateLayout];
  }
}

- (id)viewForTouchContinuation
{
  id v3 = [(HUItemCollectionViewController *)self itemManager];
  id v4 = [v3 displayedItemsInSection:0];

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __66__HUQuickControlCollectionViewController_viewForTouchContinuation__block_invoke;
  v10[3] = &unk_1E638AF88;
  v10[4] = self;
  uint64_t v5 = objc_msgSend(v4, "na_map:", v10);
  objc_super v6 = objc_msgSend(v5, "na_map:", &__block_literal_global_114);
  uint64_t v7 = 0;
  if ([v6 count] == 1)
  {
    uint64_t v8 = [v6 firstObject];
    uint64_t v7 = [v8 viewForTouchContinuation];
  }

  return v7;
}

id __66__HUQuickControlCollectionViewController_viewForTouchContinuation__block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = [*(id *)(a1 + 32) _viewControllerForItem:a2];
  id v3 = [v2 contentViewController];

  return v3;
}

id __66__HUQuickControlCollectionViewController_viewForTouchContinuation__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  id v3 = v2;
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  objc_super v6 = [v5 viewProfile];

  id v7 = 0;
  if ([v6 supportsTouchContinuation])
  {
    id v8 = v3;
    if ([v8 conformsToProtocol:&unk_1F1A0CFD8]) {
      uint64_t v9 = v8;
    }
    else {
      uint64_t v9 = 0;
    }
    id v7 = v9;
  }

  return v7;
}

- (id)intrinsicSizeDescriptorForItemAtIndexPath:(id)a3 itemSize:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [(HUItemCollectionViewController *)self itemManager];
  id v8 = [v7 displayedItemAtIndexPath:v6];

  uint64_t v9 = [(HUQuickControlCollectionViewController *)self _viewControllerForItem:v8];
  uint64_t v10 = objc_msgSend(v9, "intrinsicSizeDescriptorForControlSize:", +[HUQuickControlViewControllerCollectionViewCell quickControlSizeForItemSize:](HUQuickControlViewControllerCollectionViewCell, "quickControlSizeForItemSize:", a4));

  return v10;
}

- (double)heightForSupplementaryViewAtIndexPath:(id)a3
{
  +[HUQuickControlSectionHeaderView estimatedHeight];
  return result;
}

- (void)setCharacteristicWritingDelegate:(id)a3
{
  p_characteristicWritingDelegate = &self->_characteristicWritingDelegate;
  id v5 = a3;
  objc_storeWeak((id *)p_characteristicWritingDelegate, v5);
  id v6 = [(HUQuickControlCollectionViewController *)self characteristicWritingAdapter];
  [v6 setForwardingCharacteristicWritingDelegate:v5];
}

- (void)invalidateContentViewLayout
{
  id v2 = [(HUQuickControlCollectionViewController *)self collectionViewLayout];
  [v2 invalidateLayout];
}

- (void)shouldHideQuickControlHeaderButton:(BOOL)a3 forSectionIdentifier:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = [(HUQuickControlCollectionViewController *)self collectionView];
  id v8 = [v7 visibleSupplementaryViewsOfKind:*MEMORY[0x1E4F43758]];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  void v12[2] = __98__HUQuickControlCollectionViewController_shouldHideQuickControlHeaderButton_forSectionIdentifier___block_invoke;
  v12[3] = &unk_1E638AF40;
  id v13 = v6;
  id v9 = v6;
  uint64_t v10 = objc_msgSend(v8, "na_firstObjectPassingTest:", v12);

  id v11 = [v10 itemSection];
  [v11 setHideAccessoryButton:v4];

  [v10 setHideAccessoryButton:v4];
}

uint64_t __98__HUQuickControlCollectionViewController_shouldHideQuickControlHeaderButton_forSectionIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  id v4 = v3;
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;

  id v7 = [v6 itemSection];
  id v8 = [v7 identifier];
  uint64_t v9 = [v8 isEqualToString:*(void *)(a1 + 32)];

  return v9;
}

- (void)shouldHideQuickControlHeaderText:(BOOL)a3 forSectionIdentifier:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = [(HUQuickControlCollectionViewController *)self collectionView];
  id v8 = [v7 visibleSupplementaryViewsOfKind:*MEMORY[0x1E4F43758]];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  void v12[2] = __96__HUQuickControlCollectionViewController_shouldHideQuickControlHeaderText_forSectionIdentifier___block_invoke;
  v12[3] = &unk_1E638AF40;
  id v13 = v6;
  id v9 = v6;
  uint64_t v10 = objc_msgSend(v8, "na_firstObjectPassingTest:", v12);

  id v11 = [v10 itemSection];
  [v11 setHideHeaderText:v4];

  [v10 setHideHeaderText:v4];
}

uint64_t __96__HUQuickControlCollectionViewController_shouldHideQuickControlHeaderText_forSectionIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  id v4 = v3;
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;

  id v7 = [v6 itemSection];
  id v8 = [v7 identifier];
  uint64_t v9 = [v8 isEqualToString:*(void *)(a1 + 32)];

  return v9;
}

- (void)setQuickControlHost:(id)a3
{
  objc_storeWeak((id *)&self->_quickControlHost, a3);
  id v4 = [(HUQuickControlCollectionViewController *)self _allViewControllers];
  [(HUQuickControlCollectionViewController *)self _propagateInteractiveContentStateForChildViewControllers:v4];
}

- (void)setUserInteractionEnabled:(BOOL)a3
{
  self->_userInteractionEnabled = a3;
  id v4 = [(HUQuickControlCollectionViewController *)self _allViewControllers];
  [(HUQuickControlCollectionViewController *)self _propagateInteractiveContentStateForChildViewControllers:v4];
}

- (NSSet)affectedCharacteristics
{
  id v2 = (void *)MEMORY[0x1E4F1CAD0];
  id v3 = [(HUQuickControlCollectionViewController *)self _allContentViewControllers];
  id v4 = [v2 setWithArray:v3];
  id v5 = objc_msgSend(v4, "na_flatMap:", &__block_literal_global_121_0);

  return (NSSet *)v5;
}

uint64_t __65__HUQuickControlCollectionViewController_affectedCharacteristics__block_invoke(uint64_t a1, void *a2)
{
  return [a2 affectedCharacteristics];
}

- (id)overrideValueForCharacteristic:(id)a3
{
  id v4 = a3;
  id v5 = [(HUQuickControlCollectionViewController *)self _allContentViewControllers];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __73__HUQuickControlCollectionViewController_overrideValueForCharacteristic___block_invoke;
  v10[3] = &unk_1E638AFF0;
  id v11 = v4;
  id v6 = v4;
  id v7 = objc_msgSend(v5, "na_firstObjectPassingTest:", v10);

  id v8 = [v7 overrideValueForCharacteristic:v6];

  return v8;
}

uint64_t __73__HUQuickControlCollectionViewController_overrideValueForCharacteristic___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 affectedCharacteristics];
  uint64_t v4 = [v3 containsObject:*(void *)(a1 + 32)];

  return v4;
}

- (void)accessoryDidUpdateControllable:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  __int16 v21 = self;
  id v5 = [(HUQuickControlCollectionViewController *)self collectionView];
  id v6 = [v5 visibleSupplementaryViewsOfKind:*MEMORY[0x1E4F43758]];

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v22 objects:v34 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v23 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        objc_opt_class();
        id v13 = v12;
        if (objc_opt_isKindOfClass()) {
          long long v14 = v13;
        }
        else {
          long long v14 = 0;
        }
        id v15 = v14;

        if (v15 && objc_msgSend(v4, "hf_isHomePod"))
        {
          long long v16 = [v4 mediaProfile];
          uint64_t v17 = [v16 settings];
          if ([v17 isControllable]) {
            uint64_t v18 = 2;
          }
          else {
            uint64_t v18 = 1;
          }

          __int16 v19 = HFLogForCategory();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            id v20 = [NSNumber numberWithUnsignedInteger:v18];
            *(_DWORD *)buf = 136315906;
            v27 = "-[HUQuickControlCollectionViewController accessoryDidUpdateControllable:]";
            __int16 v28 = 2112;
            v29 = v21;
            __int16 v30 = 2112;
            id v31 = v4;
            __int16 v32 = 2112;
            v33 = v20;
            _os_log_impl(&dword_1BE345000, v19, OS_LOG_TYPE_DEFAULT, "%s(%@) accessory [%@]   reachabilityState = %@", buf, 0x2Au);
          }
          [v15 updateUIForReachabilityState:v18];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v22 objects:v34 count:16];
    }
    while (v9);
  }
}

- (HUQuickControlContentCharacteristicWritingDelegate)characteristicWritingDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_characteristicWritingDelegate);

  return (HUQuickControlContentCharacteristicWritingDelegate *)WeakRetained;
}

- (HUQuickControlContentHosting)quickControlHost
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_quickControlHost);

  return (HUQuickControlContentHosting *)WeakRetained;
}

- (BOOL)isUserInteractionEnabled
{
  return self->_userInteractionEnabled;
}

- (void)setPreferredFrameLayoutGuide:(id)a3
{
}

- (HUQuickControlCollectionViewControllerLayoutOptions)layoutOptions
{
  return self->_layoutOptions;
}

- (BOOL)disableItemUpdatesForOverrideCharacteristicValueChanges
{
  return self->_disableItemUpdatesForOverrideCharacteristicValueChanges;
}

- (NSMapTable)viewControllersKeyedByItem
{
  return self->_viewControllersKeyedByItem;
}

- (HUQuickControlContentCharacteristicWritingUpdateAdapter)characteristicWritingAdapter
{
  return self->_characteristicWritingAdapter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_characteristicWritingAdapter, 0);
  objc_storeStrong((id *)&self->_viewControllersKeyedByItem, 0);
  objc_storeStrong((id *)&self->_layoutOptions, 0);
  objc_storeStrong((id *)&self->_preferredFrameLayoutGuide, 0);
  objc_destroyWeak((id *)&self->_quickControlHost);

  objc_destroyWeak((id *)&self->_characteristicWritingDelegate);
}

@end