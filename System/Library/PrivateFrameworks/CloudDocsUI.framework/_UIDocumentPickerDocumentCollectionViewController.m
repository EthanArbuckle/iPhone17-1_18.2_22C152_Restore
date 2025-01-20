@interface _UIDocumentPickerDocumentCollectionViewController
- (BOOL)_smallCells;
- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4;
- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4;
- (BOOL)monitoring;
- (BOOL)shouldHideSortBar;
- (BOOL)supportsActions;
- (BOOL)updatesMayAnimate;
- (NSArray)actions;
- (NSArray)indexPathsForSelectedItems;
- (NSArray)modelObjects;
- (UIActivityIndicatorView)initialActivityView;
- (UIView)pinnedHeaderView;
- (_UIDocumentPickerContainerModel)model;
- (_UIDocumentPickerDocumentCollectionViewController)initWithModel:(id)a3;
- (_UIDocumentPickerFlowLayout)gridLayout;
- (_UIDocumentPickerServiceViewController)serviceViewController;
- (_UIDocumentPickerSortOrderView)sortView;
- (_UIDocumentPickerTableLayout)tableLayout;
- (id)actionViewForLocation:(CGPoint)a3;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)collectionView:(id)a3 tableLayout:(id)a4 trailingSwipeActionsForRowAtIndexPath:(id)a5;
- (id)itemForLocation:(CGPoint)a3;
- (id)previewActionItemsForItem:(id)a3;
- (id)previewingContext:(id)a3 viewControllerForLocation:(CGPoint)a4;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)collectionView:(id)a3 tableLayout:(id)a4 editingStyleForRowAtIndexPath:(id)a5;
- (int64_t)collectionView:(id)a3 tableLayout:(id)a4 indentationLevelForRowAtIndexPath:(id)a5;
- (int64_t)displayMode;
- (void)_dynamicTypeSizeChanged:(id)a3;
- (void)_showMoreOptionsForRow:(id)a3 view:(id)a4;
- (void)_unlockAnimations;
- (void)_updateIconSpacing;
- (void)_updateRowHeight;
- (void)collectionView:(id)a3 didDeselectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)collectionView:(id)a3 didHighlightItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 didUnhighlightItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 tableLayout:(id)a4 accessoryButtonTappedForRowWithIndexPath:(id)a5;
- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)containersChangedWithSnapshot:(id)a3 differences:(id)a4;
- (void)dealloc;
- (void)ensureSortViewInvisible;
- (void)modelChanged:(id)a3;
- (void)performAction:(int64_t)a3 forRow:(id)a4 view:(id)a5;
- (void)presentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)previewingContext:(id)a3 commitViewController:(id)a4;
- (void)scrollSortViewToVisible;
- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5;
- (void)setActions:(id)a3;
- (void)setContentSizeAdjustment:(double)a3;
- (void)setDisplayMode:(int64_t)a3;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)setGridLayout:(id)a3;
- (void)setIndexPathsForSelectedItems:(id)a3;
- (void)setInitialActivityView:(id)a3;
- (void)setModel:(id)a3;
- (void)setModelObjects:(id)a3;
- (void)setMonitoring:(BOOL)a3;
- (void)setPinnedHeaderView:(id)a3;
- (void)setPinnedHeaderView:(id)a3 animated:(BOOL)a4;
- (void)setServiceViewController:(id)a3;
- (void)setShouldHideSortBar:(BOOL)a3;
- (void)setSortView:(id)a3;
- (void)setTableLayout:(id)a3;
- (void)setUpdatesMayAnimate:(BOOL)a3;
- (void)updateContentInset;
- (void)updatePinnedHeader;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
- (void)willDismissSearchController:(id)a3;
- (void)willMoveToParentViewController:(id)a3;
- (void)willPresentSearchController:(id)a3;
@end

@implementation _UIDocumentPickerDocumentCollectionViewController

- (_UIDocumentPickerDocumentCollectionViewController)initWithModel:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(_UIDocumentPickerFlowLayout);
  +[_UIDocumentPickerCell defaultSizeForCellStyle:1 traitCollection:0];
  -[UICollectionViewFlowLayout setItemSize:](v5, "setItemSize:");
  -[UICollectionViewFlowLayout setSectionInset:](v5, "setSectionInset:", 25.0, 0.0, 25.0, 0.0);
  [(UICollectionViewFlowLayout *)v5 setMinimumInteritemSpacing:0.0];
  [(UICollectionViewFlowLayout *)v5 setMinimumLineSpacing:23.0];
  v6 = objc_alloc_init(_UIDocumentPickerTableLayout);
  [(UICollectionViewTableLayout *)v6 setCellLayoutMarginsFollowReadableWidth:0];
  v40.receiver = self;
  v40.super_class = (Class)_UIDocumentPickerDocumentCollectionViewController;
  v7 = [(_UIDocumentPickerDocumentCollectionViewController *)&v40 initWithCollectionViewLayout:v5];
  v8 = v7;
  if (v7)
  {
    [(_UIDocumentPickerDocumentCollectionViewController *)v7 setGridLayout:v5];
    [(_UIDocumentPickerDocumentCollectionViewController *)v8 setTableLayout:v6];
    [(_UIDocumentPickerDocumentCollectionViewController *)v8 _updateRowHeight];
    [(_UIDocumentPickerDocumentCollectionViewController *)v8 setModel:v4];
    v9 = [_UIDocumentPickerDocumentCollectionView alloc];
    uint64_t v10 = [(_UIDocumentPickerDocumentCollectionViewController *)v8 collectionView];
    [(id)v10 frame];
    v11 = -[_UIDocumentPickerDocumentCollectionView initWithFrame:collectionViewLayout:](v9, "initWithFrame:collectionViewLayout:", v5);
    [(_UIDocumentPickerDocumentCollectionViewController *)v8 setCollectionView:v11];

    v12 = [(_UIDocumentPickerDocumentCollectionViewController *)v8 collectionView];
    [v12 setDataSource:v8];

    v13 = [(_UIDocumentPickerDocumentCollectionViewController *)v8 collectionView];
    [v13 setDelegate:v8];

    v14 = [(_UIDocumentPickerDocumentCollectionViewController *)v8 collectionView];
    [v14 setPrefetchingEnabled:0];

    v15 = [(_UIDocumentPickerDocumentCollectionViewController *)v8 collectionView];
    [v15 setAlwaysBounceVertical:1];

    v16 = [(_UIDocumentPickerDocumentCollectionViewController *)v8 collectionView];
    [v16 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"_UIDocumentPickerDocumentCellIdentifier"];

    v17 = [(_UIDocumentPickerDocumentCollectionViewController *)v8 collectionView];
    [v17 setAllowsMultipleSelectionDuringEditing:1];

    v18 = [(_UIDocumentPickerDocumentCollectionViewController *)v8 model];
    LOBYTE(v10) = [v18 afterInitialUpdate];

    if ((v10 & 1) == 0)
    {
      v19 = (void *)[objc_alloc(MEMORY[0x263F1C3D8]) initWithActivityIndicatorStyle:100];
      [(_UIDocumentPickerDocumentCollectionViewController *)v8 setInitialActivityView:v19];

      v20 = [(_UIDocumentPickerDocumentCollectionViewController *)v8 initialActivityView];
      [v20 setTranslatesAutoresizingMaskIntoConstraints:0];

      v21 = [(_UIDocumentPickerDocumentCollectionViewController *)v8 view];
      v22 = [(_UIDocumentPickerDocumentCollectionViewController *)v8 initialActivityView];
      [v21 addSubview:v22];

      v23 = [(_UIDocumentPickerDocumentCollectionViewController *)v8 initialActivityView];
      v24 = [v23 centerXAnchor];
      v25 = [(_UIDocumentPickerDocumentCollectionViewController *)v8 view];
      v26 = [v25 centerXAnchor];
      v27 = [v24 constraintEqualToAnchor:v26];
      [v27 setActive:1];

      v28 = [(_UIDocumentPickerDocumentCollectionViewController *)v8 initialActivityView];
      v29 = [v28 centerYAnchor];
      v30 = [(_UIDocumentPickerDocumentCollectionViewController *)v8 view];
      v31 = [v30 centerYAnchor];
      v32 = [v29 constraintEqualToAnchor:v31];
      [v32 setActive:1];

      v33 = [(_UIDocumentPickerDocumentCollectionViewController *)v8 initialActivityView];
      [v33 startAnimating];
    }
    v34 = [MEMORY[0x263F08A00] defaultCenter];
    [v34 addObserver:v8 selector:sel__dynamicTypeSizeChanged_ name:*MEMORY[0x263F1D158] object:0];

    id v35 = (id)[MEMORY[0x263EFFA20] scheduledTimerWithTimeInterval:v8 target:sel__unlockAnimations selector:0 userInfo:0 repeats:0.5];
    v36 = [(_UIDocumentPickerDocumentCollectionViewController *)v8 collectionView];
    uint64_t v37 = [(_UIDocumentPickerDocumentCollectionViewController *)v8 registerForPreviewingWithDelegate:v8 sourceView:v36];
    viewControllerPreviewContext = v8->_viewControllerPreviewContext;
    v8->_viewControllerPreviewContext = (UIViewControllerPreviewing *)v37;
  }
  return v8;
}

