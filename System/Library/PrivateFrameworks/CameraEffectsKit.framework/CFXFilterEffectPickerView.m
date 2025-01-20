@interface CFXFilterEffectPickerView
- (BOOL)isDisplayingCompactLayout;
- (BOOL)isDisplayingExpandedLayout;
- (CFXFilterEffectPickerViewDataSource)dataSource;
- (CFXFilterEffectPickerViewDelegate)delegate;
- (CGPoint)previousScrollOffset;
- (CGSize)lastViewSize;
- (JTCollectionView)collectionView;
- (JTCollectionViewFlowLayout)collectionViewLayout;
- (NSIndexPath)lastScrollIndexPath;
- (UILabel)compactSelectedTitleView;
- (UISelectionFeedbackGenerator)selectionFeedbackGenerator;
- (UIView)compactSelectionView;
- (UIView)contentView;
- (id)effectPickerCellNibName;
- (id)effectPickerCellReuseIdentifier;
- (id)effectPickerNibName;
- (id)indexPathForCenterOfCollectionView;
- (id)layoutAttributesForNearestItemToCenterWithOffset:(CGPoint)a3;
- (unint64_t)cachedEffectCount;
- (unint64_t)selectedIndex;
- (void)CFX_selectInitialItem;
- (void)CFX_selectItemAtCellIndex:(unint64_t)a3 animated:(BOOL)a4;
- (void)CFX_updateTitleForCenterItemAtIndex:(int64_t)a3;
- (void)buildCompactSelectionViews;
- (void)configureCell:(id)a3;
- (void)configureCollectionViewLayout;
- (void)didScrollCollectionView;
- (void)didSelectItemAtCellIndex:(unint64_t)a3;
- (void)layoutSubviews;
- (void)orientationDidChange;
- (void)reloadData;
- (void)removeCompactSelectionViews;
- (void)scrollViewDidEndDecelerating:(id)a3;
- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5;
- (void)selectCenterItem;
- (void)selectEffectWithIdentifier:(id)a3;
- (void)setCachedEffectCount:(unint64_t)a3;
- (void)setCollectionView:(id)a3;
- (void)setCollectionViewLayout:(id)a3;
- (void)setCompactSelectedTitleView:(id)a3;
- (void)setCompactSelectionView:(id)a3;
- (void)setContentView:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDisplayExpandedLayout:(BOOL)a3;
- (void)setLastScrollIndexPath:(id)a3;
- (void)setLastViewSize:(CGSize)a3;
- (void)setPreviousScrollOffset:(CGPoint)a3;
- (void)setSelectionFeedbackGenerator:(id)a3;
- (void)subviewsDidLoad;
- (void)updatePreviewEffectsWhenReloadComplete;
@end

@implementation CFXFilterEffectPickerView

- (id)effectPickerNibName
{
  return @"CFXFilterEffectPickerView";
}

- (id)effectPickerCellNibName
{
  return @"CFXFilterPickerCollectionViewCell";
}

- (id)effectPickerCellReuseIdentifier
{
  return @"EffectCell";
}

- (BOOL)isDisplayingCompactLayout
{
  return ![(CFXFilterEffectPickerView *)self isDisplayingExpandedLayout];
}

- (void)configureCell:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "setCompactMode:", -[CFXFilterEffectPickerView isDisplayingCompactLayout](self, "isDisplayingCompactLayout"));
  v5 = [(CFXFilterEffectPickerView *)self delegate];
  int v6 = [v5 shouldRotateCellsForDeviceOrientation];

  if (v6)
  {
    int64_t v7 = +[JFXOrientationMonitor interfaceOrientation];
    double v8 = 0.0;
    if (v7 != 1)
    {
      if (+[JFXOrientationMonitor interfaceOrientation] == 4)
      {
        double v8 = -1.57079633;
      }
      else if (+[JFXOrientationMonitor interfaceOrientation] == 3)
      {
        double v8 = 1.57079633;
      }
      else
      {
        int64_t v9 = +[JFXOrientationMonitor interfaceOrientation];
        double v8 = 3.14159265;
        if (v9 != 2) {
          double v8 = 0.0;
        }
      }
    }
    CGAffineTransformMakeRotation(&v13, -v8);
    v10 = [v4 imageView];
    CGAffineTransform v12 = v13;
    [v10 setTransform:&v12];
  }
  v11.receiver = self;
  v11.super_class = (Class)CFXFilterEffectPickerView;
  [(CFXEffectPickerView *)&v11 configureCell:v4];
}

