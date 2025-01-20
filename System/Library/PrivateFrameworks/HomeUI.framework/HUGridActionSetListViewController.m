@interface HUGridActionSetListViewController
+ (double)requiredHeightWithLayoutOptions:(id)a3 numberOfItems:(unint64_t)a4;
+ (unint64_t)updateMode;
- (BOOL)_canShowWhileLocked;
- (BOOL)canReorderItemAtIndexPath:(id)a3;
- (BOOL)collectionView:(id)a3 canFocusItemAtIndexPath:(id)a4;
- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4;
- (BOOL)hasDetailsActionForPresentationCoordinator:(id)a3 item:(id)a4;
- (BOOL)presentationCoordinator:(id)a3 shouldBeginPresentationWithContext:(id)a4;
- (BOOL)shouldAllowItemPresentation;
- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5;
- (Class)cellClassForItem:(id)a3 indexPath:(id)a4;
- (HUGridActionSetListViewController)init;
- (HUGridActionSetListViewController)initWithRoom:(id)a3 onlyShowFavorites:(BOOL)a4;
- (HUGridActionSetListViewControllerDelegate)actionSetListViewControllerDelegate;
- (HUGridLayoutOptions)layoutOptions;
- (UILabel)titleLabel;
- (id)_detailsViewControllerForActionSetItem:(id)a3;
- (id)_performTapActionForItem:(id)a3 tappedArea:(id)a4;
- (id)detailsViewControllerForPresentationCoordinator:(id)a3 item:(id)a4;
- (id)itemManager:(id)a3 futureToUpdateItems:(id)a4 itemUpdateOptions:(id)a5;
- (id)reorderableItemListForSection:(int64_t)a3;
- (int64_t)_scrollDirectionForLayoutOptions:(id)a3;
- (void)_internalSetLayoutOptions:(id)a3;
- (void)_updateLayoutScrollDirectionIfNeeded;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)configureCell:(id)a3 forItem:(id)a4;
- (void)diffableDataItemManager:(id)a3 didUpdateItems:(id)a4 addItems:(id)a5 removeItems:(id)a6;
- (void)itemManager:(id)a3 didInsertItem:(id)a4 atIndexPath:(id)a5;
- (void)itemManager:(id)a3 didRemoveItem:(id)a4 atIndexPath:(id)a5;
- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5;
- (void)setActionSetListViewControllerDelegate:(id)a3;
- (void)setLayoutOptions:(id)a3;
- (void)setReorderableItemList:(id)a3 forSection:(int64_t)a4;
- (void)setShouldAllowItemPresentation:(BOOL)a3;
- (void)setTitleLabel:(id)a3;
- (void)viewDidLoad;
@end

@implementation HUGridActionSetListViewController

- (HUGridActionSetListViewController)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  v5 = NSStringFromSelector(sel_initWithRoom_onlyShowFavorites_);
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUGridActionSetListViewController.m", 34, @"%s is unavailable; use %@ instead",
    "-[HUGridActionSetListViewController init]",
    v5);

  return 0;
}

- (HUGridActionSetListViewController)initWithRoom:(id)a3 onlyShowFavorites:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = objc_alloc_init(HUGridFlowLayout);
  v8 = [[HUGridActionSetItemManager alloc] initWithDelegate:self];
  [(HUGridActionSetItemManager *)v8 setRoom:v6];

  [(HUGridActionSetItemManager *)v8 setOnlyShowsFavorites:v4];
  v12.receiver = self;
  v12.super_class = (Class)HUGridActionSetListViewController;
  v9 = [(HUControllableItemCollectionViewController *)&v12 initWithItemManager:v8 collectionViewLayout:v7];
  v10 = v9;
  if (v9) {
    [(HUGridActionSetListViewController *)v9 setShouldAllowItemPresentation:1];
  }

  return v10;
}

- (void)viewDidLoad
{
  v10.receiver = self;
  v10.super_class = (Class)HUGridActionSetListViewController;
  [(HUControllableItemCollectionViewController *)&v10 viewDidLoad];
  v3 = [MEMORY[0x1E4F428B8] clearColor];
  BOOL v4 = [(HUGridActionSetListViewController *)self view];
  [v4 setBackgroundColor:v3];

  v5 = [MEMORY[0x1E4F428B8] clearColor];
  id v6 = [(HUGridActionSetListViewController *)self collectionView];
  [v6 setBackgroundColor:v5];

  v7 = [(HUGridActionSetListViewController *)self collectionView];
  [v7 setShowsHorizontalScrollIndicator:0];

  v8 = [(HUGridActionSetListViewController *)self collectionView];
  [v8 setShowsVerticalScrollIndicator:0];

  v9 = [(HUGridActionSetListViewController *)self collectionView];
  [v9 setContentInsetAdjustmentBehavior:2];
}

