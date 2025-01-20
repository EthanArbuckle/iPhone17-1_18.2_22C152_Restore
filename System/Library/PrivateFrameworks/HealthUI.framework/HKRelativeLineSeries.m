@interface HKRelativeLineSeries
- (BOOL)_isUserInfoIndeterminateRelativeValue:(id)a3;
- (BOOL)_shouldForceGapBetweenUserInfo:(id)a3 andUserInfo:(id)a4;
- (BOOL)blockCoordinate:(id)a3 greaterThan:(id)a4;
- (BOOL)blockCoordinate:(id)a3 lessThan:(id)a4;
- (BOOL)blockCoordinateIsVisibleInsideOfChartRect:(CGRect)a3 blockCoordinate:(id)a4;
- (BOOL)supportsMultiTouchSelection;
- (UIColor)color;
- (UIColor)unavailableColor;
- (double)_indeterminateLozengeValueForUserInfo:(id)a3;
- (double)distanceFromPoint:(CGPoint)a3 blockCoordinate:(id)a4 chartRect:(CGRect)a5;
- (double)indeterminateLozengeHollowLineRatio;
- (double)indeterminateLozengeLineWidth;
- (double)xAxisDistanceFromPoint:(CGPoint)a3 blockCoordinate:(id)a4 chartRect:(CGRect)a5;
- (double)yAxisDifferenceToPoint:(CGPoint)a3 blockCoordinate:(id)a4 chartRect:(CGRect)a5;
- (id)_colorForUserInfo:(id)a3;
- (id)coordinatesForBlock:(id)a3 blockPath:(HKGraphSeriesDataBlockPath *)a4 xAxis:(id)a5 yAxis:(id)a6;
- (id)initFromLineSeries:(id)a3 color:(id)a4 unavailableColor:(id)a5 indeterminateLozengeLineWidth:(double)a6 chartSizeClass:(int64_t)a7;
- (void)_drawIndeterminateLozengeForCoordinate:(id)a3 context:(CGContext *)a4 seriesRenderingDelegate:(id)a5;
- (void)_drawIndeterminateLozengesForBlockCoordinates:(id)a3 pointTransform:(CGAffineTransform *)a4 renderContext:(CGContext *)a5 seriesRenderingDelegate:(id)a6;
- (void)drawSeriesWithBlockCoordinates:(id)a3 axisRect:(CGRect)a4 zoomLevelConfiguration:(id)a5 pointTransform:(CGAffineTransform *)a6 renderContext:(CGContext *)a7 secondaryRenderContext:(id)a8 seriesRenderingDelegate:(id)a9;
@end

@implementation HKRelativeLineSeries

- (id)initFromLineSeries:(id)a3 color:(id)a4 unavailableColor:(id)a5 indeterminateLozengeLineWidth:(double)a6 chartSizeClass:(int64_t)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  v24.receiver = self;
  v24.super_class = (Class)HKRelativeLineSeries;
  v15 = [(HKLineSeries *)&v24 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_color, a4);
    objc_storeStrong((id *)&v16->_unavailableColor, a5);
    v16->_indeterminateLozengeLineWidth = a6;
    v16->_indeterminateLozengeHollowLineRatio = 0.5;
    v16->_chartSizeClass = a7;
    v17 = [v12 unhighlightedPresentationStyles];
    [(HKLineSeries *)v16 setUnhighlightedPresentationStyles:v17];

    v18 = [v12 highlightedPresentationStyles];
    [(HKLineSeries *)v16 setHighlightedPresentationStyles:v18];

    v19 = [v12 selectedPresentationStyles];
    [(HKLineSeries *)v16 setSelectedPresentationStyles:v19];

    v20 = [v12 selectedPointMarkerStyle];
    [(HKLineSeries *)v16 setSelectedPointMarkerStyle:v20];

    v21 = [v12 inactivePresentationStyle];
    [(HKLineSeries *)v16 setInactivePresentationStyle:v21];

    -[HKLineSeries setFlatLastValue:](v16, "setFlatLastValue:", [v12 flatLastValue]);
    -[HKLineSeries setExtendLastValue:](v16, "setExtendLastValue:", [v12 extendLastValue]);
    -[HKLineSeries setExtendFirstValue:](v16, "setExtendFirstValue:", [v12 extendFirstValue]);
    v22 = [v12 maximumConnectionDistance];
    [(HKLineSeries *)v16 setMaximumConnectionDistance:v22];
  }
  return v16;
}

