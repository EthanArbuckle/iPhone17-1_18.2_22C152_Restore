@interface HKBloodPressureSeries
+ (CGRect)_rectCenteredAt:(CGPoint)a3 width:(double)a4;
+ (id)_bloodPressureInactivePresentationStyle;
+ (id)_bloodPressurePresentationStyleWithSystolicColor:(id)a3 diastolicColor:(id)a4;
+ (id)defaultSeriesWithDiastolicColor:(id)a3;
+ (id)diastolicImageCompatibleWithFont:(id)a3 withColor:(id)a4;
+ (id)systolicImageCompatibleWithFont:(id)a3 withColor:(id)a4;
+ (void)_drawDiastolicSymbolWithColor:(id)a3 atLocation:(CGPoint)a4 width:(double)a5 context:(CGContext *)a6;
+ (void)_drawSystolicSymbolWithColor:(id)a3 atLocation:(CGPoint)a4 width:(double)a5 context:(CGContext *)a6;
- (BOOL)blockCoordinate:(id)a3 greaterThan:(id)a4;
- (BOOL)blockCoordinate:(id)a3 lessThan:(id)a4;
- (BOOL)blockCoordinateIsVisibleInsideOfChartRect:(CGRect)a3 blockCoordinate:(id)a4;
- (BOOL)supportsMultiTouchSelection;
- (HKBloodPressureSeries)init;
- (HKBloodPressureSeriesHighlightDelegate)seriesHighlightDelegate;
- (HKBloodPressureSeriesHighlightDelegate)seriesHighlightDelegateStorage;
- (HKBloodPressureSeriesPresentationStyle)inactivePresentationStyle;
- (HKBloodPressureSeriesPresentationStyle)inactivePresentationStyleStorage;
- (HKBloodPressureSeriesPresentationStyle)selectedPresentationStyle;
- (HKBloodPressureSeriesPresentationStyle)selectedPresentationStyleStorage;
- (HKBloodPressureSeriesPresentationStyle)unselectedPresentationStyle;
- (HKBloodPressureSeriesPresentationStyle)unselectedPresentationStyleStorage;
- (NSLock)seriesMutableStateLock;
- (double)distanceFromPoint:(CGPoint)a3 blockCoordinate:(id)a4 chartRect:(CGRect)a5;
- (double)xAxisDistanceFromPoint:(CGPoint)a3 blockCoordinate:(id)a4 chartRect:(CGRect)a5;
- (double)yAxisDifferenceToPoint:(CGPoint)a3 blockCoordinate:(id)a4 chartRect:(CGRect)a5;
- (id)coordinatesForBlock:(id)a3 blockPath:(HKGraphSeriesDataBlockPath *)a4 xAxis:(id)a5 yAxis:(id)a6;
- (void)_drawBloodPressureSymbol:(int64_t)a3 withColor:(id)a4 atLocation:(CGPoint)a5 width:(double)a6 context:(CGContext *)a7;
- (void)_drawRangeBackgroundInContext:(CGContext *)a3 coordinate:(id)a4 width:(double)a5 symbolType:(int64_t)a6 symbolColor:(id)a7 fillColor:(id)a8;
- (void)_drawRangeDotsInContext:(CGContext *)a3 coordinate:(id)a4 width:(double)a5 symbolType:(int64_t)a6 symbolColor:(id)a7 fillColor:(id)a8;
- (void)drawSeriesWithBlockCoordinates:(id)a3 axisRect:(CGRect)a4 zoomLevelConfiguration:(id)a5 pointTransform:(CGAffineTransform *)a6 renderContext:(CGContext *)a7 secondaryRenderContext:(id)a8 seriesRenderingDelegate:(id)a9;
- (void)setInactivePresentationStyle:(id)a3;
- (void)setInactivePresentationStyleStorage:(id)a3;
- (void)setSelectedPresentationStyle:(id)a3;
- (void)setSelectedPresentationStyleStorage:(id)a3;
- (void)setSeriesHighlightDelegate:(id)a3;
- (void)setSeriesHighlightDelegateStorage:(id)a3;
- (void)setUnselectedPresentationStyle:(id)a3;
- (void)setUnselectedPresentationStyleStorage:(id)a3;
@end

@implementation HKBloodPressureSeries

