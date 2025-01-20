@interface AVTEngagementLayout
+ (UIEdgeInsets)insetsToCenterFirstAndLastItemsGivenContainerSize:(CGSize)a3 itemSize:(CGSize)a4;
+ (double)minimumInterItemSpacingForVisibileBoundsSize:(CGSize)a3 defaultCellSize:(CGSize)a4 engagedCellSize:(CGSize)a5;
- (AVTEngagementLayout)initWithDefaultCellSize:(CGSize)a3 engagedCellSize:(CGSize)a4 baseInteritemSpacing:(double)a5;
- (AVTEngagementLayout)initWithDefaultCellSize:(CGSize)a3 engagedCellSize:(CGSize)a4 interItemSpacingProvider:(id)a5;
- (AVTEngagementLayout)initWithDefaultCellSize:(CGSize)a3 engagedCellSize:(CGSize)a4 useEngagementSpacing:(BOOL)a5 interItemSpacingProvider:(id)a6;
- (AVTUILogger)logger;
- (BOOL)useEngagementSpacing;
- (CGPoint)centerForCenteringElementAtIndex:(int64_t)a3 visibleBoundsSize:(CGSize)a4 proposedOrigin:(CGPoint)a5;
- (CGRect)engagementBoundsForContainerBounds:(CGRect)a3;
- (CGRect)frameForElementAfterElementEndingAt:(double)a3 engagementBounds:(CGRect)a4 verticalBounds:(id)a5;
- (CGRect)frameForElementAtIndex:(int64_t)a3 visibleBounds:(CGRect)a4;
- (CGRect)frameForElementAtIndex:(int64_t)a3 visibleBounds:(CGRect)a4 engagementBounds:(CGRect)a5 verticalBounds:(id)a6;
- (CGRect)frameForElementBeforeElementStartingAt:(double)a3 engagementBounds:(CGRect)a4 verticalBounds:(id)a5;
- (CGRect)frameForElementBeforeOriginForVisibleBounds:(CGRect)a3;
- (CGSize)cellSizeForEngagement:(double)a3;
- (CGSize)contentSizeForVisibleBounds:(CGRect)a3 numberOfItems:(int64_t)a4;
- (CGSize)defaultCellSize;
- (CGSize)engagedCellSize;
- (CGSize)engagementSizeForVisibleBoundsSize:(CGSize)a3;
- (UIEdgeInsets)engagementBoundsInsets;
- (double)contentOriginXForVisibleSize:(CGSize)a3;
- (double)contentTrailingXForVisibleSize:(CGSize)a3;
- (double)engagementForValue:(double)a3 withRangeMin:(double)a4 rangeMax:(double)a5 rangePeak:(double)a6;
- (double)engagementForValue:(double)a3 withRangeMin:(double)a4 rangeMax:(double)a5 rangePeakBegin:(double)a6 rangePeakEnd:(double)a7;
- (double)interitemSpacingForEngagement:(double)a3;
- (double)spacingAfterElementEndingAt:(double)a3 engagementBounds:(CGRect)a4;
- (double)spacingBeforElementStartingAt:(double)a3 engagementBounds:(CGRect)a4;
- (double)xAxisScale;
- (id)indexesForElementsInRect:(CGRect)a3 visibleBounds:(CGRect)a4 numberOfItems:(int64_t)a5;
- (id)interItemSpacingProvider;
- (void)setEngagementBoundsInsets:(UIEdgeInsets)a3;
- (void)setUseEngagementSpacing:(BOOL)a3;
@end

@implementation AVTEngagementLayout

+ (double)minimumInterItemSpacingForVisibileBoundsSize:(CGSize)a3 defaultCellSize:(CGSize)a4 engagedCellSize:(CGSize)a5
{
  CGFloat v5 = (a3.width - a5.width) * 0.5;
  double v6 = floor(a4.width * 0.5);
  double v7 = floor(v5 - v6) + 1.0;
  if (v5 <= v6) {
    return v7;
  }
  else {
    return -v6;
  }
}

+ (UIEdgeInsets)insetsToCenterFirstAndLastItemsGivenContainerSize:(CGSize)a3 itemSize:(CGSize)a4
{
  double v4 = a3.width * 0.5 - a4.width * 0.5;
  double v5 = *MEMORY[0x263F1D1C0];
  double v6 = *(double *)(MEMORY[0x263F1D1C0] + 16);
  double v7 = v4;
  result.right = v7;
  result.bottom = v6;
  result.left = v4;
  result.top = v5;
  return result;
}