- (HUGridLayoutOptions)layoutOptions
{
  uint64_t v3 = objc_opt_class();
  id v4 = [(HUGridActionSetListViewController *)self collectionViewLayout];
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      v5 = v4;
    }
    else {
      v5 = 0;
    }
    id v6 = v4;
    if (v5) {
      goto LABEL_8;
    }
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    v8 = objc_msgSend(NSString, "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    [v7 handleFailureInFunction:v8, @"NSObject+NAAdditions.h", 54, @"Expected class of %@ but was %@", v3, objc_opt_class() file lineNumber description];
  }
  id v6 = 0;
LABEL_8:

  v9 = [v6 layoutOptions];

  return (HUGridLayoutOptions *)v9;
}

- (void)setLayoutOptions:(id)a3
{
  id v5 = (id)[a3 copy];
  objc_msgSend(v5, "setScrollDirection:", -[HUGridActionSetListViewController _scrollDirectionForLayoutOptions:](self, "_scrollDirectionForLayoutOptions:", v5));
  [v5 setSectionBottomMargin:0.0];
  if ([MEMORY[0x1E4F69138] isHomeControlService]) {
    id v4 = &unk_1F19B45C8;
  }
  else {
    id v4 = 0;
  }
  [v5 setOverrideNumberOfColumns:v4];
  [(HUGridActionSetListViewController *)self _internalSetLayoutOptions:v5];
}

- (void)_internalSetLayoutOptions:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  id v6 = [(HUGridActionSetListViewController *)self collectionViewLayout];
  if (!v6) {
    goto LABEL_7;
  }
  if (objc_opt_isKindOfClass()) {
    v7 = v6;
  }
  else {
    v7 = 0;
  }
  v8 = v6;
  if (!v7)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_super v10 = objc_msgSend(NSString, "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    [v9 handleFailureInFunction:v10, @"NSObject+NAAdditions.h", 54, @"Expected class of %@ but was %@", v5, objc_opt_class() file lineNumber description];

LABEL_7:
    v8 = 0;
  }

  v11 = [v8 layoutOptions];
  char v12 = [v11 isEqual:v4];

  if ((v12 & 1) == 0)
  {
    [v8 setLayoutOptions:v4];
    if ([(HUGridActionSetListViewController *)self isViewLoaded])
    {
      id v24 = v4;
      long long v27 = 0u;
      long long v28 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      v13 = [(HUGridActionSetListViewController *)self collectionView];
      v14 = [v13 indexPathsForVisibleItems];

      uint64_t v15 = [v14 countByEnumeratingWithState:&v25 objects:v29 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v26;
        do
        {
          uint64_t v18 = 0;
          do
          {
            if (*(void *)v26 != v17) {
              objc_enumerationMutation(v14);
            }
            uint64_t v19 = *(void *)(*((void *)&v25 + 1) + 8 * v18);
            v20 = [(HUGridActionSetListViewController *)self collectionView];
            v21 = [v20 cellForItemAtIndexPath:v19];
            v22 = [(HUItemCollectionViewController *)self itemManager];
            v23 = [v22 displayedItemAtIndexPath:v19];
            [(HUGridActionSetListViewController *)self configureCell:v21 forItem:v23];

            ++v18;
          }
          while (v16 != v18);
          uint64_t v16 = [v14 countByEnumeratingWithState:&v25 objects:v29 count:16];
        }
        while (v16);
      }

      id v4 = v24;
    }
  }
}

+ (unint64_t)updateMode
{
  return 1;
}

- (Class)cellClassForItem:(id)a3 indexPath:(id)a4
{
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || ([(HUGridActionSetListViewController *)self actionSetItemManager],
        id v6 = objc_claimAutoreleasedReturnValue(),
        [v6 actionSetPlaceholderItem],
        v7 = objc_claimAutoreleasedReturnValue(),
        int v8 = [v5 isEqual:v7],
        v7,
        v6,
        v8))
  {
    v9 = objc_opt_class();
  }
  else
  {
    v9 = 0;
  }
  objc_super v10 = v9;

  return v10;
}

