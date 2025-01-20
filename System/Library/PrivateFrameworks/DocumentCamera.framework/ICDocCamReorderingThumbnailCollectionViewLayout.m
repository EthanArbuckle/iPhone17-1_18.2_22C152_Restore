@interface ICDocCamReorderingThumbnailCollectionViewLayout
+ (double)effectiveAspectRatioForSize:(CGSize)a3;
- (BOOL)isScrollingBetweenPages;
- (BOOL)isScrubbing;
- (BOOL)isUndergoingOrientationChange;
- (BOOL)layoutCacheIsValid;
- (BOOL)movingItem;
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3;
- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)a3 withScrollingVelocity:(CGPoint)a4;
- (CGSize)cachedContentSize;
- (CGSize)collectionViewContentSize;
- (CGSize)itemSizeForImageSize:(CGSize)a3;
- (ICDocCamReorderingThumbnailCollectionViewLayout)initWithDelegate:(id)a3;
- (ICDocCamThumbnailViewLayoutDelegate)delegate;
- (NSArray)itemAttributes;
- (NSMutableArray)deleteIndexPaths;
- (NSMutableArray)imageSizeCache;
- (NSMutableArray)insertIndexPaths;
- (double)currentInterPageScrollPosition;
- (double)extraSpacingForCurrentItem;
- (double)horizontalContentOffsetAdjustmentForItem:(unint64_t)a3;
- (double)horizontalContentOffsetForItem:(unint64_t)a3;
- (double)itemHeight;
- (double)itemSpacing;
- (double)leftMargin;
- (double)rightMargin;
- (double)topBottomMargins;
- (id)finalLayoutAttributesForDisappearingItemAtIndexPath:(id)a3;
- (id)initialLayoutAttributesForAppearingItemAtIndexPath:(id)a3;
- (id)layoutAttributesForElementsInRect:(CGRect)a3;
- (id)layoutAttributesForItemAtIndexPath:(id)a3;
- (unint64_t)currentItem;
- (void)finalizeCollectionViewUpdates;
- (void)invalidateLayoutWithContext:(id)a3;
- (void)prepareForCollectionViewUpdates:(id)a3;
- (void)setCachedContentSize:(CGSize)a3;
- (void)setContentOffsetForItem:(unint64_t)a3 animated:(BOOL)a4;
- (void)setCurrentInterPageScrollPosition:(double)a3;
- (void)setCurrentItem:(unint64_t)a3;
- (void)setCurrentItem:(unint64_t)a3 animated:(BOOL)a4;
- (void)setDeleteIndexPaths:(id)a3;
- (void)setImageSizeCache:(id)a3;
- (void)setInsertIndexPaths:(id)a3;
- (void)setInterPageScrollPosition:(double)a3;
- (void)setIsScrollingBetweenPages:(BOOL)a3;
- (void)setIsScrubbing:(BOOL)a3;
- (void)setIsUndergoingOrientationChange:(BOOL)a3;
- (void)setItemAttributes:(id)a3;
- (void)setItemHeight:(double)a3;
- (void)setItemSpacing:(double)a3;
- (void)setLayoutCacheIsValid:(BOOL)a3;
- (void)setLeftMargin:(double)a3;
- (void)setMovingItem:(BOOL)a3;
- (void)setRightMargin:(double)a3;
- (void)setTopBottomMargins:(double)a3;
- (void)updateLayoutCacheIfNecessary;
@end

@implementation ICDocCamReorderingThumbnailCollectionViewLayout

- (ICDocCamReorderingThumbnailCollectionViewLayout)initWithDelegate:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ICDocCamReorderingThumbnailCollectionViewLayout;
  v5 = [(ICDocCamReorderingThumbnailCollectionViewLayout *)&v8 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    v6->_itemHeight = 40.0;
    v6->_itemSpacing = 1.0;
    v6->_topBottomMargins = 2.0;
    v6->_leftMargin = 0.0;
    v6->_rightMargin = 0.0;
    v6->_currentItem = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v6;
}

+ (double)effectiveAspectRatioForSize:(CGSize)a3
{
  BOOL v3 = a3.height > a3.width || a3.height == 0.0;
  double result = 1.3;
  if (v3) {
    return 0.769230769;
  }
  return result;
}

- (CGSize)itemSizeForImageSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  [(ICDocCamReorderingThumbnailCollectionViewLayout *)self updateLayoutCacheIfNecessary];
  objc_msgSend((id)objc_opt_class(), "effectiveAspectRatioForSize:", width, height);
  double v7 = v6;
  [(ICDocCamReorderingThumbnailCollectionViewLayout *)self itemHeight];
  double v9 = v8;
  double v10 = round(v7 * v8);
  result.double height = v9;
  result.double width = v10;
  return result;
}