- (AVTEngagementLayout)initWithDefaultCellSize:(CGSize)a3 engagedCellSize:(CGSize)a4 baseInteritemSpacing:(double)a5
{
  double height = a4.height;
  double width = a4.width;
  double v7 = a3.height;
  double v8 = a3.width;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __84__AVTEngagementLayout_initWithDefaultCellSize_engagedCellSize_baseInteritemSpacing___block_invoke;
  v13[3] = &__block_descriptor_40_e8_d16__0d8l;
  *(double *)&v13[4] = a5;
  v10 = (void *)MEMORY[0x210530210](v13, a2);
  v11 = -[AVTEngagementLayout initWithDefaultCellSize:engagedCellSize:interItemSpacingProvider:](self, "initWithDefaultCellSize:engagedCellSize:interItemSpacingProvider:", v10, v8, v7, width, height);

  return v11;
}

double __84__AVTEngagementLayout_initWithDefaultCellSize_engagedCellSize_baseInteritemSpacing___block_invoke(uint64_t a1)
{
  return *(double *)(a1 + 32);
}

- (AVTEngagementLayout)initWithDefaultCellSize:(CGSize)a3 engagedCellSize:(CGSize)a4 interItemSpacingProvider:(id)a5
{
  return -[AVTEngagementLayout initWithDefaultCellSize:engagedCellSize:useEngagementSpacing:interItemSpacingProvider:](self, "initWithDefaultCellSize:engagedCellSize:useEngagementSpacing:interItemSpacingProvider:", 1, a5, a3.width, a3.height, a4.width, a4.height);
}

- (AVTEngagementLayout)initWithDefaultCellSize:(CGSize)a3 engagedCellSize:(CGSize)a4 useEngagementSpacing:(BOOL)a5 interItemSpacingProvider:(id)a6
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  CGFloat v9 = a3.height;
  CGFloat v10 = a3.width;
  id v12 = a6;
  v23.receiver = self;
  v23.super_class = (Class)AVTEngagementLayout;
  v13 = [(AVTEngagementLayout *)&v23 init];
  v14 = v13;
  if (v13)
  {
    v13->_defaultCellSize.CGFloat width = v10;
    v13->_defaultCellSize.CGFloat height = v9;
    v15 = (_OWORD *)MEMORY[0x263F1D1C0];
    v13->_engagedCellSize.CGFloat width = width;
    v13->_engagedCellSize.CGFloat height = height;
    long long v16 = v15[1];
    *(_OWORD *)&v13->_engagementBoundsInsets.top = *v15;
    *(_OWORD *)&v13->_engagementBoundsInsets.bottom = v16;
    v13->_useEngagementSpacing = a5;
    uint64_t v17 = [v12 copy];
    id interItemSpacingProvider = v14->_interItemSpacingProvider;
    v14->_id interItemSpacingProvider = (id)v17;

    v19 = +[AVTUIEnvironment defaultEnvironment];
    uint64_t v20 = [v19 logger];
    logger = v14->_logger;
    v14->_logger = (AVTUILogger *)v20;
  }
  return v14;
}

- (CGRect)engagementBoundsForContainerBounds:(CGRect)a3
{
  double x = a3.origin.x;
  double v5 = *(double *)(MEMORY[0x263F001A8] + 8);
  -[AVTEngagementLayout engagementSizeForVisibleBoundsSize:](self, "engagementSizeForVisibleBoundsSize:", a3.size.width, a3.size.height);
  double v7 = v6;
  double v9 = v8;
  [(AVTEngagementLayout *)self engagementBoundsInsets];
  double v11 = x + v10;
  double v12 = v5;
  double v13 = v7;
  double v14 = v9;
  result.size.CGFloat height = v14;
  result.size.CGFloat width = v13;
  result.origin.y = v12;
  result.origin.double x = v11;
  return result;
}

- (CGSize)engagementSizeForVisibleBoundsSize:(CGSize)a3
{
  CGFloat height = a3.height;
  double width = a3.width;
  [(AVTEngagementLayout *)self engagementBoundsInsets];
  double v7 = width - v6;
  [(AVTEngagementLayout *)self engagementBoundsInsets];
  double v9 = v7 - v8;
  double v10 = height;
  result.CGFloat height = v10;
  result.double width = v9;
  return result;
}