- (void)configureCell:(id)a3 forItem:(id)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HUGridActionSetListViewController;
  [(HUControllableItemCollectionViewController *)&v10 configureCell:v6 forItem:a4];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v7 = [(HUGridActionSetListViewController *)self layoutOptions];
    uint64_t v8 = [v7 placeholderSceneCellOptions];
LABEL_5:
    v9 = (void *)v8;
    [v6 setLayoutOptions:v8];

    goto LABEL_6;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v7 = [(HUGridActionSetListViewController *)self layoutOptions];
    uint64_t v8 = [v7 sceneCellOptions];
    goto LABEL_5;
  }
LABEL_6:
}

- (id)itemManager:(id)a3 futureToUpdateItems:(id)a4 itemUpdateOptions:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  char v12 = [(HUGridActionSetListViewController *)self actionSetListViewControllerDelegate];
  char v13 = objc_opt_respondsToSelector();

  if (v13)
  {
    v14 = [(HUGridActionSetListViewController *)self actionSetListViewControllerDelegate];
    uint64_t v15 = [v14 actionSetListViewController:self futureToUpdateItems:v10 itemUpdateOptions:v11];
  }
  else
  {
    if (objc_msgSend((id)+[HUGridActionSetListViewController superclass](HUGridActionSetListViewController, "superclass"), "instancesRespondToSelector:", a2))
    {
      v18.receiver = self;
      v18.super_class = (Class)HUGridActionSetListViewController;
      uint64_t v16 = [(HUItemCollectionViewController *)&v18 itemManager:v9 futureToUpdateItems:v10 itemUpdateOptions:v11];
    }
    else
    {
      uint64_t v16 = [MEMORY[0x1E4F7A0D8] futureWithResult:MEMORY[0x1E4F1CC38]];
    }
    uint64_t v15 = (void *)v16;
  }

  return v15;
}

- (void)itemManager:(id)a3 didInsertItem:(id)a4 atIndexPath:(id)a5
{
  v6.receiver = self;
  v6.super_class = (Class)HUGridActionSetListViewController;
  [(HUItemCollectionViewController *)&v6 itemManager:a3 didInsertItem:a4 atIndexPath:a5];
  [(HUGridActionSetListViewController *)self _updateLayoutScrollDirectionIfNeeded];
}

- (void)itemManager:(id)a3 didRemoveItem:(id)a4 atIndexPath:(id)a5
{
  v6.receiver = self;
  v6.super_class = (Class)HUGridActionSetListViewController;
  [(HUItemCollectionViewController *)&v6 itemManager:a3 didRemoveItem:a4 atIndexPath:a5];
  [(HUGridActionSetListViewController *)self _updateLayoutScrollDirectionIfNeeded];
}

- (void)diffableDataItemManager:(id)a3 didUpdateItems:(id)a4 addItems:(id)a5 removeItems:(id)a6
{
  id v10 = a6;
  v13.receiver = self;
  v13.super_class = (Class)HUGridActionSetListViewController;
  id v11 = a5;
  [(HUControllableItemCollectionViewController *)&v13 diffableDataItemManager:a3 didUpdateItems:a4 addItems:v11 removeItems:v10];
  uint64_t v12 = objc_msgSend(v11, "count", v13.receiver, v13.super_class);

  if (v12 || [v10 count]) {
    [(HUGridActionSetListViewController *)self _updateLayoutScrollDirectionIfNeeded];
  }
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  objc_super v6 = [(HUGridActionSetListViewController *)self layoutOptions];
  if ([MEMORY[0x1E4F69138] isHomeControlService]) {
    uint64_t v7 = 1;
  }
  else {
    uint64_t v7 = 2;
  }
  [v6 pointWidthForNumberOfColumns:v7];
  double v9 = v8;

  id v10 = [(HUGridActionSetListViewController *)self layoutOptions];
  id v11 = [v10 sceneCellOptions];
  [v11 cellHeight];
  double v13 = v12;

  double v14 = v9;
  double v15 = v13;
  result.height = v15;
  result.width = v14;
  return result;
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  uint64_t v7 = [(HUGridActionSetListViewController *)self layoutOptions];
  if ([MEMORY[0x1E4F69138] isHomeControlService]) {
    uint64_t v8 = 1;
  }
  else {
    uint64_t v8 = 2;
  }
  [v7 pointWidthForNumberOfColumns:v8];
  double v10 = v9;
  id v11 = [(HUGridActionSetListViewController *)self layoutOptions];
  [v11 columnSpacing];
  double v13 = v10 + v12;

  a5->x = v13 * round(a5->x / v13);
}

- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (objc_msgSend((id)+[HUGridActionSetListViewController superclass](HUGridActionSetListViewController, "superclass"), "instancesRespondToSelector:", a2)&& (v11.receiver = self, v11.super_class = (Class)HUGridActionSetListViewController, -[HUControllableItemCollectionViewController collectionView:shouldHighlightItemAtIndexPath:](&v11, sel_collectionView_shouldHighlightItemAtIndexPath_, v7, v8)))
  {
    char v9 = 1;
  }
  else
  {
    char v9 = [(HUGridActionSetListViewController *)self isEditing];
  }

  return v9;
}

- (BOOL)collectionView:(id)a3 canFocusItemAtIndexPath:(id)a4
{
  return 1;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (objc_msgSend((id)+[HUGridActionSetListViewController superclass](HUGridActionSetListViewController, "superclass"), "instancesRespondToSelector:", a2))
  {
    v18.receiver = self;
    v18.super_class = (Class)HUGridActionSetListViewController;
    [(HUItemCollectionViewController *)&v18 collectionView:v7 didSelectItemAtIndexPath:v8];
  }
  objc_opt_class();
  char v9 = [(HUItemCollectionViewController *)self itemManager];
  double v10 = [v9 displayedItemAtIndexPath:v8];
  if (objc_opt_isKindOfClass()) {
    objc_super v11 = v10;
  }
  else {
    objc_super v11 = 0;
  }
  id v12 = v11;

  if (v12 && [(HUGridActionSetListViewController *)self isEditing])
  {
    double v13 = [(HUGridActionSetListViewController *)self _detailsViewControllerForActionSetItem:v12];
    double v14 = [(UIViewController *)self hu_delegateForModalPresentation];
    [v13 setPresentationDelegate:v14];

    double v15 = (void *)[objc_alloc(MEMORY[0x1E4F42BF8]) initWithRootViewController:v13];
    [v15 setModalPresentationStyle:2];
    uint64_t v16 = [(HUGridActionSetListViewController *)self parentViewController];
    id v17 = (id)objc_msgSend(v16, "hu_presentPreloadableViewController:animated:", v15, 1);
  }
}

+ (double)requiredHeightWithLayoutOptions:(id)a3 numberOfItems:(unint64_t)a4
{
  id v5 = a3;
  if ([v5 scrollDirection])
  {
    uint64_t v6 = 2;
  }
  else
  {
    id v7 = [v5 overrideNumberOfColumns];
    if (v7)
    {
      id v8 = [v5 overrideNumberOfColumns];
      [v8 floatValue];
      float v10 = v9;
    }
    else
    {
      float v10 = floorf((float)[v5 numberOfColumns] * 0.5);
    }

    uint64_t v11 = vcvtps_s32_f32((float)a4 / (float)(uint64_t)v10);
    if (v11 <= 2) {
      uint64_t v6 = 2;
    }
    else {
      uint64_t v6 = v11;
    }
  }
  id v12 = [v5 sceneCellOptions];
  [v12 cellHeight];
  double v14 = v13;
  [v5 rowSpacing];
  double v16 = v15 * (double)(v6 - 1) + v14 * (double)v6;

  return v16;
}

- (BOOL)canReorderItemAtIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = [(HUGridActionSetListViewController *)self actionSetItemManager];
  char v6 = [v5 isItemReorderableAtIndex:v4];

  return v6;
}

- (id)reorderableItemListForSection:(int64_t)a3
{
  uint64_t v3 = [(HUGridActionSetListViewController *)self actionSetItemManager];
  id v4 = [v3 reorderableActionSetList];

  return v4;
}

- (void)setReorderableItemList:(id)a3 forSection:(int64_t)a4
{
  id v5 = a3;
  objc_opt_class();
  id v9 = v5;
  if (objc_opt_isKindOfClass()) {
    char v6 = v9;
  }
  else {
    char v6 = 0;
  }
  id v7 = v6;

  id v8 = [(HUGridActionSetListViewController *)self actionSetItemManager];
  [v8 setReorderableActionSetList:v7];
}

