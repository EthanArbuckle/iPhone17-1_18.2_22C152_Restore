@interface AVTGroupDial
+ (BOOL)shouldScrollGivenTitleSizes:(id)a3 fittingWidth:(double)a4;
+ (double)estimatedContentWidthForTitleSizes:(id)a3;
- (AVTCenteringCollectionViewDelegate)centeringCollectionViewDelegate;
- (AVTGroupDial)initWithGroupItems:(id)a3 environment:(id)a4;
- (AVTGroupDialMaskingView)maskingView;
- (AVTGroupPickerDelegate)delegate;
- (AVTUIEnvironment)environment;
- (BOOL)hasFinalizedSelection;
- (BOOL)isMoving;
- (CGSize)cellSizeForItemAtIndex:(int64_t)a3;
- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5;
- (NSArray)cachedGroupTitleSizes;
- (NSArray)groupItems;
- (NSIndexPath)shimmeringItemIndexPath;
- (UICollectionView)collectionView;
- (UICollectionViewFlowLayout)collectionViewLayout;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)currentSelectedItemIndex;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
- (unint64_t)currentScrollDirection;
- (void)cacheTitleSizes;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)layoutSubviews;
- (void)reloadData;
- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5;
- (void)selectItemAtIndex:(int64_t)a3 updateScrollPosition:(BOOL)a4 animated:(BOOL)a5;
- (void)setBounds:(CGRect)a3;
- (void)setCollectionViewLayout:(id)a3;
- (void)setContentPadding:(double)a3;
- (void)setCurrentScrollDirection:(unint64_t)a3;
- (void)setCurrentSelectedItemIndex:(int64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setFrame:(CGRect)a3;
- (void)setHasFinalizedSelection:(BOOL)a3;
- (void)setIsMoving:(BOOL)a3;
- (void)setMaskingView:(id)a3;
- (void)setSelectedGroupIndex:(int64_t)a3;
- (void)setSelectedGroupIndex:(int64_t)a3 animated:(BOOL)a4;
- (void)setShimmeringItemIndexPath:(id)a3;
- (void)setupDial;
- (void)setupMasking;
- (void)startDiscoverability;
- (void)stopDiscoverability;
- (void)updateForEndingScroll;
- (void)updateSelectedState:(BOOL)a3 forItemAtIndexPath:(id)a4 animated:(BOOL)a5;
@end

@implementation AVTGroupDial

+ (double)estimatedContentWidthForTitleSizes:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if (v3 || (double v11 = 0.0, ![0 count]))
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v4 = v3;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v14;
      double v8 = 0.0;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v14 != v7) {
            objc_enumerationMutation(v4);
          }
          objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "CGSizeValue", (void)v13);
          double v8 = v8 + v10 + 20.0;
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v6);
    }
    else
    {
      double v8 = 0.0;
    }

    double v11 = v8 + (double)(unint64_t)([v4 count] - 1) * 30.0;
  }

  return v11;
}

+ (BOOL)shouldScrollGivenTitleSizes:(id)a3 fittingWidth:(double)a4
{
  [a1 estimatedContentWidthForTitleSizes:a3];
  return v5 > a4;
}

- (AVTGroupDial)initWithGroupItems:(id)a3 environment:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)AVTGroupDial;
  v9 = -[AVTGroupDial initWithFrame:](&v13, sel_initWithFrame_, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  double v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_environment, a4);
    objc_storeStrong((id *)&v10->_groupItems, a3);
    double v11 = [MEMORY[0x263F1C550] clearColor];
    [(AVTGroupDial *)v10 setBackgroundColor:v11];

    [(AVTGroupDial *)v10 cacheTitleSizes];
    [(AVTGroupDial *)v10 setupDial];
    if (AVTUIGroupDialUsesMasking_once()) {
      [(AVTGroupDial *)v10 setupMasking];
    }
  }

  return v10;
}