- (double)xAxisScale
{
  [(AVTEngagementLayout *)self defaultCellSize];
  double v4 = v3;
  double v5 = [(AVTEngagementLayout *)self interItemSpacingProvider];
  double v6 = v4 + v5[2](0.0);
  [(AVTEngagementLayout *)self engagedCellSize];
  double v8 = v7;
  double v9 = [(AVTEngagementLayout *)self interItemSpacingProvider];
  double v10 = v6 / (v8 + v9[2](1.0));

  return v10;
}

- (double)contentOriginXForVisibleSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  double v6 = objc_opt_class();
  [(AVTEngagementLayout *)self engagedCellSize];
  objc_msgSend(v6, "insetsToCenterFirstAndLastItemsGivenContainerSize:itemSize:", width, height, v7, v8);
  return v9;
}

- (double)contentTrailingXForVisibleSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  double v6 = objc_opt_class();
  [(AVTEngagementLayout *)self engagedCellSize];
  objc_msgSend(v6, "insetsToCenterFirstAndLastItemsGivenContainerSize:itemSize:", width, height, v7, v8);
  return v9;
}

- (CGRect)frameForElementAtIndex:(int64_t)a3 visibleBounds:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  -[AVTEngagementLayout engagementBoundsForContainerBounds:](self, "engagementBoundsForContainerBounds:");
  -[AVTEngagementLayout frameForElementAtIndex:visibleBounds:engagementBounds:verticalBounds:](self, "frameForElementAtIndex:visibleBounds:engagementBounds:verticalBounds:", a3, x, y, width, height, v10, v11, v12, v13, *(void *)&y, *(void *)&height);
  result.size.double height = v17;
  result.size.double width = v16;
  result.origin.double y = v15;
  result.origin.double x = v14;
  return result;
}

- (CGRect)frameForElementAtIndex:(int64_t)a3 visibleBounds:(CGRect)a4 engagementBounds:(CGRect)a5 verticalBounds:(id)a6
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  CGFloat v10 = a4.size.height;
  CGFloat v11 = a4.size.width;
  CGFloat rect_24 = a4.origin.y;
  CGFloat rect = a4.origin.x;
  int64_t v12 = a3;
  double v14 = v38;
  -[AVTEngagementLayout contentOriginXForVisibleSize:](self, "contentOriginXForVisibleSize:", a3, *(void *)&a6.var0, *(void *)&a6.var1, a4.size.width, a4.size.height);
  double v32 = v15;
  [(AVTEngagementLayout *)self xAxisScale];
  double v17 = 1.0 - v16;
  v39.origin.double x = rect;
  v39.origin.double y = rect_24;
  v39.size.double width = v11;
  v39.size.double height = v10;
  double v18 = v32 + v17 * CGRectGetMinX(v39);
  if (v12 >= 1)
  {
    do
    {
      -[AVTEngagementLayout frameForElementAfterElementEndingAt:engagementBounds:verticalBounds:](self, "frameForElementAfterElementEndingAt:engagementBounds:verticalBounds:", v18, x, y, width, height, v37, v14);
      CGFloat v19 = v40.origin.x;
      CGFloat v20 = v40.origin.y;
      double v21 = x;
      double v22 = y;
      double v23 = width;
      double v24 = height;
      CGFloat v25 = v40.size.width;
      CGFloat v26 = v40.size.height;
      -[AVTEngagementLayout spacingAfterElementEndingAt:engagementBounds:](self, "spacingAfterElementEndingAt:engagementBounds:", CGRectGetMaxX(v40), v21, v22, v23, v24);
      double rect_24a = v27;
      v41.origin.double x = v19;
      v41.origin.double y = v20;
      v41.size.double width = v25;
      double height = v24;
      double width = v23;
      double y = v22;
      double x = v21;
      v41.size.double height = v26;
      double v14 = v38;
      double v18 = rect_24a + CGRectGetMaxX(v41);
      --v12;
    }
    while (v12);
  }
  -[AVTEngagementLayout frameForElementAfterElementEndingAt:engagementBounds:verticalBounds:](self, "frameForElementAfterElementEndingAt:engagementBounds:verticalBounds:", v18, x, y, width, height, v37, v14);
  result.size.double height = v31;
  result.size.double width = v30;
  result.origin.double y = v29;
  result.origin.double x = v28;
  return result;
}

