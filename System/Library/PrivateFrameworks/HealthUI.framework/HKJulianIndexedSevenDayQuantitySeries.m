@interface HKJulianIndexedSevenDayQuantitySeries
- (BOOL)blockCoordinate:(id)a3 greaterThan:(id)a4;
- (BOOL)blockCoordinate:(id)a3 lessThan:(id)a4;
- (BOOL)supportsMultiTouchSelection;
- (HKJulianIndexedSevenDayQuantitySeries)initWithColor:(id)a3 lineWidth:(double)a4;
- (HKJulianIndexedSevenDayQuantitySeries)initWithColor:(id)a3 lineWidth:(double)a4 hollowLineRatio:(double)a5;
- (UIColor)color;
- (double)distanceFromPoint:(CGPoint)a3 blockCoordinate:(id)a4 chartRect:(CGRect)a5;
- (double)hollowLineRatio;
- (double)lineWidth;
- (double)xAxisDistanceFromPoint:(CGPoint)a3 blockCoordinate:(id)a4 chartRect:(CGRect)a5;
- (double)xAxisSelectedCoordinate:(double)a3 blockCoordinate:(id)a4 chartRect:(CGRect)a5;
- (double)yAxisDifferenceToPoint:(CGPoint)a3 blockCoordinate:(id)a4 chartRect:(CGRect)a5;
- (id)coordinatesForBlock:(id)a3 blockPath:(HKGraphSeriesDataBlockPath *)a4 xAxis:(id)a5 yAxis:(id)a6;
- (void)drawSeriesWithBlockCoordinates:(id)a3 axisRect:(CGRect)a4 zoomLevelConfiguration:(id)a5 pointTransform:(CGAffineTransform *)a6 renderContext:(CGContext *)a7 secondaryRenderContext:(id)a8 seriesRenderingDelegate:(id)a9;
@end

@implementation HKJulianIndexedSevenDayQuantitySeries

- (HKJulianIndexedSevenDayQuantitySeries)initWithColor:(id)a3 lineWidth:(double)a4
{
  return [(HKJulianIndexedSevenDayQuantitySeries *)self initWithColor:a3 lineWidth:a4 hollowLineRatio:0.5];
}

- (HKJulianIndexedSevenDayQuantitySeries)initWithColor:(id)a3 lineWidth:(double)a4 hollowLineRatio:(double)a5
{
  id v9 = a3;
  v14.receiver = self;
  v14.super_class = (Class)HKJulianIndexedSevenDayQuantitySeries;
  v10 = [(HKGraphSeries *)&v14 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_color, a3);
    v11->_lineWidth = a4;
    double v12 = 1.0;
    if (a5 <= 1.0) {
      double v12 = a5;
    }
    v11->_hollowLineRatio = fmax(v12, 0.0);
  }

  return v11;
}

- (void)drawSeriesWithBlockCoordinates:(id)a3 axisRect:(CGRect)a4 zoomLevelConfiguration:(id)a5 pointTransform:(CGAffineTransform *)a6 renderContext:(CGContext *)a7 secondaryRenderContext:(id)a8 seriesRenderingDelegate:(id)a9
{
  id v13 = a9;
  id v14 = a3;
  if ([(HKGraphSeries *)self allowsSelection])
  {
    v15 = self->_color;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4FB1618], "hk_chartInactiveSeriesColor");
    v15 = (UIColor *)objc_claimAutoreleasedReturnValue();
  }
  v16 = v15;
  CGContextSaveGState(a7);
  CGContextSetLineCap(a7, kCGLineCapRound);
  double v17 = self->_lineWidth * 0.5;
  v22[1] = 3221225472;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[2] = __180__HKJulianIndexedSevenDayQuantitySeries_drawSeriesWithBlockCoordinates_axisRect_zoomLevelConfiguration_pointTransform_renderContext_secondaryRenderContext_seriesRenderingDelegate___block_invoke;
  v22[3] = &unk_1E6D55FC0;
  double v25 = v17 + 2.0;
  v26 = a7;
  v22[4] = self;
  v23 = v16;
  id v24 = v13;
  long long v18 = *(_OWORD *)&a6->c;
  v21[0] = *(_OWORD *)&a6->a;
  v21[1] = v18;
  v21[2] = *(_OWORD *)&a6->tx;
  id v19 = v13;
  v20 = v16;
  [v14 enumerateCoordinatesWithTransform:v21 roundToViewScale:1 block:v22];

  CGContextRestoreGState(a7);
}