- (void)drawSeriesWithBlockCoordinates:(id)a3 axisRect:(CGRect)a4 zoomLevelConfiguration:(id)a5 pointTransform:(CGAffineTransform *)a6 renderContext:(CGContext *)a7 secondaryRenderContext:(id)a8 seriesRenderingDelegate:(id)a9
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v19 = a3;
  id v41 = a5;
  id v39 = a8;
  id v20 = a9;
  long long v21 = *(_OWORD *)&a6->c;
  long long v51 = *(_OWORD *)&a6->a;
  long long v52 = v21;
  v37 = a6;
  id v38 = v20;
  long long v53 = *(_OWORD *)&a6->tx;
  v40 = a7;
  -[HKRelativeLineSeries _drawIndeterminateLozengesForBlockCoordinates:pointTransform:renderContext:seriesRenderingDelegate:](self, "_drawIndeterminateLozengesForBlockCoordinates:pointTransform:renderContext:seriesRenderingDelegate:", v19, &v51, a7);
  v22 = [MEMORY[0x1E4F1CA48] array];
  v23 = [MEMORY[0x1E4F1CA80] set];
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  v42 = v19;
  objc_super v24 = [v19 coordinates];
  uint64_t v25 = [v24 countByEnumeratingWithState:&v47 objects:v54 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    BOOL v27 = 0;
    uint64_t v28 = *(void *)v48;
    do
    {
      for (uint64_t i = 0; i != v26; ++i)
      {
        if (*(void *)v48 != v28) {
          objc_enumerationMutation(v24);
        }
        v30 = *(void **)(*((void *)&v47 + 1) + 8 * i);
        if (v27)
        {
          v31 = (void *)MEMORY[0x1E4F29238];
          [*(id *)(*((void *)&v47 + 1) + 8 * i) coordinate];
          v32 = objc_msgSend(v31, "valueWithCGPoint:");
          [v23 addObject:v32];
        }
        v33 = [v30 userInfo];
        BOOL v27 = [(HKRelativeLineSeries *)self _isUserInfoIndeterminateRelativeValue:v33];

        if (!v27) {
          [v22 addObject:v30];
        }
      }
      uint64_t v26 = [v24 countByEnumeratingWithState:&v47 objects:v54 count:16];
    }
    while (v26);
  }

  if (v42) {
    [v42 blockPathStart];
  }
  else {
    memset(v46, 0, sizeof(v46));
  }
  v34 = +[HKGraphSeriesBlockCoordinateList coordinateListWithCoordinates:v22 blockPath:v46];
  v44[0] = MEMORY[0x1E4F143A8];
  v44[1] = 3221225472;
  v44[2] = __163__HKRelativeLineSeries_drawSeriesWithBlockCoordinates_axisRect_zoomLevelConfiguration_pointTransform_renderContext_secondaryRenderContext_seriesRenderingDelegate___block_invoke;
  v44[3] = &unk_1E6D57C58;
  id v45 = v23;
  v43.receiver = self;
  v43.super_class = (Class)HKRelativeLineSeries;
  long long v35 = *(_OWORD *)&v37->c;
  long long v51 = *(_OWORD *)&v37->a;
  long long v52 = v35;
  long long v53 = *(_OWORD *)&v37->tx;
  id v36 = v23;
  -[HKLineSeries drawSeriesWithBlockCoordinates:axisRect:zoomLevelConfiguration:pointTransform:renderContext:secondaryRenderContext:seriesRenderingDelegate:forceGapBetweenUntransformedPoints:](&v43, sel_drawSeriesWithBlockCoordinates_axisRect_zoomLevelConfiguration_pointTransform_renderContext_secondaryRenderContext_seriesRenderingDelegate_forceGapBetweenUntransformedPoints_, v34, v41, &v51, v40, v39, v38, x, y, width, height, v44);
}