- (void)setIsScrollingBetweenPages:(BOOL)a3
{
  if (self->_isScrollingBetweenPages != a3)
  {
    self->_isScrollingBetweenPages = a3;
    [(ICDocCamReorderingThumbnailCollectionViewLayout *)self setCurrentInterPageScrollPosition:0.0];
    [(ICDocCamReorderingThumbnailCollectionViewLayout *)self invalidateLayout];
  }
}

- (void)setIsScrubbing:(BOOL)a3
{
  if (self->_isScrubbing != a3)
  {
    self->_isScrubbing = a3;
    [(ICDocCamReorderingThumbnailCollectionViewLayout *)self invalidateLayout];
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __66__ICDocCamReorderingThumbnailCollectionViewLayout_setIsScrubbing___block_invoke;
    v4[3] = &unk_2642A9250;
    v4[4] = self;
    [MEMORY[0x263F1CB60] animateWithDuration:v4 animations:0.2];
  }
}

void __66__ICDocCamReorderingThumbnailCollectionViewLayout_setIsScrubbing___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setContentOffsetForItem:animated:", objc_msgSend(*(id *)(a1 + 32), "currentItem"), 0);
  id v2 = [*(id *)(a1 + 32) collectionView];
  [v2 layoutIfNeeded];
}

- (double)extraSpacingForCurrentItem
{
  double v3 = 0.0;
  if (![(ICDocCamReorderingThumbnailCollectionViewLayout *)self isScrubbing])
  {
    id v4 = [(ICDocCamReorderingThumbnailCollectionViewLayout *)self itemAttributes];
    if ((unint64_t)[v4 count] >= 3) {
      double v3 = 8.0;
    }
    else {
      double v3 = 0.0;
    }
  }
  return v3;
}

- (void)setInterPageScrollPosition:(double)a3
{
  v5 = [(ICDocCamReorderingThumbnailCollectionViewLayout *)self itemAttributes];
  unint64_t v6 = [v5 count];

  if ([(ICDocCamReorderingThumbnailCollectionViewLayout *)self currentItem] < v6)
  {
    [(ICDocCamReorderingThumbnailCollectionViewLayout *)self setCurrentInterPageScrollPosition:a3];
    double v7 = [(ICDocCamReorderingThumbnailCollectionViewLayout *)self collectionView];
    [v7 contentOffset];
    double v9 = v8;

    double v10 = [(ICDocCamReorderingThumbnailCollectionViewLayout *)self itemAttributes];
    objc_msgSend(v10, "objectAtIndexedSubscript:", -[ICDocCamReorderingThumbnailCollectionViewLayout currentItem](self, "currentItem"));
    id v42 = (id)objc_claimAutoreleasedReturnValue();

    [(ICDocCamReorderingThumbnailCollectionViewLayout *)self horizontalContentOffsetAdjustmentForItem:[(ICDocCamReorderingThumbnailCollectionViewLayout *)self currentItem]];
    double v12 = v11;
    if (a3 <= 0.0 || [(ICDocCamReorderingThumbnailCollectionViewLayout *)self currentItem] >= v6 - 1)
    {
      if (a3 < 0.0 && [(ICDocCamReorderingThumbnailCollectionViewLayout *)self currentItem])
      {
        [(ICDocCamReorderingThumbnailCollectionViewLayout *)self horizontalContentOffsetAdjustmentForItem:[(ICDocCamReorderingThumbnailCollectionViewLayout *)self currentItem] - 1];
        double v28 = v27;
        [(ICDocCamReorderingThumbnailCollectionViewLayout *)self itemSpacing];
        double v30 = v29;
        [(ICDocCamReorderingThumbnailCollectionViewLayout *)self extraSpacingForCurrentItem];
        double v32 = v30 + v31;
        v33 = [(ICDocCamReorderingThumbnailCollectionViewLayout *)self itemAttributes];
        v34 = objc_msgSend(v33, "objectAtIndexedSubscript:", -[ICDocCamReorderingThumbnailCollectionViewLayout currentItem](self, "currentItem") - 1);

        [v42 frame];
        double v36 = v35;
        [(ICDocCamReorderingThumbnailCollectionViewLayout *)self leftMargin];
        double v38 = v36 - v37;
        [v34 size];
        double v40 = v38 + (v32 + v39 - v28) * a3 + v12 * (a3 + 1.0);
        v41 = [(ICDocCamReorderingThumbnailCollectionViewLayout *)self collectionView];
        objc_msgSend(v41, "setContentOffset:animated:", 0, v40, v9);

        [(ICDocCamReorderingThumbnailCollectionViewLayout *)self invalidateLayout];
      }
    }
    else
    {
      [(ICDocCamReorderingThumbnailCollectionViewLayout *)self horizontalContentOffsetAdjustmentForItem:[(ICDocCamReorderingThumbnailCollectionViewLayout *)self currentItem] + 1];
      double v14 = v13;
      [(ICDocCamReorderingThumbnailCollectionViewLayout *)self itemSpacing];
      double v16 = v15;
      [(ICDocCamReorderingThumbnailCollectionViewLayout *)self extraSpacingForCurrentItem];
      double v18 = v16 + v17;
      if ([(ICDocCamReorderingThumbnailCollectionViewLayout *)self currentItem] == v6 - 2)
      {
        [(ICDocCamReorderingThumbnailCollectionViewLayout *)self extraSpacingForCurrentItem];
        double v18 = v18 + v19;
      }
      [v42 frame];
      double v21 = v20;
      [(ICDocCamReorderingThumbnailCollectionViewLayout *)self leftMargin];
      double v23 = v21 - v22;
      [v42 size];
      double v25 = v23 + (v14 + v18 + v24) * a3 + v12 * (1.0 - a3);
      v26 = [(ICDocCamReorderingThumbnailCollectionViewLayout *)self collectionView];
      objc_msgSend(v26, "setContentOffset:animated:", 0, v25, v9);

      [(ICDocCamReorderingThumbnailCollectionViewLayout *)self invalidateLayout];
    }
  }
}

