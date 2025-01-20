@interface HUMosaicLayout
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3;
- (CGRect)contentBounds;
- (CGSize)collectionViewContentSize;
- (HUMosaicLayoutDelegate)delegate;
- (NSMutableArray)attributeCache;
- (id)currentMosaicFrames;
- (id)layoutAttributesForElementsInRect:(CGRect)a3;
- (id)layoutAttributesForItemAtIndexPath:(id)a3;
- (void)prepareLayout;
- (void)setAttributeCache:(id)a3;
- (void)setContentBounds:(CGRect)a3;
- (void)setDelegate:(id)a3;
@end

@implementation HUMosaicLayout

- (void)prepareLayout
{
  v34.receiver = self;
  v34.super_class = (Class)HUMosaicLayout;
  [(HUMosaicLayout *)&v34 prepareLayout];
  v3 = [(HUMosaicLayout *)self attributeCache];
  [v3 removeAllObjects];

  [(HUMosaicLayout *)self contentBounds];
  if (CGRectIsEmpty(v35))
  {
    v4 = [(HUMosaicLayout *)self collectionView];
    [v4 bounds];
    double v6 = v5;
    v7 = [(HUMosaicLayout *)self collectionView];
    [v7 bounds];
    -[HUMosaicLayout setContentBounds:](self, "setContentBounds:", 0.0, 0.0, v6);
  }
  v8 = [(HUMosaicLayout *)self collectionView];
  uint64_t v9 = [v8 numberOfSections];

  if (v9 >= 1)
  {
    v10 = [(HUMosaicLayout *)self collectionView];
    uint64_t v11 = [v10 numberOfItemsInSection:0];

    v12 = [(HUMosaicLayout *)self delegate];
    v13 = [v12 layoutGeometry];

    v14 = [MEMORY[0x1E4F1CA48] array];
    if (v11)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        v16 = [MEMORY[0x1E4F28D58] indexPathForItem:i inSection:0];
        v17 = [(HUMosaicLayout *)self delegate];
        uint64_t v18 = [v17 cellSizeForItemAtIndexPath:v16];

        v19 = +[HUMosaicCellSize createMosaicCellSizeForSizeDescription:v18];
        [v14 addObject:v19];
      }
    }
    [(HUMosaicLayout *)self contentBounds];
    v20 = +[HUMosaicLayoutHelper framesForSizes:withGeometry:inBounds:](HUMosaicLayoutHelper, "framesForSizes:withGeometry:inBounds:", v14, v13);
    if ([v20 count])
    {
      unint64_t v21 = 0;
      do
      {
        v22 = [v20 objectAtIndex:v21];
        [v22 CGRectValue];
        double v24 = v23;
        double v26 = v25;
        double v28 = v27;
        double v30 = v29;

        v31 = [MEMORY[0x1E4F28D58] indexPathForItem:v21 inSection:0];
        v32 = [MEMORY[0x1E4F428A0] layoutAttributesForCellWithIndexPath:v31];
        objc_msgSend(v32, "setFrame:", v24, v26, v28, v30);
        v33 = [(HUMosaicLayout *)self attributeCache];
        [v33 addObject:v32];

        ++v21;
      }
      while (v21 < [v20 count]);
    }
  }
}

- (NSMutableArray)attributeCache
{
  attributeCache = self->_attributeCache;
  if (!attributeCache)
  {
    v4 = [MEMORY[0x1E4F1CA48] array];
    double v5 = self->_attributeCache;
    self->_attributeCache = v4;

    attributeCache = self->_attributeCache;
  }

  return attributeCache;
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  [(HUMosaicLayout *)self contentBounds];
  BOOL v8 = v7 != height || v6 != width;
  if (v8) {
    -[HUMosaicLayout setContentBounds:](self, "setContentBounds:", 0.0, 0.0, width, height);
  }
  return v8;
}

- (CGSize)collectionViewContentSize
{
  [(HUMosaicLayout *)self contentBounds];
  double v3 = v2;
  double v5 = v4;
  result.double height = v5;
  result.double width = v3;
  return result;
}

- (id)layoutAttributesForItemAtIndexPath:(id)a3
{
  id v4 = a3;
  if ([v4 section]) {
    NSLog(&cfstr_Humosaiclayout.isa, [v4 section]);
  }
  double v5 = [(HUMosaicLayout *)self attributeCache];
  unint64_t v6 = [v5 count];
  unint64_t v7 = [v4 item];

  if (v6 <= v7)
  {
    uint64_t v9 = 0;
  }
  else
  {
    BOOL v8 = [(HUMosaicLayout *)self attributeCache];
    uint64_t v9 = objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v4, "item"));
  }

  return v9;
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  BOOL v8 = [MEMORY[0x1E4F1CA48] array];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v9 = [(HUMosaicLayout *)self attributeCache];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        [v14 frame];
        v24.origin.CGFloat x = x;
        v24.origin.CGFloat y = y;
        v24.size.CGFloat width = width;
        v24.size.CGFloat height = height;
        if (CGRectIntersectsRect(v23, v24)) {
          [v8 addObject:v14];
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v11);
  }

  return v8;
}

- (id)currentMosaicFrames
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  double v3 = [MEMORY[0x1E4F1CA48] array];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = [(HUMosaicLayout *)self attributeCache];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = (void *)MEMORY[0x1E4F29238];
        [*(id *)(*((void *)&v12 + 1) + 8 * i) frame];
        uint64_t v10 = objc_msgSend(v9, "valueWithCGRect:");
        [v3 addObject:v10];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  return v3;
}

- (CGRect)contentBounds
{
  double x = self->_contentBounds.origin.x;
  double y = self->_contentBounds.origin.y;
  double width = self->_contentBounds.size.width;
  double height = self->_contentBounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setContentBounds:(CGRect)a3
{
  self->_contentBounds = a3;
}

- (HUMosaicLayoutDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (HUMosaicLayoutDelegate *)a3;
}

- (void)setAttributeCache:(id)a3
{
}

- (void).cxx_destruct
{
}

@end