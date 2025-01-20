@interface CNUINavigationListViewController
+ (BOOL)itemRequiresDetailCell:(id)a3;
- (BOOL)canExpandItem:(id)a3;
- (BOOL)canSelectItem:(id)a3;
- (BOOL)ignoreParentControllerResize;
- (BOOL)navigationListView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4;
- (BOOL)navigationListView:(id)a3 shouldSelectRowAtIndexPath:(id)a4;
- (BOOL)showFirstSectionTopSeparator;
- (BOOL)tableView:(id)a3 shouldDrawBottomSeparatorForSection:(int64_t)a4;
- (BOOL)tableView:(id)a3 shouldDrawTopSeparatorForSection:(int64_t)a4;
- (CGSize)contentSizeForExpandedItem:(id)a3;
- (CNUINavigationListItem)displayedExpandedItem;
- (CNUINavigationListItem)expandedItem;
- (CNUINavigationListStyle)navigationListStyle;
- (CNUINavigationListView)navigationListView;
- (CNUINavigationListViewCellHeightEstimator)cellHeightEstimator;
- (CNUINavigationListViewController)init;
- (CNUINavigationListViewControllerDelegate)delegate;
- (NSArray)items;
- (double)cellSeparatorHeight;
- (id)dequeueReusableDetailCell;
- (id)dequeueReusableStandardCell;
- (id)itemAtIndex:(int64_t)a3;
- (id)itemAtIndexPath:(id)a3;
- (id)itemsForItem:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)contentAlignment;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)expandItem:(id)a3;
- (void)loadView;
- (void)navigationListView:(id)a3 accessoryButtonTappedForRowWithIndexPath:(id)a4;
- (void)navigationListView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)reloadNavigationListView;
- (void)setCellHeightEstimator:(id)a3;
- (void)setContentAlignment:(int64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setDisplayedExpandedItem:(id)a3;
- (void)setExpandedItem:(id)a3;
- (void)setIgnoreParentControllerResize:(BOOL)a3;
- (void)setItems:(id)a3;
- (void)setNavigationListStyle:(id)a3;
- (void)setNavigationListView:(id)a3;
- (void)setShowFirstSectionTopSeparator:(BOOL)a3;
- (void)startTrackingRolloverWithGestureRecognizer:(id)a3;
- (void)styleUpdated;
- (void)toggleItem:(id)a3;
- (void)updateNavigationListView;
- (void)updateNavigationListViewStateAnimated:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation CNUINavigationListViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayedExpandedItem, 0);
  objc_storeStrong((id *)&self->_cellHeightEstimator, 0);
  objc_storeStrong((id *)&self->_navigationListStyle, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_expandedItem, 0);
  objc_storeStrong((id *)&self->_items, 0);

  objc_storeStrong((id *)&self->_navigationListView, 0);
}

- (void)setIgnoreParentControllerResize:(BOOL)a3
{
  self->_ignoreParentControllerResize = a3;
}

- (BOOL)ignoreParentControllerResize
{
  return self->_ignoreParentControllerResize;
}

- (void)setDisplayedExpandedItem:(id)a3
{
}

- (CNUINavigationListItem)displayedExpandedItem
{
  return self->_displayedExpandedItem;
}

- (void)setCellHeightEstimator:(id)a3
{
}

- (CNUINavigationListViewCellHeightEstimator)cellHeightEstimator
{
  return self->_cellHeightEstimator;
}

- (void)setShowFirstSectionTopSeparator:(BOOL)a3
{
  self->_showFirstSectionTopSeparator = a3;
}

- (BOOL)showFirstSectionTopSeparator
{
  return self->_showFirstSectionTopSeparator;
}

- (void)setContentAlignment:(int64_t)a3
{
  self->_contentAlignment = a3;
}

- (int64_t)contentAlignment
{
  return self->_contentAlignment;
}

- (CNUINavigationListStyle)navigationListStyle
{
  return self->_navigationListStyle;
}

- (void)setDelegate:(id)a3
{
}

- (CNUINavigationListViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CNUINavigationListViewControllerDelegate *)WeakRetained;
}

