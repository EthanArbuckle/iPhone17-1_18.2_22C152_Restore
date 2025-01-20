@interface HKMCCycleTimelineFlowLayout
+ (Class)layoutAttributesClass;
- (BOOL)flipsHorizontallyInOppositeLayoutDirection;
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3;
- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)a3;
- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)a3 withScrollingVelocity:(CGPoint)a4;
- (CGRect)_pillFrameAtZoomIndex:(int64_t)a3;
- (CGSize)configuredSize;
- (HKMCCycleTimelineFlowLayout)initWithYOffset:(double)a3 pillConfigurations:(id)a4 introPillConfiguration:(id)a5 pillAspectRatio:(double)a6;
- (double)_pillOriginXAtZoomIndex:(int64_t)a3 centerPill:(BOOL)a4;
- (id)_configurationAtIndex:(int64_t)a3;
- (id)invalidationContextForBoundsChange:(CGRect)a3;
- (id)layoutAttributesForElementsInRect:(CGRect)a3;
- (id)layoutAttributesForItemAtIndexPath:(id)a3;
- (void)_configureLayoutAttributes:(id)a3;
- (void)prepareLayout;
@end

@implementation HKMCCycleTimelineFlowLayout

- (HKMCCycleTimelineFlowLayout)initWithYOffset:(double)a3 pillConfigurations:(id)a4 introPillConfiguration:(id)a5 pillAspectRatio:(double)a6
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v12 = a4;
  id v13 = a5;
  if (![v12 count])
  {
    v31 = [MEMORY[0x263F08690] currentHandler];
    [v31 handleFailureInMethod:a2, self, @"HKMCCycleTimelineFlowLayout.m", 81, @"Invalid parameter not satisfying: %@", @"[pillConfigurations count] > 0" object file lineNumber description];
  }
  v37.receiver = self;
  v37.super_class = (Class)HKMCCycleTimelineFlowLayout;
  v14 = [(UICollectionViewFlowLayout *)&v37 init];
  v15 = v14;
  if (v14)
  {
    id v32 = v13;
    v14->_yOffset = a3;
    p_pillConfigurations = (id *)&v14->_pillConfigurations;
    objc_storeStrong((id *)&v14->_pillConfigurations, a4);
    objc_storeStrong((id *)&v15->_introPillConfiguration, a5);
    v15->_pillAspectRatio = a6;
    v17 = objc_msgSend(*p_pillConfigurations, "objectAtIndexedSubscript:", (unint64_t)objc_msgSend(v12, "count") >> 1);
    [v17 heightWithAspectRatio:a6];
    v15->_centerPillHeight = v18;
    [v17 width];
    CGFloat v19 = v15->_centerPillHeight + a3;
    v15->_cellSize.width = v20;
    v15->_cellSize.height = v19;
    v15->_totalZoomWidth = 0.0;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v21 = *p_pillConfigurations;
    uint64_t v22 = [v21 countByEnumeratingWithState:&v33 objects:v38 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v34;
      do
      {
        for (uint64_t i = 0; i != v23; ++i)
        {
          if (*(void *)v34 != v24) {
            objc_enumerationMutation(v21);
          }
          v26 = *(void **)(*((void *)&v33 + 1) + 8 * i);
          [v26 width];
          double v28 = v27;
          [v26 spacing];
          v15->_totalZoomWidth = v15->_totalZoomWidth + v28 + v29;
        }
        uint64_t v23 = [v21 countByEnumeratingWithState:&v33 objects:v38 count:16];
      }
      while (v23);
    }

    [(UICollectionViewFlowLayout *)v15 setScrollDirection:1];
    [(UICollectionViewFlowLayout *)v15 setMinimumLineSpacing:0.0];
    [(UICollectionViewFlowLayout *)v15 setMinimumInteritemSpacing:0.0];
    -[UICollectionViewFlowLayout setItemSize:](v15, "setItemSize:", v15->_cellSize.width, v15->_cellSize.height);

    id v13 = v32;
  }

  return v15;
}

- (CGSize)configuredSize
{
  double v3 = self->_cellSize.width * (double)[(NSArray *)self->_pillConfigurations count];
  double v4 = self->_centerPillHeight + self->_yOffset;
  result.height = v4;
  result.width = v3;
  return result;
}

+ (Class)layoutAttributesClass
{
  return (Class)objc_opt_class();
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v14.receiver = self;
  v14.super_class = (Class)HKMCCycleTimelineFlowLayout;
  double v4 = -[UICollectionViewFlowLayout layoutAttributesForElementsInRect:](&v14, sel_layoutAttributesForElementsInRect_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        [(HKMCCycleTimelineFlowLayout *)self _configureLayoutAttributes:*(void *)(*((void *)&v10 + 1) + 8 * i)];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v15 count:16];
    }
    while (v6);
  }
  return v4;
}