- (void)subviewsDidLoad
{
  v20.receiver = self;
  v20.super_class = (Class)CFXFilterEffectPickerView;
  [(CFXEffectPickerView *)&v20 subviewsDidLoad];
  v3 = [(CFXFilterEffectPickerView *)self collectionView];
  [v3 setAllowsMultipleSelection:0];

  id v4 = [(CFXFilterEffectPickerView *)self collectionView];
  [v4 setShowsHorizontalScrollIndicator:0];

  v5 = [(CFXFilterEffectPickerView *)self collectionViewLayout];
  [v5 setMinimumLineSpacing:16.0];

  int v6 = [(CFXFilterEffectPickerView *)self collectionViewLayout];
  [v6 setMinimumInteritemSpacing:16.0];

  int64_t v7 = [(CFXFilterEffectPickerView *)self collectionView];
  [v7 setContentInsetAdjustmentBehavior:2];

  double v8 = [(CFXFilterEffectPickerView *)self collectionView];
  [v8 setTranslatesAutoresizingMaskIntoConstraints:1];

  int64_t v9 = [(CFXFilterEffectPickerView *)self collectionView];
  [v9 setAutoresizingMask:0];

  [(CFXFilterEffectPickerView *)self bounds];
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  v18 = [(CFXFilterEffectPickerView *)self collectionView];
  objc_msgSend(v18, "setFrame:", v11, v13, v15, v17);

  v19 = [(CFXFilterEffectPickerView *)self collectionView];
  [v19 _setTransfersScrollToContainer:0];

  [(CFXFilterEffectPickerView *)self buildCompactSelectionViews];
}

- (void)buildCompactSelectionViews
{
  [(CFXFilterEffectPickerView *)self removeCompactSelectionViews];
  v3 = objc_opt_new();
  [(CFXFilterEffectPickerView *)self setCompactSelectionView:v3];

  id v4 = [(CFXFilterEffectPickerView *)self compactSelectionView];
  v5 = [v4 layer];
  [v5 setBorderWidth:3.0];

  int v6 = [(CFXFilterEffectPickerView *)self compactSelectionView];
  int64_t v7 = [v6 layer];
  [v7 setCornerRadius:12.0];

  id v8 = +[CFXFilterPickerCollectionViewCell selectionColor];
  uint64_t v9 = [v8 CGColor];
  double v10 = [(CFXFilterEffectPickerView *)self compactSelectionView];
  double v11 = [v10 layer];
  [v11 setBorderColor:v9];

  double v12 = [MEMORY[0x263F1C550] clearColor];
  double v13 = [(CFXFilterEffectPickerView *)self compactSelectionView];
  [v13 setBackgroundColor:v12];

  double v14 = [(CFXFilterEffectPickerView *)self compactSelectionView];
  [v14 setUserInteractionEnabled:0];

  double v15 = [(CFXFilterEffectPickerView *)self compactSelectionView];
  [v15 setTranslatesAutoresizingMaskIntoConstraints:0];

  double v16 = [(CFXFilterEffectPickerView *)self compactSelectionView];
  [(CFXFilterEffectPickerView *)self addSubview:v16];

  double v17 = objc_opt_new();
  [(CFXFilterEffectPickerView *)self setCompactSelectedTitleView:v17];

  v18 = +[CFXFilterPickerCollectionViewCell selectionColor];
  v19 = [(CFXFilterEffectPickerView *)self compactSelectedTitleView];
  [v19 setTextColor:v18];

  objc_super v20 = [MEMORY[0x263F1C658] systemFontOfSize:14.0];
  v21 = [(CFXFilterEffectPickerView *)self compactSelectedTitleView];
  [v21 setFont:v20];

  v22 = [(CFXFilterEffectPickerView *)self compactSelectedTitleView];
  [v22 setTranslatesAutoresizingMaskIntoConstraints:0];

  id v23 = [(CFXFilterEffectPickerView *)self compactSelectedTitleView];
  [(CFXFilterEffectPickerView *)self addSubview:v23];
}