- (void)setupMasking
{
  id v3 = [AVTGroupDialMaskingView alloc];
  [(AVTGroupDial *)self bounds];
  id v4 = -[AVTGroupDialMaskingView initWithFrame:](v3, "initWithFrame:");
  maskingView = self->_maskingView;
  self->_maskingView = v4;

  uint64_t v6 = self->_maskingView;
  [(AVTGroupDial *)self setMaskView:v6];
}

- (void)cacheTitleSizes
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v3 = (void *)MEMORY[0x263EFF980];
  id v4 = [(AVTGroupDial *)self groupItems];
  double v5 = objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v4, "count"));

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id obj = [(AVTGroupDial *)self groupItems];
  uint64_t v6 = [obj countByEnumeratingWithState:&v22 objects:v28 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v23;
    uint64_t v9 = *MEMORY[0x263F1C238];
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v23 != v8) {
          objc_enumerationMutation(obj);
        }
        double v11 = [*(id *)(*((void *)&v22 + 1) + 8 * i) localizedName];
        uint64_t v26 = v9;
        v12 = [(id)objc_opt_class() labelFont];
        v27 = v12;
        objc_super v13 = [NSDictionary dictionaryWithObjects:&v27 forKeys:&v26 count:1];
        [v11 sizeWithAttributes:v13];
        double v15 = v14;
        double v17 = v16;

        uint64_t v18 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGSize:", v15, v17);
        [v5 addObject:v18];
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v22 objects:v28 count:16];
    }
    while (v7);
  }

  v19 = (NSArray *)[v5 copy];
  cachedGroupTitleSizes = self->_cachedGroupTitleSizes;
  self->_cachedGroupTitleSizes = v19;
}

- (void)setupDial
{
  v19 = objc_alloc_init(AVTFlippingCollectionViewFlowLayout);
  [(UICollectionViewFlowLayout *)v19 setScrollDirection:1];
  -[UICollectionViewFlowLayout setSectionInset:](v19, "setSectionInset:", *MEMORY[0x263F1D1C0], *(double *)(MEMORY[0x263F1D1C0] + 8), *(double *)(MEMORY[0x263F1D1C0] + 16), *(double *)(MEMORY[0x263F1D1C0] + 24));
  [(UICollectionViewFlowLayout *)v19 setMinimumInteritemSpacing:30.0];
  [(AVTGroupDial *)self setCollectionViewLayout:v19];
  id v3 = objc_alloc(MEMORY[0x263F1C4E0]);
  [(AVTGroupDial *)self bounds];
  id v4 = (UICollectionView *)objc_msgSend(v3, "initWithFrame:collectionViewLayout:", v19);
  collectionView = self->_collectionView;
  self->_collectionView = v4;

  [(UICollectionView *)self->_collectionView setShowsVerticalScrollIndicator:0];
  [(UICollectionView *)self->_collectionView setShowsHorizontalScrollIndicator:0];
  uint64_t v6 = [MEMORY[0x263F1C550] clearColor];
  [(UICollectionView *)self->_collectionView setBackgroundColor:v6];

  [(UICollectionView *)self->_collectionView setContentInsetAdjustmentBehavior:2];
  [(UICollectionView *)self->_collectionView setDataSource:self];
  uint64_t v7 = self->_collectionView;
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = +[AVTGroupDialCell cellIdentifier];
  [(UICollectionView *)v7 registerClass:v8 forCellWithReuseIdentifier:v9];

  [(AVTGroupDial *)self addSubview:self->_collectionView];
  [(UICollectionView *)self->_collectionView setDecelerationRate:*MEMORY[0x263F1D5C8]];
  double v10 = [AVTCenteringCollectionViewDelegate alloc];
  double v11 = self->_collectionView;
  v12 = [(AVTGroupDial *)self environment];
  objc_super v13 = [(AVTCenteringCollectionViewDelegate *)v10 initWithCollectionView:v11 delegate:self environment:v12];
  centeringCollectionViewDelegate = self->_centeringCollectionViewDelegate;
  self->_centeringCollectionViewDelegate = v13;

  double v15 = objc_opt_class();
  cachedGroupTitleSizes = self->_cachedGroupTitleSizes;
  [(AVTGroupDial *)self bounds];
  uint64_t v17 = [v15 shouldScrollGivenTitleSizes:cachedGroupTitleSizes fittingWidth:CGRectGetWidth(v21)];
  uint64_t v18 = self;
  if (v17) {
    uint64_t v18 = self->_centeringCollectionViewDelegate;
  }
  [(UICollectionView *)self->_collectionView setDelegate:v18];
  [(UICollectionView *)self->_collectionView setScrollEnabled:v17];
}

