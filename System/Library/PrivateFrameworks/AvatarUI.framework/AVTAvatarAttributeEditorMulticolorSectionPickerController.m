@interface AVTAvatarAttributeEditorMulticolorSectionPickerController
+ (BOOL)shouldScrollGivenTitleSizes:(id)a3 fittingWidth:(double)a4 items:(id)a5;
+ (BOOL)shouldWrapTitlesForTitleSizes:(id)a3 items:(id)a4 forWidth:(double)a5;
+ (BOOL)supportsSelection;
+ (CGPoint)clampedContentOffsetForOffset:(CGPoint)a3 collectionView:(id)a4;
+ (CGSize)cellSizeForItemAtIndex:(int64_t)a3 forTitleSizes:(id)a4 items:(id)a5 forContainerWidth:(double)a6;
+ (double)estimatedContentHeightForWrappingTitleSizes:(id)a3 items:(id)a4 forWidth:(double)a5;
+ (double)estimatedContentWidthForTitleSizes:(id)a3 items:(id)a4;
+ (double)estimatedContentWidthForWrappingTitleSizes:(id)a3 items:(id)a4 forWidth:(double)a5;
- (AVTAvatarAttributeEditorControllerSubSelectionDelegate)delegate;
- (AVTAvatarAttributeEditorSection)section;
- (AVTUIEnvironment)environment;
- (BOOL)evaluateDisplayCondition:(id)a3;
- (CGSize)cellSizeForItemAtIndex:(int64_t)a3;
- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5;
- (CGSize)sizeForFocusingItemAtIndex:(int64_t)a3 fittingSize:(CGSize)a4;
- (CGSize)sizeForItemAtIndex:(int64_t)a3 fittingSize:(CGSize)a4;
- (NSArray)cachedTitleSizes;
- (UICollectionView)collectionView;
- (UICollectionViewFlowLayout)flowLayout;
- (UIEdgeInsets)edgeInsetsFittingSize:(CGSize)a3;
- (UIView)containerView;
- (double)currentOffsetX;
- (double)currentRelativeContentOffsetX;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)prefetchingSectionItemForIndex:(int64_t)a3;
- (id)sectionView;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)numberOfItems;
- (int64_t)selectedIndex;
- (unint64_t)indexForItem:(id)a3;
- (void)attributeSection:(id)a3 didChangeValueForSectionItem:(id)a4;
- (void)cacheTitleSizes;
- (void)cell:(id)a3 willDisplayAtIndex:(int64_t)a4;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)createCollectionView;
- (void)invalidateLayoutForNewContainerSize:(CGSize)a3;
- (void)multicolorPickerCellDidTapClearButton:(id)a3;
- (void)setCachedTitleSizes:(id)a3;
- (void)setCollectionView:(id)a3;
- (void)setContainerView:(id)a3;
- (void)setCurrentOffsetX:(double)a3;
- (void)setCurrentRelativeContentOffsetX:(double)a3;
- (void)setDelegate:(id)a3;
- (void)setFlowLayout:(id)a3;
- (void)setSelectedIndex:(int64_t)a3;
- (void)updateCell:(id)a3 forItemAtIndex:(int64_t)a4;
- (void)updateInsetsForSize:(CGSize)a3;
- (void)updateWithSection:(id)a3;
@end

@implementation AVTAvatarAttributeEditorMulticolorSectionPickerController

+ (BOOL)supportsSelection
{
  return 0;
}

+ (double)estimatedContentWidthForTitleSizes:(id)a3 items:(id)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  double v7 = 0.0;
  if (v5 && [v5 count])
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v8 = v5;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = 0;
      uint64_t v12 = *(void *)v23;
      double v13 = 0.0;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v23 != v12) {
            objc_enumerationMutation(v8);
          }
          [*(id *)(*((void *)&v22 + 1) + 8 * i) CGSizeValue];
          double v16 = v15;
          double v18 = v17;
          v19 = [v6 objectAtIndexedSubscript:v11 + i];
          if ([v19 isPlaceholder]) {
            +[AVTAvatarAttributeEditorMulticolorPickerPlaceholderCell estimatedWidthForLabelSize:](AVTAvatarAttributeEditorMulticolorPickerPlaceholderCell, "estimatedWidthForLabelSize:", v16, v18);
          }
          else {
            +[AVTAvatarAttributeEditorMulticolorPickerCell estimatedWidthForLabelSize:isRemovable:isSelected:](AVTAvatarAttributeEditorMulticolorPickerCell, "estimatedWidthForLabelSize:isRemovable:isSelected:", [v19 isRemovable], objc_msgSend(v19, "isSelected"), v16, v18);
          }
          double v13 = v13 + v20;
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
        v11 += i;
      }
      while (v10);
    }
    else
    {
      double v13 = 0.0;
    }

    double v7 = v13 + (double)(unint64_t)([v8 count] - 1) * 14.0;
  }

  return v7;
}