- (id)itemForLocation:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  v6 = [(_UIDocumentPickerDocumentCollectionViewController *)self collectionView];
  v7 = [(_UIDocumentPickerDocumentCollectionViewController *)self collectionView];
  v8 = objc_msgSend(v7, "indexPathForItemAtPoint:", x, y);
  v9 = [v6 cellForItemAtIndexPath:v8];

  uint64_t v10 = [v9 item];

  return v10;
}

- (id)actionViewForLocation:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  v6 = [(_UIDocumentPickerDocumentCollectionViewController *)self collectionView];
  v7 = [(_UIDocumentPickerDocumentCollectionViewController *)self collectionView];
  v8 = objc_msgSend(v7, "indexPathForItemAtPoint:", x, y);
  v9 = [v6 cellForItemAtIndexPath:v8];

  return v9;
}

- (void)_unlockAnimations
{
}

- (void)_updateIconSpacing
{
  id v31 = [(_UIDocumentPickerDocumentCollectionViewController *)self gridLayout];
  v3 = [(_UIDocumentPickerDocumentCollectionViewController *)self traitCollection];
  +[_UIDocumentPickerCell defaultSizeForCellStyle:1 traitCollection:v3];
  double v5 = v4;
  uint64_t v29 = v6;

  v7 = [(_UIDocumentPickerDocumentCollectionViewController *)self collectionView];
  [v7 frame];
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;

  v33.origin.double x = v9;
  v33.origin.double y = v11;
  v33.size.width = v13;
  v33.size.height = v15;
  double Width = CGRectGetWidth(v33);
  v17 = [(_UIDocumentPickerDocumentCollectionViewController *)self traitCollection];
  v18 = [v17 _valueForTraitNamed:@"TightMargins"];
  char v19 = [v18 BOOLValue];

  double v20 = 2.0;
  double v21 = 2.0;
  if ((v19 & 1) == 0)
  {
    v22 = [(_UIDocumentPickerDocumentCollectionViewController *)self traitCollection];
    v23 = [v22 _valueForTraitNamed:@"CompactIcons"];
    int v24 = [v23 BOOLValue];

    if (v24) {
      double v21 = 15.0;
    }
    else {
      double v21 = 25.0;
    }
    if (v24) {
      double v20 = 15.5;
    }
    else {
      double v20 = 25.0;
    }
  }
  double v25 = Width / (v5 * 1.35);
  if ((unint64_t)v25 <= 3) {
    unint64_t v26 = 3;
  }
  else {
    unint64_t v26 = (unint64_t)v25;
  }
  objc_msgSend(v31, "setMinimumLineSpacing:", 23.0, v29);
  v34.origin.double x = v9;
  v34.origin.double y = v11;
  v34.size.width = v13;
  v34.size.height = v15;
  CGFloat v27 = (CGRectGetWidth(v34) - (double)v26 * v5) / (double)(v26 + 1);
  double v28 = floor(v27 * 0.5);
  objc_msgSend(v31, "setSectionInset:", v20, v28, v21, v28);
  objc_msgSend(v31, "setItemSize:", v5 + v27, v30);
}

- (BOOL)_smallCells
{
  return [(_UIDocumentPickerDocumentCollectionViewController *)self displayMode] == 3;
}

- (void)_updateRowHeight
{
  v3 = [(_UIDocumentPickerDocumentCollectionViewController *)self tableLayout];
  uint64_t v4 = [v3 cellStyle];
  double v5 = [(_UIDocumentPickerDocumentCollectionViewController *)self traitCollection];
  +[_UIDocumentPickerCell defaultSizeForCellStyle:v4 traitCollection:v5];

  id v9 = [(_UIDocumentPickerDocumentCollectionViewController *)self collectionView];
  UIRoundToViewScale();
  double v7 = v6;
  double v8 = [(_UIDocumentPickerDocumentCollectionViewController *)self tableLayout];
  [v8 setRowHeight:v7];
}

- (void)_dynamicTypeSizeChanged:(id)a3
{
  uint64_t v4 = [(_UIDocumentPickerDocumentCollectionViewController *)self traitCollection];
  [(_UIDocumentPickerDocumentCollectionViewController *)self traitCollectionDidChange:v4];

  [(_UIDocumentPickerDocumentCollectionViewController *)self _updateIconSpacing];
  [(_UIDocumentPickerDocumentCollectionViewController *)self _updateRowHeight];
  id v5 = [(_UIDocumentPickerDocumentCollectionViewController *)self collectionView];
  [v5 reloadData];
}

- (void)dealloc
{
  [(_UIDocumentPickerDocumentCollectionViewController *)self setMonitoring:0];
  v3.receiver = self;
  v3.super_class = (Class)_UIDocumentPickerDocumentCollectionViewController;
  [(_UIDocumentPickerDocumentCollectionViewController *)&v3 dealloc];
}