- (void)setContentPadding:(double)a3
{
  double v5 = [(AVTGroupDial *)self collectionViewLayout];
  objc_msgSend(v5, "setSectionInset:", a3, 0.0, a3, 0.0);

  id v6 = [(AVTGroupDial *)self collectionViewLayout];
  [v6 invalidateLayout];
}

- (void)layoutSubviews
{
  [(AVTGroupDial *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v11 = [(AVTGroupDial *)self collectionView];
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

  [(AVTGroupDial *)self cellSizeForItemAtIndex:0];
  v12 = [(AVTGroupDial *)self groupItems];
  -[AVTGroupDial cellSizeForItemAtIndex:](self, "cellSizeForItemAtIndex:", [v12 count] - 1);

  objc_super v13 = objc_opt_class();
  double v14 = [(AVTGroupDial *)self cachedGroupTitleSizes];
  [(AVTGroupDial *)self bounds];
  uint64_t v15 = [v13 shouldScrollGivenTitleSizes:v14 fittingWidth:CGRectGetWidth(v52)];

  if (v15)
  {
    double v16 = [(AVTGroupDial *)self collectionView];
    [v16 bounds];
    +[AVTCenteringCollectionViewHelper insetsForBounds:withFirstCellSize:lastCellSize:](AVTCenteringCollectionViewHelper, "insetsForBounds:withFirstCellSize:lastCellSize:");
    double v18 = v17;
    double v20 = v19;
    double v22 = v21;
    double v24 = v23;

    [(AVTGroupDial *)self bounds];
    double v26 = v25;
    double v28 = v27;
    double v30 = v29;
    double v32 = v31;
    v33 = [(AVTGroupDial *)self maskingView];
    objc_msgSend(v33, "setFrame:", v26, v28, v30, v32);

    v34 = [(AVTGroupDial *)self centeringCollectionViewDelegate];
    v35 = [(AVTGroupDial *)self collectionView];
    [v35 setDelegate:v34];
  }
  else
  {
    [(AVTGroupDial *)self bounds];
    double v37 = v36;
    v38 = objc_opt_class();
    v39 = [(AVTGroupDial *)self cachedGroupTitleSizes];
    [v38 estimatedContentWidthForTitleSizes:v39];
    double v20 = (v37 - v40) * 0.5;

    double v18 = 0.0;
    [(AVTGroupDial *)self setMaskView:0];
    v34 = [(AVTGroupDial *)self collectionView];
    [v34 setDelegate:self];
    double v22 = 0.0;
    double v24 = v20;
  }

  v41 = [(AVTGroupDial *)self collectionView];
  [v41 contentInset];
  if (v45 == v20 && v42 == v18 && v44 == v24)
  {
    double v48 = v43;

    if (v48 == v22) {
      goto LABEL_14;
    }
  }
  else
  {
  }
  v49 = [(AVTGroupDial *)self collectionView];
  objc_msgSend(v49, "setContentInset:", v18, v20, v22, v24);

LABEL_14:
  int64_t v50 = [(AVTGroupDial *)self currentSelectedItemIndex];
  [(AVTGroupDial *)self selectItemAtIndex:v50 updateScrollPosition:v15 animated:0];
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(AVTGroupDial *)self frame];
  v22.origin.double x = v8;
  v22.origin.double y = v9;
  v22.size.double width = v10;
  v22.size.double height = v11;
  v20.origin.double x = x;
  v20.origin.double y = y;
  v20.size.double width = width;
  v20.size.double height = height;
  if (CGRectEqualToRect(v20, v22))
  {
    v18.receiver = self;
    v18.super_class = (Class)AVTGroupDial;
    -[AVTGroupDial setFrame:](&v18, sel_setFrame_, x, y, width, height);
    v12 = objc_opt_class();
    objc_super v13 = [(AVTGroupDial *)self cachedGroupTitleSizes];
    v21.origin.double x = x;
    v21.origin.double y = y;
    v21.size.double width = width;
    v21.size.double height = height;
    uint64_t v14 = [v12 shouldScrollGivenTitleSizes:v13 fittingWidth:CGRectGetWidth(v21)];

    uint64_t v15 = self;
    if (v14)
    {
      uint64_t v15 = [(AVTGroupDial *)self centeringCollectionViewDelegate];
    }
    double v16 = [(AVTGroupDial *)self collectionView];
    [v16 setDelegate:v15];

    if (v14) {
    double v17 = [(AVTGroupDial *)self collectionView];
    }
    [v17 setScrollEnabled:v14];
  }
  else
  {
    v19.receiver = self;
    v19.super_class = (Class)AVTGroupDial;
    -[AVTGroupDial setFrame:](&v19, sel_setFrame_, x, y, width, height);
  }
}

- (void)setBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(AVTGroupDial *)self bounds];
  v22.origin.double x = v8;
  v22.origin.double y = v9;
  v22.size.double width = v10;
  v22.size.double height = v11;
  v20.origin.double x = x;
  v20.origin.double y = y;
  v20.size.double width = width;
  v20.size.double height = height;
  if (CGRectEqualToRect(v20, v22))
  {
    v18.receiver = self;
    v18.super_class = (Class)AVTGroupDial;
    -[AVTGroupDial setBounds:](&v18, sel_setBounds_, x, y, width, height);
    v12 = objc_opt_class();
    objc_super v13 = [(AVTGroupDial *)self cachedGroupTitleSizes];
    v21.origin.double x = x;
    v21.origin.double y = y;
    v21.size.double width = width;
    v21.size.double height = height;
    uint64_t v14 = [v12 shouldScrollGivenTitleSizes:v13 fittingWidth:CGRectGetWidth(v21)];

    uint64_t v15 = self;
    if (v14)
    {
      uint64_t v15 = [(AVTGroupDial *)self centeringCollectionViewDelegate];
    }
    double v16 = [(AVTGroupDial *)self collectionView];
    [v16 setDelegate:v15];

    if (v14) {
    double v17 = [(AVTGroupDial *)self collectionView];
    }
    [v17 setScrollEnabled:v14];
  }
  else
  {
    v19.receiver = self;
    v19.super_class = (Class)AVTGroupDial;
    -[AVTGroupDial setBounds:](&v19, sel_setBounds_, x, y, width, height);
  }
}