- (void)invalidateLayoutWithContext:(id)a3
{
  id v4 = a3;
  if ([(ICDocCamReorderingThumbnailCollectionViewLayout *)self isScrubbing]) {
    int v5 = 0;
  }
  else {
    int v5 = ![(ICDocCamReorderingThumbnailCollectionViewLayout *)self isScrollingBetweenPages];
  }
  unint64_t v6 = [(ICDocCamReorderingThumbnailCollectionViewLayout *)self imageSizeCache];
  if (!v6 || ![(ICDocCamReorderingThumbnailCollectionViewLayout *)self movingItem]) {
    goto LABEL_11;
  }
  double v7 = [v4 previousIndexPathsForInteractivelyMovingItems];
  if ([v7 count] != 1)
  {
LABEL_10:

LABEL_11:
    goto LABEL_12;
  }
  double v8 = [v4 targetIndexPathsForInteractivelyMovingItems];
  if ([v8 count] != 1 || objc_msgSend(v4, "invalidateEverything"))
  {

    goto LABEL_10;
  }
  char v9 = [v4 invalidateDataSourceCounts];

  if (v9)
  {
LABEL_12:
    [(ICDocCamReorderingThumbnailCollectionViewLayout *)self setLayoutCacheIsValid:0];
    -[ICDocCamReorderingThumbnailCollectionViewLayout setCachedContentSize:](self, "setCachedContentSize:", *MEMORY[0x263F001B0], *(double *)(MEMORY[0x263F001B0] + 8));
    if (v5) {
      [(ICDocCamReorderingThumbnailCollectionViewLayout *)self setImageSizeCache:0];
    }
    goto LABEL_14;
  }
  double v10 = [v4 previousIndexPathsForInteractivelyMovingItems];
  double v11 = [v10 lastObject];
  uint64_t v12 = [v11 item];

  double v13 = [v4 targetIndexPathsForInteractivelyMovingItems];
  double v14 = [v13 lastObject];
  uint64_t v15 = [v14 item];

  if (v12 != v15)
  {
    double v16 = [(ICDocCamReorderingThumbnailCollectionViewLayout *)self imageSizeCache];
    double v17 = [v16 objectAtIndexedSubscript:v12];

    double v18 = [(ICDocCamReorderingThumbnailCollectionViewLayout *)self imageSizeCache];
    [v18 removeObjectAtIndex:v12];

    double v19 = [(ICDocCamReorderingThumbnailCollectionViewLayout *)self imageSizeCache];
    [v19 insertObject:v17 atIndex:v15];
  }
  [(ICDocCamReorderingThumbnailCollectionViewLayout *)self setLayoutCacheIsValid:0];
  -[ICDocCamReorderingThumbnailCollectionViewLayout setCachedContentSize:](self, "setCachedContentSize:", *MEMORY[0x263F001B0], *(double *)(MEMORY[0x263F001B0] + 8));
LABEL_14:
  v20.receiver = self;
  v20.super_class = (Class)ICDocCamReorderingThumbnailCollectionViewLayout;
  [(ICDocCamReorderingThumbnailCollectionViewLayout *)&v20 invalidateLayoutWithContext:v4];
}

