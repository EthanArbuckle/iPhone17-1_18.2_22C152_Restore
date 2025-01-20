@interface HUControllableItemCollectionViewController
- (BOOL)_hasTapActionForItem:(id)a3;
- (BOOL)_isMultiControllableServiceAccessory:(id)a3;
- (BOOL)alwaysAllowReordering;
- (BOOL)canBecomeFirstResponder;
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (BOOL)canReorderItemAtIndexPath:(id)a3;
- (BOOL)collectionView:(id)a3 canHandleDropSession:(id)a4;
- (BOOL)collectionView:(id)a3 canMoveItemAtIndexPath:(id)a4;
- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4;
- (BOOL)constrainCellReorderingToBounds;
- (BOOL)controlsWantSystemPresentationAnimations;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)hasCustomControlPresentationAnimations;
- (BOOL)hasDetailsActionForPresentationCoordinator:(id)a3 item:(id)a4;
- (BOOL)itemSupportsToggleInteraction:(id)a3;
- (BOOL)matterItemSupportsToggle:(id)a3;
- (BOOL)presentationCoordinator:(id)a3 shouldBeginInteractivePresentationWithTouchLocation:(CGPoint)a4 view:(id)a5;
- (BOOL)presentationCoordinator:(id)a3 shouldBeginPresentationWithContext:(id)a4;
- (BOOL)requiresUnlockToPerformActionForItem:(id)a3;
- (BOOL)shouldShowAccessoryControlForItem:(id)a3;
- (BOOL)useCustomDragAndDrop;
- (BOOL)viewAppeared;
- (HUControllableItemCollectionViewController)initWithItemManager:(id)a3 collectionViewLayout:(id)a4;
- (HULockAuthorizationDelegate)lockAuthorizationDelegate;
- (HUQuickControlPresentationCoordinator)quickControlPresentationCoordinator;
- (HUQuickControlPresentationDelegate)quickControlPresentationDelegate;
- (HUQuickControlPresentationHost)ancestorQuickControlHostAtPresentationTime;
- (NSCopying)selectedContextualMenuItem;
- (NSMutableDictionary)actionSetExecutionFuturesKeyedByIdentifier;
- (UICollectionViewCell)cellBeingReordered;
- (UIGestureRecognizer)contextualTapGestureRecognizer;
- (UILongPressGestureRecognizer)reorderGestureRecognizer;
- (id)_ancestorQuickControlPresentationHost;
- (id)_childItemsForItem:(id)a3;
- (id)_itemForServiceControlPresentationAtPoint:(CGPoint)a3;
- (id)_performTapActionForItem:(id)a3;
- (id)_performTapActionForItem:(id)a3 tappedArea:(id)a4;
- (id)_visibleCellForItem:(id)a3;
- (id)collectionView:(id)a3 dropSessionDidUpdate:(id)a4 withDestinationIndexPath:(id)a5;
- (id)collectionView:(id)a3 itemsForBeginningDragSession:(id)a4 atIndexPath:(id)a5;
- (id)collectionView:(id)a3 targetIndexPathForMoveOfItemFromOriginalIndexPath:(id)a4 atCurrentIndexPath:(id)a5 toProposedIndexPath:(id)a6;
- (id)controlItemSupprtingToggleInteractionForItem:(id)a3;
- (id)dragItemForItem:(id)a3 atIndexPath:(id)a4;
- (id)finishPresentation:(id)a3 animated:(BOOL)a4;
- (id)initUsingCompositionalLayoutWithItemManager:(id)a3;
- (id)itemForAccessoryControlsWithItem:(id)a3;
- (id)prepareToPerformToggleActionForItem:(id)a3 sourceItem:(id)a4;
- (id)presentAccessoryControlsForItem:(id)a3;
- (id)presentAccessorySettingsForItem:(id)a3;
- (id)presentAccessorySettingsForItem:(id)a3 secondaryDestination:(unint64_t)a4;
- (id)presentationCoordinator:(id)a3 contextForPresentationAtPoint:(CGPoint)a4;
- (id)quickControlPresentationContextForItem:(id)a3 atIndexPath:(id)a4;
- (id)quickControlPresentationContextForItem:(id)a3 atIndexPath:(id)a4 point:(CGPoint)a5;
- (id)quickControlPresentationContextForUUID:(id)a3 type:(unint64_t)a4;
- (id)reorderableItemListForSection:(int64_t)a3;
- (id)tappableAreaForPoint:(CGPoint)a3 inItem:(id)a4 atIndexPath:(id)a5;
- (id)toggleMatterItem:(id)a3;
- (id)unwrappedItemForAccessoryControls:(id)a3;
- (unint64_t)contentColorStyle;
- (void)_commonInit;
- (void)_handleApplicationWillResignActiveNotification:(id)a3;
- (void)_handleContextualGesture:(id)a3;
- (void)_handleReorderGesture:(id)a3;
- (void)_itemSetDidChange;
- (void)_reorderGestureDidBegin:(id)a3;
- (void)_reorderGestureDidChange:(id)a3;
- (void)_reorderGestureDidEnd:(id)a3 finished:(BOOL)a4;
- (void)_showQuickControlsForSelectedMenuItem;
- (void)_showSettingsForSelectedMenuItem;
- (void)_updateEditingStateForCell:(id)a3 animate:(BOOL)a4;
- (void)_updateReorderingGestureRecognizer;
- (void)accessoryControlViewControllerFor:(HFAccessoryRepresentableItem *)a3 tileItem:(HFItem *)a4 completionHandler:(id)a5;
- (void)childViewController:(id)a3 didEndQuickControlsPresentation:(id)a4;
- (void)childViewController:(id)a3 willBeginQuickControlsPresentation:(id)a4;
- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)configureCell:(id)a3 forItem:(id)a4;
- (void)configureWithAccessoryControlViewController:(id)a3;
- (void)didReorderItemWithSortedItemsBySectionID:(id)a3;
- (void)diffableDataItemManager:(id)a3 didUpdateItems:(id)a4 addItems:(id)a5 removeItems:(id)a6;
- (void)disableRefresh;
- (void)enableRefresh;
- (void)itemManager:(id)a3 performUpdateRequest:(id)a4;
- (void)presentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)presentationCoordinator:(id)a3 applyOverrideAttributes:(id)a4 toItem:(id)a5;
- (void)presentationCoordinator:(id)a3 clearOverrideAttributesForItem:(id)a4;
- (void)presentationCoordinator:(id)a3 didEndPresentationWithContext:(id)a4;
- (void)presentationCoordinator:(id)a3 didRecognizeTapForItem:(id)a4 tappedArea:(id)a5;
- (void)presentationCoordinator:(id)a3 willBeginPresentationWithContext:(id)a4;
- (void)presentationCoordinator:(id)a3 willEndPresentationWithContext:(id)a4;
- (void)refreshTileHelper;
- (void)setActionSetExecutionFuturesKeyedByIdentifier:(id)a3;
- (void)setAncestorQuickControlHostAtPresentationTime:(id)a3;
- (void)setCellBeingReordered:(id)a3;
- (void)setConstrainCellReorderingToBounds:(BOOL)a3;
- (void)setContentColorStyle:(unint64_t)a3;
- (void)setContextualTapGestureRecognizer:(id)a3;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)setExecutionFuture:(id)a3 forActionSet:(id)a4;
- (void)setLockAuthorizationDelegate:(id)a3;
- (void)setQuickControlPresentationCoordinator:(id)a3;
- (void)setQuickControlPresentationDelegate:(id)a3;
- (void)setReorderGestureRecognizer:(id)a3;
- (void)setReorderableItemList:(id)a3 forSection:(int64_t)a4;
- (void)setSelectedContextualMenuItem:(id)a3;
- (void)setUseCustomDragAndDrop:(BOOL)a3;
- (void)setViewAppeared:(BOOL)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation HUControllableItemCollectionViewController

- (void)setConstrainCellReorderingToBounds:(BOOL)a3
{
  self->_constrainCellReorderingToBounds = a3;
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  v9.receiver = self;
  v9.super_class = (Class)HUControllableItemCollectionViewController;
  id v8 = a4;
  [(HUItemCollectionViewController *)&v9 collectionView:a3 willDisplayCell:v8 forItemAtIndexPath:a5];
  -[HUControllableItemCollectionViewController _updateEditingStateForCell:animate:](self, "_updateEditingStateForCell:animate:", v8, 1, v9.receiver, v9.super_class);
}

- (void)configureCell:(id)a3 forItem:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v25.receiver = self;
  v25.super_class = (Class)HUControllableItemCollectionViewController;
  [(HUItemCollectionViewController *)&v25 configureCell:v6 forItem:v7];
  [(HUControllableItemCollectionViewController *)self _updateEditingStateForCell:v6 animate:1];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v6;
    objc_opt_class();
    id v9 = v7;
    if (objc_opt_isKindOfClass()) {
      v10 = v9;
    }
    else {
      v10 = 0;
    }
    id v11 = v10;

    v12 = [v11 homeKitObject];
    v13 = [v12 uniqueIdentifier];

    if (v13)
    {
      v14 = [(HUControllableItemCollectionViewController *)self actionSetExecutionFuturesKeyedByIdentifier];
      v15 = [v14 objectForKeyedSubscript:v13];

      if (v15)
      {
        v16 = [(HUControllableItemCollectionViewController *)self actionSetExecutionFuturesKeyedByIdentifier];
        v17 = [v16 objectForKeyedSubscript:v13];
        [v8 setExecuteActionSetFuture:v17];
      }
    }
  }
  id v18 = v6;
  if ([v18 conformsToProtocol:&unk_1F19D2698]) {
    v19 = v18;
  }
  else {
    v19 = 0;
  }
  id v20 = v19;

  if (([MEMORY[0x1E4F69758] isAnIPad] & 1) == 0)
  {
    uint64_t v21 = [v20 item];
    if (v21)
    {
      v22 = (void *)v21;
      v23 = [v20 item];
      char v24 = [v23 isEqual:v7];

      if ((v24 & 1) == 0)
      {
        [v20 setItem:v7];
        [v20 updateUIWithAnimation:1];
      }
    }
  }
}

- (void)_updateEditingStateForCell:(id)a3 animate:(BOOL)a4
{
  BOOL v4 = a4;
  id v16 = a3;
  BOOL v6 = [(HUControllableItemCollectionViewController *)self alwaysAllowReordering];
  id v7 = v16;
  if (!v6)
  {
    id v8 = v16;
    if ([v8 conformsToProtocol:&unk_1F19D2930]) {
      id v9 = v8;
    }
    else {
      id v9 = 0;
    }
    id v10 = v9;

    if (v10)
    {
      id v11 = [(HUItemCollectionViewController *)self itemManager];
      v12 = [v10 item];
      v13 = [v11 indexPathForItem:v12];

      if (v13) {
        BOOL v14 = [(HUControllableItemCollectionViewController *)self canReorderItemAtIndexPath:v13];
      }
      else {
        BOOL v14 = 0;
      }
      uint64_t v15 = [(HUControllableItemCollectionViewController *)self isEditing] & v4;
      if (objc_opt_respondsToSelector()) {
        [v10 setReorderable:v14];
      }
      else {
        uint64_t v15 = v14 & v15;
      }
      [v10 setRearranging:v15];
    }
    id v7 = v16;
  }
}

