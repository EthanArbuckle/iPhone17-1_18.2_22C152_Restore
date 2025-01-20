@interface HUSelectableGridActionSetListViewController
- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4;
- (BOOL)presentationCoordinator:(id)a3 shouldBeginInteractivePresentationWithTouchLocation:(CGPoint)a4 view:(id)a5;
- (HFMutableSetDiff)mutableSelectedActionSets;
- (HUSelectableGridActionSetListViewController)init;
- (HUSelectableGridActionSetListViewController)initWithRoom:(id)a3 selectedActionSets:(id)a4;
- (HUSelectableGridActionSetListViewControllerDelegate)delegate;
- (void)_selectedItemStateChanged:(id)a3 isSelected:(BOOL)a4 accessoryViewCell:(id)a5;
- (void)_updateSelectionState:(BOOL)a3 forCell:(id)a4;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)configureCell:(id)a3 forItem:(id)a4;
- (void)selectedActionSetStateChanged:(id)a3 isSelected:(BOOL)a4;
- (void)setDelegate:(id)a3;
- (void)setMutableSelectedActionSets:(id)a3;
@end

@implementation HUSelectableGridActionSetListViewController

- (HUSelectableGridActionSetListViewController)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  v5 = NSStringFromSelector(sel_initWithRoom_selectedActionSets_);
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUSelectableGridActionSetListViewController.m", 30, @"%s is unavailable; use %@ instead",
    "-[HUSelectableGridActionSetListViewController init]",
    v5);

  return 0;
}

- (HUSelectableGridActionSetListViewController)initWithRoom:(id)a3 selectedActionSets:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = objc_alloc_init(HUGridFlowLayout);
  v9 = [[HUGridActionSetItemManager alloc] initWithDelegate:self actionSetStyle:0 room:v7];

  v13.receiver = self;
  v13.super_class = (Class)HUSelectableGridActionSetListViewController;
  v10 = [(HUControllableItemCollectionViewController *)&v13 initWithItemManager:v9 collectionViewLayout:v8];
  if (v10)
  {
    v11 = (void *)[v6 mutableCopy];
    [(HUSelectableGridActionSetListViewController *)v10 setMutableSelectedActionSets:v11];
  }
  return v10;
}

- (void)selectedActionSetStateChanged:(id)a3 isSelected:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(HUGridActionSetListViewController *)self actionSetItemManager];
  uint64_t v16 = [v7 actionSetItemAssociatedWithActionSet:v6];

  v8 = (void *)v16;
  if (v16)
  {
    v9 = [(HUItemCollectionViewController *)self itemManager];
    v10 = [v9 indexPathForItem:v16];

    if (v10
      && ([(HUSelectableGridActionSetListViewController *)self collectionView],
          v11 = objc_claimAutoreleasedReturnValue(),
          [v11 indexPathsForVisibleItems],
          v12 = objc_claimAutoreleasedReturnValue(),
          int v13 = [v12 containsObject:v10],
          v12,
          v11,
          v13))
    {
      v14 = [(HUSelectableGridActionSetListViewController *)self collectionView];
      v15 = [v14 cellForItemAtIndexPath:v10];
    }
    else
    {
      v15 = 0;
    }
    [(HUSelectableGridActionSetListViewController *)self _selectedItemStateChanged:v16 isSelected:v4 accessoryViewCell:v15];

    v8 = (void *)v16;
  }
}

- (void)configureCell:(id)a3 forItem:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)HUSelectableGridActionSetListViewController;
  [(HUGridActionSetListViewController *)&v15 configureCell:v6 forItem:v7];
  if ([v6 conformsToProtocol:&unk_1F19F56E8])
  {
    id v8 = v6;
    v9 = [HUCheckmarkAccessoryView alloc];
    v10 = -[HUCheckmarkAccessoryView initWithFrame:](v9, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    [v8 setAccessoryView:v10];

    v11 = [(HUSelectableGridActionSetListViewController *)self mutableSelectedActionSets];
    v12 = [v11 toSet];
    int v13 = [v7 actionSet];
    uint64_t v14 = [v12 containsObject:v13];

    [(HUSelectableGridActionSetListViewController *)self _updateSelectionState:v14 forCell:v8];
  }
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v6 = a4;
  v22.receiver = self;
  v22.super_class = (Class)HUSelectableGridActionSetListViewController;
  [(HUGridActionSetListViewController *)&v22 collectionView:a3 didSelectItemAtIndexPath:v6];
  id v7 = [(HUSelectableGridActionSetListViewController *)self collectionView];
  id v8 = [v7 cellForItemAtIndexPath:v6];

  if ([v8 conformsToProtocol:&unk_1F19F56E8])
  {
    id v9 = v8;
    v10 = [(HUItemCollectionViewController *)self itemManager];
    v11 = [v10 displayedItemAtIndexPath:v6];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v12 = [v11 actionSet];
    }
    else
    {
      v12 = 0;
    }
    int v13 = [(HUSelectableGridActionSetListViewController *)self mutableSelectedActionSets];
    uint64_t v14 = [v13 toSet];
    objc_super v15 = [v11 actionSet];
    int v16 = [v14 containsObject:v15];

    if (v16)
    {
      [(HUSelectableGridActionSetListViewController *)self _selectedItemStateChanged:v11 isSelected:0 accessoryViewCell:v9];
      v17 = [(HUSelectableGridActionSetListViewController *)self delegate];
      v18 = v17;
      v19 = self;
      v20 = v12;
      uint64_t v21 = 0;
    }
    else
    {
      [(HUSelectableGridActionSetListViewController *)self _selectedItemStateChanged:v11 isSelected:1 accessoryViewCell:v9];
      v17 = [(HUSelectableGridActionSetListViewController *)self delegate];
      v18 = v17;
      v19 = self;
      v20 = v12;
      uint64_t v21 = 1;
    }
    [v17 selectableGridActionSetListViewController:v19 didChangeStateForActionSet:v20 isSelected:v21];
  }
}

- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4
{
  return 1;
}

- (BOOL)presentationCoordinator:(id)a3 shouldBeginInteractivePresentationWithTouchLocation:(CGPoint)a4 view:(id)a5
{
  return 0;
}

- (void)_selectedItemStateChanged:(id)a3 isSelected:(BOOL)a4 accessoryViewCell:(id)a5
{
  BOOL v6 = a4;
  id v11 = a3;
  id v8 = a5;
  id v9 = [(HUSelectableGridActionSetListViewController *)self mutableSelectedActionSets];
  v10 = [v11 actionSet];
  if (v6) {
    [v9 addObject:v10];
  }
  else {
    [v9 deleteObject:v10];
  }

  if (v8 && [v8 conformsToProtocol:&unk_1F19F56E8]) {
    [(HUSelectableGridActionSetListViewController *)self _updateSelectionState:v6 forCell:v8];
  }
}

- (void)_updateSelectionState:(BOOL)a3 forCell:(id)a4
{
  BOOL v4 = a3;
  id v5 = a4;
  objc_opt_class();
  BOOL v6 = [v5 accessoryView];

  if (objc_opt_isKindOfClass()) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }
  id v8 = v7;

  [v8 setChecked:v4];
}

- (HUSelectableGridActionSetListViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HUSelectableGridActionSetListViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (HFMutableSetDiff)mutableSelectedActionSets
{
  return self->_mutableSelectedActionSets;
}

- (void)setMutableSelectedActionSets:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutableSelectedActionSets, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end