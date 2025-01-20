@interface HKHorizontalTimePeriodSeries
- (BOOL)blockCoordinate:(id)a3 greaterThan:(id)a4;
- (BOOL)blockCoordinate:(id)a3 lessThan:(id)a4;
- (BOOL)supportsMultiTouchSelection;
- (CGPoint)renderPositionForLabelLocation:(id)a3 rect:(CGRect)a4 zoomScale:(double)a5 contentOffset:(CGPoint)a6 constantOffset:(double)a7 isHorizontal:(BOOL)a8 optionalOffset:(CGPoint)a9;
- (CGRect)enumerationRectForLevel:(int64_t)a3 axisRect:(CGRect)a4;
- (HKHorizontalTimePeriodSeries)init;
- (NSArray)cachedAxisLabelsStorage;
- (NSArray)enumerationValueOrdering;
- (NSArray)enumerationValueOrderingStorage;
- (NSDictionary)valueLabels;
- (NSDictionary)valueLabelsStorage;
- (NSLock)seriesMutableStateLock;
- (UIColor)fillColor;
- (UIColor)fillColorStorage;
- (UIImage)selectedPointMarkerImage;
- (UIImage)selectedPointMarkerImageStorage;
- (double)distanceFromPoint:(CGPoint)a3 blockCoordinate:(id)a4 chartRect:(CGRect)a5;
- (double)lineWidth;
- (double)lineWidthStorage;
- (double)offsetForCoordinate:(id)a3 axisRect:(CGRect)a4;
- (double)offsetForEnumerationRect:(CGRect)a3;
- (double)xAxisDistanceFromPoint:(CGPoint)a3 blockCoordinate:(id)a4 chartRect:(CGRect)a5;
- (double)xAxisSelectedCoordinate:(double)a3 blockCoordinate:(id)a4 chartRect:(CGRect)a5;
- (double)yAxisDifferenceToPoint:(CGPoint)a3 blockCoordinate:(id)a4 chartRect:(CGRect)a5;
- (id)_generateAxisLabels;
- (id)cacheKeysForModelRange:(id)a3 zoomScale:(double)a4;
- (id)cachedAxisLabels;
- (id)coordinatesForBlock:(id)a3 blockPath:(HKGraphSeriesDataBlockPath *)a4 xAxis:(id)a5 yAxis:(id)a6;
- (int64_t)_enumeratedLevelForCoordinate:(id)a3;
- (void)drawSeriesWithBlockCoordinates:(id)a3 axisRect:(CGRect)a4 zoomLevelConfiguration:(id)a5 pointTransform:(CGAffineTransform *)a6 renderContext:(CGContext *)a7 secondaryRenderContext:(id)a8 seriesRenderingDelegate:(id)a9;
- (void)setEnumerationValueOrdering:(id)a3;
- (void)setEnumerationValueOrderingStorage:(id)a3;
- (void)setFillColor:(id)a3;
- (void)setFillColorStorage:(id)a3;
- (void)setLineWidth:(double)a3;
- (void)setLineWidthStorage:(double)a3;
- (void)setSelectedPointMarkerImage:(id)a3;
- (void)setSelectedPointMarkerImageStorage:(id)a3;
- (void)setValueLabels:(id)a3;
- (void)setValueLabelsStorage:(id)a3;
@end

@implementation HKHorizontalTimePeriodSeries

- (HKHorizontalTimePeriodSeries)init
{
  v12.receiver = self;
  v12.super_class = (Class)HKHorizontalTimePeriodSeries;
  v2 = [(HKGraphSeries *)&v12 init];
  if (v2)
  {
    v3 = (NSLock *)objc_alloc_init(MEMORY[0x1E4F28E08]);
    seriesMutableStateLock = v2->_seriesMutableStateLock;
    v2->_seriesMutableStateLock = v3;

    [(NSLock *)v2->_seriesMutableStateLock setName:@"HKHorizontalTimePeriodSeriesLock"];
    cachedAxisLabelsStorage = v2->_cachedAxisLabelsStorage;
    v6 = (NSArray *)MEMORY[0x1E4F1CBF0];
    v2->_cachedAxisLabelsStorage = (NSArray *)MEMORY[0x1E4F1CBF0];

    selectedPointMarkerImageStorage = v2->_selectedPointMarkerImageStorage;
    v2->_selectedPointMarkerImageStorage = 0;

    fillColorStorage = v2->_fillColorStorage;
    v2->_fillColorStorage = 0;

    v2->_lineWidthStorage = 1.0;
    enumerationValueOrderingStorage = v2->_enumerationValueOrderingStorage;
    v2->_enumerationValueOrderingStorage = v6;

    valueLabelsStorage = v2->_valueLabelsStorage;
    v2->_valueLabelsStorage = (NSDictionary *)MEMORY[0x1E4F1CC08];
  }
  return v2;
}