- (double)horizontalContentOffsetAdjustmentForItem:(unint64_t)a3
{
  double v3 = 0.0;
  if (a3)
  {
    unint64_t v6 = [(ICDocCamReorderingThumbnailCollectionViewLayout *)self itemAttributes];
    unint64_t v7 = [v6 count];

    if (v7 > a3)
    {
      double v8 = [(ICDocCamReorderingThumbnailCollectionViewLayout *)self itemAttributes];
      char v9 = [v8 objectAtIndexedSubscript:0];

      double v10 = [(ICDocCamReorderingThumbnailCollectionViewLayout *)self itemAttributes];
      double v11 = [v10 objectAtIndexedSubscript:a3];

      [v11 frame];
      double v13 = v12 * 0.5;
      [v9 frame];
      double v3 = v13 - v14 * 0.5;
    }
  }
  return v3;
}

- (double)horizontalContentOffsetForItem:(unint64_t)a3
{
  int v5 = [(ICDocCamReorderingThumbnailCollectionViewLayout *)self itemAttributes];
  unint64_t v6 = [v5 count];

  double v7 = 0.0;
  if (v6 > a3)
  {
    double v8 = [(ICDocCamReorderingThumbnailCollectionViewLayout *)self itemAttributes];
    char v9 = [v8 objectAtIndexedSubscript:a3];

    [v9 frame];
    double v11 = v10;
    [(ICDocCamReorderingThumbnailCollectionViewLayout *)self leftMargin];
    double v13 = v11 - v12;
    [(ICDocCamReorderingThumbnailCollectionViewLayout *)self horizontalContentOffsetAdjustmentForItem:a3];
    double v7 = v14 + v13;
  }
  return v7;
}

- (void)setContentOffsetForItem:(unint64_t)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  double v7 = [(ICDocCamReorderingThumbnailCollectionViewLayout *)self itemAttributes];
  unint64_t v8 = [v7 count];

  if (v8 > a3)
  {
    char v9 = [(ICDocCamReorderingThumbnailCollectionViewLayout *)self collectionView];
    [v9 contentOffset];
    double v11 = v10;

    [(ICDocCamReorderingThumbnailCollectionViewLayout *)self horizontalContentOffsetForItem:a3];
    double v13 = v12;
    id v14 = [(ICDocCamReorderingThumbnailCollectionViewLayout *)self collectionView];
    objc_msgSend(v14, "setContentOffset:animated:", v4, v13, v11);
  }
}

- (void)setCurrentItem:(unint64_t)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  double v7 = [(ICDocCamReorderingThumbnailCollectionViewLayout *)self itemAttributes];
  unint64_t v8 = [v7 count];

  if (v8 > a3)
  {
    if (self->_currentItem != a3
      || [(ICDocCamReorderingThumbnailCollectionViewLayout *)self isScrubbing]
      || [(ICDocCamReorderingThumbnailCollectionViewLayout *)self isUndergoingOrientationChange])
    {
      self->_isScrubbing = 0;
      self->_currentItem = a3;
      [(ICDocCamReorderingThumbnailCollectionViewLayout *)self invalidateLayout];
      if (v4)
      {
        v13[0] = MEMORY[0x263EF8330];
        v13[1] = 3221225472;
        v13[2] = __75__ICDocCamReorderingThumbnailCollectionViewLayout_setCurrentItem_animated___block_invoke;
        v13[3] = &unk_2642A9298;
        v13[4] = self;
        v13[5] = a3;
        [MEMORY[0x263F1CB60] animateWithDuration:v13 animations:0.25];
        return;
      }
      char v9 = [(ICDocCamReorderingThumbnailCollectionViewLayout *)self collectionView];
      [v9 layoutIfNeeded];

      double v10 = self;
      unint64_t v11 = a3;
      BOOL v12 = 0;
    }
    else
    {
      double v10 = self;
      unint64_t v11 = a3;
      BOOL v12 = v4;
    }
    [(ICDocCamReorderingThumbnailCollectionViewLayout *)v10 setContentOffsetForItem:v11 animated:v12];
  }
}

uint64_t __75__ICDocCamReorderingThumbnailCollectionViewLayout_setCurrentItem_animated___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) collectionView];
  [v2 layoutIfNeeded];

  double v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);

  return [v3 setContentOffsetForItem:v4 animated:0];
}

- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)a3 withScrollingVelocity:(CGPoint)a4
{
  CGFloat y = a3.y;
  double x = a3.x;
  if (![(ICDocCamReorderingThumbnailCollectionViewLayout *)self movingItem])
  {
    [(ICDocCamReorderingThumbnailCollectionViewLayout *)self leftMargin];
    double v8 = v7;
    char v9 = [(ICDocCamReorderingThumbnailCollectionViewLayout *)self itemAttributes];
    uint64_t v10 = [v9 count];

    if (v10)
    {
      double v34 = y;
      uint64_t v11 = 0;
      double v12 = x + v8;
      while (1)
      {
        double v13 = [(ICDocCamReorderingThumbnailCollectionViewLayout *)self itemAttributes];
        id v14 = [v13 objectAtIndexedSubscript:v11];

        [v14 frame];
        CGFloat v16 = v15;
        CGFloat v18 = v17;
        CGFloat v20 = v19;
        CGFloat v22 = v21;
        [(ICDocCamReorderingThumbnailCollectionViewLayout *)self itemSpacing];
        CGFloat v24 = -v23;
        v36.origin.double x = v16;
        v36.origin.CGFloat y = v18;
        v36.size.CGFloat width = v20;
        v36.size.CGFloat height = v22;
        CGRect v37 = CGRectInset(v36, v24, 0.0);
        CGFloat v25 = v37.origin.x;
        CGFloat v26 = v37.origin.y;
        CGFloat width = v37.size.width;
        CGFloat height = v37.size.height;
        [v14 size];
        double v30 = v12 + v29 * 0.5;
        v38.origin.double x = v25;
        v38.origin.CGFloat y = v26;
        v38.size.CGFloat width = width;
        v38.size.CGFloat height = height;
        if (v30 >= CGRectGetMinX(v38))
        {
          v39.origin.double x = v25;
          v39.origin.CGFloat y = v26;
          v39.size.CGFloat width = width;
          v39.size.CGFloat height = height;
          if (v30 < CGRectGetMaxX(v39)) {
            break;
          }
        }

        if (v10 == ++v11) {
          goto LABEL_9;
        }
      }
      [(ICDocCamReorderingThumbnailCollectionViewLayout *)self horizontalContentOffsetForItem:v11];
      double x = v31;

LABEL_9:
      CGFloat y = v34;
    }
  }
  double v32 = x;
  double v33 = y;
  result.CGFloat y = v33;
  result.double x = v32;
  return result;
}