- (BOOL)hasDetailsActionForPresentationCoordinator:(id)a3 item:(id)a4
{
  id v4 = a4;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)detailsViewControllerForPresentationCoordinator:(id)a3 item:(id)a4
{
  id v5 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || ([(HUGridActionSetListViewController *)self _detailsViewControllerForActionSetItem:v5], (char v6 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    NSLog(&cfstr_NoDetailsViewC.isa, v5);
    char v6 = 0;
  }

  return v6;
}

- (id)_performTapActionForItem:(id)a3 tappedArea:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HUGridActionSetListViewController *)self actionSetItemManager];
  id v9 = [v8 actionSetPlaceholderItem];
  int v10 = [v6 isEqual:v9];

  if (v10)
  {
    uint64_t v11 = [(HUGridActionSetListViewController *)self actionSetListViewControllerDelegate];

    if (v11)
    {
      id v12 = [(HUGridActionSetListViewController *)self actionSetListViewControllerDelegate];
      [v12 addSceneTileAction:self];
    }
    uint64_t v13 = [MEMORY[0x1E4F7A0D8] futureWithNoResult];
  }
  else
  {
    v16.receiver = self;
    v16.super_class = (Class)HUGridActionSetListViewController;
    uint64_t v13 = [(HUControllableItemCollectionViewController *)&v16 _performTapActionForItem:v6 tappedArea:v7];
  }
  double v14 = (void *)v13;

  return v14;
}

- (BOOL)presentationCoordinator:(id)a3 shouldBeginPresentationWithContext:(id)a4
{
  id v5 = a4;
  if ([(HUGridActionSetListViewController *)self shouldAllowItemPresentation])
  {
    id v6 = [v5 item];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  else
  {
    char isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

- (id)_detailsViewControllerForActionSetItem:(id)a3
{
  id v4 = a3;
  id v5 = [v4 actionSet];

  if (v5)
  {
    id v6 = objc_alloc(MEMORY[0x1E4F68EB0]);
    id v7 = [v4 actionSet];
    id v8 = [(HUItemCollectionViewController *)self itemManager];
    id v9 = [v8 home];
    int v10 = (void *)[v6 initWithExistingObject:v7 inHome:v9];

    uint64_t v11 = [[HUSceneActionEditorViewController alloc] initWithActionSetBuilder:v10 mode:0];
  }
  else
  {
    NSLog(&cfstr_ActionsetMustN.isa);
    uint64_t v11 = 0;
  }

  return v11;
}

- (void)_updateLayoutScrollDirectionIfNeeded
{
  uint64_t v3 = objc_opt_class();
  id v4 = [(HUGridActionSetListViewController *)self collectionViewLayout];
  if (!v4) {
    goto LABEL_7;
  }
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v11 = v4;
  if (!v5)
  {
    id v6 = [MEMORY[0x1E4F28B00] currentHandler];
    id v7 = objc_msgSend(NSString, "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    [v6 handleFailureInFunction:v7, @"NSObject+NAAdditions.h", 54, @"Expected class of %@ but was %@", v3, objc_opt_class() file lineNumber description];

LABEL_7:
    id v11 = 0;
  }

  uint64_t v8 = [v11 scrollDirection];
  id v9 = [v11 layoutOptions];
  int64_t v10 = [(HUGridActionSetListViewController *)self _scrollDirectionForLayoutOptions:v9];

  if (v8 != v10) {
    [v11 setScrollDirection:v10];
  }
}

- (int64_t)_scrollDirectionForLayoutOptions:(id)a3
{
  return (objc_msgSend(MEMORY[0x1E4F69758], "isAMac", a3) & 1) == 0
      && (![MEMORY[0x1E4F69138] isHomeControlService]
       || ([MEMORY[0x1E4F69758] isAnIPad] & 1) == 0);
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (HUGridActionSetListViewControllerDelegate)actionSetListViewControllerDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_actionSetListViewControllerDelegate);

  return (HUGridActionSetListViewControllerDelegate *)WeakRetained;
}

- (void)setActionSetListViewControllerDelegate:(id)a3
{
}

- (BOOL)shouldAllowItemPresentation
{
  return self->_shouldAllowItemPresentation;
}

- (void)setShouldAllowItemPresentation:(BOOL)a3
{
  self->_shouldAllowItemPresentation = a3;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleLabel, 0);

  objc_destroyWeak((id *)&self->_actionSetListViewControllerDelegate);
}

@end