- (BOOL)alwaysAllowReordering
{
  return [MEMORY[0x1E4F69758] isAMac];
}

- (BOOL)itemSupportsToggleInteraction:(id)a3
{
  id v4 = a3;
  if (((_os_feature_enabled_impl() & 1) != 0 || HM_FEATURE_RVC_DEFAULTS_ENABLED())
    && [(HUControllableItemCollectionViewController *)self matterItemSupportsToggle:v4])
  {
    BOOL v5 = 1;
  }
  else
  {
    BOOL v6 = [(HUControllableItemCollectionViewController *)self controlItemSupprtingToggleInteractionForItem:v4];
    BOOL v5 = v6 != 0;
  }
  return v5;
}

- (id)controlItemSupprtingToggleInteractionForItem:(id)a3
{
  id v4 = a3;
  if ([(HUControllableItemCollectionViewController *)self _isMultiControllableServiceAccessory:v4])
  {
    BOOL v5 = 0;
  }
  else
  {
    objc_opt_class();
    id v6 = v4;
    if (objc_opt_isKindOfClass()) {
      id v7 = v6;
    }
    else {
      id v7 = 0;
    }
    id v8 = v7;

    objc_opt_class();
    BOOL v5 = 0;
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v9 = [v8 sourceItem];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        BOOL v5 = 0;
      }
      else
      {
        id v11 = [(HUControllableItemCollectionViewController *)self _childItemsForItem:v6];
        BOOL v5 = objc_msgSend(MEMORY[0x1E4F69098], "hu_preferredToggleableControlItemInControlItems:", v11);
      }
    }
  }

  return v5;
}

- (BOOL)_isMultiControllableServiceAccessory:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  id v4 = v3;
  if (objc_opt_isKindOfClass()) {
    BOOL v5 = v4;
  }
  else {
    BOOL v5 = 0;
  }
  id v6 = v5;

  if (v6)
  {
    id v7 = [v6 latestResults];
    id v8 = [v7 objectForKey:*MEMORY[0x1E4F688E8]];

    id v9 = objc_msgSend(v8, "na_flatMap:", &__block_literal_global_22);
    BOOL v10 = (unint64_t)[v9 count] > 1;
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (id)_childItemsForItem:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    id v6 = [v5 accessory];
    id v7 = objc_msgSend(v6, "hf_primaryService");
    id v8 = [v5 controlItemsForService:v7];
  }
  else
  {
    id v6 = [(HUItemCollectionViewController *)self itemManager];
    id v8 = [v6 childItemsForItem:v4 ofClass:objc_opt_class()];
  }

  return v8;
}

- (void)diffableDataItemManager:(id)a3 didUpdateItems:(id)a4 addItems:(id)a5 removeItems:(id)a6
{
  id v10 = a6;
  v13.receiver = self;
  v13.super_class = (Class)HUControllableItemCollectionViewController;
  id v11 = a5;
  [(HUItemCollectionViewController *)&v13 diffableDataItemManager:a3 didUpdateItems:a4 addItems:v11 removeItems:v10];
  uint64_t v12 = objc_msgSend(v11, "count", v13.receiver, v13.super_class);

  if (v12 || [v10 count]) {
    [(HUControllableItemCollectionViewController *)self _itemSetDidChange];
  }
}

- (void)_itemSetDidChange
{
  id v3 = [(HUControllableItemCollectionViewController *)self collectionViewLayout];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v7 = [(HUControllableItemCollectionViewController *)self collectionViewLayout];
    id v5 = [(HUItemCollectionViewController *)self itemManager];
    id v6 = [v5 allDisplayedItems];
    [v7 clearAllOverrideAttributesForItems:v6];
  }
}

- (id)initUsingCompositionalLayoutWithItemManager:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)HUControllableItemCollectionViewController;
  id v3 = [(HUItemCollectionViewController *)&v6 initUsingCompositionalLayoutWithItemManager:a3];
  char v4 = v3;
  if (v3) {
    [v3 _commonInit];
  }
  return v4;
}

- (void)_commonInit
{
  [(HUControllableItemCollectionViewController *)self setInstallsStandardGestureForInteractiveMovement:0];
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  [(HUControllableItemCollectionViewController *)self setActionSetExecutionFuturesKeyedByIdentifier:v3];
}

- (void)setActionSetExecutionFuturesKeyedByIdentifier:(id)a3
{
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (void)setUseCustomDragAndDrop:(BOOL)a3
{
  self->_useCustomDragAndDrop = a3;
}

- (void)traitCollectionDidChange:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)HUControllableItemCollectionViewController;
  id v4 = a3;
  [(HUControllableItemCollectionViewController *)&v6 traitCollectionDidChange:v4];
  id v5 = [(HUControllableItemCollectionViewController *)self quickControlPresentationCoordinator];
  [v5 traitCollectionDidChange:v4];
}

- (void)viewDidAppear:(BOOL)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v18.receiver = self;
  v18.super_class = (Class)HUControllableItemCollectionViewController;
  [(HUItemCollectionViewController *)&v18 viewDidAppear:a3];
  uint64_t v4 = [(HUControllableItemCollectionViewController *)self collectionView];
  if (v4)
  {
    id v5 = (void *)v4;
    do
    {
      long long v16 = 0u;
      long long v17 = 0u;
      long long v14 = 0u;
      long long v15 = 0u;
      objc_super v6 = objc_msgSend(v5, "gestureRecognizers", 0);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v19 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v15;
        do
        {
          uint64_t v10 = 0;
          do
          {
            if (*(void *)v15 != v9) {
              objc_enumerationMutation(v6);
            }
            uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8 * v10);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              uint64_t v12 = [(HUControllableItemCollectionViewController *)self quickControlPresentationCoordinator];
              [v12 addMutuallyExclusiveGestureRecognizer:v11];
            }
            ++v10;
          }
          while (v8 != v10);
          uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v19 count:16];
        }
        while (v8);
      }

      uint64_t v13 = [v5 superview];

      id v5 = (void *)v13;
    }
    while (v13);
  }
}

- (HUQuickControlPresentationCoordinator)quickControlPresentationCoordinator
{
  return self->_quickControlPresentationCoordinator;
}

- (void)viewDidLoad
{
  v12.receiver = self;
  v12.super_class = (Class)HUControllableItemCollectionViewController;
  [(HUItemCollectionViewController *)&v12 viewDidLoad];
  id v3 = [HUQuickControlPresentationCoordinator alloc];
  uint64_t v4 = [(HUControllableItemCollectionViewController *)self collectionView];
  id v5 = [(HUQuickControlPresentationCoordinator *)v3 initWithTargetView:v4 delegate:self];
  [(HUControllableItemCollectionViewController *)self setQuickControlPresentationCoordinator:v5];

  objc_super v6 = [(HUControllableItemCollectionViewController *)self collectionView];
  [v6 setClipsToBounds:0];

  if (![(HUControllableItemCollectionViewController *)self useCustomDragAndDrop]) {
    [(HUControllableItemCollectionViewController *)self _updateReorderingGestureRecognizer];
  }
  uint64_t v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v7 addObserver:self selector:sel__handleApplicationWillResignActiveNotification_ name:*MEMORY[0x1E4F43710] object:0];

  if ([(HUControllableItemCollectionViewController *)self useCustomDragAndDrop])
  {
    uint64_t v8 = [(HUControllableItemCollectionViewController *)self collectionView];
    [v8 setDragDelegate:self];

    uint64_t v9 = [(HUControllableItemCollectionViewController *)self collectionView];
    [v9 setDropDelegate:self];

    uint64_t v10 = [MEMORY[0x1E4F69758] isAMac];
    uint64_t v11 = [(HUControllableItemCollectionViewController *)self collectionView];
    [v11 setDragInteractionEnabled:v10];
  }
  [(HUControllableItemCollectionViewController *)self _registerSectionDecorationViews];
}

- (BOOL)useCustomDragAndDrop
{
  return self->_useCustomDragAndDrop;
}

- (void)setQuickControlPresentationCoordinator:(id)a3
{
}

- (void)_updateReorderingGestureRecognizer
{
  if (([(HUControllableItemCollectionViewController *)self isEditing] & 1) != 0
    || [(HUControllableItemCollectionViewController *)self alwaysAllowReordering])
  {
    id v3 = [(HUControllableItemCollectionViewController *)self reorderGestureRecognizer];

    if (!v3)
    {
      uint64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4F42B70]) initWithTarget:self action:sel__handleReorderGesture_];
      [(HUControllableItemCollectionViewController *)self setReorderGestureRecognizer:v4];

      if ([(HUControllableItemCollectionViewController *)self alwaysAllowReordering]) {
        double v5 = 0.15;
      }
      else {
        double v5 = 0.1;
      }
      objc_super v6 = [(HUControllableItemCollectionViewController *)self reorderGestureRecognizer];
      [v6 setMinimumPressDuration:v5];

      uint64_t v7 = [(HUControllableItemCollectionViewController *)self reorderGestureRecognizer];
      [v7 setDelegate:self];

      id v12 = [(HUControllableItemCollectionViewController *)self collectionView];
      uint64_t v8 = [(HUControllableItemCollectionViewController *)self reorderGestureRecognizer];
      [v12 addGestureRecognizer:v8];
    }
  }
  else
  {
    uint64_t v9 = [(HUControllableItemCollectionViewController *)self reorderGestureRecognizer];

    if (v9)
    {
      uint64_t v10 = [(HUControllableItemCollectionViewController *)self collectionView];
      uint64_t v11 = [(HUControllableItemCollectionViewController *)self reorderGestureRecognizer];
      [v10 removeGestureRecognizer:v11];

      [(HUControllableItemCollectionViewController *)self setReorderGestureRecognizer:0];
    }
  }
}

- (UILongPressGestureRecognizer)reorderGestureRecognizer
{
  return self->_reorderGestureRecognizer;
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)HUControllableItemCollectionViewController;
  [(HUItemCollectionViewController *)&v4 viewWillAppear:a3];
  [(HUControllableItemCollectionViewController *)self setViewAppeared:1];
  [(HUControllableItemCollectionViewController *)self refreshTileHelper];
}

- (void)setViewAppeared:(BOOL)a3
{
  self->_viewAppeared = a3;
}

- (void)presentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  uint64_t v9 = _Block_copy(a5);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __88__HUControllableItemCollectionViewController_presentViewController_animated_completion___block_invoke;
  aBlock[3] = &unk_1E6385BF8;
  aBlock[4] = self;
  id v14 = v9;
  id v10 = v9;
  uint64_t v11 = _Block_copy(aBlock);
  v12.receiver = self;
  v12.super_class = (Class)HUControllableItemCollectionViewController;
  [(HUControllableItemCollectionViewController *)&v12 presentViewController:v8 animated:v6 completion:v11];
}