- (void)setExpandedItem:(id)a3
{
}

- (CNUINavigationListItem)expandedItem
{
  return self->_expandedItem;
}

- (void)setItems:(id)a3
{
}

- (NSArray)items
{
  return self->_items;
}

- (void)setNavigationListView:(id)a3
{
}

- (CNUINavigationListView)navigationListView
{
  return self->_navigationListView;
}

- (void)navigationListView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v11 = a4;
  uint64_t v5 = [(CNUINavigationListViewController *)self delegate];
  if (v5)
  {
    v6 = (void *)v5;
    v7 = [(CNUINavigationListViewController *)self delegate];
    char v8 = objc_opt_respondsToSelector();

    if (v8)
    {
      v9 = [(CNUINavigationListViewController *)self itemAtIndexPath:v11];
      v10 = [(CNUINavigationListViewController *)self delegate];
      [v10 navigationListController:self didSelectItem:v9];
    }
  }
}

- (BOOL)navigationListView:(id)a3 shouldSelectRowAtIndexPath:(id)a4
{
  v4 = self;
  uint64_t v5 = [(CNUINavigationListViewController *)self itemAtIndexPath:a4];
  LOBYTE(v4) = [(CNUINavigationListViewController *)v4 canSelectItem:v5];

  return (char)v4;
}

- (BOOL)navigationListView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  v4 = self;
  uint64_t v5 = [(CNUINavigationListViewController *)self itemAtIndexPath:a4];
  LOBYTE(v4) = [(CNUINavigationListViewController *)v4 canSelectItem:v5];

  return (char)v4;
}

- (void)startTrackingRolloverWithGestureRecognizer:(id)a3
{
  id v4 = a3;
  id v5 = [(CNUINavigationListViewController *)self navigationListView];
  [v5 startTrackingSelectionFromGestureRecognizer:v4];
}

- (BOOL)canSelectItem:(id)a3
{
  id v4 = a3;
  id v5 = [(CNUINavigationListViewController *)self items];
  char v6 = [v5 containsObject:v4];

  if ((v6 & 1) == 0)
  {
    if (![(CNUINavigationListViewController *)self canExpandItem:v4]) {
      goto LABEL_3;
    }
LABEL_6:
    BOOL v10 = 1;
    goto LABEL_9;
  }
  v7 = [(CNUINavigationListViewController *)self items];
  unint64_t v8 = [v7 count];

  if (v8 > 1) {
    goto LABEL_6;
  }
LABEL_3:
  v9 = [v4 defaultItem];
  if (v9)
  {
    BOOL v10 = 1;
  }
  else
  {
    id v11 = [v4 content];
    BOOL v10 = v11 != 0;
  }
LABEL_9:

  return v10;
}