- (id)layoutAttributesForItemAtIndexPath:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)HKMCCycleTimelineFlowLayout;
  double v4 = [(UICollectionViewFlowLayout *)&v6 layoutAttributesForItemAtIndexPath:a3];
  [(HKMCCycleTimelineFlowLayout *)self _configureLayoutAttributes:v4];
  return v4;
}

- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)a3 withScrollingVelocity:(CGPoint)a4
{
  uint64_t v5 = [(HKMCCycleTimelineFlowLayout *)self collectionView];
  [v5 bounds];
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;

  double v14 = (double)[(NSIndexPath *)self->_centerIndexPath item];
  double width = self->_cellSize.width;
  v19.origin.x = v7;
  v19.origin.y = v9;
  v19.size.double width = v11;
  v19.size.height = v13;
  double v16 = (CGRectGetWidth(v19) - width) * -0.5 + v14 * width;
  double v17 = 0.0;
  result.y = v17;
  result.x = v16;
  return result;
}

- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)a3
{
  -[HKMCCycleTimelineFlowLayout targetContentOffsetForProposedContentOffset:withScrollingVelocity:](self, "targetContentOffsetForProposedContentOffset:withScrollingVelocity:", a3.x, a3.y, *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8));
  result.y = v4;
  result.x = v3;
  return result;
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3
{
  return 1;
}

- (id)invalidationContextForBoundsChange:(CGRect)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HKMCCycleTimelineFlowLayout;
  double v3 = -[UICollectionViewFlowLayout invalidationContextForBoundsChange:](&v5, sel_invalidationContextForBoundsChange_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [v3 setInvalidateFlowLayoutAttributes:0];
  [v3 setInvalidateFlowLayoutDelegateMetrics:0];
  return v3;
}

- (void)prepareLayout
{
  v36.receiver = self;
  v36.super_class = (Class)HKMCCycleTimelineFlowLayout;
  [(UICollectionViewFlowLayout *)&v36 prepareLayout];
  double v3 = [(HKMCCycleTimelineFlowLayout *)self collectionView];
  [v3 bounds];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  double v9 = v8;
  CGFloat v11 = v10;
  [v3 contentOffset];
  double v13 = v12;
  double v14 = v12 + v9 * 0.5;
  v37.origin.x = v5;
  v37.origin.y = v7;
  v37.size.double width = v9;
  v37.size.height = v11;
  double MidX = CGRectGetMidX(v37);
  v38.origin.x = v5;
  v38.origin.y = v7;
  v38.size.double width = v9;
  v38.size.height = v11;
  objc_msgSend(v3, "indexPathForItemAtPoint:", MidX, CGRectGetMidY(v38));
  double v16 = (NSIndexPath *)objc_claimAutoreleasedReturnValue();
  centerIndexPath = self->_centerIndexPath;
  self->_centerIndexPath = v16;

  double v18 = self->_centerIndexPath;
  v35.receiver = self;
  v35.super_class = (Class)HKMCCycleTimelineFlowLayout;
  CGRect v19 = [(UICollectionViewFlowLayout *)&v35 layoutAttributesForItemAtIndexPath:v18];
  [v19 frame];
  CGFloat v21 = v20;
  CGFloat v23 = v22;
  CGFloat v25 = v24;
  CGFloat v27 = v26;

  v39.origin.x = v21;
  v39.origin.y = v23;
  v39.size.double width = v25;
  v39.size.height = v27;
  self->_offsetFactor = (CGRectGetMidX(v39) - v14) / self->_cellSize.width;
  NSInteger v28 = [(NSIndexPath *)self->_centerIndexPath item];
  uint64_t v29 = [(NSArray *)self->_pillConfigurations count];
  if (v29 >= 0) {
    uint64_t v30 = v29;
  }
  else {
    uint64_t v30 = v29 + 1;
  }
  uint64_t v31 = v28 - (v30 >> 1);
  p_zoomRange = &self->_zoomRange;
  if (v31 <= 1) {
    uint64_t v33 = 1;
  }
  else {
    uint64_t v33 = v31;
  }
  NSUInteger v34 = [(NSArray *)self->_pillConfigurations count];
  p_zoomRange->location = v33 - 1;
  self->_zoomRange.length = v34 + 1;
  if (self->_offsetFactor < 0.0) {
    p_zoomRange->location = v33;
  }
  self->_zoomAreaOffset = v13 + (v9 - self->_totalZoomWidth) * 0.5;
}

- (BOOL)flipsHorizontallyInOppositeLayoutDirection
{
  return 1;
}