+ (double)estimatedContentWidthForWrappingTitleSizes:(id)a3 items:(id)a4 forWidth:(double)a5
{
  id v8 = a3;
  id v9 = a4;
  double v10 = 0.0;
  if (v8 && [v8 count])
  {
    if ([v9 count])
    {
      unint64_t v11 = 0;
      do
      {
        [a1 cellSizeForItemAtIndex:v11 forTitleSizes:v8 items:v9 forContainerWidth:a5];
        double v10 = v10 + v12;
        ++v11;
      }
      while ([v9 count] > v11);
    }
    double v10 = v10 + (double)(unint64_t)([v8 count] - 1) * 14.0;
  }

  return v10;
}

+ (double)estimatedContentHeightForWrappingTitleSizes:(id)a3 items:(id)a4 forWidth:(double)a5
{
  id v8 = a3;
  id v9 = a4;
  double v10 = 0.0;
  if (v8 && [v8 count] && objc_msgSend(v9, "count"))
  {
    unint64_t v11 = 0;
    do
    {
      [a1 cellSizeForItemAtIndex:v11 forTitleSizes:v8 items:v9 forContainerWidth:a5];
      if (v10 < v12) {
        double v10 = v12;
      }
      ++v11;
    }
    while ([v9 count] > v11);
  }

  return v10;
}

+ (BOOL)shouldWrapTitlesForTitleSizes:(id)a3 items:(id)a4 forWidth:(double)a5
{
  return 0;
}

+ (BOOL)shouldScrollGivenTitleSizes:(id)a3 fittingWidth:(double)a4 items:(id)a5
{
  [a1 estimatedContentWidthForTitleSizes:a3 items:a5];
  return v6 > a4;
}

+ (CGPoint)clampedContentOffsetForOffset:(CGPoint)a3 collectionView:(id)a4
{
  CGFloat y = a3.y;
  double x = a3.x;
  id v6 = a4;
  [v6 contentSize];
  double v8 = v7;
  [v6 contentInset];
  double v10 = v8 + v9;
  [v6 bounds];
  double v11 = v10 - CGRectGetWidth(v18);
  [v6 contentInset];
  double v13 = v12;

  double v14 = -v13;
  if (v11 >= x) {
    double v15 = x;
  }
  else {
    double v15 = v11;
  }
  if (v15 >= v14) {
    double v14 = v15;
  }
  double v16 = y;
  result.CGFloat y = v16;
  result.double x = v14;
  return result;
}

- (void)cacheTitleSizes
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  v3 = (void *)MEMORY[0x263EFF980];
  v4 = [(AVTAvatarAttributeEditorMulticolorSectionPickerController *)self section];
  id v5 = [v4 sectionItems];
  id v6 = objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v5, "count"));

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v24 = self;
  double v7 = [(AVTAvatarAttributeEditorMulticolorSectionPickerController *)self section];
  double v8 = [v7 sectionItems];

  uint64_t v9 = [v8 countByEnumeratingWithState:&v25 objects:v31 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v26;
    uint64_t v12 = *MEMORY[0x263F1C238];
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v26 != v11) {
          objc_enumerationMutation(v8);
        }
        double v14 = [*(id *)(*((void *)&v25 + 1) + 8 * i) localizedName];
        uint64_t v29 = v12;
        double v15 = [(id)objc_opt_class() labelFont];
        v30 = v15;
        double v16 = [NSDictionary dictionaryWithObjects:&v30 forKeys:&v29 count:1];
        [v14 sizeWithAttributes:v16];
        double v18 = v17;
        double v20 = v19;

        v21 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGSize:", v18, v20);
        [v6 addObject:v21];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v25 objects:v31 count:16];
    }
    while (v10);
  }

  uint64_t v22 = [v6 copy];
  cachedTitleSizes = v24->_cachedTitleSizes;
  v24->_cachedTitleSizes = (NSArray *)v22;
}