- (CGRect)frameForElementAfterElementEndingAt:(double)a3 engagementBounds:(CGRect)a4 verticalBounds:(id)a5
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  double MinX = CGRectGetMinX(a4);
  v34.origin.CGFloat x = x;
  v34.origin.CGFloat y = y;
  v34.size.CGFloat width = width;
  v34.size.CGFloat height = height;
  double MaxX = CGRectGetMaxX(v34);
  [(AVTEngagementLayout *)self defaultCellSize];
  double v14 = MaxX - v13;
  v35.origin.CGFloat x = x;
  v35.origin.CGFloat y = y;
  v35.size.CGFloat width = width;
  v35.size.CGFloat height = height;
  double MidX = CGRectGetMidX(v35);
  [(AVTEngagementLayout *)self engagedCellSize];
  [(AVTEngagementLayout *)self engagementForValue:a3 withRangeMin:MinX rangeMax:v14 rangePeak:MidX + v16 * -0.5];
  -[AVTEngagementLayout cellSizeForEngagement:](self, "cellSizeForEngagement:");
  CGFloat v19 = v18;
  double v20 = v17;
  if (v18 == INFINITY || v17 == INFINITY)
  {
    [(AVTEngagementLayout *)self defaultCellSize];
    CGFloat v19 = v22;
    double v20 = v23;
  }
  v36.origin.CGFloat x = a3;
  v36.origin.CGFloat y = a5.var0 + (a5.var1 - v20) * 0.5;
  v36.size.CGFloat width = v19;
  v36.size.CGFloat height = v20;
  if (CGRectIsInfinite(v36))
  {
    double v24 = NSString;
    v37.origin.CGFloat x = a3;
    v37.origin.CGFloat y = a5.var0 + (a5.var1 - v20) * 0.5;
    v37.size.CGFloat width = v19;
    v37.size.CGFloat height = v20;
    CGFloat v25 = NSStringFromCGRect(v37);
    v38.origin.CGFloat x = x;
    v38.origin.CGFloat y = y;
    v38.size.CGFloat width = width;
    v38.size.CGFloat height = height;
    CGFloat v26 = NSStringFromCGRect(v38);
    double v27 = [v24 stringWithFormat:@"Frame %@ has infinity values based on parameters previousElementMaxX=%f, engagementBounds=%@, verticalBounds=(%f %f)", v25, *(void *)&a3, v26, *(void *)&a5.var1, *(void *)&a5.var0];

    double v28 = [(AVTEngagementLayout *)self logger];
    [v28 logDebug:v27];
  }
  double v29 = a3;
  double v30 = a5.var0 + (a5.var1 - v20) * 0.5;
  double v31 = v19;
  double v32 = v20;
  result.size.CGFloat height = v32;
  result.size.CGFloat width = v31;
  result.origin.CGFloat y = v30;
  result.origin.CGFloat x = v29;
  return result;
}

- (double)spacingAfterElementEndingAt:(double)a3 engagementBounds:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  double MidX = CGRectGetMidX(a4);
  [(AVTEngagementLayout *)self engagedCellSize];
  double v12 = MidX - v11 * 0.5;
  [(AVTEngagementLayout *)self interitemSpacingForEngagement:1.0];
  double v14 = v12 - v13;
  v31.origin.CGFloat x = x;
  v31.origin.CGFloat y = y;
  v31.size.CGFloat width = width;
  v31.size.CGFloat height = height;
  double v15 = CGRectGetMidX(v31);
  [(AVTEngagementLayout *)self engagedCellSize];
  double v17 = v15 + v16 * 0.5;
  v32.origin.CGFloat x = x;
  v32.origin.CGFloat y = y;
  v32.size.CGFloat width = width;
  v32.size.CGFloat height = height;
  double MinX = CGRectGetMinX(v32);
  [(AVTEngagementLayout *)self defaultCellSize];
  double v20 = MinX + v19;
  v33.origin.CGFloat x = x;
  v33.origin.CGFloat y = y;
  v33.size.CGFloat width = width;
  v33.size.CGFloat height = height;
  double MaxX = CGRectGetMaxX(v33);
  [(AVTEngagementLayout *)self defaultCellSize];
  double v23 = MaxX - v22;
  [(AVTEngagementLayout *)self interitemSpacingForEngagement:0.0];
  [(AVTEngagementLayout *)self engagementForValue:a3 withRangeMin:v20 rangeMax:v23 - v24 rangePeakBegin:v14 rangePeakEnd:v17];
  double v26 = v25;
  BOOL v27 = [(AVTEngagementLayout *)self useEngagementSpacing];
  double v28 = 1.0;
  if (v27) {
    double v28 = v26;
  }
  [(AVTEngagementLayout *)self interitemSpacingForEngagement:v28];
  return result;
}