- (HKBloodPressureSeries)init
{
  v9.receiver = self;
  v9.super_class = (Class)HKBloodPressureSeries;
  v2 = [(HKGraphSeries *)&v9 init];
  if (v2)
  {
    v3 = (NSLock *)objc_alloc_init(MEMORY[0x1E4F28E08]);
    seriesMutableStateLock = v2->_seriesMutableStateLock;
    v2->_seriesMutableStateLock = v3;

    [(NSLock *)v2->_seriesMutableStateLock setName:@"HKBloodPressureSeriesLock"];
    selectedPresentationStyleStorage = v2->_selectedPresentationStyleStorage;
    v2->_selectedPresentationStyleStorage = 0;

    unselectedPresentationStyleStorage = v2->_unselectedPresentationStyleStorage;
    v2->_unselectedPresentationStyleStorage = 0;

    inactivePresentationStyleStorage = v2->_inactivePresentationStyleStorage;
    v2->_inactivePresentationStyleStorage = 0;

    objc_storeWeak((id *)&v2->_seriesHighlightDelegateStorage, 0);
  }
  return v2;
}

+ (id)_bloodPressurePresentationStyleWithSystolicColor:(id)a3 diastolicColor:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_alloc_init(HKBloodPressureSeriesPresentationStyle);
  [(HKBloodPressureSeriesPresentationStyle *)v7 setWidth:8.0];
  [(HKBloodPressureSeriesPresentationStyle *)v7 setSystolicSymbolColor:v6];

  v8 = [(HKBloodPressureSeriesPresentationStyle *)v7 systolicSymbolColor];
  objc_super v9 = [v8 colorWithAlphaComponent:0.16];
  [(HKBloodPressureSeriesPresentationStyle *)v7 setSystolicFillColor:v9];

  [(HKBloodPressureSeriesPresentationStyle *)v7 setDiastolicSymbolColor:v5];
  v10 = [(HKBloodPressureSeriesPresentationStyle *)v7 diastolicSymbolColor];
  v11 = [v10 colorWithAlphaComponent:0.3];
  [(HKBloodPressureSeriesPresentationStyle *)v7 setDiastolicFillColor:v11];

  return v7;
}

+ (id)_bloodPressureInactivePresentationStyle
{
  v2 = objc_alloc_init(HKBloodPressureSeriesPresentationStyle);
  [(HKBloodPressureSeriesPresentationStyle *)v2 setWidth:8.0];
  v3 = [MEMORY[0x1E4FB1618] systemGray4Color];
  v4 = [MEMORY[0x1E4FB1618] systemGray4Color];
  id v5 = [v4 colorWithAlphaComponent:0.5];

  [(HKBloodPressureSeriesPresentationStyle *)v2 setSystolicSymbolColor:v3];
  [(HKBloodPressureSeriesPresentationStyle *)v2 setSystolicFillColor:v5];
  [(HKBloodPressureSeriesPresentationStyle *)v2 setDiastolicSymbolColor:v3];
  [(HKBloodPressureSeriesPresentationStyle *)v2 setDiastolicFillColor:v5];

  return v2;
}

+ (id)defaultSeriesWithDiastolicColor:(id)a3
{
  v4 = (void *)MEMORY[0x1E4FB1618];
  id v5 = a3;
  id v6 = [v4 labelColor];
  v7 = [a1 _bloodPressurePresentationStyleWithSystolicColor:v6 diastolicColor:v5];

  v8 = [a1 _bloodPressureInactivePresentationStyle];
  id v9 = objc_alloc_init((Class)a1);
  [v9 setUnselectedPresentationStyle:v7];
  [v9 setInactivePresentationStyle:v8];

  return v9;
}

- (HKBloodPressureSeriesPresentationStyle)selectedPresentationStyle
{
  v3 = [(HKBloodPressureSeries *)self seriesMutableStateLock];
  [v3 lock];

  v4 = self->_selectedPresentationStyleStorage;
  id v5 = [(HKBloodPressureSeries *)self seriesMutableStateLock];
  [v5 unlock];

  return v4;
}

- (void)setSelectedPresentationStyle:(id)a3
{
  v4 = (HKBloodPressureSeriesPresentationStyle *)a3;
  id v5 = [(HKBloodPressureSeries *)self seriesMutableStateLock];
  [v5 lock];

  selectedPresentationStyleStorage = self->_selectedPresentationStyleStorage;
  self->_selectedPresentationStyleStorage = v4;

  id v7 = [(HKBloodPressureSeries *)self seriesMutableStateLock];
  [v7 unlock];
}