- (void)containersChangedWithSnapshot:(id)a3 differences:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = [(_UIDocumentPickerDocumentCollectionViewController *)self initialActivityView];
  [v8 stopAnimating];

  if ([v7 count])
  {
    id v9 = [v7 objectForKey:*MEMORY[0x263F1D858]];
    if ([v9 count])
    {
      BOOL v10 = 0;
    }
    else
    {
      CGFloat v11 = [v7 objectForKey:*MEMORY[0x263F1D850]];
      if ([v11 count])
      {
        BOOL v10 = 0;
      }
      else
      {
        double v12 = [v7 objectForKey:*MEMORY[0x263F1D868]];
        BOOL v10 = [v12 count] == 0;
      }
    }
  }
  else
  {
    BOOL v10 = 0;
  }
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __95___UIDocumentPickerDocumentCollectionViewController_containersChangedWithSnapshot_differences___block_invoke;
  v21[3] = &unk_26492CCC8;
  id v13 = v7;
  id v22 = v13;
  v23 = self;
  double v14 = (void (**)(void))MEMORY[0x230F72310](v21);
  if (v10)
  {
    [(_UIDocumentPickerDocumentCollectionViewController *)self setModelObjects:v6];
    v14[2](v14);
  }
  else if ([v13 count] && self->_updatesMayAnimate)
  {
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __95___UIDocumentPickerDocumentCollectionViewController_containersChangedWithSnapshot_differences___block_invoke_2;
    v18[3] = &unk_26492CFE8;
    v18[4] = self;
    id v19 = v6;
    id v20 = v13;
    CGFloat v15 = (void *)MEMORY[0x230F72310](v18);
    v16 = [(_UIDocumentPickerDocumentCollectionViewController *)self collectionView];
    [v16 performBatchUpdates:v15 completion:0];

    v14[2](v14);
  }
  else
  {
    [(_UIDocumentPickerDocumentCollectionViewController *)self setModelObjects:v6];
    v17 = [(_UIDocumentPickerDocumentCollectionViewController *)self collectionView];
    [v17 reloadData];
  }
}

- (void)willMoveToParentViewController:(id)a3
{
  [(_UIDocumentPickerDocumentCollectionViewController *)self setMonitoring:a3 != 0];
  uint64_t v4 = [(_UIDocumentPickerDocumentCollectionViewController *)self model];
  id v5 = [v4 modelObjects];
  [(_UIDocumentPickerDocumentCollectionViewController *)self setModelObjects:v5];

  id v6 = [(_UIDocumentPickerDocumentCollectionViewController *)self collectionView];
  [v6 reloadData];
}

- (void)setMonitoring:(BOOL)a3
{
  if (self->_monitoring != a3)
  {
    BOOL v3 = a3;
    id v5 = [MEMORY[0x263F08A00] defaultCenter];
    id v6 = v5;
    if (v3)
    {
      [v5 addObserver:self selector:sel_modelChanged_ name:@"_UIDocumentPickerModelUpdatedNotification" object:self->_model];

      id v6 = [(_UIDocumentPickerDocumentCollectionViewController *)self model];
      [v6 startMonitoringChanges];
    }
    else
    {
      [v5 removeObserver:self name:@"_UIDocumentPickerModelUpdatedNotification" object:self->_model];
    }

    self->_monitoring = v3;
  }
}

- (void)modelChanged:(id)a3
{
  id v4 = a3;
  id v5 = [v4 userInfo];
  id v14 = [v5 objectForKey:@"model"];

  id v6 = [v4 userInfo];

  id v7 = [v6 objectForKey:@"changes"];

  [(_UIDocumentPickerDocumentCollectionViewController *)self containersChangedWithSnapshot:v14 differences:v7];
  if ([v7 count])
  {
    double v8 = [v7 objectForKey:*MEMORY[0x263F1D850]];
    if ([v8 count])
    {
      BOOL v9 = 1;
    }
    else
    {
      BOOL v10 = [v7 objectForKey:*MEMORY[0x263F1D858]];
      BOOL v9 = [v10 count] != 0;
    }
  }
  else
  {
    BOOL v9 = 1;
  }
  CGFloat v11 = [(_UIDocumentPickerDocumentCollectionViewController *)self serviceViewController];
  char v12 = objc_opt_respondsToSelector();

  if (v12)
  {
    id v13 = [(_UIDocumentPickerDocumentCollectionViewController *)self serviceViewController];
    [v13 itemsOrSelectionDidChange:v9];
  }
}

- (void)viewWillLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)_UIDocumentPickerDocumentCollectionViewController;
  [(_UIDocumentPickerDocumentCollectionViewController *)&v3 viewWillLayoutSubviews];
  [(_UIDocumentPickerDocumentCollectionViewController *)self _updateIconSpacing];
}

- (void)setDisplayMode:(int64_t)a3
{
  if (self->_displayMode == a3) {
    return;
  }
  self->_displayMode = a3;
  if (a3 == 1)
  {
    id v7 = [(_UIDocumentPickerDocumentCollectionViewController *)self gridLayout];
    [v7 setCellStyle:1];
    [(_UIDocumentPickerDocumentCollectionViewController *)self _updateIconSpacing];
  }
  else
  {
    if (a3 == 3)
    {
      id v4 = [(_UIDocumentPickerDocumentCollectionViewController *)self tableLayout];
      id v7 = v4;
      uint64_t v5 = 3;
    }
    else
    {
      if (a3 != 2)
      {
        id v7 = 0;
        goto LABEL_10;
      }
      id v4 = [(_UIDocumentPickerDocumentCollectionViewController *)self tableLayout];
      id v7 = v4;
      uint64_t v5 = 2;
    }
    [v4 setCellStyle:v5];
    [(_UIDocumentPickerDocumentCollectionViewController *)self _updateRowHeight];
  }
LABEL_10:
  id v6 = [(_UIDocumentPickerDocumentCollectionViewController *)self collectionView];
  [v6 setCollectionViewLayout:v7 animated:1];
}