- (void)setSelectedGroupIndex:(int64_t)a3
{
}

- (void)setSelectedGroupIndex:(int64_t)a3 animated:(BOOL)a4
{
  if ((a3 & 0x8000000000000000) == 0)
  {
    BOOL v4 = a4;
    double v7 = [(AVTGroupDial *)self groupItems];
    unint64_t v8 = [v7 count];

    if (v8 > a3)
    {
      CGFloat v9 = [(AVTGroupDial *)self window];

      if (v9)
      {
        CGFloat v10 = objc_opt_class();
        id v11 = [(AVTGroupDial *)self cachedGroupTitleSizes];
        [(AVTGroupDial *)self bounds];
        -[AVTGroupDial selectItemAtIndex:updateScrollPosition:animated:](self, "selectItemAtIndex:updateScrollPosition:animated:", a3, [v10 shouldScrollGivenTitleSizes:v11 fittingWidth:CGRectGetWidth(v13)], v4);
      }
      else
      {
        [(AVTGroupDial *)self setCurrentSelectedItemIndex:a3];
      }
    }
  }
}

- (void)startDiscoverability
{
  double v3 = [(AVTGroupDial *)self groupItems];
  unint64_t v4 = [v3 count];

  if (v4 >= 2)
  {
    unint64_t v5 = [(AVTGroupDial *)self selectedGroupIndex] + 1;
    double v6 = [(AVTGroupDial *)self groupItems];
    unint64_t v7 = [v6 count];

    if (v5 >= v7) {
      unint64_t v5 = [(AVTGroupDial *)self selectedGroupIndex] - 1;
    }
    unint64_t v8 = [(AVTGroupDial *)self shimmeringItemIndexPath];
    uint64_t v9 = [v8 item];

    if (v9 != v5)
    {
      [(AVTGroupDial *)self stopDiscoverability];
      CGFloat v10 = [MEMORY[0x263F088C8] indexPathForItem:v5 inSection:0];
      [(AVTGroupDial *)self setShimmeringItemIndexPath:v10];

      id v11 = [(AVTGroupDial *)self collectionView];
      v12 = [(AVTGroupDial *)self shimmeringItemIndexPath];
      id v13 = [v11 cellForItemAtIndexPath:v12];

      [v13 startShimmering];
    }
  }
}