- (id)cachedAxisLabels
{
  v3 = [(HKHorizontalTimePeriodSeries *)self seriesMutableStateLock];
  [v3 lock];

  v4 = self->_cachedAxisLabelsStorage;
  v5 = [(HKHorizontalTimePeriodSeries *)self seriesMutableStateLock];
  [v5 unlock];

  return v4;
}

- (UIImage)selectedPointMarkerImage
{
  v3 = [(HKHorizontalTimePeriodSeries *)self seriesMutableStateLock];
  [v3 lock];

  v4 = self->_selectedPointMarkerImageStorage;
  v5 = [(HKHorizontalTimePeriodSeries *)self seriesMutableStateLock];
  [v5 unlock];

  return v4;
}

- (void)setSelectedPointMarkerImage:(id)a3
{
  v4 = (UIImage *)a3;
  v5 = [(HKHorizontalTimePeriodSeries *)self seriesMutableStateLock];
  [v5 lock];

  selectedPointMarkerImageStorage = self->_selectedPointMarkerImageStorage;
  self->_selectedPointMarkerImageStorage = v4;

  id v7 = [(HKHorizontalTimePeriodSeries *)self seriesMutableStateLock];
  [v7 unlock];
}

- (UIColor)fillColor
{
  v3 = [(HKHorizontalTimePeriodSeries *)self seriesMutableStateLock];
  [v3 lock];

  v4 = self->_fillColorStorage;
  v5 = [(HKHorizontalTimePeriodSeries *)self seriesMutableStateLock];
  [v5 unlock];

  return v4;
}

- (void)setFillColor:(id)a3
{
  v4 = (UIColor *)a3;
  v5 = [(HKHorizontalTimePeriodSeries *)self seriesMutableStateLock];
  [v5 lock];

  fillColorStorage = self->_fillColorStorage;
  self->_fillColorStorage = v4;

  id v7 = [(HKHorizontalTimePeriodSeries *)self seriesMutableStateLock];
  [v7 unlock];
}

- (double)lineWidth
{
  v3 = [(HKHorizontalTimePeriodSeries *)self seriesMutableStateLock];
  [v3 lock];

  double lineWidthStorage = self->_lineWidthStorage;
  v5 = [(HKHorizontalTimePeriodSeries *)self seriesMutableStateLock];
  [v5 unlock];

  return lineWidthStorage;
}

- (void)setLineWidth:(double)a3
{
  v5 = [(HKHorizontalTimePeriodSeries *)self seriesMutableStateLock];
  [v5 lock];

  self->_double lineWidthStorage = a3;
  id v6 = [(HKHorizontalTimePeriodSeries *)self seriesMutableStateLock];
  [v6 unlock];
}

- (NSArray)enumerationValueOrdering
{
  v3 = [(HKHorizontalTimePeriodSeries *)self seriesMutableStateLock];
  [v3 lock];

  v4 = self->_enumerationValueOrderingStorage;
  v5 = [(HKHorizontalTimePeriodSeries *)self seriesMutableStateLock];
  [v5 unlock];

  return v4;
}

- (void)setEnumerationValueOrdering:(id)a3
{
  v4 = (NSArray *)a3;
  v5 = [(HKHorizontalTimePeriodSeries *)self seriesMutableStateLock];
  [v5 lock];

  enumerationValueOrderingStorage = self->_enumerationValueOrderingStorage;
  self->_enumerationValueOrderingStorage = v4;
  id v7 = v4;

  v8 = [(HKHorizontalTimePeriodSeries *)self _generateAxisLabels];
  cachedAxisLabelsStorage = self->_cachedAxisLabelsStorage;
  self->_cachedAxisLabelsStorage = v8;

  id v10 = [(HKHorizontalTimePeriodSeries *)self seriesMutableStateLock];
  [v10 unlock];
}