- (void)updateNavigationListViewStateAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(CNUINavigationListViewController *)self expandedItem];
  char v6 = [(CNUINavigationListViewController *)self displayedExpandedItem];

  if (v5 != v6)
  {
    v7 = [(CNUINavigationListViewController *)self displayedExpandedItem];
    unint64_t v8 = [(CNUINavigationListViewController *)self expandedItem];
    v9 = [v8 parent];

    if (v3) {
      uint64_t v10 = 0;
    }
    else {
      uint64_t v10 = 5;
    }
    id v11 = [(CNUINavigationListViewController *)self navigationListView];
    [v11 beginUpdates];

    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __74__CNUINavigationListViewController_updateNavigationListViewStateAnimated___block_invoke;
    aBlock[3] = &unk_1E5496890;
    aBlock[4] = self;
    v12 = _Block_copy(aBlock);
    v64[0] = MEMORY[0x1E4F143A8];
    v64[1] = 3221225472;
    v64[2] = __74__CNUINavigationListViewController_updateNavigationListViewStateAnimated___block_invoke_2;
    v64[3] = &unk_1E54968B8;
    v64[4] = self;
    v13 = _Block_copy(v64);
    v14 = [(CNUINavigationListViewController *)self displayedExpandedItem];
    v15 = [(CNUINavigationListViewController *)self itemsForItem:v14];

    v16 = [(CNUINavigationListViewController *)self expandedItem];
    v17 = [(CNUINavigationListViewController *)self itemsForItem:v16];

    v62 = v15;
    v63 = v12;
    v59 = v13;
    uint64_t v61 = v10;
    if (v7 == v9)
    {
      v18 = [(CNUINavigationListViewController *)self expandedItem];
      uint64_t v43 = [v15 indexOfObject:v18];
      v28 = [MEMORY[0x1E4F28D58] indexPathForNavigationListItemIndex:v43];
      objc_opt_class();
      v44 = [(CNUINavigationListViewController *)self navigationListView];
      v45 = [v44 cellForRowAtIndexPath:v28];
      if (objc_opt_isKindOfClass()) {
        v46 = v45;
      }
      else {
        v46 = 0;
      }
      id v47 = v46;

      v48 = [(CNUINavigationListViewController *)self navigationListStyle];
      [v47 setNavigationListStyle:v48];

      v49 = [(CNUINavigationListViewController *)self expandedItem];
      [v47 setAccessoryControlExpanded:v18 == v49 animated:1];

      v27 = v17;
      uint64_t v50 = [v17 indexOfObject:v18];
      [MEMORY[0x1E4F28D58] indexPathForNavigationListItemIndex:v50];
      v32 = v51 = (void (**)(void *, void *))v13;
      v35 = (*((void (**)(void *, void *))v12 + 2))(v12, v18);
      v36 = v51[2](v51, v18);
      if ([v28 compare:v32])
      {
        v52 = [(CNUINavigationListViewController *)self navigationListView];
        [v52 moveRowAtIndexPath:v28 toIndexPath:v32];
      }
      v53 = [(CNUINavigationListViewController *)self navigationListView];
      v54 = [v35 first];
      [v53 deleteRowsAtIndexPaths:v54 withRowAnimation:v61];

      v55 = [(CNUINavigationListViewController *)self navigationListView];
      v56 = [v35 second];
      [v55 deleteRowsAtIndexPaths:v56 withRowAnimation:v61];

      v41 = [(CNUINavigationListViewController *)self navigationListView];
      [v41 insertRowsAtIndexPaths:v36 withRowAnimation:v61];
    }
    else
    {
      v18 = [(CNUINavigationListViewController *)self displayedExpandedItem];
      uint64_t v19 = [v15 indexOfObject:v18];
      v20 = [MEMORY[0x1E4F28D58] indexPathForNavigationListItemIndex:v19];
      objc_opt_class();
      v21 = [(CNUINavigationListViewController *)self navigationListView];
      v22 = [v21 cellForRowAtIndexPath:v20];
      if (objc_opt_isKindOfClass()) {
        v23 = v22;
      }
      else {
        v23 = 0;
      }
      id v24 = v23;

      v25 = [(CNUINavigationListViewController *)self navigationListStyle];
      [v24 setNavigationListStyle:v25];

      v26 = [(CNUINavigationListViewController *)self expandedItem];
      [v24 setAccessoryControlExpanded:v18 == v26 animated:1];

      v27 = v17;
      v28 = v20;
      uint64_t v29 = [v17 indexOfObject:v18];
      uint64_t v30 = [MEMORY[0x1E4F28D58] indexPathForNavigationListItemIndex:v29];
      v31 = (void (**)(void *, void *))v13;
      v32 = (void *)v30;
      uint64_t v33 = v31[2](v31, v18);
      v34 = (void (**)(void *, void *))v12;
      v35 = (void *)v33;
      v36 = v34[2](v34, v18);
      if ([v20 compare:v32])
      {
        v37 = [(CNUINavigationListViewController *)self navigationListView];
        [v37 moveRowAtIndexPath:v20 toIndexPath:v32];
      }
      v38 = [(CNUINavigationListViewController *)self navigationListView];
      [v38 deleteRowsAtIndexPaths:v35 withRowAnimation:v61];

      v39 = [(CNUINavigationListViewController *)self navigationListView];
      v40 = [v36 first];
      [v39 insertRowsAtIndexPaths:v40 withRowAnimation:v61];

      v41 = [(CNUINavigationListViewController *)self navigationListView];
      v42 = [v36 second];
      [v41 insertRowsAtIndexPaths:v42 withRowAnimation:v61];
    }
    v57 = [(CNUINavigationListViewController *)self expandedItem];
    [(CNUINavigationListViewController *)self setDisplayedExpandedItem:v57];

    v58 = [(CNUINavigationListViewController *)self navigationListView];
    [v58 endUpdates];
  }
}