- (id)sectionView
{
  v3 = [(AVTAvatarAttributeEditorMulticolorSectionPickerController *)self containerView];

  if (!v3)
  {
    v4 = objc_msgSend(objc_alloc(MEMORY[0x263F1CB60]), "initWithFrame:", 0.0, 0.0, 50.0, 50.0);
    [(AVTAvatarAttributeEditorMulticolorSectionPickerController *)self setContainerView:v4];

    id v5 = [(AVTAvatarAttributeEditorMulticolorSectionPickerController *)self containerView];
    id v6 = [v5 layer];
    [v6 setMasksToBounds:0];
  }
  double v7 = [(AVTAvatarAttributeEditorMulticolorSectionPickerController *)self collectionView];

  if (!v7)
  {
    [(AVTAvatarAttributeEditorMulticolorSectionPickerController *)self cacheTitleSizes];
    [(AVTAvatarAttributeEditorMulticolorSectionPickerController *)self createCollectionView];
  }
  return [(AVTAvatarAttributeEditorMulticolorSectionPickerController *)self containerView];
}

- (void)createCollectionView
{
  long long v23 = objc_alloc_init(AVTFlippingCollectionViewFlowLayout);
  [(UICollectionViewFlowLayout *)v23 setScrollDirection:1];
  -[UICollectionViewFlowLayout setSectionInset:](v23, "setSectionInset:", *MEMORY[0x263F1D1C0], *(double *)(MEMORY[0x263F1D1C0] + 8), *(double *)(MEMORY[0x263F1D1C0] + 16), *(double *)(MEMORY[0x263F1D1C0] + 24));
  [(UICollectionViewFlowLayout *)v23 setMinimumInteritemSpacing:14.0];
  [(AVTAvatarAttributeEditorMulticolorSectionPickerController *)self setFlowLayout:v23];
  id v3 = objc_alloc(MEMORY[0x263F1C4E0]);
  v4 = [(AVTAvatarAttributeEditorMulticolorSectionPickerController *)self containerView];
  [v4 bounds];
  id v5 = (UICollectionView *)objc_msgSend(v3, "initWithFrame:collectionViewLayout:", v23);
  collectionView = self->_collectionView;
  self->_collectionView = v5;

  [(UICollectionView *)self->_collectionView setShowsVerticalScrollIndicator:0];
  [(UICollectionView *)self->_collectionView setShowsHorizontalScrollIndicator:0];
  double v7 = [MEMORY[0x263F1C550] clearColor];
  [(UICollectionView *)self->_collectionView setBackgroundColor:v7];

  double v8 = [(UICollectionView *)self->_collectionView layer];
  [v8 setMasksToBounds:0];

  [(UICollectionView *)self->_collectionView setContentInsetAdjustmentBehavior:2];
  [(UICollectionView *)self->_collectionView setDataSource:self];
  uint64_t v9 = self->_collectionView;
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = +[AVTAvatarAttributeEditorMulticolorPickerCell cellIdentifier];
  [(UICollectionView *)v9 registerClass:v10 forCellWithReuseIdentifier:v11];

  uint64_t v12 = self->_collectionView;
  uint64_t v13 = objc_opt_class();
  double v14 = +[AVTAvatarAttributeEditorMulticolorPickerPlaceholderCell cellIdentifier];
  [(UICollectionView *)v12 registerClass:v13 forCellWithReuseIdentifier:v14];

  [(UICollectionView *)self->_collectionView setAutoresizingMask:18];
  double v15 = [(AVTAvatarAttributeEditorMulticolorSectionPickerController *)self containerView];
  [v15 addSubview:self->_collectionView];

  [(UICollectionView *)self->_collectionView setDecelerationRate:*MEMORY[0x263F1D5C8]];
  double v16 = objc_opt_class();
  cachedTitleSizes = self->_cachedTitleSizes;
  double v18 = [(AVTAvatarAttributeEditorMulticolorSectionPickerController *)self containerView];
  [v18 bounds];
  double Width = CGRectGetWidth(v25);
  double v20 = [(AVTAvatarAttributeEditorMulticolorSectionPickerController *)self section];
  v21 = [v20 sectionItems];
  uint64_t v22 = [v16 shouldScrollGivenTitleSizes:cachedTitleSizes fittingWidth:v21 items:Width];

  [(UICollectionView *)self->_collectionView setDelegate:self];
  [(UICollectionView *)self->_collectionView setScrollEnabled:v22];
}