uint64_t __163__HKRelativeLineSeries_drawSeriesWithBlockCoordinates_axisRect_zoomLevelConfiguration_pointTransform_renderContext_secondaryRenderContext_seriesRenderingDelegate___block_invoke(uint64_t a1, double a2, double a3, double a4, double a5)
{
  v6 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", a4, a5);
  uint64_t v7 = [*(id *)(a1 + 32) containsObject:v6];

  return v7;
}

- (void)_drawIndeterminateLozengesForBlockCoordinates:(id)a3 pointTransform:(CGAffineTransform *)a4 renderContext:(CGContext *)a5 seriesRenderingDelegate:(id)a6
{
  id v10 = a6;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __123__HKRelativeLineSeries__drawIndeterminateLozengesForBlockCoordinates_pointTransform_renderContext_seriesRenderingDelegate___block_invoke;
  v14[3] = &unk_1E6D57C80;
  id v15 = v10;
  v16 = a5;
  v14[4] = self;
  long long v11 = *(_OWORD *)&a4->c;
  v13[0] = *(_OWORD *)&a4->a;
  v13[1] = v11;
  v13[2] = *(_OWORD *)&a4->tx;
  id v12 = v10;
  [a3 enumerateCoordinatesWithTransform:v13 roundToViewScale:1 block:v14];
}

void __123__HKRelativeLineSeries__drawIndeterminateLozengesForBlockCoordinates_pointTransform_renderContext_seriesRenderingDelegate___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = *(void **)(a1 + 32);
  id v6 = v3;
  v5 = [v3 userInfo];
  LODWORD(v4) = [v4 _isUserInfoIndeterminateRelativeValue:v5];

  if (v4) {
    [*(id *)(a1 + 32) _drawIndeterminateLozengeForCoordinate:v6 context:*(void *)(a1 + 48) seriesRenderingDelegate:*(void *)(a1 + 40)];
  }
}

- (void)_drawIndeterminateLozengeForCoordinate:(id)a3 context:(CGContext *)a4 seriesRenderingDelegate:(id)a5
{
  id v7 = a3;
  CGContextSaveGState(a4);
  CGContextSetLineCap(a4, kCGLineCapRound);
  [v7 start];
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  [v7 end];
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  v16 = [v7 userInfo];

  v17 = [(HKRelativeLineSeries *)self _colorForUserInfo:v16];

  CGContextSetLineWidth(a4, self->_indeterminateLozengeLineWidth);
  CGContextSetBlendMode(a4, kCGBlendModeNormal);
  id v22 = v17;
  CGContextSetStrokeColorWithColor(a4, (CGColorRef)[v22 CGColor]);
  CGContextMoveToPoint(a4, v9, v11);
  CGContextAddLineToPoint(a4, v13, v15);
  CGContextStrokePath(a4);
  double indeterminateLozengeHollowLineRatio = self->_indeterminateLozengeHollowLineRatio;
  if (indeterminateLozengeHollowLineRatio > 0.0)
  {
    CGContextSetLineWidth(a4, indeterminateLozengeHollowLineRatio * self->_indeterminateLozengeLineWidth);
    id v19 = [MEMORY[0x1E4FB1618] systemGray6Color];
    id v20 = [MEMORY[0x1E4FB1618] systemGray5Color];
    HKUIDynamicColorWithColors(v19, v20);
    id v21 = objc_claimAutoreleasedReturnValue();
    CGContextSetStrokeColorWithColor(a4, (CGColorRef)[v21 CGColor]);

    CGContextMoveToPoint(a4, v9, v11);
    CGContextAddLineToPoint(a4, v13, v15);
    CGContextStrokePath(a4);
  }
  CGContextRestoreGState(a4);
}