- (void)updateLayoutCacheIfNecessary
{
  if ([(ICDocCamReorderingThumbnailCollectionViewLayout *)self layoutCacheIsValid]) {
    return;
  }
  double v3 = [(ICDocCamReorderingThumbnailCollectionViewLayout *)self collectionView];
  [v3 bounds];
  double v64 = v4;
  double v6 = v5;

  [(ICDocCamReorderingThumbnailCollectionViewLayout *)self topBottomMargins];
  [(ICDocCamReorderingThumbnailCollectionViewLayout *)self setItemHeight:v6 + v7 * -2.0];
  double v8 = [(ICDocCamReorderingThumbnailCollectionViewLayout *)self collectionView];
  unint64_t v9 = [v8 numberOfItemsInSection:0];

  uint64_t v10 = [(ICDocCamReorderingThumbnailCollectionViewLayout *)self imageSizeCache];
  uint64_t v11 = v10;
  if (v10 && [v10 count] == v9)
  {
    id v65 = v11;
  }
  else
  {
    id v65 = [MEMORY[0x263EFF980] arrayWithCapacity:v9];

    if (v9)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        double v13 = [(ICDocCamReorderingThumbnailCollectionViewLayout *)self delegate];
        id v14 = [(ICDocCamReorderingThumbnailCollectionViewLayout *)self collectionView];
        [v13 collectionView:v14 imageSizeAtIndex:i];
        double v16 = v15;
        double v18 = v17;

        double v19 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGSize:", v16, v18);
        [v65 addObject:v19];
      }
    }
    [(ICDocCamReorderingThumbnailCollectionViewLayout *)self setImageSizeCache:v65];
  }
  if (v9 < 3)
  {
    int v26 = 0;
    unint64_t v20 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    unint64_t v20 = [(ICDocCamReorderingThumbnailCollectionViewLayout *)self currentItem];
    [(ICDocCamReorderingThumbnailCollectionViewLayout *)self currentInterPageScrollPosition];
    if (v21 != 0.0)
    {
      [(ICDocCamReorderingThumbnailCollectionViewLayout *)self currentInterPageScrollPosition];
      double v23 = v22;
      unint64_t v24 = [(ICDocCamReorderingThumbnailCollectionViewLayout *)self currentItem];
      if (v23 >= 0.0) {
        uint64_t v25 = v24 + 1;
      }
      else {
        uint64_t v25 = v24 - 1;
      }
      uint64_t v63 = v25;
      int v26 = 1;
      goto LABEL_18;
    }
    int v26 = 0;
  }
  uint64_t v63 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_18:
  [(ICDocCamReorderingThumbnailCollectionViewLayout *)self currentInterPageScrollPosition];
  if (v27 >= 0.0) {
    double v28 = v27;
  }
  else {
    double v28 = -v27;
  }
  if (v26) {
    double v29 = 1.0 - v28;
  }
  else {
    double v29 = 1.0;
  }
  [(ICDocCamReorderingThumbnailCollectionViewLayout *)self topBottomMargins];
  CGFloat v31 = v30;
  [(ICDocCamReorderingThumbnailCollectionViewLayout *)self itemHeight];
  double v33 = v32;
  double v34 = [MEMORY[0x263EFF980] arrayWithCapacity:v9];
  if (v9)
  {
    unint64_t v35 = 0;
    unint64_t v36 = v9 - 1;
    double v37 = 0.0;
    do
    {
      CGRect v38 = (void *)MEMORY[0x263F1C520];
      CGRect v39 = [MEMORY[0x263F088C8] indexPathForItem:v35 inSection:0];
      double v40 = [v38 layoutAttributesForCellWithIndexPath:v39];

      v41 = [v65 objectAtIndexedSubscript:v35];
      [v41 CGSizeValue];
      double v43 = v42;
      double v45 = v44;

      objc_msgSend((id)objc_opt_class(), "effectiveAspectRatioForSize:", v43, v45);
      double v47 = v46;
      [(ICDocCamReorderingThumbnailCollectionViewLayout *)self itemHeight];
      double v33 = v48;
      double v49 = round(v47 * v48);
      if (v35)
      {
        [(ICDocCamReorderingThumbnailCollectionViewLayout *)self itemSpacing];
        double v37 = v37 + v50;
        if (v20 == v35)
        {
          [(ICDocCamReorderingThumbnailCollectionViewLayout *)self extraSpacingForCurrentItem];
          double v37 = v37 + v29 * v51;
        }
        else if (v63 == v35)
        {
          [(ICDocCamReorderingThumbnailCollectionViewLayout *)self extraSpacingForCurrentItem];
          double v37 = v37 + v28 * v53;
        }
      }
      else
      {
        [(ICDocCamReorderingThumbnailCollectionViewLayout *)self setLeftMargin:round((v64 - v49) * 0.5)];
        [(ICDocCamReorderingThumbnailCollectionViewLayout *)self leftMargin];
        double v37 = v52;
      }
      if (v36 == v35) {
        [(ICDocCamReorderingThumbnailCollectionViewLayout *)self setRightMargin:round((v64 - v49) * 0.5)];
      }
      [(ICDocCamReorderingThumbnailCollectionViewLayout *)self topBottomMargins];
      CGFloat v31 = v54;
      objc_msgSend(v40, "setFrame:", v37, v54, v49, v33);
      objc_msgSend(v40, "setSize:", v49, v33);
      if (v35 < v36)
      {
        double v37 = v49 + v37;
        double v55 = v29;
        if (v20 == v35 || (double v55 = v28, v63 == v35))
        {
          [(ICDocCamReorderingThumbnailCollectionViewLayout *)self extraSpacingForCurrentItem];
          double v37 = v37 + v56 * v55;
        }
      }
      [v34 addObject:v40];

      ++v35;
    }
    while (v9 != v35);
  }
  else
  {
    double v49 = 0.0;
    double v37 = 0.0;
  }
  [(ICDocCamReorderingThumbnailCollectionViewLayout *)self setItemAttributes:v34];
  v67.origin.double x = v37;
  v67.origin.CGFloat y = v31;
  v67.size.CGFloat width = v49;
  v67.size.CGFloat height = v33;
  double MaxX = CGRectGetMaxX(v67);
  [(ICDocCamReorderingThumbnailCollectionViewLayout *)self rightMargin];
  double v59 = MaxX + v58;
  [(ICDocCamReorderingThumbnailCollectionViewLayout *)self itemHeight];
  double v61 = v60;
  [(ICDocCamReorderingThumbnailCollectionViewLayout *)self topBottomMargins];
  -[ICDocCamReorderingThumbnailCollectionViewLayout setCachedContentSize:](self, "setCachedContentSize:", v59, v61 + v62 * 2.0);
  [(ICDocCamReorderingThumbnailCollectionViewLayout *)self setLayoutCacheIsValid:1];
}