- (void)updateInsetsForSize:(CGSize)a3
{
  double width = a3.width;
  uint64_t v5 = objc_opt_class();
  id v6 = [(AVTAvatarAttributeEditorMulticolorSectionPickerController *)self cachedTitleSizes];
  double v7 = [(AVTAvatarAttributeEditorMulticolorSectionPickerController *)self section];
  double v8 = [v7 sectionItems];
  LOBYTE(v5) = [(id)v5 shouldScrollGivenTitleSizes:v6 fittingWidth:v8 items:width];

  if (v5)
  {
    double v9 = 20.0;
  }
  else
  {
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = [(AVTAvatarAttributeEditorMulticolorSectionPickerController *)self cachedTitleSizes];
    uint64_t v12 = [(AVTAvatarAttributeEditorMulticolorSectionPickerController *)self section];
    uint64_t v13 = [v12 sectionItems];
    [v10 adjustedWidthForTitleSizes:v11 items:v13 forWidth:width];
    double v9 = (width - v14) * 0.5;
  }
  double v15 = [(AVTAvatarAttributeEditorMulticolorSectionPickerController *)self collectionView];
  [v15 contentInset];
  double v19 = v18;
  if (v20 == v9 && v16 == 20.0 && v17 == v9)
  {

    if (v19 == 0.0) {
      return;
    }
  }
  else
  {
  }
  id v21 = [(AVTAvatarAttributeEditorMulticolorSectionPickerController *)self collectionView];
  objc_msgSend(v21, "setContentInset:", 20.0, v9, 0.0, v9);
}

- (void)cell:(id)a3 willDisplayAtIndex:(int64_t)a4
{
  id v22 = a3;
  [v22 bounds];
  double v6 = v5;
  -[AVTAvatarAttributeEditorMulticolorSectionPickerController updateInsetsForSize:](self, "updateInsetsForSize:", v5, v7);
  double v8 = objc_opt_class();
  double v9 = [(AVTAvatarAttributeEditorMulticolorSectionPickerController *)self cachedTitleSizes];
  uint64_t v10 = [(AVTAvatarAttributeEditorMulticolorSectionPickerController *)self section];
  uint64_t v11 = [v10 sectionItems];
  uint64_t v12 = [v8 shouldScrollGivenTitleSizes:v9 fittingWidth:v11 items:v6];

  uint64_t v13 = [(AVTAvatarAttributeEditorMulticolorSectionPickerController *)self collectionView];
  [v13 setScrollEnabled:v12];

  double v14 = [(AVTAvatarAttributeEditorMulticolorSectionPickerController *)self section];
  double v15 = [v14 sectionItems];
  uint64_t v16 = [v15 indexOfObjectPassingTest:&__block_literal_global_23];

  double v17 = [(AVTAvatarAttributeEditorMulticolorSectionPickerController *)self collectionView];
  double v18 = [v17 indexPathsForSelectedItems];
  double v19 = [v18 firstObject];

  if (!v19 || [v19 item] != v16)
  {
    double v20 = [(AVTAvatarAttributeEditorMulticolorSectionPickerController *)self collectionView];
    id v21 = [MEMORY[0x263F088C8] indexPathForItem:v16 inSection:0];
    [v20 selectItemAtIndexPath:v21 animated:0 scrollPosition:0];
  }
  [v22 layoutIfNeeded];
}

uint64_t __85__AVTAvatarAttributeEditorMulticolorSectionPickerController_cell_willDisplayAtIndex___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isSelected];
}

