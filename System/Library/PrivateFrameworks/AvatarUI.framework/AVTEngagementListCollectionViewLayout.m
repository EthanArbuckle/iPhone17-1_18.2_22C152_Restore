@interface AVTEngagementListCollectionViewLayout
- (AVTEngagementLayout)engagementLayout;
- (AVTEngagementListCollectionViewLayout)initWithEngagementLayout:(id)a3;
- (BOOL)flipsHorizontallyInOppositeLayoutDirection;
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3;
- (CGPoint)centerForCenteringElementAtIndex:(int64_t)a3 visibleBoundsSize:(CGSize)a4 proposedOrigin:(CGPoint)a5;
- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)a3;
- (CGRect)frameForElementAtIndex:(int64_t)a3 visibleBounds:(CGRect)a4;
- (CGSize)collectionViewContentSize;
- (CGSize)contentSizeForVisibleBounds:(CGRect)a3 numberOfItems:(int64_t)a4;
- (NSValue)ignoredProposedContentOffset;
- (NSValue)targetContentOffset;
- (UIEdgeInsets)engagementInsetsForCollectionViewBounds:(CGSize)a3;
- (id)indexesForElementsInRect:(CGRect)a3 visibleBounds:(CGRect)a4 numberOfItems:(int64_t)a5;
- (id)layoutAttributesForElementsInRect:(CGRect)a3;
- (id)layoutAttributesForItemAtIndexPath:(id)a3;
- (void)clearTargetContentOffsetForAnimations;
- (void)invalidateLayout;
- (void)setIgnoredProposedContentOffset:(id)a3;
- (void)setTargetContentOffset:(id)a3;
- (void)setTargetContentOffsetForAnimations:(CGPoint)a3;
@end

@implementation AVTEngagementListCollectionViewLayout

- (UIEdgeInsets)engagementInsetsForCollectionViewBounds:(CGSize)a3
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

- (AVTEngagementListCollectionViewLayout)initWithEngagementLayout:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AVTEngagementListCollectionViewLayout;
  double v6 = [(AVTEngagementListCollectionViewLayout *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_engagementLayout, a3);
  }

  return v7;
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3
{
  return 1;
}

- (BOOL)flipsHorizontallyInOppositeLayoutDirection
{
  return 1;
}

- (void)setTargetContentOffsetForAnimations:(CGPoint)a3
{
  objc_msgSend(MEMORY[0x263F08D40], "valueWithCGPoint:", a3.x, a3.y);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(AVTEngagementListCollectionViewLayout *)self setTargetContentOffset:v4];
}

- (void)clearTargetContentOffsetForAnimations
{
  [(AVTEngagementListCollectionViewLayout *)self setTargetContentOffset:0];
  [(AVTEngagementListCollectionViewLayout *)self setIgnoredProposedContentOffset:0];
}

- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  double v6 = [(AVTEngagementListCollectionViewLayout *)self targetContentOffset];

  if (v6)
  {
    v7 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGPoint:", x, y);
    [(AVTEngagementListCollectionViewLayout *)self setIgnoredProposedContentOffset:v7];

    v8 = [(AVTEngagementListCollectionViewLayout *)self targetContentOffset];
    [v8 CGPointValue];
    double x = v9;
    double y = v10;
  }
  double v11 = x;
  double v12 = y;
  result.double y = v12;
  result.double x = v11;
  return result;
}

- (void)invalidateLayout
{
  double v3 = [(AVTEngagementListCollectionViewLayout *)self collectionView];
  [v3 bounds];
  -[AVTEngagementListCollectionViewLayout engagementInsetsForCollectionViewBounds:](self, "engagementInsetsForCollectionViewBounds:", v4, v5);
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  v14 = [(AVTEngagementListCollectionViewLayout *)self engagementLayout];
  objc_msgSend(v14, "setEngagementBoundsInsets:", v7, v9, v11, v13);

  v15.receiver = self;
  v15.super_class = (Class)AVTEngagementListCollectionViewLayout;
  [(AVTEngagementListCollectionViewLayout *)&v15 invalidateLayout];
}