- (HKBloodPressureSeriesPresentationStyle)unselectedPresentationStyle
{
  v3 = [(HKBloodPressureSeries *)self seriesMutableStateLock];
  [v3 lock];

  v4 = self->_unselectedPresentationStyleStorage;
  id v5 = [(HKBloodPressureSeries *)self seriesMutableStateLock];
  [v5 unlock];

  return v4;
}

- (void)setUnselectedPresentationStyle:(id)a3
{
  v4 = (HKBloodPressureSeriesPresentationStyle *)a3;
  id v5 = [(HKBloodPressureSeries *)self seriesMutableStateLock];
  [v5 lock];

  unselectedPresentationStyleStorage = self->_unselectedPresentationStyleStorage;
  self->_unselectedPresentationStyleStorage = v4;

  id v7 = [(HKBloodPressureSeries *)self seriesMutableStateLock];
  [v7 unlock];
}

- (HKBloodPressureSeriesPresentationStyle)inactivePresentationStyle
{
  v3 = [(HKBloodPressureSeries *)self seriesMutableStateLock];
  [v3 lock];

  v4 = self->_inactivePresentationStyleStorage;
  id v5 = [(HKBloodPressureSeries *)self seriesMutableStateLock];
  [v5 unlock];

  return v4;
}

- (void)setInactivePresentationStyle:(id)a3
{
  v4 = (HKBloodPressureSeriesPresentationStyle *)a3;
  id v5 = [(HKBloodPressureSeries *)self seriesMutableStateLock];
  [v5 lock];

  inactivePresentationStyleStorage = self->_inactivePresentationStyleStorage;
  self->_inactivePresentationStyleStorage = v4;

  id v7 = [(HKBloodPressureSeries *)self seriesMutableStateLock];
  [v7 unlock];
}

- (HKBloodPressureSeriesHighlightDelegate)seriesHighlightDelegate
{
  v3 = [(HKBloodPressureSeries *)self seriesMutableStateLock];
  [v3 lock];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_seriesHighlightDelegateStorage);
  id v5 = [(HKBloodPressureSeries *)self seriesMutableStateLock];
  [v5 unlock];

  return (HKBloodPressureSeriesHighlightDelegate *)WeakRetained;
}

- (void)setSeriesHighlightDelegate:(id)a3
{
  id v4 = a3;
  id v5 = [(HKBloodPressureSeries *)self seriesMutableStateLock];
  [v5 lock];

  objc_storeWeak((id *)&self->_seriesHighlightDelegateStorage, v4);
  id v6 = [(HKBloodPressureSeries *)self seriesMutableStateLock];
  [v6 unlock];
}

- (void)drawSeriesWithBlockCoordinates:(id)a3 axisRect:(CGRect)a4 zoomLevelConfiguration:(id)a5 pointTransform:(CGAffineTransform *)a6 renderContext:(CGContext *)a7 secondaryRenderContext:(id)a8 seriesRenderingDelegate:(id)a9
{
  id v12 = a3;
  CGContextSaveGState(a7);
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  [(HKGraphSeries *)self selectedPathRange];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __164__HKBloodPressureSeries_drawSeriesWithBlockCoordinates_axisRect_zoomLevelConfiguration_pointTransform_renderContext_secondaryRenderContext_seriesRenderingDelegate___block_invoke;
  v15[3] = &unk_1E6D549F8;
  long long v16 = v21;
  long long v17 = v22;
  long long v18 = v23;
  long long v19 = v24;
  v15[4] = self;
  v20 = a7;
  long long v13 = *(_OWORD *)&a6->c;
  v14[0] = *(_OWORD *)&a6->a;
  v14[1] = v13;
  v14[2] = *(_OWORD *)&a6->tx;
  [v12 enumerateCoordinatesWithTransform:v14 roundToViewScale:1 block:v15];

  CGContextRestoreGState(a7);
}