- (UIEdgeInsets)edgeInsetsFittingSize:(CGSize)a3
{
  double v3 = *MEMORY[0x263F1D1C0];
  double v4 = *(double *)(MEMORY[0x263F1D1C0] + 8);
  double v5 = *(double *)(MEMORY[0x263F1D1C0] + 16);
  double v6 = *(double *)(MEMORY[0x263F1D1C0] + 24);
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (BOOL)evaluateDisplayCondition:(id)a3
{
  return 1;
}

- (unint64_t)indexForItem:(id)a3
{
  return 0;
}

- (void)invalidateLayoutForNewContainerSize:(CGSize)a3
{
  double v4 = [(AVTAvatarAttributeEditorMulticolorSectionPickerController *)self collectionView];
  double v5 = [v4 collectionViewLayout];
  [v5 invalidateLayout];

  id v8 = [(AVTAvatarAttributeEditorMulticolorSectionPickerController *)self containerView];
  [v8 bounds];
  -[AVTAvatarAttributeEditorMulticolorSectionPickerController updateInsetsForSize:](self, "updateInsetsForSize:", v6, v7);
}

- (int64_t)numberOfItems
{
  return 1;
}

- (id)prefetchingSectionItemForIndex:(int64_t)a3
{
  return 0;
}

- (CGSize)sizeForFocusingItemAtIndex:(int64_t)a3 fittingSize:(CGSize)a4
{
  CGFloat width = a4.width;
  double v5 = [(AVTAvatarAttributeEditorMulticolorSectionPickerController *)self containerView];
  [v5 bounds];
  double v7 = v6;

  double v8 = width;
  double v9 = v7;
  result.height = v9;
  result.CGFloat width = v8;
  return result;
}

- (CGSize)sizeForItemAtIndex:(int64_t)a3 fittingSize:(CGSize)a4
{
  double width = a4.width;
  uint64_t v6 = [(AVTAvatarAttributeEditorMulticolorSectionPickerController *)self cachedTitleSizes];
  if (v6
    && (double v7 = (void *)v6,
        [(AVTAvatarAttributeEditorMulticolorSectionPickerController *)self cachedTitleSizes],
        double v8 = objc_claimAutoreleasedReturnValue(),
        uint64_t v9 = [v8 count],
        v8,
        v7,
        v9))
  {
    uint64_t v10 = [(AVTAvatarAttributeEditorMulticolorSectionPickerController *)self cachedTitleSizes];
    uint64_t v11 = [v10 objectAtIndexedSubscript:0];

    [v11 CGSizeValue];
    double v13 = v12;
    double v14 = objc_opt_class();
    double v15 = [(AVTAvatarAttributeEditorMulticolorSectionPickerController *)self cachedTitleSizes];
    uint64_t v16 = [(AVTAvatarAttributeEditorMulticolorSectionPickerController *)self section];
    double v17 = [v16 sectionItems];
    LODWORD(v14) = [v14 shouldWrapTitlesForTitleSizes:v15 items:v17 forWidth:width];

    double v18 = objc_opt_class();
    double v19 = [(AVTAvatarAttributeEditorMulticolorSectionPickerController *)self cachedTitleSizes];
    double v20 = [(AVTAvatarAttributeEditorMulticolorSectionPickerController *)self section];
    id v21 = [v20 sectionItems];
    [v18 estimatedContentHeightForWrappingTitleSizes:v19 items:v21 forWidth:width];
    double v23 = v22;

    double v24 = v13 + 22.0;
    if (v14) {
      double v24 = v23;
    }
    double v25 = ceil(v24 + 20.0);
  }
  else
  {
    double v25 = 60.0;
  }
  double v26 = width;
  double v27 = v25;
  result.height = v27;
  result.double width = v26;
  return result;
}

- (CGSize)cellSizeForItemAtIndex:(int64_t)a3
{
  double v5 = [(AVTAvatarAttributeEditorMulticolorSectionPickerController *)self cachedTitleSizes];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    double v7 = objc_opt_class();
    double v8 = [(AVTAvatarAttributeEditorMulticolorSectionPickerController *)self cachedTitleSizes];
    uint64_t v9 = [(AVTAvatarAttributeEditorMulticolorSectionPickerController *)self section];
    uint64_t v10 = [v9 sectionItems];
    uint64_t v11 = [(AVTAvatarAttributeEditorMulticolorSectionPickerController *)self containerView];
    [v11 bounds];
    [v7 cellSizeForItemAtIndex:a3 forTitleSizes:v8 items:v10 forContainerWidth:v12];
    double v14 = v13;
    double v16 = v15;
  }
  else
  {
    double v14 = *MEMORY[0x263F001B0];
    double v16 = *(double *)(MEMORY[0x263F001B0] + 8);
  }
  double v17 = v14;
  double v18 = v16;
  result.height = v18;
  result.double width = v17;
  return result;
}