- (CGSize)collectionViewContentSize
{
  double v3 = [(AVTEngagementListCollectionViewLayout *)self collectionView];
  uint64_t v4 = [v3 numberOfSections];

  if (v4 <= 0)
  {
    double v10 = *MEMORY[0x263F001B0];
    double v12 = *(double *)(MEMORY[0x263F001B0] + 8);
  }
  else
  {
    double v5 = [(AVTEngagementListCollectionViewLayout *)self collectionView];
    uint64_t v6 = [v5 numberOfItemsInSection:0];

    double v7 = [(AVTEngagementListCollectionViewLayout *)self engagementLayout];
    double v8 = [(AVTEngagementListCollectionViewLayout *)self collectionView];
    [v8 bounds];
    objc_msgSend(v7, "contentSizeForVisibleBounds:numberOfItems:", v6);
    double v10 = v9;
    double v12 = v11;
  }
  double v13 = v10;
  double v14 = v12;
  result.height = v14;
  result.width = v13;
  return result;
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  double v8 = [(AVTEngagementListCollectionViewLayout *)self collectionView];
  uint64_t v9 = [v8 numberOfSections];

  if (v9 < 1)
  {
    v24 = (void *)MEMORY[0x263EFFA68];
  }
  else
  {
    double v10 = [MEMORY[0x263EFF980] array];
    double v11 = [(AVTEngagementListCollectionViewLayout *)self engagementLayout];
    double v12 = [(AVTEngagementListCollectionViewLayout *)self collectionView];
    [v12 bounds];
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;
    v21 = [(AVTEngagementListCollectionViewLayout *)self collectionView];
    v22 = objc_msgSend(v11, "indexesForElementsInRect:visibleBounds:numberOfItems:", objc_msgSend(v21, "numberOfItemsInSection:", 0), x, y, width, height, v14, v16, v18, v20);

    uint64_t v26 = MEMORY[0x263EF8330];
    uint64_t v27 = 3221225472;
    v28 = __75__AVTEngagementListCollectionViewLayout_layoutAttributesForElementsInRect___block_invoke;
    v29 = &unk_263FF20E0;
    v30 = self;
    id v31 = v10;
    id v23 = v10;
    [v22 enumerateIndexesUsingBlock:&v26];
    v24 = objc_msgSend(v23, "copy", v26, v27, v28, v29, v30);
  }
  return v24;
}

void __75__AVTEngagementListCollectionViewLayout_layoutAttributesForElementsInRect___block_invoke(uint64_t a1, uint64_t a2)
{
  double v3 = *(void **)(a1 + 32);
  uint64_t v4 = [MEMORY[0x263F088C8] indexPathForItem:a2 inSection:0];
  id v5 = [v3 layoutAttributesForItemAtIndexPath:v4];

  [*(id *)(a1 + 40) addObject:v5];
}

- (id)layoutAttributesForItemAtIndexPath:(id)a3
{
  uint64_t v4 = (void *)MEMORY[0x263F1C520];
  id v5 = a3;
  uint64_t v6 = [v4 layoutAttributesForCellWithIndexPath:v5];
  double v7 = [(AVTEngagementListCollectionViewLayout *)self engagementLayout];
  uint64_t v8 = [v5 row];

  uint64_t v9 = [(AVTEngagementListCollectionViewLayout *)self collectionView];
  [v9 bounds];
  objc_msgSend(v7, "frameForElementAtIndex:visibleBounds:", v8);
  objc_msgSend(v6, "setFrame:");

  return v6;
}

- (CGRect)frameForElementAtIndex:(int64_t)a3 visibleBounds:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  uint64_t v9 = [(AVTEngagementListCollectionViewLayout *)self engagementLayout];
  objc_msgSend(v9, "frameForElementAtIndex:visibleBounds:", a3, x, y, width, height);
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;

  double v18 = v11;
  double v19 = v13;
  double v20 = v15;
  double v21 = v17;
  result.size.double height = v21;
  result.size.double width = v20;
  result.origin.double y = v19;
  result.origin.double x = v18;
  return result;
}

- (id)indexesForElementsInRect:(CGRect)a3 visibleBounds:(CGRect)a4 numberOfItems:(int64_t)a5
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  double v10 = a3.size.height;
  double v11 = a3.size.width;
  double v12 = a3.origin.y;
  double v13 = a3.origin.x;
  double v14 = [(AVTEngagementListCollectionViewLayout *)self engagementLayout];
  double v15 = objc_msgSend(v14, "indexesForElementsInRect:visibleBounds:numberOfItems:", a5, v13, v12, v11, v10, x, y, width, height);

  return v15;
}

- (CGPoint)centerForCenteringElementAtIndex:(int64_t)a3 visibleBoundsSize:(CGSize)a4 proposedOrigin:(CGPoint)a5
{
  double y = a5.y;
  double x = a5.x;
  double height = a4.height;
  double width = a4.width;
  double v10 = [(AVTEngagementListCollectionViewLayout *)self engagementLayout];
  objc_msgSend(v10, "centerForCenteringElementAtIndex:visibleBoundsSize:proposedOrigin:", a3, width, height, x, y);
  double v12 = v11;
  double v14 = v13;

  double v15 = v12;
  double v16 = v14;
  result.double y = v16;
  result.double x = v15;
  return result;
}

- (CGSize)contentSizeForVisibleBounds:(CGRect)a3 numberOfItems:(int64_t)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v9 = [(AVTEngagementListCollectionViewLayout *)self engagementLayout];
  objc_msgSend(v9, "contentSizeForVisibleBounds:numberOfItems:", a4, x, y, width, height);
  double v11 = v10;
  double v13 = v12;

  double v14 = v11;
  double v15 = v13;
  result.double height = v15;
  result.double width = v14;
  return result;
}

- (AVTEngagementLayout)engagementLayout
{
  return self->_engagementLayout;
}

- (NSValue)ignoredProposedContentOffset
{
  return self->_ignoredProposedContentOffset;
}

- (void)setIgnoredProposedContentOffset:(id)a3
{
}

- (NSValue)targetContentOffset
{
  return self->_targetContentOffset;
}

- (void)setTargetContentOffset:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetContentOffset, 0);
  objc_storeStrong((id *)&self->_ignoredProposedContentOffset, 0);
  objc_storeStrong((id *)&self->_engagementLayout, 0);
}

@end