- (void)setContentSizeAdjustment:(double)a3
{
  uint64_t v5 = [(_UIDocumentPickerDocumentCollectionViewController *)self collectionView];
  [v5 setContentSizeAdjustment:a3];

  id v6 = [(_UIDocumentPickerDocumentCollectionViewController *)self collectionViewLayout];
  [v6 setContentSizeAdjustment:a3];
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  id v4 = [(_UIDocumentPickerDocumentCollectionViewController *)self modelObjects];
  int64_t v5 = [v4 count];

  return v5;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = [a3 dequeueReusableCellWithReuseIdentifier:@"_UIDocumentPickerDocumentCellIdentifier" forIndexPath:v6];
  double v8 = [(_UIDocumentPickerDocumentCollectionViewController *)self actions];

  if (!v8)
  {
    BOOL v9 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:7];
    BOOL v10 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.CloudDocsUI"];
    CGRect v34 = [v10 localizedStringForKey:@"Delete..." value:@"Delete…" table:@"Localizable"];

    CGFloat v11 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.CloudDocsUI"];
    id v35 = [v11 localizedStringForKey:@"Rename..." value:@"Rename…" table:@"Localizable"];

    char v12 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.CloudDocsUI"];
    v36 = [v12 localizedStringForKey:@"Share..." value:@"Share…" table:@"Localizable"];

    id v13 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.CloudDocsUI"];
    id v31 = [v13 localizedStringForKey:@"Move..." value:@"Move…" table:@"Localizable"];

    id v14 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.CloudDocsUI"];
    v32 = [v14 localizedStringForKey:@"Info" value:@"Info" table:@"Localizable"];

    CGFloat v15 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.CloudDocsUI"];
    CGRect v33 = [v15 localizedStringForKey:@"More..." value:@"More…" table:@"Localizable"];

    v16 = (void *)[objc_alloc(MEMORY[0x263F1C7B8]) initWithTitle:v34 action:sel__deleteAction_];
    [v9 addObject:v16];

    v17 = (void *)[objc_alloc(MEMORY[0x263F1C7B8]) initWithTitle:v35 action:sel__renameAction_];
    [v9 addObject:v17];

    v18 = (void *)[objc_alloc(MEMORY[0x263F1C7B8]) initWithTitle:v36 action:sel__activityAction_];
    [v9 addObject:v18];

    id v19 = (void *)[objc_alloc(MEMORY[0x263F1C7B8]) initWithTitle:v31 action:sel__moveAction_];
    [v9 addObject:v19];

    id v20 = (void *)[objc_alloc(MEMORY[0x263F1C7B8]) initWithTitle:v32 action:sel__infoAction_];
    [v9 addObject:v20];

    double v21 = (void *)[objc_alloc(MEMORY[0x263F1C7B8]) initWithTitle:v33 action:sel__moreAction_];
    [v9 addObject:v21];

    id v22 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.CloudDocsUI"];
    v23 = [v22 localizedStringForKey:@"Debug..." value:@"Debug…" table:@"Localizable"];

    int v24 = (void *)[objc_alloc(MEMORY[0x263F1C7B8]) initWithTitle:v23 action:sel__showPickableDiagnostic];
    [v9 addObject:v24];

    [(_UIDocumentPickerDocumentCollectionViewController *)self setActions:v9];
  }
  double v25 = objc_msgSend(v7, "actions", v31);

  if (!v25)
  {
    unint64_t v26 = [(_UIDocumentPickerDocumentCollectionViewController *)self actions];
    [v7 setActions:v26];
  }
  [v7 setCollectionView:self];
  CGFloat v27 = [(_UIDocumentPickerDocumentCollectionViewController *)self modelObjects];
  uint64_t v28 = [v6 row];

  uint64_t v29 = [v27 objectAtIndex:v28];

  [v7 setItem:v29];

  return v7;
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v10 = a4;
  int v6 = [v10 isEditing];
  id v7 = [(_UIDocumentPickerDocumentCollectionViewController *)self collectionView];
  int v8 = [v7 isEditing];

  BOOL v9 = [(_UIDocumentPickerDocumentCollectionViewController *)self collectionView];
  objc_msgSend(v10, "setEditing:", objc_msgSend(v9, "isEditing"));

  if (v6 == v8) {
    [v10 updateForEditingState:0];
  }
}

- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4
{
  id v5 = a4;
  int v6 = [(_UIDocumentPickerDocumentCollectionViewController *)self modelObjects];
  uint64_t v7 = [v5 row];

  int v8 = [v6 objectAtIndex:v7];

  BOOL v9 = [(_UIDocumentPickerDocumentCollectionViewController *)self serviceViewController];
  LOBYTE(v7) = objc_opt_respondsToSelector();

  if (v7)
  {
    id v10 = [(_UIDocumentPickerDocumentCollectionViewController *)self serviceViewController];
    char v11 = [v10 shouldHighlightItem:v8];
  }
  else
  {
    char v11 = 1;
  }

  return v11;
}

- (void)collectionView:(id)a3 didHighlightItemAtIndexPath:(id)a4
{
  id v5 = a4;
  int v6 = [(_UIDocumentPickerDocumentCollectionViewController *)self collectionView];
  id v11 = [v6 cellForItemAtIndexPath:v5];

  uint64_t v7 = [v11 item];
  int v8 = [(_UIDocumentPickerDocumentCollectionViewController *)self serviceViewController];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    id v10 = [(_UIDocumentPickerDocumentCollectionViewController *)self serviceViewController];
    [v10 didHighlightItem:v7];
  }
}

- (void)collectionView:(id)a3 didUnhighlightItemAtIndexPath:(id)a4
{
  id v5 = a4;
  int v6 = [(_UIDocumentPickerDocumentCollectionViewController *)self collectionView];
  id v11 = [v6 cellForItemAtIndexPath:v5];

  uint64_t v7 = [v11 item];
  int v8 = [(_UIDocumentPickerDocumentCollectionViewController *)self serviceViewController];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    id v10 = [(_UIDocumentPickerDocumentCollectionViewController *)self serviceViewController];
    [v10 didUnhighlightItem:v7];
  }
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  id v5 = a4;
  int v6 = [(_UIDocumentPickerDocumentCollectionViewController *)self modelObjects];
  uint64_t v7 = [v5 row];

  int v8 = [v6 objectAtIndex:v7];

  char v9 = [(_UIDocumentPickerDocumentCollectionViewController *)self firstResponder];
  objc_opt_class();
  LOBYTE(v7) = objc_opt_isKindOfClass();

  if (v7)
  {
    id v10 = [(_UIDocumentPickerDocumentCollectionViewController *)self firstResponder];
    [v10 endEditing:0];
  }
  if ([v8 pickable])
  {
    id v11 = [(_UIDocumentPickerDocumentCollectionViewController *)self serviceViewController];
    char v12 = objc_opt_respondsToSelector();

    if (v12)
    {
      id v13 = [(_UIDocumentPickerDocumentCollectionViewController *)self serviceViewController];
      char v14 = [v13 shouldSelectItem:v8];
    }
    else
    {
      char v14 = 1;
    }
  }
  else
  {
    char v14 = 0;
  }

  return v14;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v16 = a3;
  id v6 = a4;
  uint64_t v7 = [(_UIDocumentPickerDocumentCollectionViewController *)self collectionView];
  int v8 = [v7 cellForItemAtIndexPath:v6];

  char v9 = [v8 item];
  int v10 = [(_UIDocumentPickerDocumentCollectionViewController *)self isEditing];
  id v11 = [(_UIDocumentPickerDocumentCollectionViewController *)self serviceViewController];
  char v12 = v11;
  if (v10)
  {
    char v13 = objc_opt_respondsToSelector();

    if (v13)
    {
      char v14 = [(_UIDocumentPickerDocumentCollectionViewController *)self serviceViewController];
      [v14 itemsOrSelectionDidChange:1];
    }
  }
  else
  {
    [v11 didSelectItem:v9];

    [v16 deselectItemAtIndexPath:v6 animated:1];
  }
  CGFloat v15 = [MEMORY[0x263F1C7B0] sharedMenuController];
  [v15 setMenuVisible:0];
}

- (void)collectionView:(id)a3 didDeselectItemAtIndexPath:(id)a4
{
  if ([(_UIDocumentPickerDocumentCollectionViewController *)self isEditing])
  {
    id v5 = [(_UIDocumentPickerDocumentCollectionViewController *)self serviceViewController];
    char v6 = objc_opt_respondsToSelector();

    if (v6)
    {
      id v7 = [(_UIDocumentPickerDocumentCollectionViewController *)self serviceViewController];
      [v7 itemsOrSelectionDidChange:1];
    }
  }
}

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
{
}