- (void)removeCompactSelectionViews
{
  v3 = [(CFXFilterEffectPickerView *)self compactSelectedTitleView];
  [v3 removeFromSuperview];

  id v4 = [(CFXFilterEffectPickerView *)self compactSelectionView];
  [v4 removeFromSuperview];
}

- (void)configureCollectionViewLayout
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  v2 = @"compact";
  if (a1) {
    v2 = @"expanded";
  }
  int v3 = 138412290;
  id v4 = v2;
  _os_log_debug_impl(&dword_234C41000, a2, OS_LOG_TYPE_DEBUG, "filter picker transitioning to %@ mode", (uint8_t *)&v3, 0xCu);
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)CFXFilterEffectPickerView;
  [(CFXFilterEffectPickerView *)&v3 layoutSubviews];
  [(CFXFilterEffectPickerView *)self configureCollectionViewLayout];
}

- (void)reloadData
{
  objc_super v3 = [(CFXFilterEffectPickerView *)self dataSource];
  -[CFXFilterEffectPickerView setCachedEffectCount:](self, "setCachedEffectCount:", [v3 numberOfEffectsInPickerView:self]);

  v4.receiver = self;
  v4.super_class = (Class)CFXFilterEffectPickerView;
  [(CFXEffectPickerView *)&v4 reloadData];
}

- (void)updatePreviewEffectsWhenReloadComplete
{
  v3.receiver = self;
  v3.super_class = (Class)CFXFilterEffectPickerView;
  [(CFXEffectPickerView *)&v3 updatePreviewEffectsWhenReloadComplete];
  [(CFXFilterEffectPickerView *)self CFX_selectInitialItem];
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  if ([(CFXFilterEffectPickerView *)self isDisplayingCompactLayout])
  {
    objc_super v4 = [(CFXFilterEffectPickerView *)self selectionFeedbackGenerator];
    [v4 prepare];

    uint64_t v5 = [(CFXFilterEffectPickerView *)self indexPathForCenterOfCollectionView];
    [(CFXFilterEffectPickerView *)self setLastScrollIndexPath:v5];

    id v6 = [(CFXFilterEffectPickerView *)self collectionView];
    [v6 contentOffset];
    -[CFXFilterEffectPickerView setPreviousScrollOffset:](self, "setPreviousScrollOffset:");
  }
}

- (void)didScrollCollectionView
{
  v24.receiver = self;
  v24.super_class = (Class)CFXFilterEffectPickerView;
  [(CFXEffectPickerView *)&v24 didScrollCollectionView];
  if ([(CFXFilterEffectPickerView *)self isDisplayingCompactLayout])
  {
    objc_super v3 = [(CFXFilterEffectPickerView *)self collectionView];
    [v3 contentOffset];
    -[CFXFilterEffectPickerView setPreviousScrollOffset:](self, "setPreviousScrollOffset:");

    objc_super v4 = [(CFXFilterEffectPickerView *)self collectionView];
    [v4 contentOffset];
    double v6 = v5;
    double v8 = v7;

    uint64_t v9 = -[CFXFilterEffectPickerView layoutAttributesForNearestItemToCenterWithOffset:](self, "layoutAttributesForNearestItemToCenterWithOffset:", v6, v8);
    double v10 = [v9 indexPath];
    double v11 = [(CFXFilterEffectPickerView *)self lastScrollIndexPath];
    char v12 = [v10 isEqual:v11];

    if ((v12 & 1) == 0)
    {
      double v13 = [(CFXFilterEffectPickerView *)self collectionView];
      [v13 bounds];
      double MidX = CGRectGetMidX(v25);

      [v9 center];
      double v16 = v15;
      [(CFXFilterEffectPickerView *)self previousScrollOffset];
      if (v6 > v17)
      {
        if (MidX < v16 - 10.0) {
          goto LABEL_12;
        }
LABEL_7:
        v18 = [(CFXFilterEffectPickerView *)self collectionView];
        if ([v18 isTracking])
        {
        }
        else
        {
          v19 = [(CFXFilterEffectPickerView *)self collectionView];
          int v20 = [v19 isDecelerating];

          if (!v20)
          {
LABEL_11:
            v22 = [v9 indexPath];
            [(CFXFilterEffectPickerView *)self setLastScrollIndexPath:v22];

            id v23 = [(CFXFilterEffectPickerView *)self lastScrollIndexPath];
            -[CFXFilterEffectPickerView CFX_updateTitleForCenterItemAtIndex:](self, "CFX_updateTitleForCenterItemAtIndex:", [v23 item]);

            goto LABEL_12;
          }
        }
        v21 = [(CFXFilterEffectPickerView *)self selectionFeedbackGenerator];
        [v21 selectionChanged];

        goto LABEL_11;
      }
      if (MidX <= v16 + 10.0) {
        goto LABEL_7;
      }
    }
LABEL_12:
  }
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  if ([(CFXFilterEffectPickerView *)self isDisplayingCompactLayout] && !a4)
  {
    [(CFXFilterEffectPickerView *)self selectCenterItem];
  }
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  if ([(CFXFilterEffectPickerView *)self isDisplayingCompactLayout])
  {
    [(CFXFilterEffectPickerView *)self selectCenterItem];
  }
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  if ([(CFXFilterEffectPickerView *)self isDisplayingCompactLayout])
  {
    double v7 = -[CFXFilterEffectPickerView layoutAttributesForNearestItemToCenterWithOffset:](self, "layoutAttributesForNearestItemToCenterWithOffset:", a5->x, a5->y);
    if (v7)
    {
      id v12 = v7;
      [v7 frame];
      double v9 = v8;
      double v10 = [(CFXFilterEffectPickerView *)self collectionViewLayout];
      [v10 sectionInset];
      a5->x = v9 - v11;

      double v7 = v12;
    }
  }
}