- (CGRect)frameForElementBeforeElementStartingAt:(double)a3 engagementBounds:(CGRect)a4 verticalBounds:(id)a5
{
  double var1 = a5.var1;
  double var0 = a5.var0;
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  double MinX = CGRectGetMinX(a4);
  [(AVTEngagementLayout *)self defaultCellSize];
  double v14 = MinX + v13;
  v25.origin.CGFloat x = x;
  v25.origin.CGFloat y = y;
  v25.size.CGFloat width = width;
  v25.size.CGFloat height = height;
  double MaxX = CGRectGetMaxX(v25);
  v26.origin.CGFloat x = x;
  v26.origin.CGFloat y = y;
  v26.size.CGFloat width = width;
  v26.size.CGFloat height = height;
  double MidX = CGRectGetMidX(v26);
  [(AVTEngagementLayout *)self engagedCellSize];
  [(AVTEngagementLayout *)self engagementForValue:a3 withRangeMin:v14 rangeMax:MaxX rangePeak:MidX + v17 * 0.5];
  -[AVTEngagementLayout cellSizeForEngagement:](self, "cellSizeForEngagement:");
  double v19 = v18;
  double v21 = v20;
  double v22 = a3 - v18;
  double v23 = var0 + (var1 - v20) * 0.5;
  result.size.CGFloat height = v21;
  result.size.CGFloat width = v19;
  result.origin.CGFloat y = v23;
  result.origin.CGFloat x = v22;
  return result;
}

- (double)spacingBeforElementStartingAt:(double)a3 engagementBounds:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  double MidX = CGRectGetMidX(a4);
  [(AVTEngagementLayout *)self engagedCellSize];
  double v12 = MidX - v11 * 0.5;
  v31.origin.CGFloat x = x;
  v31.origin.CGFloat y = y;
  v31.size.CGFloat width = width;
  v31.size.CGFloat height = height;
  double v13 = CGRectGetMidX(v31);
  [(AVTEngagementLayout *)self engagedCellSize];
  double v15 = v13 + v14 * 0.5;
  [(AVTEngagementLayout *)self interitemSpacingForEngagement:1.0];
  double v17 = v16 + v15;
  v32.origin.CGFloat x = x;
  v32.origin.CGFloat y = y;
  v32.size.CGFloat width = width;
  v32.size.CGFloat height = height;
  double MinX = CGRectGetMinX(v32);
  [(AVTEngagementLayout *)self defaultCellSize];
  double v20 = MinX + v19;
  [(AVTEngagementLayout *)self interitemSpacingForEngagement:0.0];
  double v22 = v21 + v20;
  v33.origin.CGFloat x = x;
  v33.origin.CGFloat y = y;
  v33.size.CGFloat width = width;
  v33.size.CGFloat height = height;
  double MaxX = CGRectGetMaxX(v33);
  [(AVTEngagementLayout *)self defaultCellSize];
  [(AVTEngagementLayout *)self engagementForValue:a3 withRangeMin:v22 rangeMax:MaxX - v24 rangePeakBegin:v12 rangePeakEnd:v17];
  double v26 = v25;
  BOOL v27 = [(AVTEngagementLayout *)self useEngagementSpacing];
  double v28 = 1.0;
  if (v27) {
    double v28 = v26;
  }
  [(AVTEngagementLayout *)self interitemSpacingForEngagement:v28];
  return result;
}

- (double)engagementForValue:(double)a3 withRangeMin:(double)a4 rangeMax:(double)a5 rangePeak:(double)a6
{
  [(AVTEngagementLayout *)self engagementForValue:a3 withRangeMin:a4 rangeMax:a5 rangePeakBegin:a6 rangePeakEnd:a6];
  return result;
}