- (int64_t)collectionView:(id)a3 tableLayout:(id)a4 editingStyleForRowAtIndexPath:(id)a5
{
  return ([(_UIDocumentPickerDocumentCollectionViewController *)self isEditing] & 1) == 0
      && [(_UIDocumentPickerDocumentCollectionViewController *)self displayMode] != 3;
}

- (BOOL)supportsActions
{
  objc_super v3 = [(_UIDocumentPickerDocumentCollectionViewController *)self serviceViewController];
  if (objc_opt_respondsToSelector())
  {
    id v4 = [(_UIDocumentPickerDocumentCollectionViewController *)self serviceViewController];
    BOOL v5 = (objc_opt_respondsToSelector() & 1) != 0
      && [(_UIDocumentPickerDocumentCollectionViewController *)self displayMode] != 3;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (void)collectionView:(id)a3 tableLayout:(id)a4 accessoryButtonTappedForRowWithIndexPath:(id)a5
{
  id v6 = a5;
  id v7 = [(_UIDocumentPickerDocumentCollectionViewController *)self collectionView];
  id v8 = [v7 cellForItemAtIndexPath:v6];

  [(_UIDocumentPickerDocumentCollectionViewController *)self performAction:2 forRow:v6 view:v8];
}

- (void)performAction:(int64_t)a3 forRow:(id)a4 view:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  int v10 = [(_UIDocumentPickerDocumentCollectionViewController *)self model];
  id v11 = [v10 modelObjects];
  uint64_t v12 = [v9 row];

  char v13 = [v11 objectAtIndex:v12];

  char v14 = [(_UIDocumentPickerDocumentCollectionViewController *)self serviceViewController];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __79___UIDocumentPickerDocumentCollectionViewController_performAction_forRow_view___block_invoke;
  v15[3] = &unk_26492CC78;
  v15[4] = self;
  [v14 performAction:a3 item:v13 view:v8 completion:v15];
}

- (void)_showMoreOptionsForRow:(id)a3 view:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(_UIDocumentPickerDocumentCollectionViewController *)self model];
  id v9 = [v8 modelObjects];
  int v10 = objc_msgSend(v9, "objectAtIndex:", objc_msgSend(v6, "row"));

  id v11 = [MEMORY[0x263F1C3F8] alertControllerWithTitle:0 message:0 preferredStyle:0];
  uint64_t v12 = [v11 popoverPresentationController];
  [v12 setSourceView:v7];

  [v7 bounds];
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  double v21 = [v11 popoverPresentationController];
  objc_msgSend(v21, "setSourceRect:", v14, v16, v18, v20);

  int v22 = [v10 isActionApplicableForItem:3];
  int v23 = [v10 isActionApplicableForItem:4];
  int v24 = [v10 isActionApplicableForItem:5];
  double v25 = &off_22CA7A000;
  if (v22)
  {
    unint64_t v26 = [(_UIDocumentPickerDocumentCollectionViewController *)self serviceViewController];
    int v27 = [v26 shouldShowAction:3];

    if (v27)
    {
      uint64_t v28 = (void *)MEMORY[0x263F1C3F0];
      uint64_t v29 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.CloudDocsUI"];
      double v30 = [v29 localizedStringForKey:@"Rename..." value:@"Rename…" table:@"Localizable"];
      v55[0] = MEMORY[0x263EF8330];
      v55[1] = 3221225472;
      v55[2] = __81___UIDocumentPickerDocumentCollectionViewController__showMoreOptionsForRow_view___block_invoke;
      v55[3] = &unk_26492D500;
      v55[4] = self;
      id v56 = v6;
      id v57 = v7;
      id v31 = [v28 actionWithTitle:v30 style:0 handler:v55];
      [v11 addAction:v31];

      double v25 = &off_22CA7A000;
    }
  }
  if (v23)
  {
    v32 = [(_UIDocumentPickerDocumentCollectionViewController *)self serviceViewController];
    int v33 = [v32 shouldShowAction:4];

    if (v33)
    {
      CGRect v34 = (void *)MEMORY[0x263F1C3F0];
      id v35 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.CloudDocsUI"];
      v36 = [v35 localizedStringForKey:@"Share..." value:@"Share…" table:@"Localizable"];
      v52[0] = MEMORY[0x263EF8330];
      v52[1] = *((void *)v25 + 72);
      v52[2] = __81___UIDocumentPickerDocumentCollectionViewController__showMoreOptionsForRow_view___block_invoke_2;
      v52[3] = &unk_26492D500;
      v52[4] = self;
      id v53 = v6;
      id v54 = v7;
      uint64_t v37 = [v34 actionWithTitle:v36 style:0 handler:v52];
      [v11 addAction:v37];
    }
  }
  if (v24)
  {
    v38 = [(_UIDocumentPickerDocumentCollectionViewController *)self serviceViewController];
    int v39 = [v38 shouldShowAction:5];

    if (v39)
    {
      objc_super v40 = (void *)MEMORY[0x263F1C3F0];
      v41 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.CloudDocsUI"];
      v42 = [v41 localizedStringForKey:@"Move..." value:@"Move…" table:@"Localizable"];
      v49[0] = MEMORY[0x263EF8330];
      v49[1] = *((void *)v25 + 72);
      v49[2] = __81___UIDocumentPickerDocumentCollectionViewController__showMoreOptionsForRow_view___block_invoke_3;
      v49[3] = &unk_26492D500;
      v49[4] = self;
      id v50 = v6;
      id v51 = v7;
      v43 = [v40 actionWithTitle:v42 style:0 handler:v49];
      [v11 addAction:v43];
    }
  }
  v44 = (void *)MEMORY[0x263F1C3F0];
  v45 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.CloudDocsUI"];
  v46 = [v45 localizedStringForKey:@"Cancel" value:@"Cancel" table:@"Localizable"];
  v48[0] = MEMORY[0x263EF8330];
  v48[1] = *((void *)v25 + 72);
  v48[2] = __81___UIDocumentPickerDocumentCollectionViewController__showMoreOptionsForRow_view___block_invoke_4;
  v48[3] = &unk_26492D528;
  v48[4] = self;
  v47 = [v44 actionWithTitle:v46 style:1 handler:v48];
  [v11 addAction:v47];

  [(_UIDocumentPickerDocumentCollectionViewController *)self presentViewController:v11 animated:1 completion:0];
}