- (NSDictionary)valueLabels
{
  v3 = [(HKHorizontalTimePeriodSeries *)self seriesMutableStateLock];
  [v3 lock];

  v4 = self->_valueLabelsStorage;
  v5 = [(HKHorizontalTimePeriodSeries *)self seriesMutableStateLock];
  [v5 unlock];

  return v4;
}

- (void)setValueLabels:(id)a3
{
  v4 = (NSDictionary *)a3;
  v5 = [(HKHorizontalTimePeriodSeries *)self seriesMutableStateLock];
  [v5 lock];

  valueLabelsStorage = self->_valueLabelsStorage;
  self->_valueLabelsStorage = v4;
  id v7 = v4;

  v8 = [(HKHorizontalTimePeriodSeries *)self _generateAxisLabels];
  cachedAxisLabelsStorage = self->_cachedAxisLabelsStorage;
  self->_cachedAxisLabelsStorage = v8;

  id v10 = [(HKHorizontalTimePeriodSeries *)self seriesMutableStateLock];
  [v10 unlock];
}

- (void)drawSeriesWithBlockCoordinates:(id)a3 axisRect:(CGRect)a4 zoomLevelConfiguration:(id)a5 pointTransform:(CGAffineTransform *)a6 renderContext:(CGContext *)a7 secondaryRenderContext:(id)a8 seriesRenderingDelegate:(id)a9
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  id v19 = a3;
  id v20 = a5;
  id v21 = a8;
  id v22 = a9;
  long long v66 = 0u;
  long long v67 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  [(HKGraphSeries *)self selectedPathRange];
  v23 = [(HKGraphSeries *)self closestXCoordinateRange];
  v39 = [v23 minValue];

  LOBYTE(v23) = [(HKGraphSeries *)self isHighlighted];
  uint64_t v59 = 0;
  v60 = (CGFloat *)&v59;
  uint64_t v61 = 0x3010000000;
  v62 = &unk_1E0F50A5E;
  long long v63 = *MEMORY[0x1E4F1DAD8];
  uint64_t v55 = 0;
  v56 = &v55;
  uint64_t v57 = 0x2020000000;
  char v58 = 0;
  CGContextSaveGState(a7);
  [(HKHorizontalTimePeriodSeries *)self lineWidth];
  CGContextSetLineWidth(a7, v24);
  CGContextSetLineCap(a7, kCGLineCapRound);
  id v25 = [(HKHorizontalTimePeriodSeries *)self fillColor];
  CGContextSetStrokeColorWithColor(a7, (CGColorRef)[v25 CGColor]);

  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = __171__HKHorizontalTimePeriodSeries_drawSeriesWithBlockCoordinates_axisRect_zoomLevelConfiguration_pointTransform_renderContext_secondaryRenderContext_seriesRenderingDelegate___block_invoke;
  v41[3] = &unk_1E6D570A8;
  CGFloat v45 = x;
  CGFloat v46 = y;
  CGFloat v47 = width;
  CGFloat v48 = height;
  v49 = a7;
  char v54 = (char)v23;
  long long v50 = v64;
  long long v51 = v65;
  long long v52 = v66;
  long long v53 = v67;
  v26 = v19;
  v41[4] = self;
  v43 = &v55;
  id v27 = v39;
  id v42 = v27;
  v44 = &v59;
  long long v28 = *(_OWORD *)&a6->c;
  v40[0] = *(_OWORD *)&a6->a;
  v40[1] = v28;
  v40[2] = *(_OWORD *)&a6->tx;
  [v26 enumerateCoordinatesWithTransform:v40 roundToViewScale:1 block:v41];
  if (*((unsigned char *)v56 + 24))
  {
    v29 = [(HKHorizontalTimePeriodSeries *)self selectedPointMarkerImage];
    double v30 = HKChartSeriesPointMarkerBaseRect(v29);
    CGFloat v32 = v31;
    CGFloat v34 = v33;
    CGFloat v36 = v35;
    id v37 = v29;
    v38 = (CGImage *)[v37 CGImage];
    v68.origin.CGFloat x = v30;
    v68.origin.CGFloat y = v32;
    v68.size.CGFloat width = v34;
    v68.size.CGFloat height = v36;
    CGRect v69 = CGRectOffset(v68, v60[4], v60[5]);
    CGContextDrawImage(a7, v69, v38);
  }
  CGContextRestoreGState(a7);

  _Block_object_dispose(&v55, 8);
  _Block_object_dispose(&v59, 8);
}