void __164__HKBloodPressureSeries_drawSeriesWithBlockCoordinates_axisRect_zoomLevelConfiguration_pointTransform_renderContext_secondaryRenderContext_seriesRenderingDelegate___block_invoke(uint64_t a1, void *a2, _OWORD *a3, void *a4)
{
  id v7 = a2;
  id v8 = a4;
  long long v9 = a3[1];
  v97[0] = *a3;
  v97[1] = v9;
  long long v10 = *(_OWORD *)(a1 + 56);
  v96[0] = *(_OWORD *)(a1 + 40);
  v96[1] = v10;
  long long v11 = *(_OWORD *)(a1 + 88);
  v96[2] = *(_OWORD *)(a1 + 72);
  v96[3] = v11;
  int v12 = HKGraphSeriesDataPointPathInRangeInclusive((uint64_t *)v97, (uint64_t *)v96);
  long long v13 = *(void **)(a1 + 32);
  if (v12)
  {
    v14 = [v13 selectedPresentationStyle];
    v15 = v14;
    if (v14)
    {
      id v16 = v14;
    }
    else
    {
      id v16 = [*(id *)(a1 + 32) unselectedPresentationStyle];
    }
    v95 = v16;
  }
  else
  {
    v95 = [v13 unselectedPresentationStyle];
  }
  if ([*(id *)(a1 + 32) allowsSelection]
    && ([*(id *)(a1 + 32) seriesHighlightDelegate],
        long long v17 = objc_claimAutoreleasedReturnValue(),
        int v18 = [v17 highlightEnabled],
        v17,
        !v18))
  {
    id v19 = v95;
  }
  else
  {
    id v19 = [*(id *)(a1 + 32) inactivePresentationStyle];
  }
  v20 = v19;
  v92 = [v7 systolicCoordinate];
  long long v21 = [v7 diastolicCoordinate];
  long long v22 = [*(id *)(a1 + 32) seriesHighlightDelegate];
  char v23 = [v22 highlightEnabled];

  v89 = v8;
  v90 = v7;
  if ((v23 & 1) == 0)
  {
    v38 = v21;
    id v27 = v20;
    v91 = 0;
    char v39 = 1;
    v40 = v27;
LABEL_18:
    v31 = v92;
    goto LABEL_27;
  }
  long long v24 = [*(id *)(a1 + 32) seriesHighlightDelegate];
  v25 = [v24 highlightedBloodPressureCoordinateWithCoordinate:v7 originalCoordinate:v8];

  id v26 = v20;
  id v27 = v26;
  if (!v25)
  {
    v38 = v21;
    v91 = 0;
    char v39 = 1;
    v40 = v26;
    goto LABEL_18;
  }
  [v21 min];
  double v29 = v28;
  v30 = [v25 diastolicCoordinate];
  [v30 min];
  v31 = v92;
  if (v29 == v32)
  {
    [v21 max];
    double v34 = v33;
    v35 = [v25 diastolicCoordinate];
    [v35 max];
    double v37 = v36;

    id v93 = v27;
    if (v34 != v37) {
      goto LABEL_21;
    }
    id v93 = v95;
    v30 = v27;
  }
  else
  {
    id v93 = v27;
  }

LABEL_21:
  [v92 min];
  double v42 = v41;
  v43 = [v25 systolicCoordinate];
  [v43 min];
  v91 = v25;
  v38 = v21;
  if (v42 != v44)
  {

    goto LABEL_25;
  }
  [v92 max];
  double v46 = v45;
  v47 = [v25 systolicCoordinate];
  [v47 max];
  double v49 = v48;

  if (v46 != v49)
  {
LABEL_25:
    char v39 = 0;
    goto LABEL_26;
  }
  id v50 = v95;

  char v39 = 0;
  id v27 = v50;
LABEL_26:
  v40 = v93;
LABEL_27:
  v94 = v40;
  v51 = *(void **)(a1 + 32);
  uint64_t v52 = *(void *)(a1 + 104);
  [v40 width];
  double v54 = v53;
  v55 = [v40 diastolicSymbolColor];
  v56 = [v40 diastolicFillColor];
  [v51 _drawRangeBackgroundInContext:v52 coordinate:v38 width:1 symbolType:v55 symbolColor:v56 fillColor:v54];

  v57 = *(void **)(a1 + 32);
  uint64_t v58 = *(void *)(a1 + 104);
  [v27 width];
  double v60 = v59;
  v61 = [v27 systolicSymbolColor];
  v62 = [v27 systolicFillColor];
  [v57 _drawRangeBackgroundInContext:v58 coordinate:v31 width:0 symbolType:v61 symbolColor:v62 fillColor:v60];

  CGContextSaveGState(*(CGContextRef *)(a1 + 104));
  v63 = *(void **)(a1 + 32);
  uint64_t v64 = *(void *)(a1 + 104);
  [v20 width];
  double v66 = v65;
  v67 = [v20 diastolicSymbolColor];
  v68 = [v20 diastolicFillColor];
  [v63 _drawRangeDotsInContext:v64 coordinate:v38 width:1 symbolType:v67 symbolColor:v68 fillColor:v66];

  v69 = *(void **)(a1 + 32);
  uint64_t v70 = *(void *)(a1 + 104);
  [v20 width];
  double v72 = v71;
  v73 = [v20 systolicSymbolColor];
  v74 = [v20 systolicFillColor];
  [v69 _drawRangeDotsInContext:v70 coordinate:v31 width:0 symbolType:v73 symbolColor:v74 fillColor:v72];

  if ((v39 & 1) == 0)
  {
    v75 = *(void **)(a1 + 32);
    uint64_t v76 = *(void *)(a1 + 104);
    v77 = [v91 diastolicCoordinate];
    [v95 width];
    double v79 = v78;
    v80 = [v95 diastolicSymbolColor];
    v81 = [v95 diastolicFillColor];
    [v75 _drawRangeDotsInContext:v76 coordinate:v77 width:1 symbolType:v80 symbolColor:v81 fillColor:v79];

    v82 = *(void **)(a1 + 32);
    uint64_t v83 = *(void *)(a1 + 104);
    v84 = [v91 systolicCoordinate];
    [v95 width];
    double v86 = v85;
    v87 = [v95 systolicSymbolColor];
    v31 = v92;
    v88 = [v95 systolicFillColor];
    [v82 _drawRangeDotsInContext:v83 coordinate:v84 width:0 symbolType:v87 symbolColor:v88 fillColor:v86];
  }
  CGContextRestoreGState(*(CGContextRef *)(a1 + 104));
}