- (id)presentAccessorySettingsForItem:(id)a3
{
  id v3 = [(HUControllableItemCollectionViewController *)self presentAccessorySettingsForItem:a3 secondaryDestination:0];

  return v3;
}

- (id)presentAccessorySettingsForItem:(id)a3 secondaryDestination:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v7 = self;
  id v8 = HUControllableItemCollectionViewController.presentAccessorySettings(for:secondaryDestination:)(v6, a4);

  return v8;
}

- (id)presentAccessoryControlsForItem:(id)a3
{
  id v4 = a3;
  double v5 = self;
  id v6 = HUControllableItemCollectionViewController.presentAccessoryControls(for:)(v4);

  return v6;
}

- (void)configureWithAccessoryControlViewController:(id)a3
{
  id v4 = a3;
  double v5 = self;
  HUControllableItemCollectionViewController.configure(accessoryControlViewController:)(v4);
}

- (void)accessoryControlViewControllerFor:(HFAccessoryRepresentableItem *)a3 tileItem:(HFItem *)a4 completionHandler:(id)a5
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBA46780);
  MEMORY[0x1F4188790](v9 - 8);
  uint64_t v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  objc_super v12 = _Block_copy(a5);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  uint64_t v14 = sub_1BE9C4DD8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  long long v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_1EA1167E0;
  v15[5] = v13;
  long long v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_1EA113230;
  v16[5] = v15;
  long long v17 = a3;
  objc_super v18 = a4;
  v19 = self;
  sub_1BE5AF20C((uint64_t)v11, (uint64_t)&unk_1EA1167F0, (uint64_t)v16);
  swift_release();
}

- (id)unwrappedItemForAccessoryControls:(id)a3
{
  self;
  double v5 = (void *)swift_dynamicCastObjCClass();
  id v6 = a3;
  uint64_t v7 = v6;
  if (v5)
  {
    id v8 = self;
    id v9 = objc_msgSend(v5, sel_sourceItem);
  }
  else
  {
    id v9 = v6;
    uint64_t v10 = self;
  }
  uint64_t v11 = (void *)swift_dynamicCastObjCProtocolConditional();

  if (!v11) {

  }
  return v11;
}

- (void)refreshTileHelper
{
  v2 = self;
  HUControllableItemCollectionViewController.refreshTileHelper()();
}

- (BOOL)hasCustomControlPresentationAnimations
{
  return 0;
}

- (BOOL)controlsWantSystemPresentationAnimations
{
  v2 = self;
  if ([(HUControllableItemCollectionViewController *)v2 hasCustomControlPresentationAnimations])
  {
    if (objc_msgSend(self, sel_isAnIPhone)) {
      unsigned __int8 v3 = 1;
    }
    else {
      unsigned __int8 v3 = objc_msgSend(self, sel_isHomeControlService);
    }
  }
  else
  {
    unsigned __int8 v3 = 0;
  }

  return v3;
}

- (BOOL)matterItemSupportsToggle:(id)a3
{
  id v4 = a3;
  double v5 = self;
  char v6 = _sSo42HUControllableItemCollectionViewControllerC6HomeUIE06matterB14SupportsToggle4itemSbSo6HFItemC_tF_0(v4);

  return v6 & 1;
}

- (id)toggleMatterItem:(id)a3
{
  id v4 = a3;
  double v5 = self;
  id v6 = _sSo42HUControllableItemCollectionViewControllerC6HomeUIE012toggleMatterB0ySo8NAFutureCyyXlGSo6HFItemCF_0(v4);

  return v6;
}

- (id)itemForAccessoryControlsWithItem:(id)a3
{
  self;
  double v5 = (void *)swift_dynamicCastObjCClass();
  id v6 = a3;
  uint64_t v7 = v6;
  if (v5)
  {
    id v8 = self;
    id v9 = objc_msgSend(v5, sel_sourceItem);
  }
  else
  {
    id v9 = v6;
    uint64_t v10 = self;
  }
  uint64_t v11 = (void *)swift_dynamicCastObjCProtocolConditional();

  if (!v11) {

  }
  return v11;
}

- (BOOL)shouldShowAccessoryControlForItem:(id)a3
{
  id v4 = (HFItem *)a3;
  double v5 = self;
  LOBYTE(self) = HUControllableItemCollectionViewController.shouldShowAccessoryControl(for:)(v4);

  return self & 1;
}

- (id)finishPresentation:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  swift_getObjectType();
  if (swift_conformsToProtocol2()) {
    id v7 = a3;
  }
  else {
    id v7 = 0;
  }
  if (v7)
  {
    id v8 = a3;
    id v9 = self;
    id v10 = objc_msgSend(v8, sel_hu_dismissViewControllerAnimated_, -[HUControllableItemCollectionViewController controlsWantSystemPresentationAnimations](v9, sel_controlsWantSystemPresentationAnimations));
  }
  else
  {
    id v10 = objc_msgSend(a3, sel_hu_dismissViewControllerAnimated_, v4);
  }

  return v10;
}

- (void)enableRefresh
{
}

- (void)disableRefresh
{
}

- (HUControllableItemCollectionViewController)initWithItemManager:(id)a3 collectionViewLayout:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (([v8 conformsToProtocol:&unk_1F1A0ACC0] & 1) == 0)
  {
    objc_super v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"HUControllableItemCollectionViewController.m", 73, @"Invalid parameter not satisfying: %@", @"[collectionViewLayout conformsToProtocol:@protocol(HUControllableCollectionViewLayout)]" object file lineNumber description];
  }
  v13.receiver = self;
  v13.super_class = (Class)HUControllableItemCollectionViewController;
  id v9 = [(HUItemCollectionViewController *)&v13 initWithItemManager:v7 collectionViewLayout:v8];
  id v10 = v9;
  if (v9) {
    [(HUControllableItemCollectionViewController *)v9 _commonInit];
  }

  return v10;
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  [(HUControllableItemCollectionViewController *)self setEditing:0 animated:0];
  [(HUControllableItemCollectionViewController *)self setViewAppeared:0];
  v5.receiver = self;
  v5.super_class = (Class)HUControllableItemCollectionViewController;
  [(HUItemCollectionViewController *)&v5 viewDidDisappear:v3];
}

uint64_t __88__HUControllableItemCollectionViewController_presentViewController_animated_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  BOOL v3 = *(void **)(a1 + 32);

  return [v3 setEditing:0 animated:0];
}

- (void)_handleApplicationWillResignActiveNotification:(id)a3
{
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  int v7 = [(HUControllableItemCollectionViewController *)self isEditing];
  v22.receiver = self;
  v22.super_class = (Class)HUControllableItemCollectionViewController;
  [(HUCollectionViewController *)&v22 setEditing:v5 animated:v4];
  if (v7 != v5)
  {
    if ([(HUControllableItemCollectionViewController *)self useCustomDragAndDrop])
    {
      id v8 = [(HUControllableItemCollectionViewController *)self quickControlPresentationCoordinator];
      [v8 setIsEditing:v5];

      uint64_t v9 = [MEMORY[0x1E4F69758] isAMac] | v5;
      id v10 = [(HUControllableItemCollectionViewController *)self collectionView];
      [v10 setDragInteractionEnabled:v9];

      uint64_t v11 = [(HUControllableItemCollectionViewController *)self splitViewController];
      [v11 setEditing:v5 animated:v4];
    }
    else
    {
      [(HUControllableItemCollectionViewController *)self _updateReorderingGestureRecognizer];
    }
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    objc_super v12 = [(HUControllableItemCollectionViewController *)self collectionView];
    objc_super v13 = [v12 visibleCells];

    uint64_t v14 = [v13 countByEnumeratingWithState:&v18 objects:v23 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v19;
      do
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v19 != v16) {
            objc_enumerationMutation(v13);
          }
          [(HUControllableItemCollectionViewController *)self _updateEditingStateForCell:*(void *)(*((void *)&v18 + 1) + 8 * v17++) animate:1];
        }
        while (v15 != v17);
        uint64_t v15 = [v13 countByEnumeratingWithState:&v18 objects:v23 count:16];
      }
      while (v15);
    }
  }
}

- (void)setContentColorStyle:(unint64_t)a3
{
  self->_contentColorStyle = a3;
}

- (void)setExecutionFuture:(id)a3 forActionSet:(id)a4
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  v33 = v6;
  if (v6 && v7 && ([v6 isFinished] & 1) == 0)
  {
    v32 = v8;
    uint64_t v9 = [(HUControllableItemCollectionViewController *)self actionSetExecutionFuturesKeyedByIdentifier];
    id v10 = [v8 uniqueIdentifier];
    [v9 setObject:v6 forKeyedSubscript:v10];

    objc_initWeak(&location, self);
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __78__HUControllableItemCollectionViewController_setExecutionFuture_forActionSet___block_invoke;
    v38[3] = &unk_1E6386150;
    objc_copyWeak(&v40, &location);
    id v11 = v8;
    id v39 = v11;
    id v12 = (id)[v6 addCompletionBlock:v38];
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    objc_super v13 = [(HUControllableItemCollectionViewController *)self collectionView];
    uint64_t v14 = [v13 visibleCells];

    uint64_t v15 = [v14 countByEnumeratingWithState:&v34 objects:v42 count:16];
    if (v15)
    {
      uint64_t v16 = *(void *)v35;
      while (2)
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v35 != v16) {
            objc_enumerationMutation(v14);
          }
          long long v18 = *(void **)(*((void *)&v34 + 1) + 8 * i);
          objc_opt_class();
          id v19 = v18;
          if (objc_opt_isKindOfClass()) {
            long long v20 = v19;
          }
          else {
            long long v20 = 0;
          }
          id v21 = v20;

          objc_opt_class();
          id v22 = v19;
          if (objc_opt_isKindOfClass()) {
            v23 = v22;
          }
          else {
            v23 = 0;
          }
          id v24 = v23;

          if (v24) {
            BOOL v25 = 1;
          }
          else {
            BOOL v25 = v21 == 0;
          }
          if (!v25)
          {
            id v26 = v21;
            id v24 = v22;
          }
          objc_opt_class();
          id v27 = [v24 item];
          if (objc_opt_isKindOfClass()) {
            v28 = v27;
          }
          else {
            v28 = 0;
          }
          id v29 = v28;

          v30 = [v29 actionSet];
          int v31 = [v30 isEqual:v11];

          if (v31)
          {
            [v24 setExecuteActionSetFuture:v33];

            goto LABEL_28;
          }
        }
        uint64_t v15 = [v14 countByEnumeratingWithState:&v34 objects:v42 count:16];
        if (v15) {
          continue;
        }
        break;
      }
    }
LABEL_28:

    objc_destroyWeak(&v40);
    objc_destroyWeak(&location);
    id v8 = v32;
  }
}

void __78__HUControllableItemCollectionViewController_setExecutionFuture_forActionSet___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v2 = [WeakRetained actionSetExecutionFuturesKeyedByIdentifier];
  BOOL v3 = [*(id *)(a1 + 32) uniqueIdentifier];
  [v2 removeObjectForKey:v3];
}