- (void)stopDiscoverability
{
  double v3 = [(AVTGroupDial *)self shimmeringItemIndexPath];

  if (v3)
  {
    unint64_t v4 = [(AVTGroupDial *)self collectionView];
    unint64_t v5 = [(AVTGroupDial *)self shimmeringItemIndexPath];
    id v6 = [v4 cellForItemAtIndexPath:v5];

    [v6 stopShimmeringAnimated:1];
    [(AVTGroupDial *)self setShimmeringItemIndexPath:0];
  }
}

- (void)reloadData
{
  [(AVTGroupDial *)self cacheTitleSizes];
  id v3 = [(AVTGroupDial *)self collectionView];
  [v3 reloadData];
}

- (CGSize)cellSizeForItemAtIndex:(int64_t)a3
{
  unint64_t v5 = [(AVTGroupDial *)self cachedGroupTitleSizes];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    unint64_t v7 = [(AVTGroupDial *)self cachedGroupTitleSizes];
    unint64_t v8 = [v7 objectAtIndexedSubscript:a3];

    [v8 CGSizeValue];
    double v10 = v9;
    double v12 = v11 + 20.0;
  }
  else
  {
    double v12 = *MEMORY[0x263F001B0];
    double v10 = *(double *)(MEMORY[0x263F001B0] + 8);
  }
  double v13 = v12;
  double v14 = v10;
  result.double height = v14;
  result.double width = v13;
  return result;
}