- (void)_drawRangeDotsInContext:(CGContext *)a3 coordinate:(id)a4 width:(double)a5 symbolType:(int64_t)a6 symbolColor:(id)a7 fillColor:(id)a8
{
  id v16 = a4;
  id v12 = a7;
  [v16 min];
  -[HKBloodPressureSeries _drawBloodPressureSymbol:withColor:atLocation:width:context:](self, "_drawBloodPressureSymbol:withColor:atLocation:width:context:", a6, v12, a3);
  [v16 max];
  double v14 = v13;
  [v16 min];
  if (!HKUIEqualDoubles(v14, v15))
  {
    [v16 max];
    -[HKBloodPressureSeries _drawBloodPressureSymbol:withColor:atLocation:width:context:](self, "_drawBloodPressureSymbol:withColor:atLocation:width:context:", a6, v12, a3);
  }
}

- (void)_drawRangeBackgroundInContext:(CGContext *)a3 coordinate:(id)a4 width:(double)a5 symbolType:(int64_t)a6 symbolColor:(id)a7 fillColor:(id)a8
{
  id v36 = a4;
  id v12 = a8;
  [v36 max];
  double v14 = v13;
  [v36 min];
  if (!HKUIEqualDoubles(v14, v15))
  {
    CGContextSetFillColorWithColor(a3, (CGColorRef)[v12 CGColor]);
    if (a6)
    {
      [v36 max];
      CGFloat v17 = v16 + a5 * -0.5;
      [v36 max];
      CGFloat v19 = v18;
      [v36 min];
      double v21 = v20;
      [v36 max];
      v38.size.height = v21 - v22;
      v38.origin.x = v17;
      v38.origin.y = v19;
      v38.size.width = a5;
      CGContextFillRect(a3, v38);
    }
    else
    {
      CGFloat v23 = a5 * 0.5;
      [v36 max];
      CGFloat v25 = v24 - v23;
      [v36 max];
      CGContextMoveToPoint(a3, v25, v26);
      [v36 max];
      CGFloat v28 = v27;
      [v36 max];
      CGContextAddArc(a3, v28, v29, v23, 3.14159265, 0.0, 1);
      [v36 min];
      CGFloat v31 = v23 + v30;
      [v36 min];
      CGContextAddLineToPoint(a3, v31, v32);
      [v36 min];
      CGFloat v34 = v33;
      [v36 min];
      CGContextAddArc(a3, v34, v35, v23, 0.0, 3.14159265, 1);
      CGContextClosePath(a3);
      CGContextFillPath(a3);
    }
  }
}