void __171__HKHorizontalTimePeriodSeries_drawSeriesWithBlockCoordinates_axisRect_zoomLevelConfiguration_pointTransform_renderContext_secondaryRenderContext_seriesRenderingDelegate___block_invoke(uint64_t a1, void *a2, _OWORD *a3, void *a4)
{
  id v7 = a4;
  id v8 = a2;
  [v8 start];
  CGFloat v10 = v9;
  [v8 end];
  CGFloat v12 = v11;

  objc_msgSend(*(id *)(a1 + 32), "offsetForCoordinate:axisRect:", v7, *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88));
  CGFloat v14 = v13;

  CGContextMoveToPoint(*(CGContextRef *)(a1 + 96), v10, v14);
  CGContextAddLineToPoint(*(CGContextRef *)(a1 + 96), v12, v14);
  CGContextStrokePath(*(CGContextRef *)(a1 + 96));
  if (*(unsigned char *)(a1 + 168))
  {
    long long v15 = a3[1];
    v22[0] = *a3;
    v22[1] = v15;
    long long v16 = *(_OWORD *)(a1 + 120);
    v21[0] = *(_OWORD *)(a1 + 104);
    v21[1] = v16;
    long long v17 = *(_OWORD *)(a1 + 152);
    v21[2] = *(_OWORD *)(a1 + 136);
    v21[3] = v17;
    if (HKGraphSeriesDataPointPathInRangeInclusive((uint64_t *)v22, (uint64_t *)v21))
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
      v18 = *(void **)(a1 + 40);
      if (v18)
      {
        [v18 floatValue];
        *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 32) = v19;
        uint64_t v20 = *(void *)(*(void *)(a1 + 56) + 8);
      }
      else
      {
        uint64_t v20 = *(void *)(*(void *)(a1 + 56) + 8);
        *(CGFloat *)(v20 + 32) = v10;
      }
      *(CGFloat *)(v20 + 40) = v14;
    }
  }
}

- (int64_t)_enumeratedLevelForCoordinate:(id)a3
{
  [a3 start];
  return llround(v3);
}

- (CGRect)enumerationRectForLevel:(int64_t)a3 axisRect:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  double y = a4.origin.y;
  CGFloat x = a4.origin.x;
  CGFloat v10 = [(HKHorizontalTimePeriodSeries *)self valueLabels];
  if ([v10 count])
  {
    double v11 = [(HKHorizontalTimePeriodSeries *)self valueLabels];
    double v12 = (double)(unint64_t)[v11 count];
  }
  else
  {
    double v12 = 1.0;
  }

  v17.origin.CGFloat x = x;
  v17.origin.double y = y;
  v17.size.CGFloat width = width;
  v17.size.CGFloat height = height;
  double v13 = CGRectGetHeight(v17) / v12;
  double v14 = y + (double)a3 * v13;
  double v15 = x;
  double v16 = width;
  result.size.CGFloat height = v13;
  result.size.CGFloat width = v16;
  result.origin.double y = v14;
  result.origin.CGFloat x = v15;
  return result;
}

- (double)offsetForEnumerationRect:(CGRect)a3
{
  return a3.origin.y + a3.size.height * 0.5;
}

- (double)offsetForCoordinate:(id)a3 axisRect:(CGRect)a4
{
  -[HKHorizontalTimePeriodSeries enumerationRectForLevel:axisRect:](self, "enumerationRectForLevel:axisRect:", [(HKHorizontalTimePeriodSeries *)self _enumeratedLevelForCoordinate:a3], a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  -[HKHorizontalTimePeriodSeries offsetForEnumerationRect:](self, "offsetForEnumerationRect:");
  return result;
}

- (id)coordinatesForBlock:(id)a3 blockPath:(HKGraphSeriesDataBlockPath *)a4 xAxis:(id)a5 yAxis:(id)a6
{
  id v11 = a5;
  id v12 = a6;
  double v13 = [a3 chartPoints];
  if (!v13)
  {
    id v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2, self, @"HKHorizontalTimePeriodSeries.m", 212, @"Invalid parameter not satisfying: %@", @"points != nil" object file lineNumber description];
  }
  double v14 = [v11 transform];
  double v15 = [v12 transform];

  double v16 = objc_opt_new();
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __74__HKHorizontalTimePeriodSeries_coordinatesForBlock_blockPath_xAxis_yAxis___block_invoke;
  v25[3] = &unk_1E6D570D0;
  id v26 = v14;
  id v27 = v15;
  id v28 = v16;
  id v17 = v16;
  id v18 = v15;
  id v19 = v14;
  [v13 enumerateObjectsUsingBlock:v25];
  long long v23 = *(_OWORD *)&a4->index;
  int64_t resolution = a4->resolution;
  uint64_t v20 = +[HKGraphSeriesBlockCoordinateList coordinateListWithCoordinates:v17 blockPath:&v23];

  return v20;
}