- (void)_handleReorderGesture:(id)a3
{
  id v7 = a3;
  switch([v7 state])
  {
    case 1:
      [(HUControllableItemCollectionViewController *)self _reorderGestureDidBegin:v7];
      break;
    case 2:
      [(HUControllableItemCollectionViewController *)self _reorderGestureDidChange:v7];
      break;
    case 3:
      BOOL v4 = self;
      id v5 = v7;
      uint64_t v6 = 1;
      goto LABEL_6;
    case 4:
      BOOL v4 = self;
      id v5 = v7;
      uint64_t v6 = 0;
LABEL_6:
      [(HUControllableItemCollectionViewController *)v4 _reorderGestureDidEnd:v5 finished:v6];
      break;
    default:
      break;
  }
}

- (void)_reorderGestureDidBegin:(id)a3
{
  id v4 = a3;
  id v5 = [(HUControllableItemCollectionViewController *)self collectionView];
  uint64_t v6 = [(HUControllableItemCollectionViewController *)self collectionView];
  [v4 locationInView:v6];
  double v8 = v7;
  double v10 = v9;

  objc_msgSend(v5, "indexPathForItemAtPoint:", v8, v10);
  id v14 = (id)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    id v11 = [(HUControllableItemCollectionViewController *)self collectionView];
    [v11 beginInteractiveMovementForItemAtIndexPath:v14];

    id v12 = [(HUControllableItemCollectionViewController *)self collectionView];
    objc_super v13 = [v12 cellForItemAtIndexPath:v14];
    [(HUControllableItemCollectionViewController *)self setCellBeingReordered:v13];
  }
}

- (void)_reorderGestureDidChange:(id)a3
{
  id v4 = a3;
  id v5 = [(HUControllableItemCollectionViewController *)self cellBeingReordered];
  [v5 bounds];
  double v7 = v6;

  double v8 = [(HUControllableItemCollectionViewController *)self collectionView];
  [v4 locationInView:v8];
  double v10 = v9;
  double v12 = v11;

  objc_super v13 = [(HUControllableItemCollectionViewController *)self collectionView];
  [v13 contentSize];
  double v15 = v14;
  double v17 = v16;

  if ([(HUControllableItemCollectionViewController *)self constrainCellReorderingToBounds])
  {
    double v18 = v7 * 0.5;
    double v19 = fmax(v10, 0.0);
    if (v19 >= v15) {
      double v10 = v15;
    }
    else {
      double v10 = v19;
    }
    double v20 = v18 + 0.0;
    if (v18 + 0.0 < v12) {
      double v20 = v12;
    }
    double v21 = v17 - v18;
    if (v21 < 0.0) {
      double v21 = -v21;
    }
    if (v20 >= v21) {
      double v12 = v21;
    }
    else {
      double v12 = v20;
    }
  }
  id v22 = [(HUControllableItemCollectionViewController *)self collectionView];
  objc_msgSend(v22, "updateInteractiveMovementTargetPosition:", v10, v12);
}

- (void)_reorderGestureDidEnd:(id)a3 finished:(BOOL)a4
{
  BOOL v4 = a4;
  [(HUControllableItemCollectionViewController *)self setCellBeingReordered:0];
  double v6 = [(HUControllableItemCollectionViewController *)self collectionView];
  id v7 = v6;
  if (v4) {
    [v6 endInteractiveMovement];
  }
  else {
    [v6 cancelInteractiveMovement];
  }
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(HUControllableItemCollectionViewController *)self reorderGestureRecognizer];

  if (v8 == v7)
  {
    double v10 = [(HUControllableItemCollectionViewController *)self collectionView];
    double v11 = [(HUControllableItemCollectionViewController *)self collectionView];
    [v6 locationInView:v11];
    double v12 = objc_msgSend(v10, "indexPathForItemAtPoint:");

    if (v12) {
      BOOL v9 = [(HUControllableItemCollectionViewController *)self canReorderItemAtIndexPath:v12];
    }
    else {
      BOOL v9 = 0;
    }
  }
  else
  {
    BOOL v9 = 1;
  }

  return v9;
}

- (BOOL)canReorderItemAtIndexPath:(id)a3
{
  return 0;
}

- (id)reorderableItemListForSection:(int64_t)a3
{
  return 0;
}

- (void)setReorderableItemList:(id)a3 forSection:(int64_t)a4
{
}

- (id)_visibleCellForItem:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v5 = [(HUControllableItemCollectionViewController *)self collectionView];
  id v6 = [v5 indexPathsForVisibleItems];

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
        double v12 = [(HUItemCollectionViewController *)self itemManager];
        id v13 = [v12 displayedItemAtIndexPath:v11];

        if (v13 == v4)
        {
          double v15 = [(HUControllableItemCollectionViewController *)self collectionView];
          double v14 = [v15 cellForItemAtIndexPath:v11];

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
  double v14 = 0;
LABEL_11:

  return v14;
}

- (BOOL)_hasTapActionForItem:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  id v5 = v4;
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v8 = [v5 latestResults];
    uint64_t v9 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F68B30]];
    char v10 = [v9 BOOLValue];

    if ((v10 & 1) == 0
      && ((_os_feature_enabled_impl() & 1) == 0 && !HM_FEATURE_RVC_DEFAULTS_ENABLED()
       || ![(HUControllableItemCollectionViewController *)self matterItemSupportsToggle:v5]))
    {
      id v14 = v5;
      if ([v14 conformsToProtocol:&unk_1F1A3D558]) {
        double v15 = v14;
      }
      else {
        double v15 = 0;
      }
      id v16 = v15;

      long long v17 = [v14 latestResults];
      long long v18 = [v17 objectForKeyedSubscript:*MEMORY[0x1E4F683C0]];

      if (v18)
      {
        BOOL v19 = ([v18 integerValue] & 8) == 0;
        if (v7)
        {
LABEL_17:

          goto LABEL_37;
        }
      }
      else
      {
        BOOL v19 = 1;
        if (v7) {
          goto LABEL_17;
        }
      }
      uint64_t v20 = [(HUControllableItemCollectionViewController *)self _childItemsForItem:v14];
      uint64_t v21 = objc_msgSend(MEMORY[0x1E4F69098], "hu_preferredToggleableControlItemInControlItems:", v20);
      id v39 = (void *)v20;
      id v40 = (void *)v21;
      if (v21)
      {
        uint64_t v22 = (void *)v21;
        v23 = [v16 accessories];
        id v24 = [v23 anyObject];
        BOOL v25 = objc_msgSend(v24, "hf_siriEndpointProfile");
        if (v25) {
          BOOL v26 = v19;
        }
        else {
          BOOL v26 = 0;
        }

        BOOL v11 = 1;
        int v27 = 1;
        if (v26)
        {
LABEL_36:

          if (!v27) {
            goto LABEL_10;
          }
LABEL_37:
          LOBYTE(v12) = 0;
          goto LABEL_11;
        }
      }
      else
      {
        v28 = [v14 latestResults];
        id v29 = [v28 objectForKeyedSubscript:*MEMORY[0x1E4F68BC0]];

        v30 = [v14 latestResults];
        int v31 = [v30 objectForKeyedSubscript:*MEMORY[0x1E4F68C40]];

        BOOL v11 = 0;
        if (!v29 && v31) {
          BOOL v11 = [v31 category] == 1;
        }

        uint64_t v22 = 0;
      }
      objc_opt_class();
      id v32 = v22;
      if (objc_opt_isKindOfClass()) {
        v33 = v32;
      }
      else {
        v33 = 0;
      }
      id v34 = v33;

      long long v35 = [v34 targetModeValueSet];
      if ((unint64_t)[v35 count] <= 1)
      {

        int v27 = 0;
      }
      else
      {
        long long v36 = [v16 accessories];
        [v36 anyObject];
        long long v37 = v38 = v16;
        int v27 = [v37 supportsCHIP];

        id v16 = v38;
      }

      uint64_t v22 = v40;
      goto LABEL_36;
    }
  }
  BOOL v11 = 1;
LABEL_10:
  unsigned int v12 = v11 & ~[(HUControllableItemCollectionViewController *)self isEditing];
LABEL_11:

  return v12;
}

- (id)_performTapActionForItem:(id)a3
{
  return [(HUControllableItemCollectionViewController *)self _performTapActionForItem:a3 tappedArea:@"HUTileCellTappableAreaGeneralToggleArea"];
}

- (id)_performTapActionForItem:(id)a3 tappedArea:(id)a4
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v6;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __82__HUControllableItemCollectionViewController__performTapActionForItem_tappedArea___block_invoke;
    aBlock[3] = &unk_1E6386178;
    id v61 = v7;
    v62 = self;
    uint64_t v8 = (void (**)(void))_Block_copy(aBlock);