+ (CGSize)cellSizeForItemAtIndex:(int64_t)a3 forTitleSizes:(id)a4 items:(id)a5 forContainerWidth:(double)a6
{
  v40[1] = *MEMORY[0x263EF8340];
  id v10 = a4;
  id v11 = a5;
  if ([v11 count] <= (unint64_t)a3)
  {
    double v21 = *MEMORY[0x263F001B0];
    double v20 = *(double *)(MEMORY[0x263F001B0] + 8);
  }
  else
  {
    double v12 = [v11 objectAtIndexedSubscript:a3];
    double v13 = [v10 objectAtIndexedSubscript:a3];
    [v13 CGSizeValue];
    double v15 = v14;
    double v17 = v16;
    if (v12)
    {
      uint64_t v18 = [v12 isRemovable];
      uint64_t v19 = [v12 isSelected];
    }
    else
    {
      uint64_t v18 = 0;
      uint64_t v19 = 0;
    }
    if ([a1 shouldWrapTitlesForTitleSizes:v10 items:v11 forWidth:a6])
    {
      double v22 = a6 + -30.0 + (double)(unint64_t)([v11 count] - 1) * -14.0;
      double v23 = v22 / (double)(unint64_t)[v11 count];
      if ([v12 isPlaceholder]) {
        +[AVTAvatarAttributeEditorMulticolorPickerPlaceholderCell estimatedTitleSpaceForWidth:v23];
      }
      else {
        +[AVTAvatarAttributeEditorMulticolorPickerCell estimatedTitleSpaceForWidth:v18 isRemovable:v19 isSelected:v23];
      }
      double v25 = v24;
      double v26 = [(id)objc_opt_class() labelFont];
      double v27 = [v12 localizedName];
      uint64_t v39 = *MEMORY[0x263F1C238];
      v40[0] = v26;
      long long v28 = [NSDictionary dictionaryWithObjects:v40 forKeys:&v39 count:1];
      objc_msgSend(v27, "boundingRectWithSize:options:attributes:context:", 1, v28, 0, v25, 1.79769313e308);
      double v30 = v29;
      double v32 = v31;

      [v26 lineHeight];
      double v34 = ceil(v33 + v33) + 3.0;
      double v15 = ceil(v30);
      double v35 = ceil(v32);
      if (v35 >= v34) {
        double v17 = v34;
      }
      else {
        double v17 = v35;
      }
    }
    if ([v12 isPlaceholder]) {
      +[AVTAvatarAttributeEditorMulticolorPickerPlaceholderCell estimatedWidthForLabelSize:](AVTAvatarAttributeEditorMulticolorPickerPlaceholderCell, "estimatedWidthForLabelSize:", v15, v17);
    }
    else {
      +[AVTAvatarAttributeEditorMulticolorPickerCell estimatedWidthForLabelSize:isRemovable:isSelected:](AVTAvatarAttributeEditorMulticolorPickerCell, "estimatedWidthForLabelSize:isRemovable:isSelected:", v18, v19, v15, v17);
    }
    double v21 = v36;
    double v20 = v17 + 22.0;
  }
  double v37 = v21;
  double v38 = v20;
  result.height = v38;
  result.double width = v37;
  return result;
}

- (void)updateCell:(id)a3 forItemAtIndex:(int64_t)a4
{
  id v6 = a3;
  id v8 = [(AVTAvatarAttributeEditorMulticolorSectionPickerController *)self viewForIndex:a4];
  double v7 = [v6 contentView];
  [v7 bounds];
  objc_msgSend(v8, "setFrame:");

  [v6 setAttributeView:v8];
}