id __74__CNUINavigationListViewController_updateNavigationListViewStateAnimated___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [MEMORY[0x1E4F1CA48] array];
  id v5 = [MEMORY[0x1E4F1CA48] array];
  id v6 = v4;
  v7 = *(void **)(a1 + 32);
  unint64_t v8 = [v3 parent];
  v9 = [v7 itemsForItem:v8];

  id v10 = v6;
  if ([v9 count])
  {
    unint64_t v11 = 0;
    id v10 = v6;
    do
    {
      id v12 = [v9 objectAtIndex:v11];

      if (v12 == v3)
      {
        v13 = v10;
        id v10 = v5;
      }
      else
      {
        v13 = [MEMORY[0x1E4F28D58] indexPathForNavigationListItemIndex:v11];
        [v10 addObject:v13];
      }

      ++v11;
    }
    while (v11 < [v9 count]);
  }
  v14 = (void *)MEMORY[0x1E4F5A490];
  v15 = (void *)[v6 copy];
  v16 = (void *)[v5 copy];
  v17 = [v14 pairWithFirst:v15 second:v16];

  return v17;
}

id __74__CNUINavigationListViewController_updateNavigationListViewStateAnimated___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [MEMORY[0x1E4F1CA48] array];
  id v5 = [*(id *)(a1 + 32) itemsForItem:v3];
  if ([v5 count])
  {
    unint64_t v6 = 0;
    do
    {
      id v7 = [v5 objectAtIndex:v6];

      if (v7 != v3)
      {
        unint64_t v8 = [MEMORY[0x1E4F28D58] indexPathForNavigationListItemIndex:v6];
        [v4 addObject:v8];
      }
      ++v6;
    }
    while (v6 < [v5 count]);
  }
  v9 = (void *)[v4 copy];

  return v9;
}

- (void)reloadNavigationListView
{
  if ([(CNUINavigationListViewController *)self isViewLoaded])
  {
    id v3 = [(CNUINavigationListViewController *)self expandedItem];
    [(CNUINavigationListViewController *)self setDisplayedExpandedItem:v3];

    id v4 = [(CNUINavigationListViewController *)self navigationListView];
    [v4 reloadData];

    id v5 = [(CNUINavigationListViewController *)self parentViewController];
    unint64_t v6 = [v5 transitionCoordinator];

    if (v6)
    {
      id v7 = [(CNUINavigationListViewController *)self parentViewController];
      unint64_t v8 = [v7 transitionCoordinator];
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __60__CNUINavigationListViewController_reloadNavigationListView__block_invoke;
      v9[3] = &unk_1E5498AF8;
      v9[4] = self;
      [v8 animateAlongsideTransition:0 completion:v9];
    }
    else
    {
      [(CNUINavigationListViewController *)self updateNavigationListView];
    }
  }
}

uint64_t __60__CNUINavigationListViewController_reloadNavigationListView__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateNavigationListView];
}

- (void)updateNavigationListView
{
  id v3 = [(CNUINavigationListViewController *)self expandedItem];
  [(CNUINavigationListViewController *)self contentSizeForExpandedItem:v3];
  double v5 = v4;
  double v7 = v6;

  [(CNUINavigationListViewController *)self preferredContentSize];
  BOOL v10 = v5 == v9 && v7 == v8;
  if (!v10 && ![(CNUINavigationListViewController *)self ignoreParentControllerResize]) {
    -[CNUINavigationListViewController setPreferredContentSize:](self, "setPreferredContentSize:", v5, v7);
  }

  [(CNUINavigationListViewController *)self updateNavigationListViewStateAnimated:1];
}