- (double)engagementForValue:(double)a3 withRangeMin:(double)a4 rangeMax:(double)a5 rangePeakBegin:(double)a6 rangePeakEnd:(double)a7
{
  double v7 = a5 - a7;
  if (a3 > a7)
  {
    double v8 = a3 - a7;
  }
  else
  {
    double v7 = 1.0;
    double v8 = 0.0;
  }
  double v9 = a6 - a3;
  double v10 = a6 - a4;
  BOOL v11 = a3 < a6;
  if (a3 < a6) {
    double v12 = v10;
  }
  else {
    double v12 = v7;
  }
  if (v11) {
    double v13 = v9;
  }
  else {
    double v13 = v8;
  }
  double result = fmin(1.0 - v13 / v12, 1.0);
  if (result < 0.0) {
    return 0.0;
  }
  return result;
}

- (CGSize)cellSizeForEngagement:(double)a3
{
  [(AVTEngagementLayout *)self defaultCellSize];
  double v6 = v5;
  [(AVTEngagementLayout *)self engagedCellSize];
  double v8 = v7;
  [(AVTEngagementLayout *)self defaultCellSize];
  double v10 = v6 + (v8 - v9) * a3;
  [(AVTEngagementLayout *)self defaultCellSize];
  double v12 = v11;
  [(AVTEngagementLayout *)self engagedCellSize];
  double v14 = v13;
  [(AVTEngagementLayout *)self defaultCellSize];
  double v16 = v12 + (v14 - v15) * a3;
  double v17 = v10;
  result.CGFloat height = v16;
  result.CGFloat width = v17;
  return result;
}

- (double)interitemSpacingForEngagement:(double)a3
{
  double v4 = [(AVTEngagementLayout *)self interItemSpacingProvider];
  double v5 = v4[2](a3);

  return v5;
}

- (id)indexesForElementsInRect:(CGRect)a3 visibleBounds:(CGRect)a4 numberOfItems:(int64_t)a5
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  CGFloat v10 = a3.size.height;
  CGFloat v11 = a3.size.width;
  CGFloat v12 = a3.origin.y;
  CGFloat v13 = a3.origin.x;
  double v15 = [MEMORY[0x263F089C8] indexSet];
  if (a5 >= 1)
  {
    uint64_t v16 = 0;
    do
    {
      -[AVTEngagementLayout frameForElementAtIndex:visibleBounds:](self, "frameForElementAtIndex:visibleBounds:", v16, x, y, width, height);
      v25.origin.double x = v17;
      v25.origin.double y = v18;
      v25.size.double width = v19;
      v25.size.double height = v20;
      v24.origin.double x = v13;
      v24.origin.double y = v12;
      v24.size.double width = v11;
      v24.size.double height = v10;
      if (CGRectIntersectsRect(v24, v25)) {
        [v15 addIndex:v16];
      }
      ++v16;
    }
    while (a5 != v16);
  }
  double v21 = (void *)[v15 copy];

  return v21;
}

- (CGPoint)centerForCenteringElementAtIndex:(int64_t)a3 visibleBoundsSize:(CGSize)a4 proposedOrigin:(CGPoint)a5
{
  double y = a5.y;
  double height = a4.height;
  double width = a4.width;
  -[AVTEngagementLayout engagementSizeForVisibleBoundsSize:](self, "engagementSizeForVisibleBoundsSize:", a4.width, a4.height, a5.x);
  double v11 = v10;
  double v13 = v12;
  [(AVTEngagementLayout *)self engagedCellSize];
  double MinX = v14 * -0.5;
  if (a3 >= 1)
  {
    double v16 = *(double *)(MEMORY[0x263F001A8] + 8);
    double v17 = v11 * -0.5;
    do
    {
      -[AVTEngagementLayout spacingBeforElementStartingAt:engagementBounds:](self, "spacingBeforElementStartingAt:engagementBounds:", MinX, v17, v16, v11, v13);
      -[AVTEngagementLayout frameForElementBeforeElementStartingAt:engagementBounds:verticalBounds:](self, "frameForElementBeforeElementStartingAt:engagementBounds:verticalBounds:", MinX - v18, v17, v16, v11, v13, y, height);
      double MinX = CGRectGetMinX(v31);
      --a3;
    }
    while (a3);
  }
  -[AVTEngagementLayout contentOriginXForVisibleSize:](self, "contentOriginXForVisibleSize:", width, height);
  double v20 = MinX - v19;
  [(AVTEngagementLayout *)self engagementBoundsInsets];
  double v22 = v11 * 0.5 + v21;
  [(AVTEngagementLayout *)self xAxisScale];
  double v24 = v22 + (-v20 - v22) / v23;
  [(AVTEngagementLayout *)self engagementBoundsInsets];
  double v26 = v25;
  [(AVTEngagementLayout *)self engagementBoundsInsets];
  double v28 = v24 + (v26 - v27) * 0.5;
  double v29 = y + height * 0.5;
  result.double y = v29;
  result.double x = v28;
  return result;
}