- (id)collectionView:(id)a3 tableLayout:(id)a4 trailingSwipeActionsForRowAtIndexPath:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (![(_UIDocumentPickerDocumentCollectionViewController *)self supportsActions])
  {
    double v15 = 0;
    goto LABEL_18;
  }
  id v11 = [(_UIDocumentPickerDocumentCollectionViewController *)self model];
  uint64_t v12 = [v11 modelObjects];
  double v13 = objc_msgSend(v12, "objectAtIndex:", objc_msgSend(v10, "row"));

  v45[0] = 0;
  v45[1] = v45;
  v45[2] = 0x3032000000;
  v45[3] = __Block_byref_object_copy__2;
  v45[4] = __Block_byref_object_dispose__2;
  double v14 = self;
  v46 = v14;
  double v15 = [MEMORY[0x263EFF980] array];
  double v16 = [(_UIDocumentPickerDocumentCollectionViewController *)v14 serviceViewController];
  if ([v16 shouldShowAction:1])
  {
    int v17 = [v13 isActionApplicableForItem:1];

    if (v17)
    {
      double v18 = (void *)MEMORY[0x263F1C538];
      double v19 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.CloudDocsUI"];
      double v20 = [v19 localizedStringForKey:@"More" value:@"More" table:@"Localizable"];
      double v21 = v44;
      v44[0] = MEMORY[0x263EF8330];
      v44[1] = 3221225472;
      v44[2] = __118___UIDocumentPickerDocumentCollectionViewController_collectionView_tableLayout_trailingSwipeActionsForRowAtIndexPath___block_invoke;
      v44[3] = &unk_26492D550;
      v44[5] = v45;
      v44[4] = v10;
      int v22 = [v18 actionWithStyle:0 title:v20 handler:v44];

      [v22 setResetsSwipedRow:0];
      [v15 addObject:v22];
LABEL_12:

      goto LABEL_13;
    }
  }
  else
  {
  }
  int v23 = [v13 isActionApplicableForItem:3];
  int v24 = [v13 isActionApplicableForItem:4];
  char v25 = [v13 isActionApplicableForItem:5];
  unint64_t v26 = [(_UIDocumentPickerDocumentCollectionViewController *)v14 serviceViewController];
  if ([v26 shouldShowAction:3] & v23) {
    goto LABEL_10;
  }
  int v27 = [(_UIDocumentPickerDocumentCollectionViewController *)v14 serviceViewController];
  if (([v27 shouldShowAction:4] & v24) == 1)
  {

LABEL_10:
LABEL_11:
    uint64_t v28 = (void *)MEMORY[0x263F1C538];
    uint64_t v29 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.CloudDocsUI"];
    double v30 = [v29 localizedStringForKey:@"More" value:@"More" table:@"Localizable"];
    double v21 = v43;
    v43[0] = MEMORY[0x263EF8330];
    v43[1] = 3221225472;
    v43[2] = __118___UIDocumentPickerDocumentCollectionViewController_collectionView_tableLayout_trailingSwipeActionsForRowAtIndexPath___block_invoke_2;
    v43[3] = &unk_26492D550;
    v43[5] = v45;
    v43[4] = v10;
    int v22 = [v28 actionWithStyle:0 title:v30 handler:v43];

    [v22 setResetsSwipedRow:0];
    [v15 addObject:v22];
    goto LABEL_12;
  }
  v38 = [(_UIDocumentPickerDocumentCollectionViewController *)v14 serviceViewController];
  char v39 = [v38 shouldShowAction:5] & v25;

  if (v39) {
    goto LABEL_11;
  }
LABEL_13:
  id v31 = [(_UIDocumentPickerDocumentCollectionViewController *)v14 serviceViewController];
  if (![v31 shouldShowAction:0])
  {
LABEL_16:

    goto LABEL_17;
  }
  int v32 = [v13 isActionApplicableForItem:0];

  if (v32)
  {
    int v33 = (void *)MEMORY[0x263F1C538];
    CGRect v34 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.CloudDocsUI"];
    id v35 = [v34 localizedStringForKey:@"Delete" value:@"Delete" table:@"Localizable"];
    v40[0] = MEMORY[0x263EF8330];
    v40[1] = 3221225472;
    v40[2] = __118___UIDocumentPickerDocumentCollectionViewController_collectionView_tableLayout_trailingSwipeActionsForRowAtIndexPath___block_invoke_3;
    v40[3] = &unk_26492D550;
    v42 = v45;
    id v41 = v10;
    v36 = [v33 actionWithStyle:1 title:v35 handler:v40];

    [v36 setResetsSwipedRow:0];
    [v15 addObject:v36];

    id v31 = v41;
    goto LABEL_16;
  }
LABEL_17:
  _Block_object_dispose(v45, 8);

LABEL_18:

  return v15;
}

- (int64_t)collectionView:(id)a3 tableLayout:(id)a4 indentationLevelForRowAtIndexPath:(id)a5
{
  id v7 = a5;
  if ([a4 cellStyle] == 3)
  {
    id v8 = [(_UIDocumentPickerDocumentCollectionViewController *)self model];
    id v9 = [v8 modelObjects];
    id v10 = objc_msgSend(v9, "objectAtIndex:", objc_msgSend(v7, "row"));

    int64_t v11 = [v10 indentationLevel];
  }
  else
  {
    int64_t v11 = 0;
  }

  return v11;
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  if ([(_UIDocumentPickerDocumentCollectionViewController *)self isEditing] != a3)
  {
    id v7 = [(_UIDocumentPickerDocumentCollectionViewController *)self firstResponder];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      id v9 = [(_UIDocumentPickerDocumentCollectionViewController *)self firstResponder];
      [v9 endEditing:0];
    }
    v10.receiver = self;
    v10.super_class = (Class)_UIDocumentPickerDocumentCollectionViewController;
    [(_UIDocumentPickerDocumentCollectionViewController *)&v10 setEditing:v5 animated:v4];
  }
}

- (NSArray)indexPathsForSelectedItems
{
  v2 = [(_UIDocumentPickerDocumentCollectionViewController *)self collectionView];
  objc_super v3 = [v2 indexPathsForSelectedItems];

  return (NSArray *)v3;
}

- (void)setIndexPathsForSelectedItems:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v11 + 1) + 8 * v8);
        objc_super v10 = [(_UIDocumentPickerDocumentCollectionViewController *)self collectionView];
        [v10 selectItemAtIndexPath:v9 animated:0 scrollPosition:0];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
}

- (void)setSortView:(id)a3
{
  v23[3] = *MEMORY[0x263EF8340];
  uint64_t v5 = (_UIDocumentPickerSortOrderView *)a3;
  sortView = self->_sortView;
  if (sortView != v5)
  {
    [(_UIDocumentPickerSortOrderView *)sortView removeFromSuperview];
    objc_storeStrong((id *)&self->_sortView, a3);
    [(_UIDocumentPickerDocumentCollectionViewController *)self updateContentInset];
    if (v5)
    {
      uint64_t v7 = [(_UIDocumentPickerDocumentCollectionViewController *)self scrollView];
      [v7 addSubview:v5];

      [(_UIDocumentPickerSortOrderView *)v5 setTranslatesAutoresizingMaskIntoConstraints:0];
      int v17 = (void *)MEMORY[0x263F08938];
      int v22 = [(_UIDocumentPickerDocumentCollectionViewController *)self scrollView];
      double v21 = [v22 widthAnchor];
      double v20 = [(_UIDocumentPickerSortOrderView *)v5 widthAnchor];
      double v19 = [v21 constraintEqualToAnchor:v20];
      v23[0] = v19;
      double v18 = [(_UIDocumentPickerDocumentCollectionViewController *)self scrollView];
      uint64_t v8 = [v18 leftAnchor];
      uint64_t v9 = [(_UIDocumentPickerSortOrderView *)v5 leftAnchor];
      objc_super v10 = [v8 constraintEqualToAnchor:v9];
      v23[1] = v10;
      long long v11 = [(_UIDocumentPickerDocumentCollectionViewController *)self scrollView];
      long long v12 = [v11 topAnchor];
      long long v13 = [(_UIDocumentPickerSortOrderView *)v5 topAnchor];
      [(_UIDocumentPickerSortOrderView *)self->_sortView frame];
      double v15 = [v12 constraintEqualToAnchor:v13 constant:v14];
      v23[2] = v15;
      uint64_t v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:3];
      [v17 activateConstraints:v16];

      [(_UIDocumentPickerDocumentCollectionViewController *)self setShouldHideSortBar:1];
      [(_UIDocumentPickerSortOrderView *)v5 setListMode:[(_UIDocumentPickerDocumentCollectionViewController *)self displayMode]];
    }
  }
}