- (id)layoutAttributesForNearestItemToCenterWithOffset:(CGPoint)a3
{
  double x = a3.x;
  uint64_t v33 = *MEMORY[0x263EF8340];
  double v5 = [(CFXFilterEffectPickerView *)self collectionViewLayout];
  [v5 sectionInset];
  double v7 = x + v6;

  [(CFXEffectPickerView *)self cellSize];
  double v9 = v7 + v8 * -0.5;
  [(CFXEffectPickerView *)self cellSize];
  double v11 = v10;
  [(CFXEffectPickerView *)self cellSize];
  double v13 = v12;
  double v14 = [(CFXFilterEffectPickerView *)self collectionViewLayout];
  double v15 = objc_msgSend(v14, "layoutAttributesForElementsInRect:", v9, 0.0, v11, v13);

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v16 = v15;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    v19 = 0;
    uint64_t v20 = *(void *)v29;
    double v21 = 1.79769313e308;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v29 != v20) {
          objc_enumerationMutation(v16);
        }
        id v23 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        objc_msgSend(v23, "frame", (void)v28);
        double v25 = vabdd_f64(v7, v24);
        if (v21 > v25)
        {
          id v26 = v23;

          double v21 = v25;
          v19 = v26;
        }
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v18);
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (UISelectionFeedbackGenerator)selectionFeedbackGenerator
{
  selectionFeedbackGenerator = self->_selectionFeedbackGenerator;
  if (!selectionFeedbackGenerator)
  {
    objc_super v4 = (UISelectionFeedbackGenerator *)objc_alloc_init(MEMORY[0x263F1C970]);
    double v5 = self->_selectionFeedbackGenerator;
    self->_selectionFeedbackGenerator = v4;

    [(UISelectionFeedbackGenerator *)self->_selectionFeedbackGenerator _setOutputMode:5];
    selectionFeedbackGenerator = self->_selectionFeedbackGenerator;
  }
  return selectionFeedbackGenerator;
}

- (void)didSelectItemAtCellIndex:(unint64_t)a3
{
  [(CFXFilterEffectPickerView *)self CFX_selectItemAtCellIndex:a3 animated:1];
  [(CFXEffectPickerView *)self applyEffectAtCellIndex:a3];
}

- (void)selectCenterItem
{
  id v4 = [(CFXFilterEffectPickerView *)self indexPathForCenterOfCollectionView];
  -[CFXFilterEffectPickerView CFX_selectItemAtCellIndex:animated:](self, "CFX_selectItemAtCellIndex:animated:", [v4 item], 1);
  unint64_t v3 = [(CFXFilterEffectPickerView *)self selectedIndex];
  if (v3 != 0x7FFFFFFFFFFFFFFFLL) {
    [(CFXEffectPickerView *)self applyEffectAtCellIndex:v3];
  }
}