void __180__HKJulianIndexedSevenDayQuantitySeries_drawSeriesWithBlockCoordinates_axisRect_zoomLevelConfiguration_pointTransform_renderContext_secondaryRenderContext_seriesRenderingDelegate___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 start];
  double v5 = v4;
  CGFloat v7 = v6;
  [v3 end];
  double v9 = v8;
  CGFloat v11 = v10;

  double v12 = v5 + (v9 - v5) * 0.5;
  double v13 = *(double *)(a1 + 56);
  if (v12 >= v5 + v13) {
    double v14 = v5 + v13;
  }
  else {
    double v14 = v5 + (v9 - v5) * 0.5;
  }
  double v15 = v9 - v13;
  if (v12 >= v15) {
    double v16 = v5 + (v9 - v5) * 0.5;
  }
  else {
    double v16 = v15;
  }
  CGContextSetLineWidth(*(CGContextRef *)(a1 + 64), *(CGFloat *)(*(void *)(a1 + 32) + 216));
  CGContextSetBlendMode(*(CGContextRef *)(a1 + 64), kCGBlendModeNormal);
  CGContextSetStrokeColorWithColor(*(CGContextRef *)(a1 + 64), (CGColorRef)[*(id *)(a1 + 40) CGColor]);
  CGContextMoveToPoint(*(CGContextRef *)(a1 + 64), v14, v7);
  CGContextAddLineToPoint(*(CGContextRef *)(a1 + 64), v16, v11);
  CGContextStrokePath(*(CGContextRef *)(a1 + 64));
  uint64_t v17 = *(void *)(a1 + 32);
  double v18 = *(double *)(v17 + 224);
  if (v18 > 0.0)
  {
    CGContextSetLineWidth(*(CGContextRef *)(a1 + 64), v18 * *(double *)(v17 + 216));
    int v19 = [*(id *)(a1 + 48) seriesDrawingDuringTiling];
    v20 = *(CGContext **)(a1 + 64);
    if (v19)
    {
      objc_msgSend(MEMORY[0x1E4FB1618], "hk_chartBackgroundColor");
      id v21 = objc_claimAutoreleasedReturnValue();
      CGContextSetStrokeColorWithColor(v20, (CGColorRef)[v21 CGColor]);
    }
    else
    {
      CGContextSetBlendMode(*(CGContextRef *)(a1 + 64), kCGBlendModeClear);
    }
    CGContextMoveToPoint(*(CGContextRef *)(a1 + 64), v14, v7);
    CGContextAddLineToPoint(*(CGContextRef *)(a1 + 64), v16, v11);
    v22 = *(CGContext **)(a1 + 64);
    CGContextStrokePath(v22);
  }
}

- (id)coordinatesForBlock:(id)a3 blockPath:(HKGraphSeriesDataBlockPath *)a4 xAxis:(id)a5 yAxis:(id)a6
{
  id v11 = a5;
  id v12 = a6;
  double v13 = [a3 chartPoints];
  if (!v13)
  {
    v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2, self, @"HKJulianIndexedSevenDayQuantitySeries.m", 138, @"Invalid parameter not satisfying: %@", @"points != nil" object file lineNumber description];
  }
  double v14 = [v11 transform];
  double v15 = [v12 transform];

  double v16 = objc_opt_new();
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __83__HKJulianIndexedSevenDayQuantitySeries_coordinatesForBlock_blockPath_xAxis_yAxis___block_invoke;
  v25[3] = &unk_1E6D55FE8;
  id v26 = v14;
  id v27 = v15;
  id v28 = v16;
  id v17 = v16;
  id v18 = v15;
  id v19 = v14;
  [v13 enumerateObjectsUsingBlock:v25];
  long long v23 = *(_OWORD *)&a4->index;
  int64_t resolution = a4->resolution;
  v20 = +[HKGraphSeriesBlockCoordinateList coordinateListWithCoordinates:v17 blockPath:&v23];

  return v20;
}

