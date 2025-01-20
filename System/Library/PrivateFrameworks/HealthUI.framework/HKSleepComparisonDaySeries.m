@interface HKSleepComparisonDaySeries
- (BOOL)supportsMultiTouchSelection;
- (CGPoint)renderPositionForLabelLocation:(id)a3 rect:(CGRect)a4 zoomScale:(double)a5 contentOffset:(CGPoint)a6 constantOffset:(double)a7 isHorizontal:(BOOL)a8 optionalOffset:(CGPoint)a9;
- (CGSize)cornerRadii;
- (CGSize)cornerRadiiStorage;
- (HKSleepComparisonDaySeries)init;
- (NSArray)defaultFillStyles;
- (NSArray)defaultFillStylesStorage;
- (NSLock)seriesMutableStateLock;
- (double)distanceFromPoint:(CGPoint)a3 blockCoordinate:(id)a4 chartRect:(CGRect)a5;
- (double)xAxisDistanceFromPoint:(CGPoint)a3 blockCoordinate:(id)a4 chartRect:(CGRect)a5;
- (double)xAxisSelectedCoordinate:(double)a3 blockCoordinate:(id)a4 chartRect:(CGRect)a5;
- (double)yAxisDifferenceToPoint:(CGPoint)a3 blockCoordinate:(id)a4 chartRect:(CGRect)a5;
- (id)cacheKeysForModelRange:(id)a3 zoomScale:(double)a4;
- (id)coordinatesForBlock:(id)a3 blockPath:(HKGraphSeriesDataBlockPath *)a4 xAxis:(id)a5 yAxis:(id)a6;
- (id)findAxisLabelsInModelRange:(id)a3 zoomScale:(double)a4;
- (id)visibleValueRange;
- (void)_drawPaths:(id)a3 withFillStyles:(id)a4 axisRect:(CGRect)a5 context:(CGContext *)a6;
- (void)drawSeriesWithBlockCoordinates:(id)a3 axisRect:(CGRect)a4 zoomLevelConfiguration:(id)a5 pointTransform:(CGAffineTransform *)a6 renderContext:(CGContext *)a7 secondaryRenderContext:(id)a8 seriesRenderingDelegate:(id)a9;
- (void)setCornerRadii:(CGSize)a3;
- (void)setCornerRadiiStorage:(CGSize)a3;
- (void)setDefaultFillStyles:(id)a3;
- (void)setDefaultFillStylesStorage:(id)a3;
@end

@implementation HKSleepComparisonDaySeries

- (HKSleepComparisonDaySeries)init
{
  v8.receiver = self;
  v8.super_class = (Class)HKSleepComparisonDaySeries;
  v2 = [(HKGraphSeries *)&v8 init];
  v3 = v2;
  if (v2)
  {
    v2->_cornerRadiiStorage.width = 0.0;
    v2->_cornerRadiiStorage.height = 0.0;
    defaultFillStylesStorage = v2->_defaultFillStylesStorage;
    v2->_defaultFillStylesStorage = (NSArray *)MEMORY[0x1E4F1CBF0];

    v5 = (NSLock *)objc_alloc_init(MEMORY[0x1E4F28E08]);
    seriesMutableStateLock = v3->_seriesMutableStateLock;
    v3->_seriesMutableStateLock = v5;

    [(NSLock *)v3->_seriesMutableStateLock setName:@"HKSleepComparisonDaySeriesLock"];
  }
  return v3;
}

- (CGSize)cornerRadii
{
  v3 = [(HKSleepComparisonDaySeries *)self seriesMutableStateLock];
  [v3 lock];

  CGFloat width = self->_cornerRadiiStorage.width;
  CGFloat height = self->_cornerRadiiStorage.height;
  v6 = [(HKSleepComparisonDaySeries *)self seriesMutableStateLock];
  [v6 unlock];

  double v7 = width;
  double v8 = height;
  result.CGFloat height = v8;
  result.CGFloat width = v7;
  return result;
}