LABEL_7:
    int v9 = 1;
    goto LABEL_28;
  }
  if (((_os_feature_enabled_impl() & 1) != 0 || HM_FEATURE_RVC_DEFAULTS_ENABLED())
    && [(HUControllableItemCollectionViewController *)self matterItemSupportsToggle:v6])
  {
    objc_initWeak((id *)location, self);
    v57[0] = MEMORY[0x1E4F143A8];
    v57[1] = 3221225472;
    v57[2] = __82__HUControllableItemCollectionViewController__performTapActionForItem_tappedArea___block_invoke_2;
    v57[3] = &unk_1E63861A0;
    objc_copyWeak(&v59, (id *)location);
    id v7 = v6;
    id v58 = v7;
    uint64_t v8 = (void (**)(void))_Block_copy(v57);

    objc_destroyWeak(&v59);
    objc_destroyWeak((id *)location);
    goto LABEL_7;
  }
  char v10 = [v6 latestResults];
  BOOL v11 = [v10 objectForKeyedSubscript:*MEMORY[0x1E4F683C0]];

  if (v11 && ([v11 unsignedIntegerValue] & 0x10) != 0)
  {
    v56[0] = MEMORY[0x1E4F143A8];
    v56[1] = 3221225472;
    v56[2] = __82__HUControllableItemCollectionViewController__performTapActionForItem_tappedArea___block_invoke_3;
    v56[3] = &unk_1E6385000;
    v56[4] = self;
    uint64_t v8 = (void (**)(void))_Block_copy(v56);
    int v9 = 1;
    id v7 = v6;
  }
  else
  {
    unsigned int v12 = [v6 latestResults];
    id v13 = [v12 objectForKeyedSubscript:*MEMORY[0x1E4F68BC0]];

    id v14 = [v6 latestResults];
    double v15 = [v14 objectForKeyedSubscript:*MEMORY[0x1E4F68C40]];

    objc_opt_class();
    id v16 = v15;
    if (objc_opt_isKindOfClass()) {
      long long v17 = v16;
    }
    else {
      long long v17 = 0;
    }
    id v18 = v17;

    if (v16 && !v18)
    {
      uint64_t v19 = objc_opt_class();
      NSLog(&cfstr_Hfresultunderl.isa, v16, v19);
    }
    uint64_t v20 = v13;
    v47 = v18;
    if ([v13 integerValue]) {
      BOOL v21 = [v18 category] == 1;
    }
    else {
      BOOL v21 = 1;
    }
    uint64_t v22 = [v6 latestResults];
    v23 = [v22 objectForKeyedSubscript:*MEMORY[0x1E4F68CB0]];
    uint64_t v24 = [v23 unsignedIntegerValue];

    if (v21 && (objc_msgSend(MEMORY[0x1E4F2E4F8], "hf_isSuspendedStateSupported:", v24) & 1) == 0)
    {
      v53[0] = MEMORY[0x1E4F143A8];
      v53[1] = 3221225472;
      v53[2] = __82__HUControllableItemCollectionViewController__performTapActionForItem_tappedArea___block_invoke_4;
      v53[3] = &unk_1E63861C8;
      v53[4] = self;
      id v7 = v6;
      id v54 = v7;
      SEL v55 = a2;
      uint64_t v8 = (void (**)(void))_Block_copy(v53);
      id v29 = v47;
      if (((_os_feature_enabled_impl() & 1) != 0
         || CFPreferencesGetAppBooleanValue(@"MatteriPhoneOnlyPairingEnabled", @"/Library/Managed Preferences/mobile/com.apple.homed.plist", 0))&& [v47 isThreadNetworkError])
      {
        int v33 = [MEMORY[0x1E4F69138] isSpringBoard];
        id v34 = HFLogForCategory();
        BOOL v35 = os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT);
        if (v33)
        {
          if (v35)
          {
            long long v36 = (objc_class *)objc_opt_class();
            long long v37 = NSStringFromClass(v36);
            *(_DWORD *)id location = 138412546;
            *(void *)&location[4] = v37;
            __int16 v64 = 2112;
            id v65 = v7;
            _os_log_impl(&dword_1BE345000, v34, OS_LOG_TYPE_DEFAULT, "%@+Controls: presenting alert popup due to no thread network for item: %@", location, 0x16u);
          }
          id v38 = (void *)MEMORY[0x1E4F42728];
          id v39 = _HULocalizedStringWithDefaultValue(@"HUControlCenterErrorAccessoryUnavailable", @"HUControlCenterErrorAccessoryUnavailable", 1);
          id v40 = _HULocalizedStringWithDefaultValue(@"HUControlCenterLongFormErrorNoThreadNetworkLocal", @"HUControlCenterLongFormErrorNoThreadNetworkLocal", 1);
          v41 = [v38 alertControllerWithTitle:v39 message:v40 preferredStyle:1];

          v42 = (void *)MEMORY[0x1E4F42720];
          uint64_t v43 = _HULocalizedStringWithDefaultValue(@"HUControlCenterOkAction", @"HUControlCenterOkAction", 1);
          v44 = [v42 actionWithTitle:v43 style:0 handler:0];

          [v41 addAction:v44];
          [v41 setPreferredAction:v44];
          v52.receiver = self;
          v52.super_class = (Class)HUControllableItemCollectionViewController;
          [(HUControllableItemCollectionViewController *)&v52 presentViewController:v41 animated:1 completion:0];
          uint64_t v31 = [MEMORY[0x1E4F7A0D8] futureWithNoResult];
        }
        else
        {
          if (v35)
          {
            v45 = (objc_class *)objc_opt_class();
            v46 = NSStringFromClass(v45);
            *(_DWORD *)id location = 138412546;
            *(void *)&location[4] = v46;
            __int16 v64 = 2112;
            id v65 = v7;
            _os_log_impl(&dword_1BE345000, v34, OS_LOG_TYPE_DEFAULT, "%@+Controls: navigating to accessory settings due to no thread network for item: %@", location, 0x16u);
          }
          uint64_t v31 = [(HUControllableItemCollectionViewController *)self presentAccessorySettingsForItem:v7];
        }

        goto LABEL_32;
      }

      int v9 = 0;
    }
    else
    {
      BOOL v25 = (void *)MEMORY[0x1E4F69098];
      BOOL v26 = [(HUControllableItemCollectionViewController *)self _childItemsForItem:v6];
      int v27 = objc_msgSend(v25, "hu_preferredToggleableControlItemInControlItems:", v26);

      if (v27)
      {
        v50[0] = MEMORY[0x1E4F143A8];
        v50[1] = 3221225472;
        v50[2] = __82__HUControllableItemCollectionViewController__performTapActionForItem_tappedArea___block_invoke_238;
        v50[3] = &unk_1E6385000;
        id v28 = v27;
        id v51 = v28;
        uint64_t v8 = (void (**)(void))_Block_copy(v50);
        id v7 = v28;
      }
      else
      {
        uint64_t v8 = 0;
        id v7 = v6;
      }
      id v29 = v47;

      int v9 = 1;
    }
  }
LABEL_28:
  BOOL v11 = [MEMORY[0x1E4F7A0D8] futureWithNoResult];
  if (!v8) {
    goto LABEL_33;
  }
  if (v9)
  {
    v30 = [(HUControllableItemCollectionViewController *)self prepareToPerformToggleActionForItem:v7 sourceItem:v6];
    v48[0] = MEMORY[0x1E4F143A8];
    v48[1] = 3221225472;
    v48[2] = __82__HUControllableItemCollectionViewController__performTapActionForItem_tappedArea___block_invoke_2_239;
    v48[3] = &unk_1E63861F0;
    uint64_t v8 = v8;
    v49 = v8;
    uint64_t v31 = [v30 flatMap:v48];

    BOOL v11 = v49;
  }
  else
  {
    uint64_t v31 = v8[2](v8);
  }
LABEL_32:

  BOOL v11 = (void *)v31;
LABEL_33:

  return v11;
}

id __82__HUControllableItemCollectionViewController__performTapActionForItem_tappedArea___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) latestResults];
  BOOL v3 = [v2 objectForKeyedSubscript:*MEMORY[0x1E4F68BC0]];
  uint64_t v4 = [v3 integerValue];

  id v5 = *(void **)(a1 + 32);
  if (v4 == 2) {
    [v5 turnOffActionSet];
  }
  else {
  id v6 = [v5 executeActionSet];
  }
  id v7 = *(void **)(a1 + 40);
  uint64_t v8 = [*(id *)(a1 + 32) actionSet];
  [v7 setExecutionFuture:v6 forActionSet:v8];

  return v6;
}

id __82__HUControllableItemCollectionViewController__performTapActionForItem_tappedArea___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  BOOL v3 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained toggleMatterItem:*(void *)(a1 + 32)];
  }
  else {
  uint64_t v4 = [MEMORY[0x1E4F7A0D8] futureWithNoResult];
  }

  return v4;
}

id __82__HUControllableItemCollectionViewController__performTapActionForItem_tappedArea___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) quickControlPresentationCoordinator];
  BOOL v3 = [*(id *)(a1 + 32) quickControlPresentationCoordinator];
  uint64_t v4 = [v3 presentationContext];
  id v5 = [v2 presentQuickControlWithContext:v4 animated:1];

  return v5;
}

id __82__HUControllableItemCollectionViewController__performTapActionForItem_tappedArea___block_invoke_4(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) itemManager];
  BOOL v3 = [MEMORY[0x1E4F1CAD0] setWithObject:*(void *)(a1 + 40)];
  uint64_t v4 = [v2 updateResultsForItems:v3 senderSelector:*(void *)(a1 + 48)];

  return v4;
}

uint64_t __82__HUControllableItemCollectionViewController__performTapActionForItem_tappedArea___block_invoke_238(uint64_t a1)
{
  return [*(id *)(a1 + 32) toggleValue];
}

uint64_t __82__HUControllableItemCollectionViewController__performTapActionForItem_tappedArea___block_invoke_2_239(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)tappableAreaForPoint:(CGPoint)a3 inItem:(id)a4 atIndexPath:(id)a5
{
  double y = a3.y;
  double x = a3.x;
  id v8 = a5;
  int v9 = [(HUControllableItemCollectionViewController *)self collectionView];
  char v10 = [v9 cellForItemAtIndexPath:v8];

  objc_opt_class();
  id v11 = v10;
  if (objc_opt_isKindOfClass()) {
    unsigned int v12 = v11;
  }
  else {
    unsigned int v12 = 0;
  }
  id v13 = v12;

  if (v13)
  {
    id v14 = [(HUControllableItemCollectionViewController *)self collectionView];
    objc_msgSend(v13, "convertPoint:fromView:", v14, x, y);
    double v16 = v15;
    double v18 = v17;

    objc_msgSend(v13, "tappableAreaForPoint:", v16, v18);
    uint64_t v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v19 = @"HUTileCellTappableAreaGeneralToggleArea";
  }
  uint64_t v20 = v19;

  return v20;
}

- (id)prepareToPerformToggleActionForItem:(id)a3 sourceItem:(id)a4
{
  id v5 = a3;
  if (![MEMORY[0x1E4F69138] isHomeControlService]
    || !-[HUControllableItemCollectionViewController requiresUnlockToPerformActionForItem:](self, "requiresUnlockToPerformActionForItem:", v5)|| (-[HUControllableItemCollectionViewController lockAuthorizationDelegate](self, "lockAuthorizationDelegate"), id v6 = objc_claimAutoreleasedReturnValue(), [v6 authorizeIfLockedForViewController:self], v7 = objc_claimAutoreleasedReturnValue(), v6, !v7))
  {
    id v7 = [MEMORY[0x1E4F7A0D8] futureWithNoResult];
  }

  return v7;
}

id __83__HUControllableItemCollectionViewController__isMultiControllableServiceAccessory___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 valueSource];
  BOOL v3 = [v2 allServices];
  uint64_t v4 = objc_msgSend(v3, "na_filter:", &__block_literal_global_271);

  return v4;
}

BOOL __83__HUControllableItemCollectionViewController__isMultiControllableServiceAccessory___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = objc_msgSend(a2, "hf_parentService");
  BOOL v3 = v2 == 0;

  return v3;
}

- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4
{
  return 0;
}

- (BOOL)collectionView:(id)a3 canMoveItemAtIndexPath:(id)a4
{
  return [(HUControllableItemCollectionViewController *)self canReorderItemAtIndexPath:a4];
}

- (id)collectionView:(id)a3 targetIndexPathForMoveOfItemFromOriginalIndexPath:(id)a4 atCurrentIndexPath:(id)a5 toProposedIndexPath:(id)a6
{
  id v8 = a4;
  id v9 = a6;
  uint64_t v10 = [v9 section];
  if (v10 >= [v8 section])
  {
    uint64_t v15 = [v9 section];
    double v16 = v9;
    if (v15 <= [v8 section]) {
      goto LABEL_6;
    }
    double v17 = [(HUItemCollectionViewController *)self itemManager];
    double v18 = objc_msgSend(v17, "displayedItemsInSection:", objc_msgSend(v8, "section"));
    uint64_t v19 = [v18 count];

    uint64_t v20 = (void *)MEMORY[0x1E4F28D58];
    uint64_t v12 = [v8 section];
    id v13 = v20;
    uint64_t v14 = v19 - 1;
  }
  else
  {
    id v11 = (void *)MEMORY[0x1E4F28D58];
    uint64_t v12 = [v8 section];
    id v13 = v11;
    uint64_t v14 = 0;
  }
  double v16 = [v13 indexPathForItem:v14 inSection:v12];

LABEL_6:

  return v16;
}

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
{
  v5.receiver = self;
  v5.super_class = (Class)HUControllableItemCollectionViewController;
  [(HUItemCollectionViewController *)&v5 collectionView:a3 didEndDisplayingCell:a4 forItemAtIndexPath:a5];
}