- (void)_drawBloodPressureSymbol:(int64_t)a3 withColor:(id)a4 atLocation:(CGPoint)a5 width:(double)a6 context:(CGContext *)a7
{
  double y = a5.y;
  double x = a5.x;
  id v12 = a4;
  id v13 = v12;
  if (a3 == 1)
  {
    id v14 = v12;
    id v12 = (id)+[HKBloodPressureSeries _drawDiastolicSymbolWithColor:atLocation:width:context:](HKBloodPressureSeries, "_drawDiastolicSymbolWithColor:atLocation:width:context:", v12, a7, x, y, a6);
  }
  else
  {
    if (a3) {
      goto LABEL_6;
    }
    id v14 = v12;
    id v12 = (id)+[HKBloodPressureSeries _drawSystolicSymbolWithColor:atLocation:width:context:](HKBloodPressureSeries, "_drawSystolicSymbolWithColor:atLocation:width:context:", v12, a7, x, y, a6);
  }
  id v13 = v14;
LABEL_6:
  MEMORY[0x1F41817F8](v12, v13);
}

+ (void)_drawSystolicSymbolWithColor:(id)a3 atLocation:(CGPoint)a4 width:(double)a5 context:(CGContext *)a6
{
  double y = a4.y;
  double x = a4.x;
  id v11 = a3;
  objc_msgSend(a1, "_rectCenteredAt:width:", x, y, a5);
  uint64_t v13 = v12;
  uint64_t v15 = v14;
  uint64_t v17 = v16;
  uint64_t v19 = v18;
  id v20 = v11;
  double v21 = (CGColor *)[v20 CGColor];

  CGContextSetFillColorWithColor(a6, v21);
  uint64_t v22 = v13;
  uint64_t v23 = v15;
  uint64_t v24 = v17;
  uint64_t v25 = v19;
  CGContextFillEllipseInRect(a6, *(CGRect *)&v22);
}

+ (CGRect)_rectCenteredAt:(CGPoint)a3 width:(double)a4
{
  double v4 = a3.x - a4 * 0.5;
  double v5 = a3.y - a4 * 0.5;
  result.size.height = a4;
  result.size.width = a4;
  result.origin.double y = v5;
  result.origin.double x = v4;
  return result;
}

+ (void)_drawDiastolicSymbolWithColor:(id)a3 atLocation:(CGPoint)a4 width:(double)a5 context:(CGContext *)a6
{
  double y = a4.y;
  double x = a4.x;
  CGContextSetFillColorWithColor(a6, (CGColorRef)[a3 CGColor]);
  double v10 = a5 * 0.5;
  CGContextMoveToPoint(a6, x - v10, y);
  CGContextAddLineToPoint(a6, x, y - v10);
  CGContextAddLineToPoint(a6, x + v10, y);
  CGContextAddLineToPoint(a6, x, y + v10);
  CGContextFillPath(a6);
}

- (id)coordinatesForBlock:(id)a3 blockPath:(HKGraphSeriesDataBlockPath *)a4 xAxis:(id)a5 yAxis:(id)a6
{
  id v11 = a5;
  id v12 = a6;
  uint64_t v13 = [a3 chartPoints];
  if (!v13)
  {
    uint64_t v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2, self, @"HKBloodPressureSeries.m", 336, @"Invalid parameter not satisfying: %@", @"points != nil" object file lineNumber description];
  }
  uint64_t v14 = [v11 transform];
  uint64_t v15 = [v12 transform];

  uint64_t v16 = objc_opt_new();
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __67__HKBloodPressureSeries_coordinatesForBlock_blockPath_xAxis_yAxis___block_invoke;
  v25[3] = &unk_1E6D54A20;
  id v26 = v14;
  id v27 = v15;
  id v28 = v16;
  id v17 = v16;
  id v18 = v15;
  id v19 = v14;
  [v13 enumerateObjectsUsingBlock:v25];
  long long v23 = *(_OWORD *)&a4->index;
  int64_t resolution = a4->resolution;
  id v20 = +[HKGraphSeriesBlockCoordinateList coordinateListWithCoordinates:v17 blockPath:&v23];

  return v20;
}