- (void)selectItemAtIndex:(int64_t)a3 updateScrollPosition:(BOOL)a4 animated:(BOOL)a5
{
  if ((a3 & 0x8000000000000000) == 0)
  {
    BOOL v5 = a5;
    BOOL v6 = a4;
    double v9 = [(AVTGroupDial *)self groupItems];
    unint64_t v10 = [v9 count];

    if (v10 > a3)
    {
      int64_t v11 = [(AVTGroupDial *)self currentSelectedItemIndex];
      [(AVTGroupDial *)self setCurrentSelectedItemIndex:a3];
      id v26 = [MEMORY[0x263F088C8] indexPathForItem:a3 inSection:0];
      double v12 = [MEMORY[0x263F088C8] indexPathForItem:v11 inSection:0];
      [(AVTGroupDial *)self updateSelectedState:0 forItemAtIndexPath:v12 animated:v5];
      double v13 = [(AVTGroupDial *)self collectionView];
      [v13 selectItemAtIndexPath:v26 animated:v5 scrollPosition:0];

      if (v6)
      {
        [(AVTGroupDial *)self layoutIfNeeded];
        double v14 = [(AVTGroupDial *)self collectionView];
        uint64_t v15 = [v14 layoutAttributesForItemAtIndexPath:v26];

        [v15 frame];
        UIRectGetCenter();
        double v17 = v16;
        double v19 = v18;
        CGRect v20 = [(AVTGroupDial *)self collectionView];
        +[AVTCenteringCollectionViewHelper contentOffsetForCenteringPoint:collectionView:](AVTCenteringCollectionViewHelper, "contentOffsetForCenteringPoint:collectionView:", v20, v17, v19);
        double v22 = v21;
        double v24 = v23;

        double v25 = [(AVTGroupDial *)self collectionView];
        objc_msgSend(v25, "setContentOffset:animated:", v5, v22, v24);
      }
      if (!v5 || v11 == [(AVTGroupDial *)self currentSelectedItemIndex]) {
        [(AVTGroupDial *)self updateSelectedState:1 forItemAtIndexPath:v26 animated:v5];
      }
    }
  }
}

- (void)updateSelectedState:(BOOL)a3 forItemAtIndexPath:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a3;
  id v8 = a4;
  double v9 = [(AVTGroupDial *)self collectionView];
  id v10 = [v9 cellForItemAtIndexPath:v8];

  [v10 setActiveItem:v6 animated:v5];
}

- (void)updateForEndingScroll
{
  [(AVTGroupDial *)self setIsMoving:0];
  if ([(AVTGroupDial *)self hasFinalizedSelection])
  {
    id v3 = [(AVTGroupDial *)self collectionView];
    [v3 contentOffset];
    double v5 = v4;
    double v7 = v6;
    id v8 = [(AVTGroupDial *)self collectionView];
    +[AVTCenteringCollectionViewHelper indexPathForNearestItemToCenterWithOffset:collectionView:](AVTCenteringCollectionViewHelper, "indexPathForNearestItemToCenterWithOffset:collectionView:", v8, v5, v7);
    id v10 = (id)objc_claimAutoreleasedReturnValue();

    -[AVTGroupDial setCurrentSelectedItemIndex:](self, "setCurrentSelectedItemIndex:", [v10 row]);
    [(AVTGroupDial *)self updateSelectedState:1 forItemAtIndexPath:v10 animated:1];
    double v9 = [(AVTGroupDial *)self delegate];
    objc_msgSend(v9, "groupPicker:didSelectGroupAtIndex:tapped:", self, -[AVTGroupDial currentSelectedItemIndex](self, "currentSelectedItemIndex"), 0);
  }
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return 1;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  double v4 = [(AVTGroupDial *)self groupItems];
  int64_t v5 = [v4 count];

  return v5;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  uint64_t v6 = objc_msgSend(a5, "row", a3, a4);
  [(AVTGroupDial *)self cellSizeForItemAtIndex:v6];
  result.double height = v8;
  result.double width = v7;
  return result;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  double v8 = +[AVTGroupDialCell cellIdentifier];
  double v9 = [v7 dequeueReusableCellWithReuseIdentifier:v8 forIndexPath:v6];

  id v10 = [(AVTGroupDial *)self groupItems];
  uint64_t v11 = [v6 row];

  double v12 = [v10 objectAtIndexedSubscript:v11];
  double v13 = [v12 localizedName];
  [v9 setString:v13];

  return v9;
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v13 = v7;
  uint64_t v9 = [v8 row];
  int64_t v10 = [(AVTGroupDial *)self currentSelectedItemIndex];
  [v13 setActiveItem:v9 == v10 animated:1];
  if (v9 != v10)
  {
    uint64_t v11 = [(AVTGroupDial *)self shimmeringItemIndexPath];
    int v12 = [v8 isEqual:v11];

    if (v12) {
      [v13 startShimmering];
    }
  }
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  [(AVTGroupDial *)self setIsMoving:1];
  [(AVTGroupDial *)self setHasFinalizedSelection:0];
  [(AVTGroupDial *)self stopDiscoverability];
}