- (void)didReorderItemWithSortedItemsBySectionID:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = HFLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412802;
    id v11 = self;
    __int16 v12 = 2112;
    id v13 = v7;
    __int16 v14 = 2112;
    id v15 = v5;
    _os_log_impl(&dword_1BE345000, v6, OS_LOG_TYPE_DEFAULT, "[%@:%@]: %@", buf, 0x20u);
  }
  objc_initWeak((id *)buf, self);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __87__HUControllableItemCollectionViewController_didReorderItemWithSortedItemsBySectionID___block_invoke;
  v8[3] = &unk_1E6386218;
  objc_copyWeak(&v9, (id *)buf);
  objc_msgSend(v5, "na_each:", v8);
  objc_destroyWeak(&v9);
  objc_destroyWeak((id *)buf);
}

void __87__HUControllableItemCollectionViewController_didReorderItemWithSortedItemsBySectionID___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v14 = a3;
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v7 = [WeakRetained itemManager];
  uint64_t v8 = [v7 sectionIndexForDisplayedSectionIdentifier:v5];

  id v9 = [WeakRetained reorderableItemListForSection:v8];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v10 = [v9 mutableCopy];

    id v9 = (void *)v10;
  }
  [v9 setSortedItems:v14];
  [WeakRetained setReorderableItemList:v9 forSection:v8];
  id v11 = [WeakRetained itemManager];
  __int16 v12 = [v9 saveWithSender:v11];
  id v13 = (id)[v12 addFailureBlock:&__block_literal_global_281];
}

void __87__HUControllableItemCollectionViewController_didReorderItemWithSortedItemsBySectionID___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = (void *)MEMORY[0x1E4F69110];
  id v3 = a2;
  id v4 = [v2 sharedHandler];
  [v4 logError:v3 operationDescription:@"ReorderItems"];
}

- (void)itemManager:(id)a3 performUpdateRequest:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)HUControllableItemCollectionViewController;
  id v6 = a4;
  [(HUItemCollectionViewController *)&v9 itemManager:a3 performUpdateRequest:v6];
  id v7 = objc_msgSend(v6, "changes", v9.receiver, v9.super_class);

  uint64_t v8 = [v7 allOperations];
  LODWORD(v6) = objc_msgSend(v8, "na_any:", &__block_literal_global_294);

  if (v6) {
    [(HUControllableItemCollectionViewController *)self _itemSetDidChange];
  }
}

BOOL __79__HUControllableItemCollectionViewController_itemManager_performUpdateRequest___block_invoke(uint64_t a1, void *a2)
{
  return [a2 type] != 0;
}

- (id)_itemForServiceControlPresentationAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id v6 = [(HUControllableItemCollectionViewController *)self collectionView];
  id v7 = objc_msgSend(v6, "indexPathForItemAtPoint:", x, y);

  if (v7)
  {
    uint64_t v8 = [(HUItemCollectionViewController *)self itemManager];
    objc_super v9 = [v8 displayedItemAtIndexPath:v7];

    if ([v9 conformsToProtocol:&unk_1F19E4850]) {
      goto LABEL_5;
    }
  }
  objc_super v9 = 0;
LABEL_5:

  return v9;
}

- (id)quickControlPresentationContextForItem:(id)a3 atIndexPath:(id)a4
{
  return -[HUControllableItemCollectionViewController quickControlPresentationContextForItem:atIndexPath:point:](self, "quickControlPresentationContextForItem:atIndexPath:point:", a3, a4, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
}

- (id)quickControlPresentationContextForItem:(id)a3 atIndexPath:(id)a4 point:(CGPoint)a5
{
  double y = a5.y;
  double x = a5.x;
  id v9 = a4;
  id v10 = a3;
  id v11 = objc_alloc_init(HUQuickControlPresentationContext);
  [(HUQuickControlPresentationContext *)v11 setColorStyle:[(HUControllableItemCollectionViewController *)self contentColorStyle]];
  [(HUQuickControlPresentationContext *)v11 setItem:v10];
  __int16 v12 = [(HUItemCollectionViewController *)self itemManager];
  id v13 = [v12 childItemsForItem:v10 ofClass:objc_opt_class()];
  [(HUQuickControlPresentationContext *)v11 setControlItems:v13];

  id v14 = [(HUItemCollectionViewController *)self itemManager];
  id v15 = [v14 home];
  [(HUQuickControlPresentationContext *)v11 setHome:v15];

  uint64_t v16 = [(HUControllableItemCollectionViewController *)self collectionView];
  double v17 = [v16 layoutAttributesForItemAtIndexPath:v9];
  [v17 frame];
  -[HUQuickControlPresentationContext setSourceRect:](v11, "setSourceRect:");

  double v18 = -[HUControllableItemCollectionViewController tappableAreaForPoint:inItem:atIndexPath:](self, "tappableAreaForPoint:inItem:atIndexPath:", v10, v9, x, y);

  [(HUQuickControlPresentationContext *)v11 setTappedArea:v18];
  [(HUQuickControlPresentationContext *)v11 setPrefersSystemTransitions:0];
  [(HUQuickControlPresentationContext *)v11 setShouldIncludeRoomNameInHeaderTitle:0];
  uint64_t v19 = [(HUControllableItemCollectionViewController *)self navigationController];

  if (v19)
  {
    uint64_t v20 = [(HUControllableItemCollectionViewController *)self navigationController];
    [(HUQuickControlPresentationContext *)v11 setSourceViewController:v20];
  }
  else
  {
    [(HUQuickControlPresentationContext *)v11 setSourceViewController:self];
  }

  return v11;
}

- (id)quickControlPresentationContextForUUID:(id)a3 type:(unint64_t)a4
{
  id v6 = a3;
  id v7 = objc_alloc_init(HUQuickControlPresentationContext);
  [(HUQuickControlPresentationContext *)v7 setColorStyle:[(HUControllableItemCollectionViewController *)self contentColorStyle]];
  uint64_t v8 = [[HUQuickControlPresentationItemManager alloc] initWithHomeKitObjectUUID:v6 type:a4];

  [(HUQuickControlPresentationContext *)v7 setItemManager:v8];
  id v9 = [(HUItemCollectionViewController *)self itemManager];
  id v10 = [v9 home];
  [(HUQuickControlPresentationContext *)v7 setHome:v10];

  [(HUQuickControlPresentationContext *)v7 setPrefersSystemTransitions:1];
  [(HUQuickControlPresentationContext *)v7 setShouldIncludeRoomNameInHeaderTitle:0];
  id v11 = [(HUControllableItemCollectionViewController *)self navigationController];

  if (v11)
  {
    __int16 v12 = [(HUControllableItemCollectionViewController *)self navigationController];
    [(HUQuickControlPresentationContext *)v7 setSourceViewController:v12];
  }
  else
  {
    [(HUQuickControlPresentationContext *)v7 setSourceViewController:self];
  }

  return v7;
}

- (BOOL)presentationCoordinator:(id)a3 shouldBeginInteractivePresentationWithTouchLocation:(CGPoint)a4 view:(id)a5
{
  id v6 = -[HUControllableItemCollectionViewController _itemForServiceControlPresentationAtPoint:](self, "_itemForServiceControlPresentationAtPoint:", a3, a5, a4.x, a4.y);
  if (v6) {
    int v7 = [(HUControllableItemCollectionViewController *)self isEditing] ^ 1;
  }
  else {
    LOBYTE(v7) = 0;
  }

  return v7;
}

- (BOOL)presentationCoordinator:(id)a3 shouldBeginPresentationWithContext:(id)a4
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (![MEMORY[0x1E4F69138] isHomeControlService]) {
    goto LABEL_5;
  }
  if ([v7 didAuthenticate]) {
    goto LABEL_5;
  }
  uint64_t v8 = [(HUItemCollectionViewController *)self itemManager];
  id v9 = [v7 item];
  id v10 = [v8 childItemsForItem:v9 ofClass:objc_opt_class()];
  v45[0] = MEMORY[0x1E4F143A8];
  v45[1] = 3221225472;
  v45[2] = __105__HUControllableItemCollectionViewController_presentationCoordinator_shouldBeginPresentationWithContext___block_invoke;
  v45[3] = &unk_1E6386108;
  v45[4] = self;
  int v11 = objc_msgSend(v10, "na_any:", v45);

  if (!v11)
  {
LABEL_5:
    double v18 = HFLogForCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v19 = (objc_class *)objc_opt_class();
      uint64_t v20 = NSStringFromClass(v19);
      BOOL v21 = [v7 item];
      *(_DWORD *)buf = 138412546;
      v47 = v20;
      __int16 v48 = 2112;
      v49 = v21;
      _os_log_impl(&dword_1BE345000, v18, OS_LOG_TYPE_DEFAULT, "%@+Controls: checking about presenting accessory controls instead of quick controls for item %@", buf, 0x16u);
    }
    uint64_t v22 = [v7 item];
    BOOL v23 = [(HUControllableItemCollectionViewController *)self shouldShowAccessoryControlForItem:v22];

    if (v23)
    {
      uint64_t v24 = [v7 item];
      if ([v24 conformsToProtocol:&unk_1F1A3D190]) {
        BOOL v25 = v24;
      }
      else {
        BOOL v25 = 0;
      }
      id v26 = v25;

      if ((_os_feature_enabled_impl() & 1) != 0 || HM_FEATURE_RVC_DEFAULTS_ENABLED())
      {
        int v27 = [v26 accessoryRepresentableObject];
        int v28 = objc_msgSend(v27, "hf_isMatterOnlyAccessory");
      }
      else
      {
        int v28 = 0;
      }
      id v29 = HFLogForCategory();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        v30 = (objc_class *)objc_opt_class();
        uint64_t v31 = NSStringFromClass(v30);
        id v32 = [v7 controlItems];
        *(_DWORD *)buf = 138412802;
        v47 = v31;
        __int16 v48 = 2112;
        v49 = v32;
        __int16 v50 = 1024;
        int v51 = v28;
        _os_log_impl(&dword_1BE345000, v29, OS_LOG_TYPE_DEFAULT, "%@+Controls: confirming control items %@, shouldShowWithNoControlItems: %{BOOL}d", buf, 0x1Cu);
      }
      int v33 = [v7 controlItems];
      if ([v33 count]) {
        int v28 = 1;
      }

      if (v28 == 1)
      {
        id v34 = HFLogForCategory();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        {
          BOOL v35 = (objc_class *)objc_opt_class();
          long long v36 = NSStringFromClass(v35);
          long long v37 = [v7 item];
          *(_DWORD *)buf = 138412546;
          v47 = v36;
          __int16 v48 = 2112;
          v49 = v37;
          _os_log_impl(&dword_1BE345000, v34, OS_LOG_TYPE_DEFAULT, "%@+Controls presenting accessory controls for item %@", buf, 0x16u);
        }
        id v38 = [v7 item];
        id v39 = [(HUControllableItemCollectionViewController *)self presentAccessoryControlsForItem:v38];

        goto LABEL_22;
      }
    }
    BOOL v40 = 1;
    goto LABEL_25;
  }
  __int16 v12 = (void *)[v7 copy];
  id v13 = [v7 controlItems];
  [v12 setControlItems:v13];

  id v14 = [(HUControllableItemCollectionViewController *)self lockAuthorizationDelegate];
  id v15 = [v14 authorizeIfLockedForViewController:self];

  v42[0] = MEMORY[0x1E4F143A8];
  v42[1] = 3221225472;
  v42[2] = __105__HUControllableItemCollectionViewController_presentationCoordinator_shouldBeginPresentationWithContext___block_invoke_2;
  v42[3] = &unk_1E63859F8;
  id v43 = v12;
  id v44 = v6;
  id v16 = v12;
  id v17 = (id)[v15 addSuccessBlock:v42];