- (void)setCornerRadii:(CGSize)a3
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  v6 = [(HKSleepComparisonDaySeries *)self seriesMutableStateLock];
  [v6 lock];

  self->_cornerRadiiStorage.CGFloat width = width;
  self->_cornerRadiiStorage.CGFloat height = height;
  id v7 = [(HKSleepComparisonDaySeries *)self seriesMutableStateLock];
  [v7 unlock];
}

- (NSArray)defaultFillStyles
{
  v3 = [(HKSleepComparisonDaySeries *)self seriesMutableStateLock];
  [v3 lock];

  v4 = self->_defaultFillStylesStorage;
  v5 = [(HKSleepComparisonDaySeries *)self seriesMutableStateLock];
  [v5 unlock];

  return v4;
}

- (void)setDefaultFillStyles:(id)a3
{
  id v4 = a3;
  v5 = [(HKSleepComparisonDaySeries *)self seriesMutableStateLock];
  [v5 lock];

  v6 = (NSArray *)[v4 copy];
  defaultFillStylesStorage = self->_defaultFillStylesStorage;
  self->_defaultFillStylesStorage = v6;

  id v8 = [(HKSleepComparisonDaySeries *)self seriesMutableStateLock];
  [v8 unlock];
}

- (BOOL)supportsMultiTouchSelection
{
  return 0;
}

- (id)coordinatesForBlock:(id)a3 blockPath:(HKGraphSeriesDataBlockPath *)a4 xAxis:(id)a5 yAxis:(id)a6
{
  id v10 = a5;
  v11 = [a3 chartPoints];
  if (!v11)
  {
    v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"HKSleepComparisonDaySeries.m", 153, @"Invalid parameter not satisfying: %@", @"points != nil" object file lineNumber description];
  }
  v12 = [v10 transform];
  v13 = objc_opt_new();
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __72__HKSleepComparisonDaySeries_coordinatesForBlock_blockPath_xAxis_yAxis___block_invoke;
  v21[3] = &unk_1E6D54810;
  id v22 = v12;
  id v23 = v13;
  id v14 = v13;
  id v15 = v12;
  [v11 enumerateObjectsUsingBlock:v21];
  long long v19 = *(_OWORD *)&a4->index;
  int64_t resolution = a4->resolution;
  v16 = +[HKGraphSeriesBlockCoordinateList coordinateListWithCoordinates:v14 blockPath:&v19];

  return v16;
}

void __72__HKSleepComparisonDaySeries_coordinatesForBlock_blockPath_xAxis_yAxis___block_invoke(uint64_t a1, void *a2)
{
  id v18 = a2;
  v3 = [v18 yValue];

  if (v3)
  {
    id v4 = *(void **)(a1 + 32);
    v5 = [v18 startDate];
    [v4 coordinateForValue:v5];
    double v7 = v6;

    id v8 = *(void **)(a1 + 32);
    v9 = [v18 endDate];
    [v8 coordinateForValue:v9];
    double v11 = v10;

    v12 = *(void **)(a1 + 40);
    v13 = [HKSleepComparisonDayCoordinate alloc];
    id v14 = [v18 yValue];
    uint64_t v15 = (int)[v14 intValue];
    v16 = [v18 userInfo];
    v17 = [(HKSleepComparisonDayCoordinate *)v13 initWithXValueStart:v15 xValueEnd:v16 sleepValue:v7 userInfo:v11];
    [v12 addObject:v17];
  }
}