- (void)selectEffectWithIdentifier:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v7 = v4;
    double v5 = [(CFXFilterEffectPickerView *)self dataSource];
    uint64_t v6 = [v5 effectPickerView:self indexForEffectID:v7];

    id v4 = v7;
    if (v6 != 0x7FFFFFFFFFFFFFFFLL)
    {
      [(CFXFilterEffectPickerView *)self CFX_selectItemAtCellIndex:v6 animated:1];
      id v4 = v7;
    }
  }
}

- (id)indexPathForCenterOfCollectionView
{
  unint64_t v3 = [(CFXFilterEffectPickerView *)self collectionView];
  id v4 = [MEMORY[0x263F088C8] indexPathForItem:0 inSection:0];
  double v5 = [v3 layoutAttributesForItemAtIndexPath:v4];

  if (v5)
  {
    [(CFXFilterEffectPickerView *)self center];
    double v7 = v6;
    double v9 = v8;
    double v10 = [(CFXFilterEffectPickerView *)self collectionView];
    -[CFXFilterEffectPickerView convertPoint:toView:](self, "convertPoint:toView:", v10, v7, v9);
    double v12 = v11;

    [v5 center];
    double v14 = v13;
    double v15 = [(CFXFilterEffectPickerView *)self collectionView];
    id v16 = objc_msgSend(v15, "indexPathForItemAtPoint:", v12, v14);

    if (!v16)
    {
      uint64_t v17 = [(CFXFilterEffectPickerView *)self collectionViewLayout];
      [v17 minimumInteritemSpacing];
      double v19 = v12 + v18;

      uint64_t v20 = [(CFXFilterEffectPickerView *)self collectionView];
      id v16 = objc_msgSend(v20, "indexPathForItemAtPoint:", v19, v14);

      if (!v16)
      {
        double v21 = [(CFXFilterEffectPickerView *)self collectionViewLayout];
        [v21 minimumInteritemSpacing];
        double v23 = v12 - v22;

        double v24 = [(CFXFilterEffectPickerView *)self collectionView];
        id v16 = objc_msgSend(v24, "indexPathForItemAtPoint:", v23, v14);
      }
    }
  }
  else
  {
    id v16 = 0;
  }

  return v16;
}

- (unint64_t)selectedIndex
{
  v2 = [(CFXFilterEffectPickerView *)self collectionView];
  unint64_t v3 = [v2 indexPathsForSelectedItems];
  id v4 = [v3 firstObject];

  if (v4) {
    unint64_t v5 = [v4 item];
  }
  else {
    unint64_t v5 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v5;
}

- (void)orientationDidChange
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  unint64_t v3 = [(CFXFilterEffectPickerView *)self delegate];
  int v4 = [v3 shouldRotateCellsForDeviceOrientation];

  if (v4)
  {
    double v5 = 0.0;
    if (+[JFXOrientationMonitor interfaceOrientation] != 1)
    {
      if (+[JFXOrientationMonitor interfaceOrientation] == 4)
      {
        double v5 = -1.57079633;
      }
      else if (+[JFXOrientationMonitor interfaceOrientation] == 3)
      {
        double v5 = 1.57079633;
      }
      else if (+[JFXOrientationMonitor interfaceOrientation] == 2)
      {
        double v5 = 3.14159265;
      }
      else
      {
        double v5 = 0.0;
      }
    }
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    double v6 = [(CFXFilterEffectPickerView *)self collectionView];
    double v7 = [v6 visibleCells];

    uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      double v10 = -v5;
      uint64_t v11 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v18 != v11) {
            objc_enumerationMutation(v7);
          }
          double v13 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          CGAffineTransformMakeRotation(&v16, v10);
          double v14 = [v13 imageView];
          CGAffineTransform v15 = v16;
          [v14 setTransform:&v15];
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v9);
    }
  }
}