- (CGSize)contentSizeForExpandedItem:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(CNUINavigationListViewController *)self preferredContentSize];
  double v6 = v5;
  double v7 = [(CNUINavigationListViewController *)self itemsForItem:v4];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v31;
    double v11 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v31 != v10) {
          objc_enumerationMutation(v7);
        }
        v13 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        if ([(id)objc_opt_class() itemRequiresDetailCell:v13]) {
          v14 = CNUINavigationListViewDetailCell;
        }
        else {
          v14 = CNUINavigationListViewCell;
        }
        v15 = [v13 title];
        v16 = [v13 subtitle];
        v17 = [(CNUINavigationListViewController *)self navigationListStyle];
        [(__objc2_class *)v14 desiredContentSizeForTitle:v15 subTitle:v16 navigationListStyle:v17];
        double v19 = v18;
        double v21 = v20;

        [(CNUINavigationListViewController *)self cellSeparatorHeight];
        double v23 = v21 + v22;
        if (v6 < v19) {
          double v6 = v19;
        }
        double v11 = v11 + v23;
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v9);
  }
  else
  {
    double v11 = 0.0;
  }
  [(CNUINavigationListViewController *)self cellSeparatorHeight];
  double v25 = ceil(v11 + v24);
  [(CNUINavigationListViewController *)self cellSeparatorHeight];
  double v27 = v26 + 54.0;
  if (v27 >= v25) {
    double v25 = v27;
  }

  double v28 = v6;
  double v29 = v25;
  result.height = v29;
  result.width = v28;
  return result;
}

- (id)itemsForItem:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 items];
  if (v5)
  {
    double v6 = (void *)v5;
    v10[0] = v4;
    double v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
    uint64_t v8 = [v7 arrayByAddingObjectsFromArray:v6];
  }
  else
  {
    uint64_t v8 = [(CNUINavigationListViewController *)self items];
  }

  return v8;
}

- (id)itemAtIndexPath:(id)a3
{
  uint64_t v4 = [a3 row];

  return [(CNUINavigationListViewController *)self itemAtIndex:v4];
}

- (id)itemAtIndex:(int64_t)a3
{
  uint64_t v5 = [(CNUINavigationListViewController *)self displayedExpandedItem];
  double v6 = [(CNUINavigationListViewController *)self itemsForItem:v5];

  double v7 = [v6 objectAtIndexedSubscript:a3];

  return v7;
}

- (id)dequeueReusableDetailCell
{
  v2 = [(CNUINavigationListViewController *)self navigationListView];
  id v3 = +[CNUINavigationListViewDetailCell reuseIdentifier];
  uint64_t v4 = [v2 dequeueReusableCellWithIdentifier:v3];

  return v4;
}

- (id)dequeueReusableStandardCell
{
  v2 = [(CNUINavigationListViewController *)self navigationListView];
  id v3 = +[CNUINavigationListViewCell reuseIdentifier];
  uint64_t v4 = [v2 dequeueReusableCellWithIdentifier:v3];

  return v4;
}

- (void)navigationListView:(id)a3 accessoryButtonTappedForRowWithIndexPath:(id)a4
{
  id v5 = [(CNUINavigationListViewController *)self itemAtIndexPath:a4];
  [(CNUINavigationListViewController *)self toggleItem:v5];
}

- (BOOL)canExpandItem:(id)a3
{
  if (a3)
  {
    id v3 = [a3 items];
    BOOL v4 = [v3 count] != 0;
  }
  else
  {
    id v3 = [(CNUINavigationListViewController *)self items];
    BOOL v4 = (unint64_t)[v3 count] > 1;
  }

  return v4;
}

- (void)toggleItem:(id)a3
{
  id v9 = a3;
  id v4 = [(CNUINavigationListViewController *)self displayedExpandedItem];
  if (v4 == v9)
  {
    double v6 = [v9 parent];
    BOOL v7 = [(CNUINavigationListViewController *)self canExpandItem:v6];

    id v5 = v9;
    if (v7)
    {
      uint64_t v8 = [v9 parent];
      [(CNUINavigationListViewController *)self expandItem:v8];

      goto LABEL_7;
    }
  }
  else
  {

    id v5 = v9;
  }
  if ([(CNUINavigationListViewController *)self canExpandItem:v5]) {
    [(CNUINavigationListViewController *)self expandItem:v9];
  }
LABEL_7:
}