- (void)drawSeriesWithBlockCoordinates:(id)a3 axisRect:(CGRect)a4 zoomLevelConfiguration:(id)a5 pointTransform:(CGAffineTransform *)a6 renderContext:(CGContext *)a7 secondaryRenderContext:(id)a8 seriesRenderingDelegate:(id)a9
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  v35[2] = *MEMORY[0x1E4F143B8];
  v16 = (void *)MEMORY[0x1E4FB14C0];
  id v17 = a3;
  id v18 = [v16 bezierPath];
  v35[0] = v18;
  long long v19 = [MEMORY[0x1E4FB14C0] bezierPath];
  v35[1] = v19;
  v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:2];
  v21 = (void *)[v20 mutableCopy];

  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __169__HKSleepComparisonDaySeries_drawSeriesWithBlockCoordinates_axisRect_zoomLevelConfiguration_pointTransform_renderContext_secondaryRenderContext_seriesRenderingDelegate___block_invoke;
  v28[3] = &unk_1E6D54838;
  double v31 = x;
  double v32 = y;
  double v33 = width;
  double v34 = height;
  id v29 = v21;
  v30 = self;
  long long v22 = *(_OWORD *)&a6->c;
  long long v25 = *(_OWORD *)&a6->a;
  long long v26 = v22;
  long long v27 = *(_OWORD *)&a6->tx;
  id v23 = v21;
  [v17 enumerateCoordinatesWithTransform:&v25 roundToViewScale:1 block:v28];

  v24 = [(HKSleepComparisonDaySeries *)self defaultFillStyles];
  -[HKSleepComparisonDaySeries _drawPaths:withFillStyles:axisRect:context:](self, "_drawPaths:withFillStyles:axisRect:context:", v23, v24, a7, x, y, width, height);
}

void __169__HKSleepComparisonDaySeries_drawSeriesWithBlockCoordinates_axisRect_zoomLevelConfiguration_pointTransform_renderContext_secondaryRenderContext_seriesRenderingDelegate___block_invoke(uint64_t a1, void *a2)
{
  double v3 = *(double *)(a1 + 72);
  CGFloat v4 = v3 * 0.3;
  CGFloat v5 = *(double *)(a1 + 56) + (v3 - v3 * 0.3) * 0.5;
  id v6 = a2;
  [v6 xValueStart];
  CGFloat v8 = v7;
  [v6 xValueEnd];
  double v10 = v9;
  [v6 xValueStart];
  v22.size.double width = v10 - v11;
  v22.origin.double x = v8;
  v22.origin.double y = v5;
  v22.size.double height = v4;
  CGRect v23 = CGRectStandardize(v22);
  double x = v23.origin.x;
  double y = v23.origin.y;
  double width = v23.size.width;
  double height = v23.size.height;
  uint64_t v16 = [v6 sleepValue];

  [*(id *)(a1 + 32) objectAtIndexedSubscript:v16 != 0];
  id v20 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 40) cornerRadii];
  long long v19 = +[HKBarSeries barSeriesRoundedRect:byRoundingCorners:cornerRadii:](HKBarSeries, "barSeriesRoundedRect:byRoundingCorners:cornerRadii:", -1, x, y, width, height, v17, v18);
  [v20 appendPath:v19];
}

- (void)_drawPaths:(id)a3 withFillStyles:(id)a4 axisRect:(CGRect)a5 context:(CGContext *)a6
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  id v19 = a3;
  id v13 = a4;
  if ([v19 count])
  {
    unint64_t v14 = 0;
    do
    {
      uint64_t v15 = [v19 objectAtIndexedSubscript:v14];
      if (([v15 isEmpty] & 1) == 0)
      {
        uint64_t v16 = [v13 objectAtIndexedSubscript:v14];
        if (v16)
        {
          uint64_t v17 = [v15 CGPath];
          [(HKGraphSeries *)self alpha];
          objc_msgSend(v16, "renderPath:context:axisRect:alpha:", v17, a6, x, y, width, height, v18);
        }
      }
      ++v14;
    }
    while (v14 < [v19 count]);
  }
}

- (double)distanceFromPoint:(CGPoint)a3 blockCoordinate:(id)a4 chartRect:(CGRect)a5
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  double v9 = a3.y;
  double v10 = a3.x;
  id v12 = a4;
  -[HKSleepComparisonDaySeries xAxisDistanceFromPoint:blockCoordinate:chartRect:](self, "xAxisDistanceFromPoint:blockCoordinate:chartRect:", v12, v10, v9, x, y, width, height);
  double v14 = v13;
  -[HKSleepComparisonDaySeries yAxisDifferenceToPoint:blockCoordinate:chartRect:](self, "yAxisDifferenceToPoint:blockCoordinate:chartRect:", v12, v10, v9, x, y, width, height);
  double v16 = v15;

  return sqrt(v16 * v16 + v14 * v14);
}