- (id)_colorForUserInfo:(id)a3
{
  id v4 = a3;
  if ([(HKGraphSeries *)self allowsSelection])
  {
    id v5 = v4;
    id v6 = [v5 relativeValueState];
    if ([v6 integerValue] == 1)
    {

      id v7 = &OBJC_IVAR___HKRelativeLineSeries__unavailableColor;
    }
    else
    {
      CGFloat v9 = [v5 relativeValueState];
      uint64_t v10 = [v9 integerValue];

      id v7 = &OBJC_IVAR___HKRelativeLineSeries__color;
      if (v10 == 2) {
        id v7 = &OBJC_IVAR___HKRelativeLineSeries__unavailableColor;
      }
    }
    id v8 = *(id *)((char *)&self->super.super.super.isa + *v7);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4FB1618], "hk_chartInactiveSeriesColor");
    id v8 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (id)coordinatesForBlock:(id)a3 blockPath:(HKGraphSeriesDataBlockPath *)a4 xAxis:(id)a5 yAxis:(id)a6
{
  id v11 = a5;
  id v12 = a6;
  CGFloat v13 = [a3 chartPoints];
  if (!v13)
  {
    id v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2, self, @"HKRelativeLineSeries.m", 195, @"Invalid parameter not satisfying: %@", @"points != nil" object file lineNumber description];
  }
  double v14 = [v11 transform];
  CGFloat v15 = [v12 transform];

  v16 = [MEMORY[0x1E4F1CA48] array];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __66__HKRelativeLineSeries_coordinatesForBlock_blockPath_xAxis_yAxis___block_invoke;
  v25[3] = &unk_1E6D57CA8;
  id v26 = v14;
  BOOL v27 = self;
  id v28 = v15;
  id v29 = v16;
  id v17 = v16;
  id v18 = v15;
  id v19 = v14;
  [v13 enumerateObjectsUsingBlock:v25];
  long long v23 = *(_OWORD *)&a4->index;
  int64_t resolution = a4->resolution;
  id v20 = +[HKGraphSeriesBlockCoordinateList coordinateListWithCoordinates:v17 blockPath:&v23];

  return v20;
}

void __66__HKRelativeLineSeries_coordinatesForBlock_blockPath_xAxis_yAxis___block_invoke(void *a1, void *a2)
{
  id v32 = a2;
  id v3 = (void *)a1[4];
  id v4 = [v32 xValueAsGenericType];
  [v3 coordinateForValue:v4];
  double v6 = v5;

  id v7 = (void *)a1[5];
  id v8 = [v32 userInfo];
  LODWORD(v7) = [v7 _isUserInfoIndeterminateRelativeValue:v8];

  if (v7)
  {
    CGFloat v9 = (void *)a1[5];
    uint64_t v10 = [v32 userInfo];
    [v9 _indeterminateLozengeValueForUserInfo:v10];
    double v12 = v11;

    CGFloat v13 = (void *)a1[6];
    double v14 = [NSNumber numberWithDouble:-v12];
    [v13 coordinateForValue:v14];
    double v16 = v15;

    id v17 = (void *)a1[6];
    id v18 = [NSNumber numberWithDouble:v12];
    [v17 coordinateForValue:v18];
    double v20 = v19;

    id v21 = (void *)a1[7];
    id v22 = [_HKRelativeLineSeriesBlockCoordinate alloc];
    long long v23 = [v32 userInfo];
    objc_super v24 = v22;
    double v25 = v6;
    double v26 = v16;
  }
  else
  {
    BOOL v27 = (void *)a1[6];
    id v28 = [v32 yValue];
    [v27 coordinateForValue:v28];
    double v20 = v29;

    id v21 = (void *)a1[7];
    v30 = [_HKRelativeLineSeriesBlockCoordinate alloc];
    long long v23 = [v32 userInfo];
    objc_super v24 = v30;
    double v25 = v6;
    double v26 = v20;
  }
  v31 = -[_HKRelativeLineSeriesBlockCoordinate initWithStart:end:userInfo:](v24, "initWithStart:end:userInfo:", v23, v25, v26, v6, v20);
  [v21 addObject:v31];
}

- (BOOL)supportsMultiTouchSelection
{
  return 0;
}

- (BOOL)_shouldForceGapBetweenUserInfo:(id)a3 andUserInfo:(id)a4
{
  id v6 = a4;
  BOOL v7 = [(HKRelativeLineSeries *)self _isUserInfoIndeterminateRelativeValue:a3]|| [(HKRelativeLineSeries *)self _isUserInfoIndeterminateRelativeValue:v6];

  return v7;
}