- (void)expandItem:(id)a3
{
  id v5 = a3;
  id v4 = [(CNUINavigationListViewController *)self displayedExpandedItem];
  if (v4 != v5)
  {
    [(CNUINavigationListViewController *)self setExpandedItem:v5];
    [(CNUINavigationListViewController *)self updateNavigationListView];
  }
}

- (BOOL)tableView:(id)a3 shouldDrawTopSeparatorForSection:(int64_t)a4
{
  return !a4
      && [(CNUINavigationListViewController *)self showFirstSectionTopSeparator];
}

- (double)cellSeparatorHeight
{
  if (!dyld_program_sdk_at_least()
    || (char v3 = objc_msgSend(MEMORY[0x1E4FB08E0], "ab_preferredContentSizeCategoryIsAccessibilityCategory"),
        double result = 1.0,
        (v3 & 1) == 0))
  {
    id v4 = objc_msgSend(MEMORY[0x1E4FB1BA8], "mainScreen", result);
    [v4 scale];
    double v6 = v5;

    return 1.0 / v6;
  }
  return result;
}

- (BOOL)tableView:(id)a3 shouldDrawBottomSeparatorForSection:(int64_t)a4
{
  return [a3 numberOfSections] - 1 != a4;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  double v5 = [(CNUINavigationListViewController *)self items];
  double v6 = [(CNUINavigationListViewController *)self displayedExpandedItem];

  if (v6)
  {
    BOOL v7 = [(CNUINavigationListViewController *)self displayedExpandedItem];
    uint64_t v8 = [(CNUINavigationListViewController *)self itemsForItem:v7];

    double v5 = (void *)v8;
  }
  int64_t v9 = [v5 count];

  return v9;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  double v5 = [(CNUINavigationListViewController *)self itemAtIndexPath:a4];
  if ([(id)objc_opt_class() itemRequiresDetailCell:v5])
  {
    double v6 = [(CNUINavigationListViewController *)self dequeueReusableDetailCell];
    objc_msgSend(v6, "setContentAlignment:", -[CNUINavigationListViewController contentAlignment](self, "contentAlignment"));
  }
  else
  {
    double v6 = [(CNUINavigationListViewController *)self dequeueReusableStandardCell];
  }
  if ([(CNUINavigationListViewController *)self canExpandItem:v5])
  {
    BOOL v7 = [v5 parent];
    uint64_t v8 = [(CNUINavigationListViewController *)self canExpandItem:v7] ^ 1;
  }
  else
  {
    uint64_t v8 = 1;
  }
  int64_t v9 = [(CNUINavigationListViewController *)self navigationListStyle];
  [v6 setNavigationListStyle:v9];

  uint64_t v10 = [v6 accessoryImageView];
  [v10 setHidden:v8];

  objc_msgSend(MEMORY[0x1E4FB08E0], "ab_preferredContentSizeCategoryName");
  double v11 = (NSString *)objc_claimAutoreleasedReturnValue();
  NSComparisonResult v12 = UIContentSizeCategoryCompareToCategory(v11, (UIContentSizeCategory)*MEMORY[0x1E4FB2788]);
  v13 = (uint64_t *)MEMORY[0x1E4FB2A58];
  if (v12 != NSOrderedAscending) {
    v13 = (uint64_t *)MEMORY[0x1E4FB2A60];
  }
  uint64_t v14 = *v13;

  v15 = [v5 image];
  v16 = [MEMORY[0x1E4FB1830] configurationWithTextStyle:*MEMORY[0x1E4FB28C8] scale:v14];
  v17 = [v15 imageWithConfiguration:v16];
  double v18 = [v6 titleImageView];
  [v18 setImage:v17];

  double v19 = [v5 title];
  double v20 = [v6 titleLabel];
  [v20 setText:v19];

  double v21 = [v5 subtitle];
  double v22 = [v6 subtitleLabel];
  [v22 setText:v21];

  double v23 = [(CNUINavigationListViewController *)self displayedExpandedItem];
  [v6 setAccessoryControlExpanded:v5 == v23 animated:0];

  return v6;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)CNUINavigationListViewController;
  id v7 = a4;
  -[CNUINavigationListViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __87__CNUINavigationListViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v8[3] = &unk_1E5498AF8;
  v8[4] = self;
  [v7 animateAlongsideTransition:v8 completion:&__block_literal_global_732];
}