- (double)xAxisSelectedCoordinate:(double)a3 blockCoordinate:(id)a4 chartRect:(CGRect)a5
{
  id v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    double v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2 object:self file:@"HKSleepComparisonDaySeries.m" lineNumber:251 description:@"xAxisSelectedCoordinate type class failure"];
  }
  id v9 = v8;
  [v9 startXValue];
  if (v10 <= a3) {
    double v11 = a3;
  }
  else {
    double v11 = v10;
  }
  [v9 endXValue];
  double v13 = v12;

  if (v11 < v13) {
    double v13 = v11;
  }

  return v13;
}

- (double)xAxisDistanceFromPoint:(CGPoint)a3 blockCoordinate:(id)a4 chartRect:(CGRect)a5
{
  double x = a3.x;
  id v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2 object:self file:@"HKSleepComparisonDaySeries.m" lineNumber:261 description:@"xAxisDistanceFromPoint type class failure"];
  }
  id v9 = v8;
  [v9 startXValue];
  double v11 = v10 - x;
  [v9 endXValue];
  double v13 = v12;

  double v14 = fmax(v11, 0.0);
  if (x - v13 <= 0.0) {
    double v15 = v14;
  }
  else {
    double v15 = x - v13;
  }

  return v15;
}

- (double)yAxisDifferenceToPoint:(CGPoint)a3 blockCoordinate:(id)a4 chartRect:(CGRect)a5
{
  return 0.0;
}

- (id)visibleValueRange
{
  return +[HKValueRange valueRangeWithMinValue:&unk_1F3C22A90 maxValue:&unk_1F3C22AA0];
}

- (id)cacheKeysForModelRange:(id)a3 zoomScale:(double)a4
{
  v7[1] = *MEMORY[0x1E4F143B8];
  CGFloat v4 = [(HKSleepComparisonDaySeries *)self visibleValueRange];
  v7[0] = v4;
  CGFloat v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];

  return v5;
}

- (id)findAxisLabelsInModelRange:(id)a3 zoomScale:(double)a4
{
  v8[2] = *MEMORY[0x1E4F143B8];
  CGFloat v4 = objc_alloc_init(HKAxisLabel);
  [(HKAxisLabel *)v4 setText:&stru_1F3B9CF20];
  [(HKAxisLabel *)v4 setLocation:&unk_1F3C22A90];
  [(HKAxisLabel *)v4 setLabelType:1];
  CGFloat v5 = objc_alloc_init(HKAxisLabel);
  [(HKAxisLabel *)v5 setText:&stru_1F3B9CF20];
  [(HKAxisLabel *)v5 setLocation:&unk_1F3C22AA0];
  [(HKAxisLabel *)v5 setLabelType:1];
  v8[0] = v4;
  v8[1] = v5;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:2];

  return v6;
}

- (CGPoint)renderPositionForLabelLocation:(id)a3 rect:(CGRect)a4 zoomScale:(double)a5 contentOffset:(CGPoint)a6 constantOffset:(double)a7 isHorizontal:(BOOL)a8 optionalOffset:(CGPoint)a9
{
  double v9 = *MEMORY[0x1E4F1DAD8];
  double v10 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  result.double y = v10;
  result.double x = v9;
  return result;
}

- (CGSize)cornerRadiiStorage
{
  double width = self->_cornerRadiiStorage.width;
  double height = self->_cornerRadiiStorage.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setCornerRadiiStorage:(CGSize)a3
{
  self->_cornerRadiiStorage = a3;
}

- (NSArray)defaultFillStylesStorage
{
  return self->_defaultFillStylesStorage;
}

- (void)setDefaultFillStylesStorage:(id)a3
{
}

- (NSLock)seriesMutableStateLock
{
  return self->_seriesMutableStateLock;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_seriesMutableStateLock, 0);
  objc_storeStrong((id *)&self->_defaultFillStylesStorage, 0);
}

@end