- (void)scrollViewDidScroll:(id)a3
{
  id v16 = a3;
  double v4 = objc_opt_class();
  int64_t v5 = [(AVTGroupDial *)self cachedGroupTitleSizes];
  [(AVTGroupDial *)self bounds];
  LODWORD(v4) = [v4 shouldScrollGivenTitleSizes:v5 fittingWidth:CGRectGetWidth(v18)];

  if (v4)
  {
    if (objc_msgSend(v16, "avtui_isMoving"))
    {
      if (![(AVTGroupDial *)self hasFinalizedSelection])
      {
        int64_t v6 = [(AVTGroupDial *)self currentSelectedItemIndex];
        id v7 = [(AVTGroupDial *)self centeringCollectionViewDelegate];
        id v8 = [v7 centerItemAttributes];
        uint64_t v9 = [v8 indexPath];
        uint64_t v10 = [v9 item];

        if (v6 != v10)
        {
          uint64_t v11 = objc_msgSend(MEMORY[0x263F088C8], "indexPathForItem:inSection:", -[AVTGroupDial currentSelectedItemIndex](self, "currentSelectedItemIndex"), 0);
          int v12 = [(AVTGroupDial *)self centeringCollectionViewDelegate];
          id v13 = [v12 centerItemAttributes];
          double v14 = [v13 indexPath];

          [(AVTGroupDial *)self updateSelectedState:0 forItemAtIndexPath:v11 animated:1];
          uint64_t v15 = [(AVTGroupDial *)self delegate];
          objc_msgSend(v15, "groupPicker:didDeselectGroupAtIndex:", self, -[AVTGroupDial currentSelectedItemIndex](self, "currentSelectedItemIndex"));

          if (([v16 isDecelerating] & 1) == 0)
          {
            -[AVTGroupDial setCurrentSelectedItemIndex:](self, "setCurrentSelectedItemIndex:", [v14 item]);
            [(AVTGroupDial *)self updateSelectedState:1 forItemAtIndexPath:v14 animated:1];
          }
        }
      }
    }
  }
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v12 = a4;
  int64_t v5 = objc_msgSend(MEMORY[0x263F088C8], "indexPathForItem:inSection:", -[AVTGroupDial currentSelectedItemIndex](self, "currentSelectedItemIndex"), 0);
  -[AVTGroupDial setCurrentSelectedItemIndex:](self, "setCurrentSelectedItemIndex:", [v12 item]);
  char v6 = [v5 isEqual:v12];
  [(AVTGroupDial *)self stopDiscoverability];
  if (v6)
  {
    id v7 = [(AVTGroupDial *)self delegate];
    uint64_t v8 = [v12 item];
  }
  else
  {
    [(AVTGroupDial *)self updateSelectedState:0 forItemAtIndexPath:v5 animated:1];
    uint64_t v9 = [(AVTGroupDial *)self delegate];
    objc_msgSend(v9, "groupPicker:didDeselectGroupAtIndex:", self, objc_msgSend(v5, "item"));

    [(AVTGroupDial *)self updateSelectedState:1 forItemAtIndexPath:v12 animated:1];
    [(AVTGroupDial *)self setHasFinalizedSelection:1];
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = [(AVTGroupDial *)self cachedGroupTitleSizes];
    [(AVTGroupDial *)self bounds];
    LOBYTE(v10) = [(id)v10 shouldScrollGivenTitleSizes:v11 fittingWidth:CGRectGetWidth(v14)];

    if (v10)
    {
      [(AVTGroupDial *)self setIsMoving:1];
      goto LABEL_7;
    }
    id v7 = [(AVTGroupDial *)self delegate];
    uint64_t v8 = [(AVTGroupDial *)self currentSelectedItemIndex];
  }
  [v7 groupPicker:self didSelectGroupAtIndex:v8 tapped:1];

LABEL_7:
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  objc_msgSend(MEMORY[0x263F088C8], "indexPathForItem:inSection:", -[AVTGroupDial currentSelectedItemIndex](self, "currentSelectedItemIndex", a3, a4.x, a4.y), 0);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  [(AVTGroupDial *)self updateSelectedState:0 forItemAtIndexPath:v10 animated:1];
  id v7 = [(AVTGroupDial *)self delegate];
  objc_msgSend(v7, "groupPicker:didDeselectGroupAtIndex:", self, -[AVTGroupDial currentSelectedItemIndex](self, "currentSelectedItemIndex"));

  uint64_t v8 = [(AVTGroupDial *)self collectionView];
  uint64_t v9 = +[AVTCenteringCollectionViewHelper indexPathForNearestItemToCenterWithOffset:collectionView:](AVTCenteringCollectionViewHelper, "indexPathForNearestItemToCenterWithOffset:collectionView:", v8, a5->x, a5->y);

  -[AVTGroupDial setCurrentSelectedItemIndex:](self, "setCurrentSelectedItemIndex:", [v9 item]);
  [(AVTGroupDial *)self updateSelectedState:1 forItemAtIndexPath:v9 animated:1];
  [(AVTGroupDial *)self setHasFinalizedSelection:1];
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  if (!a4) {
    [(AVTGroupDial *)self updateForEndingScroll];
  }
}