void __67__HKBloodPressureSeries_coordinatesForBlock_blockPath_xAxis_yAxis___block_invoke(uint64_t a1, void *a2)
{
  id v13 = a2;
  v3 = [v13 yValue];

  if (v3)
  {
    double v4 = [v13 systolicChartPoint];

    if (v4)
    {
      double v5 = [HKMinMaxCoordinate alloc];
      id v6 = [v13 systolicChartPoint];
      double v4 = [(HKMinMaxCoordinate *)v5 initWithChartPoint:v6 xAxisTransform:*(void *)(a1 + 32) yAxisTransform:*(void *)(a1 + 40)];
    }
    id v7 = [v13 diastolicChartPoint];

    if (v7)
    {
      id v8 = [HKMinMaxCoordinate alloc];
      long long v9 = [v13 diastolicChartPoint];
      id v7 = [(HKMinMaxCoordinate *)v8 initWithChartPoint:v9 xAxisTransform:*(void *)(a1 + 32) yAxisTransform:*(void *)(a1 + 40)];
    }
    double v10 = [_HKBloodPressureCoordinate alloc];
    id v11 = [v13 userInfo];
    id v12 = [(_HKBloodPressureCoordinate *)v10 initWithSystolicCoordinate:v4 diastolicCoordinate:v7 userInfo:v11];

    [*(id *)(a1 + 48) addObject:v12];
  }
}

- (BOOL)supportsMultiTouchSelection
{
  return 1;
}

- (double)distanceFromPoint:(CGPoint)a3 blockCoordinate:(id)a4 chartRect:(CGRect)a5
{
  double y = a3.y;
  double x = a3.x;
  id v9 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2 object:self file:@"HKBloodPressureSeries.m" lineNumber:374 description:@"distanceFromPoint type class failure"];
  }
  id v10 = v9;
  id v11 = [v10 systolicCoordinate];
  id v12 = [v10 diastolicCoordinate];

  objc_msgSend(v11, "distanceToPoint:", x, y);
  double v14 = v13;
  objc_msgSend(v12, "distanceToPoint:", x, y);
  double v16 = 1.79769313e308;
  if (v12) {
    double v16 = v15;
  }
  if (v14 < v15 || v12 == 0) {
    double v15 = v14;
  }
  if (v11) {
    double v18 = v15;
  }
  else {
    double v18 = v16;
  }

  return v18;
}

- (double)xAxisDistanceFromPoint:(CGPoint)a3 blockCoordinate:(id)a4 chartRect:(CGRect)a5
{
  double x = a3.x;
  id v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2 object:self file:@"HKBloodPressureSeries.m" lineNumber:399 description:@"xAxisDistanceFromPoint type class failure"];
  }
  [v8 startXValue];
  double v10 = vabdd_f64(v9, x);

  return v10;
}

- (double)yAxisDifferenceToPoint:(CGPoint)a3 blockCoordinate:(id)a4 chartRect:(CGRect)a5
{
  double y = a3.y;
  double x = a3.x;
  id v9 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    double v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2 object:self file:@"HKBloodPressureSeries.m" lineNumber:407 description:@"yAxisDistanceFromPoint type class failure"];
  }
  id v10 = v9;
  id v11 = [v10 systolicCoordinate];
  id v12 = [v10 diastolicCoordinate];
  objc_msgSend(v11, "yAxisDifferenceToPoint:", x, y);
  double v14 = v13;
  objc_msgSend(v12, "yAxisDifferenceToPoint:", x, y);
  if (v11 && v12)
  {
    if (fabs(v14) >= fabs(v15)) {
      double v16 = v15;
    }
    else {
      double v16 = v14;
    }
  }
  else
  {
    if (!v12) {
      double v15 = 1.79769313e308;
    }
    if (v11) {
      double v16 = v14;
    }
    else {
      double v16 = v15;
    }
  }

  return v16;
}

- (BOOL)blockCoordinateIsVisibleInsideOfChartRect:(CGRect)a3 blockCoordinate:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v8 = a4;
  id v9 = [v8 systolicCoordinate];
  id v10 = [v8 diastolicCoordinate];

  if (objc_msgSend(v9, "isVisibleInChartRect:", x, y, width, height)) {
    char v11 = 1;
  }
  else {
    char v11 = objc_msgSend(v10, "isVisibleInChartRect:", x, y, width, height);
  }

  return v11;
}