void __83__HKJulianIndexedSevenDayQuantitySeries_coordinatesForBlock_blockPath_xAxis_yAxis___block_invoke(void *a1, void *a2)
{
  id v20 = a2;
  id v3 = [v20 yValue];

  if (v3)
  {
    double v4 = (void *)a1[4];
    double v5 = [v20 xStart];
    [v4 coordinateForValue:v5];
    double v7 = v6;

    double v8 = (void *)a1[4];
    double v9 = [v20 xEnd];
    [v8 coordinateForValue:v9];
    double v11 = v10;

    id v12 = (void *)a1[5];
    double v13 = [v20 yValue];
    [v12 coordinateForValue:v13];
    double v15 = v14;

    double v16 = (void *)a1[6];
    id v17 = [_HKJulianIndexedSevenDayQuantitySeriesBlockCoordinate alloc];
    id v18 = [v20 userInfo];
    id v19 = -[_HKJulianIndexedSevenDayQuantitySeriesBlockCoordinate initWithStart:end:userInfo:](v17, "initWithStart:end:userInfo:", v18, v7, v15, v11, v15);
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
  -[HKJulianIndexedSevenDayQuantitySeries xAxisDistanceFromPoint:blockCoordinate:chartRect:](self, "xAxisDistanceFromPoint:blockCoordinate:chartRect:", v12, v10, v9, x, y, width, height);
  double v14 = v13;
  -[HKJulianIndexedSevenDayQuantitySeries yAxisDifferenceToPoint:blockCoordinate:chartRect:](self, "yAxisDifferenceToPoint:blockCoordinate:chartRect:", v12, v10, v9, x, y, width, height);
  double v16 = v15;

  return sqrt(v16 * v16 + v14 * v14);
}

- (double)xAxisDistanceFromPoint:(CGPoint)a3 blockCoordinate:(id)a4 chartRect:(CGRect)a5
{
  double x = a3.x;
  id v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2 object:self file:@"HKJulianIndexedSevenDayQuantitySeries.m" lineNumber:182 description:@"xAxisDistanceFromPoint type class failure"];
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
  double y = a3.y;
  id v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    double v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2 object:self file:@"HKJulianIndexedSevenDayQuantitySeries.m" lineNumber:197 description:@"yAxisDiffToPoint type class failure"];
  }
  [v8 start];
  double v10 = v9 - y;

  return v10;
}

- (double)xAxisSelectedCoordinate:(double)a3 blockCoordinate:(id)a4 chartRect:(CGRect)a5
{
  id v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2 object:self file:@"HKJulianIndexedSevenDayQuantitySeries.m" lineNumber:208 description:@"xAxisSelectedCoordinate type class failure"];
  }
  id v9 = v8;
  [v9 startXValue];
  double v11 = v10;
  [v9 endXValue];
  double v13 = v12;

  double v14 = self->_lineWidth * 0.5 + 2.0;
  double v15 = v11 + (v13 - v11) * 0.5;
  double v16 = v11 + v14;
  if (v15 < v11 + v14) {
    double v16 = v11 + (v13 - v11) * 0.5;
  }
  double v17 = v13 - v14;
  if (v15 >= v17) {
    double v17 = v11 + (v13 - v11) * 0.5;
  }
  if (v16 <= a3) {
    double v18 = a3;
  }
  else {
    double v18 = v16;
  }
  if (v18 >= v17) {
    double v19 = v17;
  }
  else {
    double v19 = v18;
  }

  return v19;
}

- (BOOL)blockCoordinate:(id)a3 lessThan:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    double v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2 object:self file:@"HKJulianIndexedSevenDayQuantitySeries.m" lineNumber:228 description:@"yAxisDifferenceToPoint type class failure"];
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
    [v15 handleFailureInMethod:a2 object:self file:@"HKJulianIndexedSevenDayQuantitySeries.m" lineNumber:238 description:@"yAxisDifferenceToPoint type class failure"];
  }
  id v9 = v8;
  [v7 start];
  double v11 = v10;
  [v9 start];
  double v13 = v12;

  return v11 > v13;
}

- (UIColor)color
{
  return self->_color;
}

- (double)lineWidth
{
  return self->_lineWidth;
}

- (double)hollowLineRatio
{
  return self->_hollowLineRatio;
}

- (void).cxx_destruct
{
}

@end