- (void)updateContentInset
{
  sortView = self->_sortView;
  if (sortView)
  {
    [(_UIDocumentPickerSortOrderView *)sortView bounds];
    double v5 = v4 + 0.0;
  }
  else
  {
    double v5 = 0.0;
  }
  pinnedHeaderView = self->_pinnedHeaderView;
  if (pinnedHeaderView)
  {
    [(UIView *)pinnedHeaderView bounds];
    double v8 = v7;
    double v5 = v5 + v7;
    [(_UIDocumentPickerDocumentCollectionViewController *)self setContentSizeAdjustment:-v7];
    uint64_t v9 = [(_UIDocumentPickerDocumentCollectionViewController *)self scrollView];
    objc_msgSend(v9, "setScrollIndicatorInsets:", v8, 0.0, 0.0, 0.0);
  }
  id v10 = [(_UIDocumentPickerDocumentCollectionViewController *)self scrollView];
  objc_msgSend(v10, "setContentInset:", v5, 0.0, 0.0, 0.0);
}

- (void)presentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v10 = [(_UIDocumentPickerDocumentCollectionViewController *)self navigationController];
    [v10 presentViewController:v8 animated:v6 completion:v9];
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)_UIDocumentPickerDocumentCollectionViewController;
    [(_UIDocumentPickerDocumentCollectionViewController *)&v11 presentViewController:v8 animated:v6 completion:v9];
  }
}

- (void)willPresentSearchController:(id)a3
{
  id v3 = [(_UIDocumentPickerDocumentCollectionViewController *)self scrollView];
  objc_msgSend(v3, "setContentInset:", 0.0, 0.0, 0.0, 0.0);
}

- (void)willDismissSearchController:(id)a3
{
  [(_UIDocumentPickerDocumentCollectionViewController *)self updateContentInset];

  [(_UIDocumentPickerDocumentCollectionViewController *)self ensureSortViewInvisible];
}

- (void)setPinnedHeaderView:(id)a3 animated:(BOOL)a4
{
  BOOL v6 = (UIView *)a3;
  pinnedHeaderView = self->_pinnedHeaderView;
  if (pinnedHeaderView != v6)
  {
    double v18 = v6;
    id v8 = pinnedHeaderView;
    [(UIView *)v8 removeFromSuperview];
    objc_storeStrong((id *)&self->_pinnedHeaderView, a3);
    id v9 = [(_UIDocumentPickerDocumentCollectionViewController *)self scrollView];
    [v9 addSubview:v18];

    [(_UIDocumentPickerDocumentCollectionViewController *)self updateContentInset];
    [(_UIDocumentPickerDocumentCollectionViewController *)self updatePinnedHeader];
    id v10 = [(_UIDocumentPickerDocumentCollectionViewController *)self scrollView];
    [v10 contentOffset];
    double v12 = v11;

    if (v18)
    {
      [(UIView *)v18 frame];
      double v14 = v12 - v13;
    }
    else
    {
      [(UIView *)v8 frame];
      double v14 = v12 + v15;
    }
    [(UIView *)self->_pinnedHeaderView bounds];
    if (v14 < -v16) {
      double v14 = -v16;
    }
    int v17 = [(_UIDocumentPickerDocumentCollectionViewController *)self scrollView];
    objc_msgSend(v17, "setContentOffset:animated:", 0, 0.0, v14);

    BOOL v6 = v18;
  }
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double y = a4.y;
  id v29 = a3;
  double v8 = a5->y;
  [(UIView *)self->_pinnedHeaderView frame];
  double v10 = v8 + v9;
  double v11 = [(_UIDocumentPickerDocumentCollectionViewController *)self sortView];
  double v12 = [v11 superview];
  double v13 = [(_UIDocumentPickerDocumentCollectionViewController *)self sortView];
  [v13 frame];
  objc_msgSend(v12, "convertRect:toView:", v29);
  double v15 = v14;
  double v17 = v16;

  double v18 = v15 + v17;
  if (y > 0.0)
  {
    if (v10 <= v15 || v10 >= v18) {
      goto LABEL_26;
    }
    goto LABEL_24;
  }
  if (y >= 0.0)
  {
    double v21 = v15 + v17 * 0.5;
    if (v10 > v15 && v10 <= v21)
    {
LABEL_24:
      objc_msgSend(v29, "contentOffset", v18);
      CGFloat v25 = v28;
      [v29 contentInset];
      goto LABEL_25;
    }
    if (v10 < v21 || v10 >= v18) {
      goto LABEL_26;
    }
  }
  else if (v10 <= v15 || v10 >= v18)
  {
    goto LABEL_26;
  }
  objc_msgSend(v29, "contentOffset", v18);
  CGFloat v25 = v24;
  [(UIView *)self->_pinnedHeaderView bounds];
  double v27 = v26;
LABEL_25:
  a5->double x = v25;
  a5->double y = -v27;
LABEL_26:
}

- (void)updatePinnedHeader
{
  id v3 = [(_UIDocumentPickerDocumentCollectionViewController *)self scrollView];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;

  pinnedHeaderView = self->_pinnedHeaderView;

  -[UIView setFrame:](pinnedHeaderView, "setFrame:", v5, v7, v9, 44.0);
}

- (void)viewDidAppear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)_UIDocumentPickerDocumentCollectionViewController;
  [(_UIDocumentPickerDocumentCollectionViewController *)&v3 viewDidAppear:a3];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  [(_UIDocumentPickerDocumentCollectionViewController *)self setShouldHideSortBar:1];
  [(_UIDocumentPickerDocumentCollectionViewController *)self updateContentInset];
  double v5 = [(_UIDocumentPickerDocumentCollectionViewController *)self scrollView];
  [v5 setNeedsLayout];

  double v6 = [(_UIDocumentPickerDocumentCollectionViewController *)self navigationController];
  double v7 = [v6 view];
  uint64_t v8 = [v7 semanticContentAttribute];
  double v9 = [(_UIDocumentPickerDocumentCollectionViewController *)self collectionView];
  [v9 setSemanticContentAttribute:v8];

  v10.receiver = self;
  v10.super_class = (Class)_UIDocumentPickerDocumentCollectionViewController;
  [(_UIDocumentPickerDocumentCollectionViewController *)&v10 viewWillAppear:v3];
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)_UIDocumentPickerDocumentCollectionViewController;
  [(_UIDocumentPickerDocumentCollectionViewController *)&v3 viewDidLayoutSubviews];
  if ([(_UIDocumentPickerDocumentCollectionViewController *)self shouldHideSortBar])
  {
    [(_UIDocumentPickerDocumentCollectionViewController *)self ensureSortViewInvisible];
    [(_UIDocumentPickerDocumentCollectionViewController *)self setShouldHideSortBar:0];
  }
}