- (void)CFX_selectItemAtCellIndex:(unint64_t)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v13 = [MEMORY[0x263F088C8] indexPathForItem:a3 inSection:0];
  BOOL v7 = [(CFXFilterEffectPickerView *)self isDisplayingCompactLayout];
  uint64_t v8 = [(CFXFilterEffectPickerView *)self collectionView];
  unint64_t v9 = [v8 numberOfItemsInSection:0];

  if (v9 > a3)
  {
    if (v7) {
      uint64_t v10 = 16;
    }
    else {
      uint64_t v10 = 0;
    }
    uint64_t v11 = [(CFXFilterEffectPickerView *)self collectionView];
    [v11 selectItemAtIndexPath:v13 animated:v4 scrollPosition:v10];

    if (![(CFXFilterEffectPickerView *)self isDisplayingCompactLayout])
    {
      double v12 = [(CFXFilterEffectPickerView *)self collectionView];
      [v12 scrollToItemAtIndexPath:v13 atScrollPosition:0 animated:1];
    }
    [(CFXFilterEffectPickerView *)self CFX_updateTitleForCenterItemAtIndex:a3];
  }
}

- (void)CFX_selectInitialItem
{
  unint64_t v3 = [(CFXFilterEffectPickerView *)self dataSource];
  uint64_t v4 = [v3 selectedFilterIndexForFilterPickerView:self];

  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    [(CFXFilterEffectPickerView *)self CFX_selectItemAtCellIndex:v4 animated:0];
  }
}

- (void)CFX_updateTitleForCenterItemAtIndex:(int64_t)a3
{
  if ([(CFXFilterEffectPickerView *)self isDisplayingCompactLayout])
  {
    id v7 = [(CFXFilterEffectPickerView *)self dataSource];
    double v5 = [v7 effectPickerView:self effectTitleAtIndex:a3];
    double v6 = [(CFXFilterEffectPickerView *)self compactSelectedTitleView];
    [v6 setText:v5];
  }
}

- (CFXFilterEffectPickerViewDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->dataSource);
  return (CFXFilterEffectPickerViewDataSource *)WeakRetained;
}

- (void)setDataSource:(id)a3
{
}

- (CFXFilterEffectPickerViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->delegate);
  return (CFXFilterEffectPickerViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIView)contentView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_contentView);
  return (UIView *)WeakRetained;
}

- (void)setContentView:(id)a3
{
}

- (JTCollectionView)collectionView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_collectionView);
  return (JTCollectionView *)WeakRetained;
}

- (void)setCollectionView:(id)a3
{
}

- (JTCollectionViewFlowLayout)collectionViewLayout
{
  return self->_collectionViewLayout;
}

- (void)setCollectionViewLayout:(id)a3
{
}

- (UIView)compactSelectionView
{
  return self->_compactSelectionView;
}

- (void)setCompactSelectionView:(id)a3
{
}

- (UILabel)compactSelectedTitleView
{
  return self->_compactSelectedTitleView;
}

- (void)setCompactSelectedTitleView:(id)a3
{
}

- (unint64_t)cachedEffectCount
{
  return self->_cachedEffectCount;
}

- (void)setCachedEffectCount:(unint64_t)a3
{
  self->_cachedEffectCount = a3;
}

- (BOOL)isDisplayingExpandedLayout
{
  return self->_displayExpandedLayout;
}

- (void)setDisplayExpandedLayout:(BOOL)a3
{
  self->_displayExpandedLayout = a3;
}

- (CGSize)lastViewSize
{
  double width = self->_lastViewSize.width;
  double height = self->_lastViewSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setLastViewSize:(CGSize)a3
{
  self->_lastViewSize = a3;
}

- (void)setSelectionFeedbackGenerator:(id)a3
{
}

- (NSIndexPath)lastScrollIndexPath
{
  return self->_lastScrollIndexPath;
}

- (void)setLastScrollIndexPath:(id)a3
{
}

- (CGPoint)previousScrollOffset
{
  double x = self->_previousScrollOffset.x;
  double y = self->_previousScrollOffset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setPreviousScrollOffset:(CGPoint)a3
{
  self->_previousScrollOffset = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastScrollIndexPath, 0);
  objc_storeStrong((id *)&self->_selectionFeedbackGenerator, 0);
  objc_storeStrong((id *)&self->_compactSelectedTitleView, 0);
  objc_storeStrong((id *)&self->_compactSelectionView, 0);
  objc_storeStrong((id *)&self->_collectionViewLayout, 0);
  objc_destroyWeak((id *)&self->_collectionView);
  objc_destroyWeak((id *)&self->_contentView);
  objc_destroyWeak((id *)&self->delegate);
  objc_destroyWeak((id *)&self->dataSource);
}

@end