- (CGSize)collectionViewContentSize
{
  [(ICDocCamReorderingThumbnailCollectionViewLayout *)self updateLayoutCacheIfNecessary];

  [(ICDocCamReorderingThumbnailCollectionViewLayout *)self cachedContentSize];
  result.CGFloat height = v4;
  result.CGFloat width = v3;
  return result;
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  double v7 = [(ICDocCamReorderingThumbnailCollectionViewLayout *)self itemAttributes];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __85__ICDocCamReorderingThumbnailCollectionViewLayout_layoutAttributesForElementsInRect___block_invoke;
  v10[3] = &__block_descriptor_64_e49_B32__0__UICollectionViewLayoutAttributes_8Q16_B24l;
  *(CGFloat *)&v10[4] = x;
  *(CGFloat *)&v10[5] = y;
  *(CGFloat *)&v10[6] = width;
  *(CGFloat *)&v10[7] = height;
  double v8 = objc_msgSend(v7, "dc_objectsPassingTest:", v10);

  return v8;
}

BOOL __85__ICDocCamReorderingThumbnailCollectionViewLayout_layoutAttributesForElementsInRect___block_invoke(void *a1, void *a2)
{
  [a2 frame];
  uint64_t v7 = a1[4];
  uint64_t v8 = a1[5];
  uint64_t v9 = a1[6];
  uint64_t v10 = a1[7];

  return CGRectIntersectsRect(*(CGRect *)&v3, *(CGRect *)&v7);
}

- (id)layoutAttributesForItemAtIndexPath:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [v4 item];
  double v6 = [(ICDocCamReorderingThumbnailCollectionViewLayout *)self itemAttributes];
  unint64_t v7 = [v6 count];

  if (v5 >= v7)
  {
    uint64_t v10 = os_log_create("com.apple.documentcamera", "");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      [(ICDocCamReorderingThumbnailCollectionViewLayout *)(uint64_t)v4 layoutAttributesForItemAtIndexPath:v10];
    }

    uint64_t v9 = 0;
  }
  else
  {
    uint64_t v8 = [(ICDocCamReorderingThumbnailCollectionViewLayout *)self itemAttributes];
    uint64_t v9 = objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v4, "item"));
  }

  return v9;
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3
{
  return 0;
}

- (void)prepareForCollectionViewUpdates:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)ICDocCamReorderingThumbnailCollectionViewLayout;
  [(ICDocCamReorderingThumbnailCollectionViewLayout *)&v20 prepareForCollectionViewUpdates:v4];
  unint64_t v5 = [MEMORY[0x263EFF980] array];
  [(ICDocCamReorderingThumbnailCollectionViewLayout *)self setDeleteIndexPaths:v5];

  double v6 = [MEMORY[0x263EFF980] array];
  [(ICDocCamReorderingThumbnailCollectionViewLayout *)self setInsertIndexPaths:v6];

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = v4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v21 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        double v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v12, "updateAction", (void)v16) == 1)
        {
          double v13 = [(ICDocCamReorderingThumbnailCollectionViewLayout *)self deleteIndexPaths];
          uint64_t v14 = [v12 indexPathBeforeUpdate];
        }
        else
        {
          if ([v12 updateAction]) {
            continue;
          }
          double v13 = [(ICDocCamReorderingThumbnailCollectionViewLayout *)self insertIndexPaths];
          uint64_t v14 = [v12 indexPathAfterUpdate];
        }
        double v15 = (void *)v14;
        [v13 addObject:v14];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v21 count:16];
    }
    while (v9);
  }
}

- (void)finalizeCollectionViewUpdates
{
  v3.receiver = self;
  v3.super_class = (Class)ICDocCamReorderingThumbnailCollectionViewLayout;
  [(ICDocCamReorderingThumbnailCollectionViewLayout *)&v3 finalizeCollectionViewUpdates];
  [(ICDocCamReorderingThumbnailCollectionViewLayout *)self setDeleteIndexPaths:0];
  [(ICDocCamReorderingThumbnailCollectionViewLayout *)self setInsertIndexPaths:0];
}

- (id)initialLayoutAttributesForAppearingItemAtIndexPath:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICDocCamReorderingThumbnailCollectionViewLayout;
  unint64_t v5 = [(ICDocCamReorderingThumbnailCollectionViewLayout *)&v9 initialLayoutAttributesForAppearingItemAtIndexPath:v4];
  double v6 = [(ICDocCamReorderingThumbnailCollectionViewLayout *)self insertIndexPaths];
  char v7 = [v6 containsObject:v4];

  if ((v7 & 1) == 0)
  {
    if (!v5)
    {
      unint64_t v5 = [(ICDocCamReorderingThumbnailCollectionViewLayout *)self layoutAttributesForItemAtIndexPath:v4];
    }
    [v5 setAlpha:1.0];
  }

  return v5;
}