- (BOOL)blockCoordinate:(id)a3 lessThan:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    long long v23 = [MEMORY[0x1E4F28B00] currentHandler];
    [v23 handleFailureInMethod:a2 object:self file:@"HKBloodPressureSeries.m" lineNumber:445 description:@"compare type class failure"];
  }
  id v9 = v7;
  id v10 = [v9 systolicCoordinate];
  char v11 = [v9 diastolicCoordinate];
  id v12 = v8;
  double v13 = [v12 systolicCoordinate];
  double v14 = [v12 diastolicCoordinate];
  [v10 min];
  double v16 = v15;
  [v13 min];
  if (v16 >= v17)
  {
    [v11 min];
    double v20 = v19;
    [v14 min];
    BOOL v18 = v20 < v21;
  }
  else
  {
    BOOL v18 = 1;
  }

  return v18;
}

- (BOOL)blockCoordinate:(id)a3 greaterThan:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    long long v23 = [MEMORY[0x1E4F28B00] currentHandler];
    [v23 handleFailureInMethod:a2 object:self file:@"HKBloodPressureSeries.m" lineNumber:462 description:@"compare type class failure"];
  }
  id v9 = v7;
  id v10 = [v9 systolicCoordinate];
  char v11 = [v9 diastolicCoordinate];
  id v12 = v8;
  double v13 = [v12 systolicCoordinate];
  double v14 = [v12 diastolicCoordinate];
  [v10 max];
  double v16 = v15;
  [v13 max];
  if (v16 <= v17)
  {
    [v11 max];
    double v20 = v19;
    [v14 max];
    BOOL v18 = v20 > v21;
  }
  else
  {
    BOOL v18 = 1;
  }

  return v18;
}

+ (id)systolicImageCompatibleWithFont:(id)a3 withColor:(id)a4
{
  id v5 = a4;
  [a3 capHeight];
  v12.double height = v6;
  CGFloat v7 = fmin(v6, 8.0);
  double v8 = v6 * 0.5;
  v12.double width = v7;
  UIGraphicsBeginImageContextWithOptions(v12, 0, 0.0);
  +[HKBloodPressureSeries _drawSystolicSymbolWithColor:atLocation:width:context:](HKBloodPressureSeries, "_drawSystolicSymbolWithColor:atLocation:width:context:", v5, UIGraphicsGetCurrentContext(), v7 * 0.5, v8, v7);

  id v9 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  return v9;
}

+ (id)diastolicImageCompatibleWithFont:(id)a3 withColor:(id)a4
{
  id v5 = a4;
  [a3 capHeight];
  v12.double height = v6;
  CGFloat v7 = fmin(v6, 8.0);
  double v8 = v6 * 0.5;
  v12.double width = v7;
  UIGraphicsBeginImageContextWithOptions(v12, 0, 0.0);
  +[HKBloodPressureSeries _drawDiastolicSymbolWithColor:atLocation:width:context:](HKBloodPressureSeries, "_drawDiastolicSymbolWithColor:atLocation:width:context:", v5, UIGraphicsGetCurrentContext(), v7 * 0.5, v8, v7);

  id v9 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  return v9;
}

- (NSLock)seriesMutableStateLock
{
  return self->_seriesMutableStateLock;
}

- (HKBloodPressureSeriesPresentationStyle)selectedPresentationStyleStorage
{
  return self->_selectedPresentationStyleStorage;
}

- (void)setSelectedPresentationStyleStorage:(id)a3
{
}

- (HKBloodPressureSeriesPresentationStyle)unselectedPresentationStyleStorage
{
  return self->_unselectedPresentationStyleStorage;
}

- (void)setUnselectedPresentationStyleStorage:(id)a3
{
}

- (HKBloodPressureSeriesPresentationStyle)inactivePresentationStyleStorage
{
  return self->_inactivePresentationStyleStorage;
}

- (void)setInactivePresentationStyleStorage:(id)a3
{
}

- (HKBloodPressureSeriesHighlightDelegate)seriesHighlightDelegateStorage
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_seriesHighlightDelegateStorage);
  return (HKBloodPressureSeriesHighlightDelegate *)WeakRetained;
}

- (void)setSeriesHighlightDelegateStorage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_seriesHighlightDelegateStorage);
  objc_storeStrong((id *)&self->_inactivePresentationStyleStorage, 0);
  objc_storeStrong((id *)&self->_unselectedPresentationStyleStorage, 0);
  objc_storeStrong((id *)&self->_selectedPresentationStyleStorage, 0);
  objc_storeStrong((id *)&self->_seriesMutableStateLock, 0);
}

@end