uint64_t __87__CNUINavigationListViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateNavigationListViewStateAnimated:1];
}

- (void)viewDidLoad
{
  v11.receiver = self;
  v11.super_class = (Class)CNUINavigationListViewController;
  [(CNUINavigationListViewController *)&v11 viewDidLoad];
  char v3 = [(CNUINavigationListViewController *)self navigationListView];
  id v4 = [MEMORY[0x1E4FB1618] clearColor];
  [v3 setBackgroundColor:v4];

  [v3 setRowHeight:*MEMORY[0x1E4FB2F28]];
  double v5 = [(CNUINavigationListViewController *)self cellHeightEstimator];
  [v5 estimatedCellHeight];
  double v7 = v6;
  [(CNUINavigationListViewController *)self cellSeparatorHeight];
  [v3 setEstimatedRowHeight:v7 + v8];

  id v9 = objc_alloc(MEMORY[0x1E4FB1EB0]);
  uint64_t v10 = objc_msgSend(v9, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [v3 setTableFooterView:v10];

  [(CNUINavigationListViewController *)self updateNavigationListView];
}

- (void)loadView
{
  char v3 = [CNUINavigationListView alloc];
  id v4 = -[CNUINavigationListView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [(CNUINavigationListView *)v4 setDataSource:self];
  [(CNUINavigationListView *)v4 setDelegate:self];
  [(CNUINavigationListView *)v4 setNavigationListViewDataSource:self];
  [(CNUINavigationListView *)v4 setNavigationListViewDelegate:self];
  [(CNUINavigationListView *)v4 setSeparatorStyle:1];
  [(CNUINavigationListViewController *)self setView:v4];
  [(CNUINavigationListViewController *)self setNavigationListView:v4];
}

- (void)styleUpdated
{
  char v3 = [CNUINavigationListViewCellHeightEstimator alloc];
  id v4 = [(CNUINavigationListViewController *)self navigationListStyle];
  double v5 = [(CNUINavigationListViewCellHeightEstimator *)v3 initWithNavigationListStyle:v4];
  [(CNUINavigationListViewController *)self setCellHeightEstimator:v5];

  [(CNUINavigationListViewController *)self reloadNavigationListView];
}

- (void)setNavigationListStyle:(id)a3
{
  objc_storeStrong((id *)&self->_navigationListStyle, a3);

  [(CNUINavigationListViewController *)self styleUpdated];
}

- (CNUINavigationListViewController)init
{
  v10.receiver = self;
  v10.super_class = (Class)CNUINavigationListViewController;
  v2 = [(CNUINavigationListViewController *)&v10 initWithNibName:0 bundle:0];
  char v3 = v2;
  if (v2)
  {
    v2->_contentAlignment = 0;
    uint64_t v4 = +[CNUINavigationListStyleProvider defaultStyle];
    navigationListStyle = v3->_navigationListStyle;
    v3->_navigationListStyle = (CNUINavigationListStyle *)v4;

    double v6 = [[CNUINavigationListViewCellHeightEstimator alloc] initWithNavigationListStyle:v3->_navigationListStyle];
    cellHeightEstimator = v3->_cellHeightEstimator;
    v3->_cellHeightEstimator = v6;

    double v8 = v3;
  }

  return v3;
}

+ (BOOL)itemRequiresDetailCell:(id)a3
{
  id v3 = a3;
  uint64_t v4 = *MEMORY[0x1E4F5A298];
  double v5 = [v3 subtitle];
  if ((*(uint64_t (**)(uint64_t, void *))(v4 + 16))(v4, v5))
  {
    BOOL v6 = 0;
  }
  else
  {
    double v7 = [v3 items];
    BOOL v6 = [v7 count] == 0;
  }
  return v6;
}

@end