- (void)ensureSortViewInvisible
{
  objc_super v3 = [(_UIDocumentPickerDocumentCollectionViewController *)self scrollView];
  [v3 contentOffset];
  double v5 = v4;
  [(UIView *)self->_pinnedHeaderView bounds];
  double v7 = -v6;

  if (v5 < v7)
  {
    id v9 = [(_UIDocumentPickerDocumentCollectionViewController *)self scrollView];
    [(UIView *)self->_pinnedHeaderView bounds];
    objc_msgSend(v9, "setContentOffset:animated:", 0, 0.0, -v8);
  }
}

- (void)scrollSortViewToVisible
{
  [(_UIDocumentPickerDocumentCollectionViewController *)self setShouldHideSortBar:0];
  id v5 = [(_UIDocumentPickerDocumentCollectionViewController *)self scrollView];
  objc_super v3 = [(_UIDocumentPickerDocumentCollectionViewController *)self scrollView];
  [v3 contentInset];
  objc_msgSend(v5, "setContentOffset:animated:", 0, 0.0, -v4);
}

- (id)previewingContext:(id)a3 viewControllerForLocation:(CGPoint)a4
{
  id v5 = -[_UIDocumentPickerDocumentCollectionViewController itemForLocation:](self, "itemForLocation:", a3, a4.x, a4.y);
  if (v5
    && ([(_UIDocumentPickerDocumentCollectionViewController *)self serviceViewController],
        double v6 = objc_claimAutoreleasedReturnValue(),
        char v7 = objc_opt_respondsToSelector(),
        v6,
        (v7 & 1) != 0))
  {
    double v8 = [(_UIDocumentPickerDocumentCollectionViewController *)self serviceViewController];
    id v9 = [v8 previewViewControllerForItem:v5];

    if (v9)
    {
      objc_setAssociatedObject(v9, &viewControllerItemKey, v5, (void *)0x301);
      if (objc_opt_respondsToSelector())
      {
        objc_super v10 = [(_UIDocumentPickerDocumentCollectionViewController *)self previewActionItemsForItem:v5];
        [v9 setPreviewActionItems:v10];
      }
    }
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (id)previewActionItemsForItem:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x263EFF980] array];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __79___UIDocumentPickerDocumentCollectionViewController_previewActionItemsForItem___block_invoke;
  v19[3] = &unk_26492D5A0;
  v19[4] = self;
  id v20 = v4;
  id v6 = v5;
  id v21 = v6;
  id v7 = v4;
  double v8 = (void (**)(void, void, void))MEMORY[0x230F72310](v19);
  id v9 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.CloudDocsUI"];
  objc_super v10 = [v9 localizedStringForKey:@"Rename..." value:@"Rename…" table:@"Localizable"];
  ((void (**)(void, void *, uint64_t))v8)[2](v8, v10, 3);

  double v11 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.CloudDocsUI"];
  double v12 = [v11 localizedStringForKey:@"Delete..." value:@"Delete…" table:@"Localizable"];
  ((void (**)(void, void *, void))v8)[2](v8, v12, 0);

  double v13 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.CloudDocsUI"];
  double v14 = [v13 localizedStringForKey:@"Share..." value:@"Share…" table:@"Localizable"];
  ((void (**)(void, void *, uint64_t))v8)[2](v8, v14, 4);

  double v15 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.CloudDocsUI"];
  double v16 = [v15 localizedStringForKey:@"Move..." value:@"Move…" table:@"Localizable"];
  ((void (**)(void, void *, uint64_t))v8)[2](v8, v16, 5);

  id v17 = v6;
  return v17;
}

- (void)previewingContext:(id)a3 commitViewController:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  id v7 = [(_UIDocumentPickerDocumentCollectionViewController *)self serviceViewController];
  int v8 = [v7 shouldShowAction:6];

  if (v8)
  {
    id v9 = objc_getAssociatedObject(v6, &viewControllerItemKey);
    objc_super v10 = [(_UIDocumentPickerDocumentCollectionViewController *)self serviceViewController];
    double v11 = [v12 sourceView];
    [v10 performAction:6 item:v9 view:v11 completion:&__block_literal_global_9];
  }
  else
  {
    id v9 = [(_UIDocumentPickerDocumentCollectionViewController *)self navigationController];
    [v9 pushViewController:v6 animated:1];
  }

  objc_setAssociatedObject(v6, &viewControllerItemKey, 0, (void *)0x301);
}

- (int64_t)displayMode
{
  return self->_displayMode;
}

- (_UIDocumentPickerServiceViewController)serviceViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_serviceViewController);

  return (_UIDocumentPickerServiceViewController *)WeakRetained;
}

- (void)setServiceViewController:(id)a3
{
}

- (_UIDocumentPickerContainerModel)model
{
  return self->_model;
}

- (void)setModel:(id)a3
{
}

- (NSArray)actions
{
  return self->_actions;
}

- (void)setActions:(id)a3
{
}

- (_UIDocumentPickerFlowLayout)gridLayout
{
  return self->_gridLayout;
}

- (void)setGridLayout:(id)a3
{
}

- (_UIDocumentPickerTableLayout)tableLayout
{
  return self->_tableLayout;
}

- (void)setTableLayout:(id)a3
{
}

- (BOOL)monitoring
{
  return self->_monitoring;
}

- (BOOL)shouldHideSortBar
{
  return self->_shouldHideSortBar;
}

- (void)setShouldHideSortBar:(BOOL)a3
{
  self->_shouldHideSortBar = a3;
}

- (_UIDocumentPickerSortOrderView)sortView
{
  return self->_sortView;
}

- (UIView)pinnedHeaderView
{
  return self->_pinnedHeaderView;
}

- (void)setPinnedHeaderView:(id)a3
{
}

- (NSArray)modelObjects
{
  return self->_modelObjects;
}

- (void)setModelObjects:(id)a3
{
}

- (BOOL)updatesMayAnimate
{
  return self->_updatesMayAnimate;
}

- (void)setUpdatesMayAnimate:(BOOL)a3
{
  self->_updatesMayAnimate = a3;
}

- (UIActivityIndicatorView)initialActivityView
{
  return self->_initialActivityView;
}

- (void)setInitialActivityView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_initialActivityView, 0);
  objc_storeStrong((id *)&self->_modelObjects, 0);
  objc_storeStrong((id *)&self->_pinnedHeaderView, 0);
  objc_storeStrong((id *)&self->_sortView, 0);
  objc_storeStrong((id *)&self->_tableLayout, 0);
  objc_storeStrong((id *)&self->_gridLayout, 0);
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_destroyWeak((id *)&self->_serviceViewController);

  objc_storeStrong((id *)&self->_viewControllerPreviewContext, 0);
}

@end