void __74__HKHorizontalTimePeriodSeries_coordinatesForBlock_blockPath_xAxis_yAxis___block_invoke(void *a1, void *a2)
{
  id v20 = a2;
  double v3 = [v20 yValue];

  if (v3)
  {
    v4 = (void *)a1[4];
    v5 = [v20 xStart];
    [v4 coordinateForValue:v5];
    double v7 = v6;

    id v8 = (void *)a1[4];
    double v9 = [v20 xEnd];
    [v8 coordinateForValue:v9];
    double v11 = v10;

    id v12 = (void *)a1[5];
    double v13 = [v20 yValue];
    [v12 coordinateForValue:v13];
    double v15 = v14;

    double v16 = (void *)a1[6];
    id v17 = [HKStackedCategoryValueSeriesCoordinate alloc];
    id v18 = [v20 userInfo];
    id v19 = -[HKStackedCategoryValueSeriesCoordinate initWithStart:end:pointStyle:userInfo:](v17, "initWithStart:end:pointStyle:userInfo:", 0, v18, v7, v15, v11, v15);
    [v16 addObject:v19];
  }
}

- (BOOL)supportsMultiTouchSelection
{
  return 0;
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
  -[HKHorizontalTimePeriodSeries xAxisDistanceFromPoint:blockCoordinate:chartRect:](self, "xAxisDistanceFromPoint:blockCoordinate:chartRect:", v12, v10, v9, x, y, width, height);
  double v14 = v13;
  -[HKHorizontalTimePeriodSeries yAxisDifferenceToPoint:blockCoordinate:chartRect:](self, "yAxisDifferenceToPoint:blockCoordinate:chartRect:", v12, v10, v9, x, y, width, height);
  double v16 = v15;

  return sqrt(v16 * v16 + v14 * v14);
}

- (double)xAxisDistanceFromPoint:(CGPoint)a3 blockCoordinate:(id)a4 chartRect:(CGRect)a5
{
  double height = a5.size.height;
  double y = a5.origin.y;
  double v7 = a3.y;
  double x = a3.x;
  id v11 = a4;
  if (v7 >= y && v7 <= y + height)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v21 = [MEMORY[0x1E4F28B00] currentHandler];
      [v21 handleFailureInMethod:a2 object:self file:@"HKHorizontalTimePeriodSeries.m" lineNumber:263 description:@"xAxisDistanceFromPoint type class failure"];
    }
    id v14 = v11;
    [v14 startXValue];
    double v16 = v15 - x;
    [v14 endXValue];
    double v18 = v17;

    double v19 = fmax(v16, 0.0);
    if (x - v18 <= 0.0) {
      double v13 = v19;
    }
    else {
      double v13 = x - v18;
    }
  }
  else
  {
    double v13 = 1.79769313e308;
  }

  return v13;
}

- (double)yAxisDifferenceToPoint:(CGPoint)a3 blockCoordinate:(id)a4 chartRect:(CGRect)a5
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  double v9 = a3.y;
  id v12 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    double v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2 object:self file:@"HKHorizontalTimePeriodSeries.m" lineNumber:279 description:@"yAxisDifferenceToPoint type class failure"];
  }
  -[HKHorizontalTimePeriodSeries offsetForCoordinate:axisRect:](self, "offsetForCoordinate:axisRect:", v12, x, y, width, height);
  double v14 = v13 - v9;

  return v14;
}

- (double)xAxisSelectedCoordinate:(double)a3 blockCoordinate:(id)a4 chartRect:(CGRect)a5
{
  id v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    double v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2 object:self file:@"HKHorizontalTimePeriodSeries.m" lineNumber:291 description:@"xAxisSelectedCoordinate type class failure"];
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