- (void)_configureLayoutAttributes:(id)a3
{
  id v18 = a3;
  double v4 = [v18 indexPath];
  unint64_t v5 = [v4 item];

  NSUInteger location = self->_zoomRange.location;
  if (v5 < location || v5 - location >= self->_zoomRange.length)
  {
    double width = self->_cellSize.width;
    double height = self->_cellSize.height;
    double v12 = 0.0;
    double y = 0.0;
    double v14 = 0.0;
  }
  else
  {
    -[HKMCCycleTimelineFlowLayout _pillFrameAtZoomIndex:](self, "_pillFrameAtZoomIndex:");
    double x = v20.origin.x;
    double y = v20.origin.y;
    double width = v20.size.width;
    double height = v20.size.height;
    double v12 = fabs(CGRectGetMidX(v20) / self->_totalZoomWidth * 2.0 + -1.0);
    [v18 frame];
    double v14 = x - (v13 - self->_zoomAreaOffset);
    v15 = [(HKMCCycleTimelineFlowLayout *)self collectionView];
    uint64_t v16 = [v15 effectiveUserInterfaceLayoutDirection];

    if (v16 == 1)
    {
      [v18 frame];
      double v14 = v17 - v14 - width;
    }
  }
  objc_msgSend(v18, "setPillFrame:", v14, y, width, height);
  [v18 setShrinkFactor:v12];
}

- (CGRect)_pillFrameAtZoomIndex:(int64_t)a3
{
  unint64_t v5 = [(HKMCCycleTimelineFlowLayout *)self _configurationAtIndex:a3 - 1];
  double v6 = [(HKMCCycleTimelineFlowLayout *)self _configurationAtIndex:a3];
  [v5 width];
  double v8 = v7;
  [v6 width];
  double offsetFactor = self->_offsetFactor;
  double v11 = v10 - v8;
  double v12 = v10 + (v10 - v8) * offsetFactor;
  double v13 = v8 + v11 * offsetFactor;
  if (offsetFactor >= 0.0) {
    double v14 = v13;
  }
  else {
    double v14 = v12;
  }
  double v15 = v14 * self->_pillAspectRatio;
  [(HKMCCycleTimelineFlowLayout *)self _pillOriginXAtZoomIndex:a3 centerPill:1];
  double v17 = v16;
  double v18 = self->_yOffset + (self->_centerPillHeight - v15) * 0.5;

  double v19 = v17;
  double v20 = v18;
  double v21 = v14;
  double v22 = v15;
  result.size.double height = v22;
  result.size.double width = v21;
  result.origin.double y = v20;
  result.origin.double x = v19;
  return result;
}

- (double)_pillOriginXAtZoomIndex:(int64_t)a3 centerPill:(BOOL)a4
{
  BOOL v4 = a4;
  int64_t v7 = a3 - 1;
  if (a3 < 1)
  {
    double v9 = 0.0;
  }
  else
  {
    [(HKMCCycleTimelineFlowLayout *)self _pillOriginXAtZoomIndex:a3 - 1 centerPill:0];
    double v9 = v8;
  }
  double v10 = [(HKMCCycleTimelineFlowLayout *)self _configurationAtIndex:a3 - 2];
  double v11 = [(HKMCCycleTimelineFlowLayout *)self _configurationAtIndex:v7];
  [v10 width];
  double v13 = v12;
  [v11 width];
  double offsetFactor = self->_offsetFactor;
  double v16 = v15 - v13;
  double v17 = v15 + (v15 - v13) * offsetFactor;
  double v18 = v13 + v16 * offsetFactor;
  if (offsetFactor >= 0.0) {
    double v19 = v18;
  }
  else {
    double v19 = v17;
  }
  [v10 spacing];
  double v21 = v20;
  [v11 spacing];
  double v22 = self->_offsetFactor;
  double v24 = v23 - v21;
  double v25 = v23 + (v23 - v21) * v22;
  double v26 = v21 + v24 * v22;
  if (v22 >= 0.0) {
    double v25 = v26;
  }
  double v27 = v9 + v19 + v25;
  if (v4)
  {
    NSInteger v28 = [(HKMCCycleTimelineFlowLayout *)self _configurationAtIndex:v7];
    [v28 spacing];
    double v30 = v29;
    uint64_t v31 = [(HKMCCycleTimelineFlowLayout *)self _configurationAtIndex:a3];
    [v31 spacing];
    double v32 = self->_offsetFactor;
    double v34 = v33 - v30;
    double v35 = v33 + (v33 - v30) * v32;
    double v36 = v30 + v34 * v32;
    if (v32 >= 0.0) {
      double v37 = v36;
    }
    else {
      double v37 = v35;
    }

    double v27 = v27 + v37 * 0.5;
  }

  return v27;
}

- (id)_configurationAtIndex:(int64_t)a3
{
  if (a3 < 0 || [(NSArray *)self->_pillConfigurations count] <= a3)
  {
    unint64_t v5 = self->_introPillConfiguration;
  }
  else
  {
    unint64_t v5 = [(NSArray *)self->_pillConfigurations objectAtIndexedSubscript:a3];
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_centerIndexPath, 0);
  objc_storeStrong((id *)&self->_introPillConfiguration, 0);
  objc_storeStrong((id *)&self->_pillConfigurations, 0);
}

@end