LABEL_22:
  BOOL v40 = 0;
LABEL_25:

  return v40;
}

uint64_t __105__HUControllableItemCollectionViewController_presentationCoordinator_shouldBeginPresentationWithContext___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) requiresUnlockToPerformActionForItem:a2];
}

id __105__HUControllableItemCollectionViewController_presentationCoordinator_shouldBeginPresentationWithContext___block_invoke_2(uint64_t a1)
{
  return (id)[*(id *)(a1 + 40) presentQuickControlWithContext:*(void *)(a1 + 32) animated:1];
}

- (id)presentationCoordinator:(id)a3 contextForPresentationAtPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v7 = [(HUControllableItemCollectionViewController *)self collectionView];
  uint64_t v8 = objc_msgSend(v7, "indexPathForItemAtPoint:", x, y);

  if (!v8)
  {
    v15.double x = x;
    v15.double y = y;
    id v9 = NSStringFromCGPoint(v15);
    NSLog(&cfstr_CouldNotFindIn.isa, v9);
  }
  id v10 = -[HUControllableItemCollectionViewController _itemForServiceControlPresentationAtPoint:](self, "_itemForServiceControlPresentationAtPoint:", x, y);
  if (!v10)
  {
    v16.double x = x;
    v16.double y = y;
    int v11 = NSStringFromCGPoint(v16);
    NSLog(&cfstr_CouldNotFindAn.isa, v11);
  }
  __int16 v12 = -[HUControllableItemCollectionViewController quickControlPresentationContextForItem:atIndexPath:point:](self, "quickControlPresentationContextForItem:atIndexPath:point:", v10, v8, x, y);

  return v12;
}

- (void)presentationCoordinator:(id)a3 applyOverrideAttributes:(id)a4 toItem:(id)a5
{
  id v13 = a4;
  id v7 = a5;
  uint64_t v8 = [(HUItemCollectionViewController *)self itemManager];
  id v9 = [v8 indexPathForItem:v7];

  if (v9)
  {
    id v10 = [(HUControllableItemCollectionViewController *)self collectionViewLayout];
    char v11 = objc_opt_respondsToSelector();

    if (v11)
    {
      __int16 v12 = [(HUControllableItemCollectionViewController *)self collectionViewLayout];
      [v12 applyOverrideAttributes:v13 toItem:v7 atIndexPath:v9];
    }
  }
}

- (void)presentationCoordinator:(id)a3 clearOverrideAttributesForItem:(id)a4
{
  id v10 = a4;
  id v5 = [(HUItemCollectionViewController *)self itemManager];
  id v6 = [v5 indexPathForItem:v10];

  if (v6)
  {
    id v7 = [(HUControllableItemCollectionViewController *)self collectionViewLayout];
    char v8 = objc_opt_respondsToSelector();

    if (v8)
    {
      id v9 = [(HUControllableItemCollectionViewController *)self collectionViewLayout];
      [v9 clearOverrideAttributesForItem:v10 atIndexPath:v6];
    }
  }
}

- (void)presentationCoordinator:(id)a3 didRecognizeTapForItem:(id)a4 tappedArea:(id)a5
{
  id v20 = a4;
  id v7 = a5;
  char v8 = [v20 latestResults];
  id v9 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F68C40]];

  objc_opt_class();
  id v10 = v9;
  if (objc_opt_isKindOfClass()) {
    char v11 = v10;
  }
  else {
    char v11 = 0;
  }
  id v12 = v11;

  if ((![v7 isEqualToString:@"HUTileCellTappableAreaDetail"]
     || [v12 isThreadNetworkError])
    && [(HUControllableItemCollectionViewController *)self _hasTapActionForItem:v20]
    && ![(HUControllableItemCollectionViewController *)self _isMultiControllableServiceAccessory:v20])
  {
    id v19 = [(HUControllableItemCollectionViewController *)self _performTapActionForItem:v20 tappedArea:v7];
  }
  else
  {
    id v13 = [(HUControllableItemCollectionViewController *)self quickControlPresentationCoordinator];
    id v14 = [v13 presentationContext];

    if (v14)
    {
      CGPoint v15 = [(HUControllableItemCollectionViewController *)self quickControlPresentationCoordinator];
      CGPoint v16 = [(HUControllableItemCollectionViewController *)self quickControlPresentationCoordinator];
      id v17 = [v16 presentationContext];
      id v18 = (id)[v15 presentQuickControlWithContext:v17 animated:1];
    }
  }
}

- (void)presentationCoordinator:(id)a3 willBeginPresentationWithContext:(id)a4
{
  [(HUControllableItemCollectionViewController *)self childViewController:self willBeginQuickControlsPresentation:a3];
  id v5 = [(HUControllableItemCollectionViewController *)self quickControlPresentationDelegate];
  [v5 quickControlsPresentationDidUpdate:1];
}

- (void)presentationCoordinator:(id)a3 willEndPresentationWithContext:(id)a4
{
  id v4 = [(HUControllableItemCollectionViewController *)self quickControlPresentationDelegate];
  [v4 quickControlsPresentationDidUpdate:0];
}

- (void)presentationCoordinator:(id)a3 didEndPresentationWithContext:(id)a4
{
}

- (id)_ancestorQuickControlPresentationHost
{
  uint64_t v2 = [(HUControllableItemCollectionViewController *)self parentViewController];
  if (v2)
  {
    do
    {
      if ([v2 conformsToProtocol:&unk_1F19CF228]) {
        break;
      }
      uint64_t v3 = [v2 parentViewController];

      uint64_t v2 = (void *)v3;
    }
    while (v3);
  }

  return v2;
}

- (void)childViewController:(id)a3 willBeginQuickControlsPresentation:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  if (![(HUControllableItemCollectionViewController *)self viewAppeared]) {
    NSLog(&cfstr_TheQuickContro.isa, v6, v9);
  }
  if ([(HUControllableItemCollectionViewController *)self viewAppeared])
  {
    id v7 = [(HUControllableItemCollectionViewController *)self _ancestorQuickControlPresentationHost];
    if (v7)
    {
      [(HUControllableItemCollectionViewController *)self setAncestorQuickControlHostAtPresentationTime:v7];
      char v8 = [(HUControllableItemCollectionViewController *)self ancestorQuickControlHostAtPresentationTime];
      [v8 childViewController:self willBeginQuickControlsPresentation:v6];
    }
    else
    {
      [(HUItemCollectionViewController *)self recursivelyDisableItemUpdates:1 withReason:@"HUControllableItemCollectionViewController_QuickControls"];
    }
  }
}

- (void)childViewController:(id)a3 didEndQuickControlsPresentation:(id)a4
{
  id v10 = a4;
  id v5 = [(HUControllableItemCollectionViewController *)self ancestorQuickControlHostAtPresentationTime];

  if (v5)
  {
    id v6 = [(HUControllableItemCollectionViewController *)self _ancestorQuickControlPresentationHost];
    id v7 = [(HUControllableItemCollectionViewController *)self ancestorQuickControlHostAtPresentationTime];

    if (v7 != v6)
    {
      char v8 = [(HUControllableItemCollectionViewController *)self ancestorQuickControlHostAtPresentationTime];
      NSLog(&cfstr_TheAncestorQui.isa, v8, v6);
    }
    id v9 = [(HUControllableItemCollectionViewController *)self ancestorQuickControlHostAtPresentationTime];
    [v9 childViewController:self didEndQuickControlsPresentation:v10];

    [(HUControllableItemCollectionViewController *)self setAncestorQuickControlHostAtPresentationTime:0];
  }
  else
  {
    [(HUItemCollectionViewController *)self recursivelyDisableItemUpdates:0 withReason:@"HUControllableItemCollectionViewController_QuickControls"];
  }
}

- (BOOL)hasDetailsActionForPresentationCoordinator:(id)a3 item:(id)a4
{
  return 0;
}

- (void)_handleContextualGesture:(id)a3
{
  id v27 = a3;
  if ([v27 state] == 3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v4 = [(HUControllableItemCollectionViewController *)self collectionView];
      [v27 locationInView:v4];
      double v6 = v5;
      double v8 = v7;

      id v9 = -[HUControllableItemCollectionViewController _itemForServiceControlPresentationAtPoint:](self, "_itemForServiceControlPresentationAtPoint:", v6, v8);
      if (!v9)
      {
LABEL_17:

        goto LABEL_18;
      }
      id v10 = objc_opt_new();
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
      objc_opt_class();
      char v12 = objc_opt_isKindOfClass();
      id v13 = [(HUControllableItemCollectionViewController *)self _childItemsForItem:v9];
      uint64_t v14 = [v13 count];

      CGPoint v15 = [(HUControllableItemCollectionViewController *)self quickControlPresentationCoordinator];
      CGPoint v16 = [v27 view];
      if (-[HUControllableItemCollectionViewController presentationCoordinator:shouldBeginInteractivePresentationWithTouchLocation:view:](self, "presentationCoordinator:shouldBeginInteractivePresentationWithTouchLocation:view:", v15, v16, v6, v8)&& (isKindOfClass & 1) == 0)
      {

        if (!(v12 & 1 | (v14 != 0)))
        {
LABEL_12:
          id v18 = [(HUControllableItemCollectionViewController *)self quickControlPresentationCoordinator];
          BOOL v19 = [(HUControllableItemCollectionViewController *)self hasDetailsActionForPresentationCoordinator:v18 item:v9];

          if (v19)
          {
            id v20 = objc_alloc(MEMORY[0x1E4F42B98]);
            BOOL v21 = _HULocalizedStringWithDefaultValue(@"HUContextualMenuItemSettings", @"HUContextualMenuItemSettings", 1);
            uint64_t v22 = (void *)[v20 initWithTitle:v21 action:sel__showSettingsForSelectedMenuItem];
            [v10 addObject:v22];
          }
          if ([v10 count])
          {
            [(HUControllableItemCollectionViewController *)self setSelectedContextualMenuItem:v9];
            BOOL v23 = [MEMORY[0x1E4F42B88] sharedMenuController];
            [v23 setMenuItems:v10];
            [(HUControllableItemCollectionViewController *)self becomeFirstResponder];
            double v24 = *MEMORY[0x1E4F1DB30];
            double v25 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
            id v26 = [(HUControllableItemCollectionViewController *)self collectionView];
            objc_msgSend(v23, "showMenuFromView:rect:", v26, v6, v8, v24, v25);
          }
          goto LABEL_17;
        }
        if (v12) {
          id v17 = @"HUContextualMenuItemStatusDetails";
        }
        else {
          id v17 = @"HUContextualMenuItemQuickControls";
        }
        CGPoint v15 = _HULocalizedStringWithDefaultValue(v17, v17, 1);
        CGPoint v16 = (void *)[objc_alloc(MEMORY[0x1E4F42B98]) initWithTitle:v15 action:sel__showQuickControlsForSelectedMenuItem];
        [v10 addObject:v16];
      }

      goto LABEL_12;
    }
  }