- (CGSize)contentSizeForVisibleBounds:(CGRect)a3 numberOfItems:(int64_t)a4
{
  if (a4 <= 0)
  {
    double v14 = *MEMORY[0x263F001B0];
    double v15 = *(double *)(MEMORY[0x263F001B0] + 8);
  }
  else
  {
    double height = a3.size.height;
    double width = a3.size.width;
    CGFloat y = a3.origin.y;
    CGFloat x = a3.origin.x;
    -[AVTEngagementLayout centerForCenteringElementAtIndex:visibleBoundsSize:proposedOrigin:](self, "centerForCenteringElementAtIndex:visibleBoundsSize:proposedOrigin:", a4 - 1, a3.size.width, a3.size.height, a3.origin.x, a3.origin.y);
    double v10 = v9;
    -[AVTEngagementLayout contentTrailingXForVisibleSize:](self, "contentTrailingXForVisibleSize:", width, height);
    double v12 = v11;
    [(AVTEngagementLayout *)self engagedCellSize];
    double v14 = v12 + v10 + v13 * 0.5;
    v18.origin.CGFloat x = x;
    v18.origin.CGFloat y = y;
    v18.size.double width = width;
    v18.size.double height = height;
    double v15 = CGRectGetHeight(v18);
  }
  double v16 = v14;
  result.double height = v15;
  result.double width = v16;
  return result;
}

- (CGRect)frameForElementBeforeOriginForVisibleBounds:(CGRect)a3
{
  double width = a3.size.width;
  double x = a3.origin.x;
  double y = a3.origin.y;
  double rect_8 = a3.size.height;
  double rect_16 = a3.origin.y;
  double height = a3.size.height;
  -[AVTEngagementLayout frameForElementAtIndex:visibleBounds:](self, "frameForElementAtIndex:visibleBounds:", 0);
  CGFloat v9 = v8;
  CGFloat rect = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  -[AVTEngagementLayout engagementBoundsForContainerBounds:](self, "engagementBoundsForContainerBounds:", x, y, width, height);
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;
  v35.origin.double x = v9;
  v35.origin.double y = v11;
  v35.size.double width = v13;
  v35.size.double height = v15;
  -[AVTEngagementLayout spacingBeforElementStartingAt:engagementBounds:](self, "spacingBeforElementStartingAt:engagementBounds:", CGRectGetMinX(v35), v17, v19, v21, v23);
  double v25 = v24;
  v36.origin.double x = rect;
  v36.origin.double y = v11;
  v36.size.double width = v13;
  v36.size.double height = v15;
  double v26 = CGRectGetMinX(v36) - v25;
  -[AVTEngagementLayout frameForElementBeforeElementStartingAt:engagementBounds:verticalBounds:](self, "frameForElementBeforeElementStartingAt:engagementBounds:verticalBounds:", v26, v17, v19, v21, v23, rect_16, rect_8);
  result.size.double height = v30;
  result.size.double width = v29;
  result.origin.double y = v28;
  result.origin.double x = v27;
  return result;
}

- (CGSize)defaultCellSize
{
  double width = self->_defaultCellSize.width;
  double height = self->_defaultCellSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGSize)engagedCellSize
{
  double width = self->_engagedCellSize.width;
  double height = self->_engagedCellSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (UIEdgeInsets)engagementBoundsInsets
{
  double top = self->_engagementBoundsInsets.top;
  double left = self->_engagementBoundsInsets.left;
  double bottom = self->_engagementBoundsInsets.bottom;
  double right = self->_engagementBoundsInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setEngagementBoundsInsets:(UIEdgeInsets)a3
{
  self->_engagementBoundsInsets = a3;
}

- (BOOL)useEngagementSpacing
{
  return self->_useEngagementSpacing;
}

- (void)setUseEngagementSpacing:(BOOL)a3
{
  self->_useEngagementSpacing = a3;
}

- (id)interItemSpacingProvider
{
  return self->_interItemSpacingProvider;
}

- (AVTUILogger)logger
{
  return self->_logger;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong(&self->_interItemSpacingProvider, 0);
}

@end