- (void)updateWithSection:(id)a3
{
  uint64_t isKindOfClass = (uint64_t)a3;
  uint64_t v6 = isKindOfClass;
  if (self->_section != (AVTAvatarAttributeEditorSection *)isKindOfClass)
  {
    uint64_t v26 = isKindOfClass;
    [(AVTAvatarAttributeEditorMulticolorSectionPickerController *)self currentRelativeContentOffsetX];
    -[AVTAvatarAttributeEditorMulticolorSectionPickerController setCurrentOffsetX:](self, "setCurrentOffsetX:");
    objc_opt_class();
    uint64_t isKindOfClass = objc_opt_isKindOfClass();
    uint64_t v6 = v26;
    if (isKindOfClass)
    {
      objc_storeStrong((id *)&self->_section, a3);
      [(AVTAvatarAttributeEditorMulticolorSectionPickerController *)self cacheTitleSizes];
      double v7 = [(AVTAvatarAttributeEditorMulticolorSectionPickerController *)self containerView];
      [v7 bounds];
      -[AVTAvatarAttributeEditorMulticolorSectionPickerController updateInsetsForSize:](self, "updateInsetsForSize:", v8, v9);

      id v10 = [(AVTAvatarAttributeEditorMulticolorSectionPickerController *)self collectionView];
      [v10 reloadData];

      id v11 = objc_opt_class();
      double v12 = [(AVTAvatarAttributeEditorMulticolorSectionPickerController *)self cachedTitleSizes];
      double v13 = [(AVTAvatarAttributeEditorMulticolorSectionPickerController *)self containerView];
      [v13 bounds];
      double v15 = v14;
      double v16 = [(AVTAvatarAttributeEditorMulticolorSectionPickerController *)self section];
      double v17 = [v16 sectionItems];
      uint64_t v18 = [v11 shouldScrollGivenTitleSizes:v12 fittingWidth:v17 items:v15];

      uint64_t v19 = [(AVTAvatarAttributeEditorMulticolorSectionPickerController *)self section];
      double v20 = [v19 sectionItems];
      uint64_t v21 = [v20 indexOfObjectPassingTest:&__block_literal_global_12];

      double v22 = [(AVTAvatarAttributeEditorMulticolorSectionPickerController *)self collectionView];
      [v22 setScrollEnabled:v18];

      double v23 = 0.0;
      if (v18) {
        [(AVTAvatarAttributeEditorMulticolorSectionPickerController *)self currentOffsetX];
      }
      [(AVTAvatarAttributeEditorMulticolorSectionPickerController *)self setCurrentRelativeContentOffsetX:v23];
      double v24 = [(AVTAvatarAttributeEditorMulticolorSectionPickerController *)self collectionView];
      double v25 = [MEMORY[0x263F088C8] indexPathForItem:v21 inSection:0];
      [v24 selectItemAtIndexPath:v25 animated:0 scrollPosition:0];

      uint64_t v6 = v26;
    }
  }
  MEMORY[0x270F9A758](isKindOfClass, v6);
}

uint64_t __79__AVTAvatarAttributeEditorMulticolorSectionPickerController_updateWithSection___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isSelected];
}

- (double)currentRelativeContentOffsetX
{
  double v3 = [(AVTAvatarAttributeEditorMulticolorSectionPickerController *)self collectionView];
  [v3 contentOffset];
  double v5 = v4;
  uint64_t v6 = [(AVTAvatarAttributeEditorMulticolorSectionPickerController *)self collectionView];
  [v6 contentInset];
  double v8 = v5 + v7;

  return v8;
}

- (void)setCurrentRelativeContentOffsetX:(double)a3
{
  double v5 = [(AVTAvatarAttributeEditorMulticolorSectionPickerController *)self collectionView];
  [v5 contentSize];
  double v7 = v6;
  double v8 = [(AVTAvatarAttributeEditorMulticolorSectionPickerController *)self collectionView];
  [v8 bounds];
  double Width = CGRectGetWidth(v30);
  id v10 = [(AVTAvatarAttributeEditorMulticolorSectionPickerController *)self collectionView];
  [v10 contentInset];
  double v12 = v11;
  double v13 = [(AVTAvatarAttributeEditorMulticolorSectionPickerController *)self collectionView];
  [v13 contentInset];
  double v15 = Width - (v12 + v14);

  double v16 = [(AVTAvatarAttributeEditorMulticolorSectionPickerController *)self collectionView];
  [v16 contentInset];
  double v18 = v17;

  uint64_t v19 = [(AVTAvatarAttributeEditorMulticolorSectionPickerController *)self collectionView];
  [v19 contentOffset];
  double v21 = v20;

  if (v7 <= v15)
  {
    double v23 = [(AVTAvatarAttributeEditorMulticolorSectionPickerController *)self collectionView];
    [v23 contentInset];
    double v25 = -v27;
  }
  else
  {
    double v22 = objc_opt_class();
    double v23 = [(AVTAvatarAttributeEditorMulticolorSectionPickerController *)self collectionView];
    objc_msgSend(v22, "clampedContentOffsetForOffset:collectionView:", v23, a3 - v18, v21);
    double v25 = v24;
    double v21 = v26;
  }

  id v28 = [(AVTAvatarAttributeEditorMulticolorSectionPickerController *)self collectionView];
  objc_msgSend(v28, "setContentOffset:", v25, v21);
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  double v8 = [(AVTAvatarAttributeEditorMulticolorSectionPickerController *)self section];
  double v9 = [v8 sectionItems];
  id v10 = objc_msgSend(v9, "objectAtIndexedSubscript:", objc_msgSend(v6, "row"));

  if ([v10 isPlaceholder])
  {
    double v11 = +[AVTAvatarAttributeEditorMulticolorPickerPlaceholderCell cellIdentifier];
    double v12 = [v7 dequeueReusableCellWithReuseIdentifier:v11 forIndexPath:v6];

    [v12 setItem:v10];
  }
  else
  {
    double v13 = +[AVTAvatarAttributeEditorMulticolorPickerCell cellIdentifier];
    double v12 = [v7 dequeueReusableCellWithReuseIdentifier:v13 forIndexPath:v6];

    [v12 setItem:v10];
    double v14 = [v12 delegate];

    if (v14 != self) {
      [v12 setDelegate:self];
    }
  }

  return v12;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  double v4 = [(AVTAvatarAttributeEditorMulticolorSectionPickerController *)self section];
  double v5 = [v4 sectionItems];
  int64_t v6 = [v5 count];

  return v6;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  uint64_t v6 = objc_msgSend(a5, "row", a3, a4);
  [(AVTAvatarAttributeEditorMulticolorSectionPickerController *)self cellSizeForItemAtIndex:v6];
  result.height = v8;
  result.double width = v7;
  return result;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v5 = a4;
  id v10 = [(AVTAvatarAttributeEditorMulticolorSectionPickerController *)self section];
  uint64_t v6 = [v10 items];
  uint64_t v7 = [v5 item];

  double v8 = [v6 objectAtIndexedSubscript:v7];

  double v9 = [(AVTAvatarAttributeEditorMulticolorSectionPickerController *)self delegate];
  [v9 attributeEditorSectionController:self didSelectSectionItem:v8];
}