- (id)finalLayoutAttributesForDisappearingItemAtIndexPath:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICDocCamReorderingThumbnailCollectionViewLayout;
  unint64_t v5 = [(ICDocCamReorderingThumbnailCollectionViewLayout *)&v9 finalLayoutAttributesForDisappearingItemAtIndexPath:v4];
  double v6 = [(ICDocCamReorderingThumbnailCollectionViewLayout *)self deleteIndexPaths];
  char v7 = [v6 containsObject:v4];

  if ((v7 & 1) == 0)
  {
    if (!v5)
    {
      unint64_t v5 = [(ICDocCamReorderingThumbnailCollectionViewLayout *)self layoutAttributesForItemAtIndexPath:v4];
    }
    [v5 setAlpha:1.0];
  }

  return v5;
}

- (ICDocCamThumbnailViewLayoutDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (ICDocCamThumbnailViewLayoutDelegate *)WeakRetained;
}

- (BOOL)movingItem
{
  return self->_movingItem;
}

- (void)setMovingItem:(BOOL)a3
{
  self->_movingItem = a3;
}

- (BOOL)isScrollingBetweenPages
{
  return self->_isScrollingBetweenPages;
}

- (BOOL)isScrubbing
{
  return self->_isScrubbing;
}

- (BOOL)isUndergoingOrientationChange
{
  return self->_isUndergoingOrientationChange;
}

- (void)setIsUndergoingOrientationChange:(BOOL)a3
{
  self->_isUndergoingOrientationChange = a3;
}

- (double)itemSpacing
{
  return self->_itemSpacing;
}

- (void)setItemSpacing:(double)a3
{
  self->_itemSpacing = a3;
}

- (double)topBottomMargins
{
  return self->_topBottomMargins;
}

- (void)setTopBottomMargins:(double)a3
{
  self->_topBottomMargins = a3;
}

- (double)leftMargin
{
  return self->_leftMargin;
}

- (void)setLeftMargin:(double)a3
{
  self->_leftMargin = a3;
}

- (double)rightMargin
{
  return self->_rightMargin;
}

- (void)setRightMargin:(double)a3
{
  self->_rightMargin = a3;
}

- (double)itemHeight
{
  return self->_itemHeight;
}

- (void)setItemHeight:(double)a3
{
  self->_itemHeight = a3;
}

- (BOOL)layoutCacheIsValid
{
  return self->_layoutCacheIsValid;
}

- (void)setLayoutCacheIsValid:(BOOL)a3
{
  self->_layoutCacheIsValid = a3;
}

- (CGSize)cachedContentSize
{
  double width = self->_cachedContentSize.width;
  double height = self->_cachedContentSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setCachedContentSize:(CGSize)a3
{
  self->_cachedContentSize = a3;
}

- (NSArray)itemAttributes
{
  return self->_itemAttributes;
}

- (void)setItemAttributes:(id)a3
{
}

- (NSMutableArray)imageSizeCache
{
  return self->_imageSizeCache;
}

- (void)setImageSizeCache:(id)a3
{
}

- (unint64_t)currentItem
{
  return self->_currentItem;
}

- (void)setCurrentItem:(unint64_t)a3
{
  self->_currentItem = a3;
}

- (double)currentInterPageScrollPosition
{
  return self->_currentInterPageScrollPosition;
}

- (void)setCurrentInterPageScrollPosition:(double)a3
{
  self->_currentInterPageScrollPosition = a3;
}

- (NSMutableArray)deleteIndexPaths
{
  return self->_deleteIndexPaths;
}

- (void)setDeleteIndexPaths:(id)a3
{
}

- (NSMutableArray)insertIndexPaths
{
  return self->_insertIndexPaths;
}

- (void)setInsertIndexPaths:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_insertIndexPaths, 0);
  objc_storeStrong((id *)&self->_deleteIndexPaths, 0);
  objc_storeStrong((id *)&self->_imageSizeCache, 0);
  objc_storeStrong((id *)&self->_itemAttributes, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (void)layoutAttributesForItemAtIndexPath:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  unint64_t v5 = [a2 itemAttributes];
  int v6 = 138412546;
  uint64_t v7 = a1;
  __int16 v8 = 2048;
  uint64_t v9 = [v5 count];
  _os_log_error_impl(&dword_217885000, a3, OS_LOG_TYPE_ERROR, "Index out of bounds: %@, %ld", (uint8_t *)&v6, 0x16u);
}

@end