- (AVTGroupPickerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->delegate);
  return (AVTGroupPickerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSArray)groupItems
{
  return self->_groupItems;
}

- (AVTUIEnvironment)environment
{
  return self->_environment;
}

- (NSArray)cachedGroupTitleSizes
{
  return self->_cachedGroupTitleSizes;
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (UICollectionViewFlowLayout)collectionViewLayout
{
  return self->_collectionViewLayout;
}

- (void)setCollectionViewLayout:(id)a3
{
}

- (AVTCenteringCollectionViewDelegate)centeringCollectionViewDelegate
{
  return self->_centeringCollectionViewDelegate;
}

- (unint64_t)currentScrollDirection
{
  return self->_currentScrollDirection;
}

- (void)setCurrentScrollDirection:(unint64_t)a3
{
  self->_currentScrollDirection = a3;
}

- (int64_t)currentSelectedItemIndex
{
  return self->_currentSelectedItemIndex;
}

- (void)setCurrentSelectedItemIndex:(int64_t)a3
{
  self->_currentSelectedItemIndedouble x = a3;
}

- (BOOL)isMoving
{
  return self->_isMoving;
}

- (void)setIsMoving:(BOOL)a3
{
  self->_isMoving = a3;
}

- (BOOL)hasFinalizedSelection
{
  return self->_hasFinalizedSelection;
}

- (void)setHasFinalizedSelection:(BOOL)a3
{
  self->_hasFinalizedSelection = a3;
}

- (AVTGroupDialMaskingView)maskingView
{
  return self->_maskingView;
}

- (void)setMaskingView:(id)a3
{
}

- (NSIndexPath)shimmeringItemIndexPath
{
  return self->_shimmeringItemIndexPath;
}

- (void)setShimmeringItemIndexPath:(id)a3
{
  self->_shimmeringItemIndexPath = (NSIndexPath *)a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maskingView, 0);
  objc_storeStrong((id *)&self->_centeringCollectionViewDelegate, 0);
  objc_storeStrong((id *)&self->_collectionViewLayout, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_cachedGroupTitleSizes, 0);
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_groupItems, 0);
  objc_destroyWeak((id *)&self->delegate);
}

@end