- (BOOL)_isUserInfoIndeterminateRelativeValue:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [v3 relativeValueState];
    BOOL v5 = [v4 integerValue] != 3;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (double)_indeterminateLozengeValueForUserInfo:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v5 = [v4 unit];
    id v6 = [MEMORY[0x1E4F2B618] _changeInDegreeFahrenheitUnit];
    int v7 = [v5 isEqual:v6];

    id v8 = (double *)&unk_1E0F061F0;
    if (v7) {
      id v8 = (double *)&unk_1E0F06200;
    }
    double v9 = v8[self->_chartSizeClass == 1];
  }
  else
  {
    _HKInitializeLogging();
    uint64_t v10 = (void *)*MEMORY[0x1E4F29FB0];
    double v9 = 0.0;
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB0], OS_LOG_TYPE_ERROR)) {
      -[HKRelativeLineSeries _indeterminateLozengeValueForUserInfo:](v10);
    }
  }

  return v9;
}

- (double)distanceFromPoint:(CGPoint)a3 blockCoordinate:(id)a4 chartRect:(CGRect)a5
{
  id v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    double v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2 object:self file:@"HKRelativeLineSeries.m" lineNumber:265 description:@"distanceFromPoint type class failure"];
  }
  [v7 midpoint];
  UIDistanceBetweenPoints();
  double v9 = v8;

  return v9;
}

- (double)xAxisDistanceFromPoint:(CGPoint)a3 blockCoordinate:(id)a4 chartRect:(CGRect)a5
{
  double x = a3.x;
  id v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    double v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2 object:self file:@"HKRelativeLineSeries.m" lineNumber:273 description:@"xAxisDistanceFromPoint type class failure"];
  }
  [v8 midpoint];
  double v10 = vabdd_f64(v9, x);

  return v10;
}

- (double)yAxisDifferenceToPoint:(CGPoint)a3 blockCoordinate:(id)a4 chartRect:(CGRect)a5
{
  double y = a3.y;
  id v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    double v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2 object:self file:@"HKRelativeLineSeries.m" lineNumber:282 description:@"yAxisDiffToPoint type class failure"];
  }
  [v8 midpoint];
  double v10 = v9 - y;

  return v10;
}

- (BOOL)blockCoordinateIsVisibleInsideOfChartRect:(CGRect)a3 blockCoordinate:(id)a4
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  [a4 midpoint];
  uint64_t v9 = v8;
  uint64_t v11 = v10;
  CGFloat v12 = x;
  CGFloat v13 = y;
  CGFloat v14 = width;
  CGFloat v15 = height;
  return CGRectContainsPoint(*(CGRect *)&v12, *(CGPoint *)&v9);
}

- (BOOL)blockCoordinate:(id)a3 lessThan:(id)a4
{
  id v5 = a4;
  [a3 midpoint];
  double v7 = v6;
  [v5 midpoint];
  double v9 = v8;

  return v7 < v9;
}

- (BOOL)blockCoordinate:(id)a3 greaterThan:(id)a4
{
  id v5 = a4;
  [a3 midpoint];
  double v7 = v6;
  [v5 midpoint];
  double v9 = v8;

  return v7 > v9;
}

- (UIColor)color
{
  return self->_color;
}

- (UIColor)unavailableColor
{
  return self->_unavailableColor;
}

- (double)indeterminateLozengeLineWidth
{
  return self->_indeterminateLozengeLineWidth;
}

- (double)indeterminateLozengeHollowLineRatio
{
  return self->_indeterminateLozengeHollowLineRatio;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unavailableColor, 0);
  objc_storeStrong((id *)&self->_color, 0);
}

- (void)_indeterminateLozengeValueForUserInfo:(void *)a1 .cold.1(void *a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v1 = a1;
  v2 = objc_opt_class();
  id v3 = v2;
  int v5 = 138543618;
  double v6 = v2;
  __int16 v7 = 2114;
  id v8 = (id)objc_opt_class();
  id v4 = v8;
  _os_log_error_impl(&dword_1E0B26000, v1, OS_LOG_TYPE_ERROR, "[%{public}@] Received unexpected user info %{public}@", (uint8_t *)&v5, 0x16u);
}

@end