- (void)attributeSection:(id)a3 didChangeValueForSectionItem:(id)a4
{
  id v5 = [(AVTAvatarAttributeEditorMulticolorSectionPickerController *)self collectionView];
  uint64_t v6 = [v5 indexPathsForSelectedItems];
  id v12 = [v6 firstObject];

  if (v12)
  {
    uint64_t v7 = [(AVTAvatarAttributeEditorMulticolorSectionPickerController *)self collectionView];
    double v8 = [(AVTAvatarAttributeEditorMulticolorSectionPickerController *)self collectionView];
    double v9 = [v8 indexPathsForSelectedItems];
    id v10 = [v9 firstObject];
    double v11 = [v7 cellForItemAtIndexPath:v10];

    [v11 updateColor];
  }
}

- (void)multicolorPickerCellDidTapClearButton:(id)a3
{
  id v4 = a3;
  id v5 = [(AVTAvatarAttributeEditorMulticolorSectionPickerController *)self collectionView];
  id v13 = [v5 indexPathForCell:v4];

  uint64_t v6 = [(AVTAvatarAttributeEditorMulticolorSectionPickerController *)self section];
  uint64_t v7 = [v6 sectionItems];
  uint64_t v8 = [v13 item];
  double v9 = [(AVTAvatarAttributeEditorMulticolorSectionPickerController *)self section];
  id v10 = [v9 sectionItems];
  double v11 = objc_msgSend(v7, "subarrayWithRange:", v8, objc_msgSend(v10, "count") - objc_msgSend(v13, "item"));

  id v12 = [(AVTAvatarAttributeEditorMulticolorSectionPickerController *)self delegate];
  [v12 attributeEditorSectionController:self didDeleteSectionItems:v11];
}

- (AVTAvatarAttributeEditorControllerSubSelectionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (AVTAvatarAttributeEditorControllerSubSelectionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (AVTAvatarAttributeEditorSection)section
{
  return self->_section;
}

- (int64_t)selectedIndex
{
  return self->_selectedIndex;
}

- (void)setSelectedIndex:(int64_t)a3
{
  self->_selectedIndedouble x = a3;
}

- (UIView)containerView
{
  return self->_containerView;
}

- (void)setContainerView:(id)a3
{
}

- (AVTUIEnvironment)environment
{
  return self->_environment;
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (void)setCollectionView:(id)a3
{
}

- (UICollectionViewFlowLayout)flowLayout
{
  return self->_flowLayout;
}

- (void)setFlowLayout:(id)a3
{
}

- (double)currentOffsetX
{
  return self->_currentOffsetX;
}

- (void)setCurrentOffsetX:(double)a3
{
  self->_currentOffsetX = a3;
}

- (NSArray)cachedTitleSizes
{
  return self->_cachedTitleSizes;
}

- (void)setCachedTitleSizes:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedTitleSizes, 0);
  objc_storeStrong((id *)&self->_flowLayout, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_section, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end