LABEL_18:
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  id v6 = a4;
  double v7 = [MEMORY[0x1E4F42B88] sharedMenuController];
  double v8 = [v7 menuItems];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __74__HUControllableItemCollectionViewController_canPerformAction_withSender___block_invoke;
  v13[3] = &__block_descriptor_40_e20_B16__0__UIMenuItem_8l;
  v13[4] = a3;
  int v9 = objc_msgSend(v8, "na_any:", v13);

  if (v9 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    BOOL v10 = 1;
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)HUControllableItemCollectionViewController;
    BOOL v10 = [(HUControllableItemCollectionViewController *)&v12 canPerformAction:a3 withSender:v6];
  }

  return v10;
}

BOOL __74__HUControllableItemCollectionViewController_canPerformAction_withSender___block_invoke(uint64_t a1, void *a2)
{
  return [a2 action] == *(void *)(a1 + 32);
}

- (void)_showSettingsForSelectedMenuItem
{
  uint64_t v3 = [(HUControllableItemCollectionViewController *)self selectedContextualMenuItem];

  if (v3)
  {
    objc_opt_class();
    id v4 = [(HUControllableItemCollectionViewController *)self selectedContextualMenuItem];
    if (objc_opt_isKindOfClass()) {
      double v5 = v4;
    }
    else {
      double v5 = 0;
    }
    id v20 = v5;

    id v6 = [(HUControllableItemCollectionViewController *)self selectedContextualMenuItem];
    if (v20)
    {
      double v7 = [v20 accessory];
      char v8 = objc_msgSend(v7, "hf_isMultiServiceAccessory");

      if ((v8 & 1) == 0)
      {
        int v9 = [v20 accessory];
        BOOL v10 = objc_msgSend(v9, "hf_primaryService");
        uint64_t v11 = [v20 serviceItemForService:v10];

        id v6 = (void *)v11;
      }
    }
    objc_super v12 = [(HUControllableItemCollectionViewController *)self quickControlPresentationCoordinator];
    id v13 = [(HUControllableItemCollectionViewController *)self detailsViewControllerForPresentationCoordinator:v12 item:v6];

    if (v13)
    {
      uint64_t v14 = [(UIViewController *)self hu_delegateForModalPresentation];
      [v13 setPresentationDelegate:v14];

      CGPoint v15 = (void *)[objc_alloc(MEMORY[0x1E4F42BF8]) initWithRootViewController:v13];
      [v15 setModalPresentationStyle:2];
      CGPoint v16 = [v15 presentationController];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        id v18 = [v15 presentationController];
        [v18 _setPreferredCornerRadius:20.0];
      }
      id v19 = [(UIViewController *)self hu_presentPreloadableViewController:v15 animated:1];
    }
  }
}

- (void)_showQuickControlsForSelectedMenuItem
{
  uint64_t v3 = [(HUControllableItemCollectionViewController *)self selectedContextualMenuItem];

  if (v3)
  {
    id v17 = [(HUControllableItemCollectionViewController *)self selectedContextualMenuItem];
    id v4 = [(HUItemCollectionViewController *)self itemManager];
    double v5 = [v4 indexPathForItem:v17];

    id v6 = [(HUControllableItemCollectionViewController *)self quickControlPresentationContextForItem:v17 atIndexPath:v5];
    if ([MEMORY[0x1E4F69758] shouldUseLegacyQuickControlPresentation])
    {
      objc_opt_class();
      double v7 = [(HUControllableItemCollectionViewController *)self collectionView];
      char v8 = [v7 cellForItemAtIndexPath:v5];
      if (objc_opt_isKindOfClass()) {
        int v9 = v8;
      }
      else {
        int v9 = 0;
      }
      id v10 = v9;

      uint64_t v11 = [(HUControllableItemCollectionViewController *)self quickControlPresentationCoordinator];
      objc_msgSend(v11, "setPressedTile_legacy:", v10);
    }
    else
    {
      objc_super v12 = [(HUControllableItemCollectionViewController *)self collectionView];
      id v13 = [v12 cellForItemAtIndexPath:v5];
      if ([v13 conformsToProtocol:&unk_1F19E3E20]) {
        uint64_t v14 = v13;
      }
      else {
        uint64_t v14 = 0;
      }
      id v10 = v14;

      uint64_t v11 = [(HUControllableItemCollectionViewController *)self quickControlPresentationCoordinator];
      [v11 setPressedTile:v10];
    }

    CGPoint v15 = [(HUControllableItemCollectionViewController *)self quickControlPresentationCoordinator];
    id v16 = (id)[v15 presentQuickControlWithContext:v6 animated:1];
  }
}

- (id)collectionView:(id)a3 itemsForBeginningDragSession:(id)a4 atIndexPath:(id)a5
{
  id v7 = a5;
  char v8 = [a3 cellForItemAtIndexPath:v7];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || ![(HUControllableItemCollectionViewController *)self canReorderItemAtIndexPath:v7])
  {
    objc_super v12 = (void *)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    int v9 = [(HUItemCollectionViewController *)self itemManager];
    id v10 = [v9 displayedItemAtIndexPath:v7];

    uint64_t v11 = [(HUControllableItemCollectionViewController *)self dragItemForItem:v10 atIndexPath:v7];
    objc_super v12 = objc_msgSend(MEMORY[0x1E4F1C978], "na_arrayWithSafeObject:", v11);
  }

  return v12;
}

- (id)dragItemForItem:(id)a3 atIndexPath:(id)a4
{
  id v6 = (objc_class *)MEMORY[0x1E4F28D78];
  id v7 = a4;
  id v8 = a3;
  id v9 = objc_alloc_init(v6);
  [v9 registerItemForTypeIdentifier:*MEMORY[0x1E4F226F0] loadHandler:&__block_literal_global_405];
  id v10 = (void *)[objc_alloc(MEMORY[0x1E4F429A0]) initWithItemProvider:v9];
  [v10 setLocalObject:v8];

  uint64_t v11 = [(HUControllableItemCollectionViewController *)self collectionView];
  objc_super v12 = [v11 cellForItemAtIndexPath:v7];

  if (v12 && (objc_opt_respondsToSelector() & 1) != 0) {
    [v12 configureDragItem:v10];
  }

  return v10;
}

uint64_t __74__HUControllableItemCollectionViewController_dragItemForItem_atIndexPath___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, void, void))(a2 + 16))(a2, 0, 0);
}

- (BOOL)collectionView:(id)a3 canHandleDropSession:(id)a4
{
  id v4 = objc_msgSend(a4, "localDragSession", a3);

  return v4 != 0;
}

- (id)collectionView:(id)a3 dropSessionDidUpdate:(id)a4 withDestinationIndexPath:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if ([a3 hasActiveDrag])
  {
    id v10 = [v8 items];
    uint64_t v11 = [v10 firstObject];
    objc_super v12 = [v11 localObject];

    id v13 = [(HUItemCollectionViewController *)self itemManager];
    uint64_t v14 = [v13 indexPathForItem:v12];

    uint64_t v15 = [v14 section];
    if (v15 == [v9 section])
    {
      id v16 = (void *)[objc_alloc(MEMORY[0x1E4F42888]) initWithDropOperation:3 intent:1];

      goto LABEL_6;
    }
  }
  id v16 = (void *)[objc_alloc(MEMORY[0x1E4F42888]) initWithDropOperation:0];
LABEL_6:

  return v16;
}

- (BOOL)requiresUnlockToPerformActionForItem:(id)a3
{
  uint64_t v3 = [a3 latestResults];
  id v4 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F688A0]];
  char v5 = [v4 BOOLValue];

  return v5;
}

- (unint64_t)contentColorStyle
{
  return self->_contentColorStyle;
}

- (BOOL)constrainCellReorderingToBounds
{
  return self->_constrainCellReorderingToBounds;
}

- (HULockAuthorizationDelegate)lockAuthorizationDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_lockAuthorizationDelegate);

  return (HULockAuthorizationDelegate *)WeakRetained;
}

- (void)setLockAuthorizationDelegate:(id)a3
{
}

- (HUQuickControlPresentationDelegate)quickControlPresentationDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_quickControlPresentationDelegate);

  return (HUQuickControlPresentationDelegate *)WeakRetained;
}

- (void)setQuickControlPresentationDelegate:(id)a3
{
}

- (HUQuickControlPresentationHost)ancestorQuickControlHostAtPresentationTime
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_ancestorQuickControlHostAtPresentationTime);

  return (HUQuickControlPresentationHost *)WeakRetained;
}

- (void)setAncestorQuickControlHostAtPresentationTime:(id)a3
{
}

- (BOOL)viewAppeared
{
  return self->_viewAppeared;
}

- (void)setReorderGestureRecognizer:(id)a3
{
}

- (UICollectionViewCell)cellBeingReordered
{
  return self->_cellBeingReordered;
}

- (void)setCellBeingReordered:(id)a3
{
}

- (NSMutableDictionary)actionSetExecutionFuturesKeyedByIdentifier
{
  return self->_actionSetExecutionFuturesKeyedByIdentifier;
}

- (UIGestureRecognizer)contextualTapGestureRecognizer
{
  return self->_contextualTapGestureRecognizer;
}

- (void)setContextualTapGestureRecognizer:(id)a3
{
}

- (NSCopying)selectedContextualMenuItem
{
  return self->_selectedContextualMenuItem;
}

- (void)setSelectedContextualMenuItem:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedContextualMenuItem, 0);
  objc_storeStrong((id *)&self->_contextualTapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_actionSetExecutionFuturesKeyedByIdentifier, 0);
  objc_storeStrong((id *)&self->_cellBeingReordered, 0);
  objc_storeStrong((id *)&self->_reorderGestureRecognizer, 0);
  objc_destroyWeak((id *)&self->_ancestorQuickControlHostAtPresentationTime);
  objc_storeStrong((id *)&self->_quickControlPresentationCoordinator, 0);
  objc_destroyWeak((id *)&self->_quickControlPresentationDelegate);

  objc_destroyWeak((id *)&self->_lockAuthorizationDelegate);
}

@end