- (BOOL)blockCoordinate:(id)a3 lessThan:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    double v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2 object:self file:@"HKHorizontalTimePeriodSeries.m" lineNumber:300 description:@"yAxisDifferenceToPoint type class failure"];
  }
  id v9 = v8;
  [v7 start];
  double v11 = v10;
  [v9 start];
  double v13 = v12;

  return v11 < v13;
}

- (BOOL)blockCoordinate:(id)a3 greaterThan:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    double v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2 object:self file:@"HKHorizontalTimePeriodSeries.m" lineNumber:310 description:@"yAxisDifferenceToPoint type class failure"];
  }
  id v9 = v8;
  [v7 start];
  double v11 = v10;
  [v9 start];
  double v13 = v12;

  return v11 > v13;
}

- (id)_generateAxisLabels
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  obj = self->_enumerationValueOrderingStorage;
  uint64_t v4 = [(NSArray *)obj countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = 0;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(obj);
        }
        id v9 = [(NSDictionary *)self->_valueLabelsStorage objectForKeyedSubscript:*(void *)(*((void *)&v14 + 1) + 8 * i)];
        double v10 = objc_alloc_init(HKAxisLabel);
        [(HKAxisLabel *)v10 setText:v9];
        double v11 = [NSNumber numberWithInteger:v6 + i];
        [(HKAxisLabel *)v10 setLocation:v11];

        [v3 addObject:v10];
      }
      uint64_t v5 = [(NSArray *)obj countByEnumeratingWithState:&v14 objects:v18 count:16];
      v6 += i;
    }
    while (v5);
  }

  return v3;
}

- (id)cacheKeysForModelRange:(id)a3 zoomScale:(double)a4
{
  return 0;
}

- (CGPoint)renderPositionForLabelLocation:(id)a3 rect:(CGRect)a4 zoomScale:(double)a5 contentOffset:(CGPoint)a6 constantOffset:(double)a7 isHorizontal:(BOOL)a8 optionalOffset:(CGPoint)a9
{
  BOOL v9 = a8;
  -[HKHorizontalTimePeriodSeries enumerationRectForLevel:axisRect:](self, "enumerationRectForLevel:axisRect:", objc_msgSend(a3, "integerValue", a4.origin.x, a4.origin.y, a4.size.width, a4.size.height, a5, a6.x, a6.y), a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  -[HKHorizontalTimePeriodSeries offsetForEnumerationRect:](self, "offsetForEnumerationRect:");
  double v13 = HKUIFloorToScreenScale(v12);
  if (v9) {
    double v14 = v13;
  }
  else {
    double v14 = a7;
  }
  double v15 = v18 + v14;
  if (v9) {
    double v13 = a7;
  }
  double v16 = v19 + v13;
  double v17 = v15;
  result.double y = v16;
  result.double x = v17;
  return result;
}

- (NSLock)seriesMutableStateLock
{
  return self->_seriesMutableStateLock;
}

- (NSArray)cachedAxisLabelsStorage
{
  return self->_cachedAxisLabelsStorage;
}

- (UIImage)selectedPointMarkerImageStorage
{
  return self->_selectedPointMarkerImageStorage;
}

- (void)setSelectedPointMarkerImageStorage:(id)a3
{
}

- (UIColor)fillColorStorage
{
  return self->_fillColorStorage;
}

- (void)setFillColorStorage:(id)a3
{
}

- (double)lineWidthStorage
{
  return self->_lineWidthStorage;
}

- (void)setLineWidthStorage:(double)a3
{
  self->_double lineWidthStorage = a3;
}

- (NSArray)enumerationValueOrderingStorage
{
  return self->_enumerationValueOrderingStorage;
}

- (void)setEnumerationValueOrderingStorage:(id)a3
{
}

- (NSDictionary)valueLabelsStorage
{
  return self->_valueLabelsStorage;
}

- (void)setValueLabelsStorage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueLabelsStorage, 0);
  objc_storeStrong((id *)&self->_enumerationValueOrderingStorage, 0);
  objc_storeStrong((id *)&self->_fillColorStorage, 0);
  objc_storeStrong((id *)&self->_selectedPointMarkerImageStorage, 0);
  objc_storeStrong((id *)&self->_cachedAxisLabelsStorage, 0);
  objc_storeStrong((id *)&self->_seriesMutableStateLock, 0);
}

@end