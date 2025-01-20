@interface HKSleepPeriodSeries
+ (id)_sleepCircleImageWithWidth:(double)a3 diameter:(double)a4 color:(id)a5;
+ (id)asleepImageCompatibleWithFont:(id)a3 withColor:(id)a4;
+ (id)inBedImageCompatibleWithFont:(id)a3 withColor:(id)a4;
- (BOOL)blockCoordinate:(id)a3 greaterThan:(id)a4;
- (BOOL)blockCoordinate:(id)a3 lessThan:(id)a4;
- (BOOL)blockCoordinateIsVisibleInsideOfChartRect:(CGRect)a3 blockCoordinate:(id)a4;
- (BOOL)shouldInvertAxis;
- (BOOL)supportsMultiTouchSelection;
- (CGSize)cornerRadii;
- (CGSize)cornerRadiiStorage;
- (HKLineSeriesPointMarkerStyle)lowerGoalLineMarkerStyle;
- (HKLineSeriesPointMarkerStyle)lowerGoalLineMarkerStyleStorage;
- (HKLineSeriesPointMarkerStyle)upperGoalLineMarkerStyle;
- (HKLineSeriesPointMarkerStyle)upperGoalLineMarkerStyleStorage;
- (HKSleepPeriodSeries)init;
- (HKStrokeStyle)goalLineStrokeStyle;
- (HKStrokeStyle)goalLineStrokeStyleStorage;
- (HKStrokeStyle)strokeStyle;
- (HKStrokeStyle)strokeStyleStorage;
- (HKStrokeStyle)tiledStrokeStyle;
- (HKStrokeStyle)tiledStrokeStyleStorage;
- (NSArray)defaultFillStyles;
- (NSArray)defaultFillStylesStorage;
- (NSArray)highlightedFillStyles;
- (NSArray)highlightedFillStylesStorage;
- (NSArray)inactiveFillStyles;
- (NSArray)inactiveFillStylesStorage;
- (NSLock)seriesMutableStateLock;
- (double)_maximumYForCoordinate:(id)a3;
- (double)_minimumYForCoordinate:(id)a3;
- (double)barWidthForVisibleBarCount:(int64_t)a3 axisRect:(CGRect)a4 minimumSpacing:(double)a5;
- (double)distanceFromPoint:(CGPoint)a3 blockCoordinate:(id)a4 chartRect:(CGRect)a5;
- (double)xAxisDistanceFromPoint:(CGPoint)a3 blockCoordinate:(id)a4 chartRect:(CGRect)a5;
- (double)yAxisDifferenceToPoint:(CGPoint)a3 blockCoordinate:(id)a4 chartRect:(CGRect)a5;
- (id)_attributedAxisString:(id)a3;
- (id)_stringFromTimeSinceNoon:(id)a3;
- (id)coordinatesForBlock:(id)a3 blockPath:(HKGraphSeriesDataBlockPath *)a4 xAxis:(id)a5 yAxis:(id)a6;
- (id)marginsForYAxis:(id)a3 xAxisRange:(id)a4 zoomLevel:(int64_t)a5 chartRect:(CGRect)a6;
- (id)startOfDayTransform;
- (id)startOfDayTransformStorage;
- (int64_t)visibleBarCountWithZoomLevelConfiguration:(id)a3;
- (void)_assertCoordinateCompatibility:(id)a3;
- (void)_drawWithBlockCoordinates:(id)a3 visibleBarCount:(int64_t)a4 pointTransform:(CGAffineTransform *)a5 context:(CGContext *)a6 axisRect:(CGRect)a7 axisResolution:(double)a8 seriesRenderingDelegate:(id)a9;
- (void)addAnnotationForValue:(double)a3 axisAnnotationDelegate:(id)a4;
- (void)addGoalLinePathsToCoordinate:(id)a3 upperGoalLinePath:(id)a4 upperGoalMarkerPoints:(id)a5 previousUpperGoalLinePoint:(id)a6 lowerGoalLinePath:(id)a7 lowerGoalMarkerPoints:(id)a8 previousLowerGoalLinePoint:(id)a9 axisRect:(CGRect)a10;
- (void)clearCaches;
- (void)drawGoalLinePath:(id)a3 goalMarkerPoints:(id)a4 markerImage:(id)a5 context:(CGContext *)a6;
- (void)drawPaths:(id)a3 withFillStyles:(id)a4 strokeStyle:(id)a5 axisRect:(CGRect)a6 context:(CGContext *)a7;
- (void)drawSeriesWithBlockCoordinates:(id)a3 axisRect:(CGRect)a4 zoomLevelConfiguration:(id)a5 pointTransform:(CGAffineTransform *)a6 renderContext:(CGContext *)a7 secondaryRenderContext:(id)a8 seriesRenderingDelegate:(id)a9;
- (void)setCornerRadii:(CGSize)a3;
- (void)setCornerRadiiStorage:(CGSize)a3;
- (void)setDefaultFillStyles:(id)a3;
- (void)setDefaultFillStylesStorage:(id)a3;
- (void)setGoalLineStrokeStyle:(id)a3;
- (void)setGoalLineStrokeStyleStorage:(id)a3;
- (void)setHighlightedFillStyles:(id)a3;
- (void)setHighlightedFillStylesStorage:(id)a3;
- (void)setInactiveFillStyles:(id)a3;
- (void)setInactiveFillStylesStorage:(id)a3;
- (void)setLowerGoalLineMarkerStyle:(id)a3;
- (void)setLowerGoalLineMarkerStyleStorage:(id)a3;
- (void)setStartOfDayTransform:(id)a3;
- (void)setStartOfDayTransformStorage:(id)a3;
- (void)setStrokeStyle:(id)a3;
- (void)setStrokeStyleStorage:(id)a3;
- (void)setTiledStrokeStyle:(id)a3;
- (void)setTiledStrokeStyleStorage:(id)a3;
- (void)setUpperGoalLineMarkerStyle:(id)a3;
- (void)setUpperGoalLineMarkerStyleStorage:(id)a3;
@end

@implementation HKSleepPeriodSeries

- (HKSleepPeriodSeries)init
{
  v16.receiver = self;
  v16.super_class = (Class)HKSleepPeriodSeries;
  v2 = [(HKGraphSeries *)&v16 init];
  if (v2)
  {
    v3 = (NSLock *)objc_alloc_init(MEMORY[0x1E4F28E08]);
    seriesMutableStateLock = v2->_seriesMutableStateLock;
    v2->_seriesMutableStateLock = v3;

    [(NSLock *)v2->_seriesMutableStateLock setName:@"HKSleepPeriodSeriesLock"];
    v2->_cornerRadiiStorage.width = 0.0;
    v2->_cornerRadiiStorage.height = 0.0;
    strokeStyleStorage = v2->_strokeStyleStorage;
    v2->_strokeStyleStorage = 0;

    tiledStrokeStyleStorage = v2->_tiledStrokeStyleStorage;
    v2->_tiledStrokeStyleStorage = 0;

    defaultFillStylesStorage = v2->_defaultFillStylesStorage;
    v8 = (NSArray *)MEMORY[0x1E4F1CBF0];
    v2->_defaultFillStylesStorage = (NSArray *)MEMORY[0x1E4F1CBF0];

    highlightedFillStylesStorage = v2->_highlightedFillStylesStorage;
    v2->_highlightedFillStylesStorage = v8;

    inactiveFillStylesStorage = v2->_inactiveFillStylesStorage;
    v2->_inactiveFillStylesStorage = v8;

    goalLineStrokeStyleStorage = v2->_goalLineStrokeStyleStorage;
    v2->_goalLineStrokeStyleStorage = 0;

    upperGoalLineMarkerStyleStorage = v2->_upperGoalLineMarkerStyleStorage;
    v2->_upperGoalLineMarkerStyleStorage = 0;

    lowerGoalLineMarkerStyleStorage = v2->_lowerGoalLineMarkerStyleStorage;
    v2->_lowerGoalLineMarkerStyleStorage = 0;

    id startOfDayTransformStorage = v2->_startOfDayTransformStorage;
    v2->_id startOfDayTransformStorage = 0;
  }
  return v2;
}

- (HKStrokeStyle)strokeStyle
{
  v3 = [(HKSleepPeriodSeries *)self seriesMutableStateLock];
  [v3 lock];

  v4 = self->_strokeStyleStorage;
  v5 = [(HKSleepPeriodSeries *)self seriesMutableStateLock];
  [v5 unlock];

  return v4;
}

- (void)setStrokeStyle:(id)a3
{
  id v4 = a3;
  v5 = [(HKSleepPeriodSeries *)self seriesMutableStateLock];
  [v5 lock];

  v6 = (HKStrokeStyle *)[v4 copy];
  strokeStyleStorage = self->_strokeStyleStorage;
  self->_strokeStyleStorage = v6;

  id v8 = [(HKSleepPeriodSeries *)self seriesMutableStateLock];
  [v8 unlock];
}

- (HKStrokeStyle)tiledStrokeStyle
{
  v3 = [(HKSleepPeriodSeries *)self seriesMutableStateLock];
  [v3 lock];

  id v4 = self->_tiledStrokeStyleStorage;
  v5 = [(HKSleepPeriodSeries *)self seriesMutableStateLock];
  [v5 unlock];

  return v4;
}

- (void)setTiledStrokeStyle:(id)a3
{
  id v4 = a3;
  v5 = [(HKSleepPeriodSeries *)self seriesMutableStateLock];
  [v5 lock];

  v6 = (HKStrokeStyle *)[v4 copy];
  tiledStrokeStyleStorage = self->_tiledStrokeStyleStorage;
  self->_tiledStrokeStyleStorage = v6;

  id v8 = [(HKSleepPeriodSeries *)self seriesMutableStateLock];
  [v8 unlock];
}

- (NSArray)defaultFillStyles
{
  v3 = [(HKSleepPeriodSeries *)self seriesMutableStateLock];
  [v3 lock];

  id v4 = self->_defaultFillStylesStorage;
  v5 = [(HKSleepPeriodSeries *)self seriesMutableStateLock];
  [v5 unlock];

  return v4;
}

- (void)setDefaultFillStyles:(id)a3
{
  id v4 = a3;
  v5 = [(HKSleepPeriodSeries *)self seriesMutableStateLock];
  [v5 lock];

  v6 = (NSArray *)[v4 copy];
  defaultFillStylesStorage = self->_defaultFillStylesStorage;
  self->_defaultFillStylesStorage = v6;

  id v8 = [(HKSleepPeriodSeries *)self seriesMutableStateLock];
  [v8 unlock];
}

- (NSArray)highlightedFillStyles
{
  v3 = [(HKSleepPeriodSeries *)self seriesMutableStateLock];
  [v3 lock];

  id v4 = self->_highlightedFillStylesStorage;
  v5 = [(HKSleepPeriodSeries *)self seriesMutableStateLock];
  [v5 unlock];

  return v4;
}

- (void)setHighlightedFillStyles:(id)a3
{
  id v4 = a3;
  v5 = [(HKSleepPeriodSeries *)self seriesMutableStateLock];
  [v5 lock];

  v6 = (NSArray *)[v4 copy];
  highlightedFillStylesStorage = self->_highlightedFillStylesStorage;
  self->_highlightedFillStylesStorage = v6;

  id v8 = [(HKSleepPeriodSeries *)self seriesMutableStateLock];
  [v8 unlock];
}

- (NSArray)inactiveFillStyles
{
  v3 = [(HKSleepPeriodSeries *)self seriesMutableStateLock];
  [v3 lock];

  id v4 = self->_inactiveFillStylesStorage;
  v5 = [(HKSleepPeriodSeries *)self seriesMutableStateLock];
  [v5 unlock];

  return v4;
}

- (void)setInactiveFillStyles:(id)a3
{
  id v4 = a3;
  v5 = [(HKSleepPeriodSeries *)self seriesMutableStateLock];
  [v5 lock];

  v6 = (NSArray *)[v4 copy];
  inactiveFillStylesStorage = self->_inactiveFillStylesStorage;
  self->_inactiveFillStylesStorage = v6;

  id v8 = [(HKSleepPeriodSeries *)self seriesMutableStateLock];
  [v8 unlock];
}

- (HKStrokeStyle)goalLineStrokeStyle
{
  v3 = [(HKSleepPeriodSeries *)self seriesMutableStateLock];
  [v3 lock];

  id v4 = self->_goalLineStrokeStyleStorage;
  v5 = [(HKSleepPeriodSeries *)self seriesMutableStateLock];
  [v5 unlock];

  return v4;
}

- (void)setGoalLineStrokeStyle:(id)a3
{
  id v4 = a3;
  v5 = [(HKSleepPeriodSeries *)self seriesMutableStateLock];
  [v5 lock];

  v6 = (HKStrokeStyle *)[v4 copy];
  goalLineStrokeStyleStorage = self->_goalLineStrokeStyleStorage;
  self->_goalLineStrokeStyleStorage = v6;

  id v8 = [(HKSleepPeriodSeries *)self seriesMutableStateLock];
  [v8 unlock];
}

- (HKLineSeriesPointMarkerStyle)upperGoalLineMarkerStyle
{
  v3 = [(HKSleepPeriodSeries *)self seriesMutableStateLock];
  [v3 lock];

  id v4 = self->_upperGoalLineMarkerStyleStorage;
  v5 = [(HKSleepPeriodSeries *)self seriesMutableStateLock];
  [v5 unlock];

  return v4;
}

- (void)setUpperGoalLineMarkerStyle:(id)a3
{
  id v4 = (HKLineSeriesPointMarkerStyle *)a3;
  v5 = [(HKSleepPeriodSeries *)self seriesMutableStateLock];
  [v5 lock];

  upperGoalLineMarkerStyleStorage = self->_upperGoalLineMarkerStyleStorage;
  self->_upperGoalLineMarkerStyleStorage = v4;

  id v7 = [(HKSleepPeriodSeries *)self seriesMutableStateLock];
  [v7 unlock];
}

- (HKLineSeriesPointMarkerStyle)lowerGoalLineMarkerStyle
{
  v3 = [(HKSleepPeriodSeries *)self seriesMutableStateLock];
  [v3 lock];

  id v4 = self->_lowerGoalLineMarkerStyleStorage;
  v5 = [(HKSleepPeriodSeries *)self seriesMutableStateLock];
  [v5 unlock];

  return v4;
}

- (void)setLowerGoalLineMarkerStyle:(id)a3
{
  id v4 = (HKLineSeriesPointMarkerStyle *)a3;
  v5 = [(HKSleepPeriodSeries *)self seriesMutableStateLock];
  [v5 lock];

  lowerGoalLineMarkerStyleStorage = self->_lowerGoalLineMarkerStyleStorage;
  self->_lowerGoalLineMarkerStyleStorage = v4;

  id v7 = [(HKSleepPeriodSeries *)self seriesMutableStateLock];
  [v7 unlock];
}

- (id)startOfDayTransform
{
  v3 = [(HKSleepPeriodSeries *)self seriesMutableStateLock];
  [v3 lock];

  id v4 = _Block_copy(self->_startOfDayTransformStorage);
  v5 = [(HKSleepPeriodSeries *)self seriesMutableStateLock];
  [v5 unlock];

  v6 = _Block_copy(v4);
  return v6;
}

- (void)setStartOfDayTransform:(id)a3
{
  id v4 = a3;
  v5 = [(HKSleepPeriodSeries *)self seriesMutableStateLock];
  [v5 lock];

  v6 = (void *)[v4 copy];
  id startOfDayTransformStorage = self->_startOfDayTransformStorage;
  self->_id startOfDayTransformStorage = v6;

  id v8 = [(HKSleepPeriodSeries *)self seriesMutableStateLock];
  [v8 unlock];
}

- (void)clearCaches
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  v3 = [(HKSleepPeriodSeries *)self defaultFillStyles];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v27 objects:v33 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v28;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v28 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v27 + 1) + 8 * v7++) clearCache];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v27 objects:v33 count:16];
    }
    while (v5);
  }

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v8 = [(HKSleepPeriodSeries *)self highlightedFillStyles];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v23 objects:v32 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v24;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v24 != v11) {
          objc_enumerationMutation(v8);
        }
        [*(id *)(*((void *)&v23 + 1) + 8 * v12++) clearCache];
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v23 objects:v32 count:16];
    }
    while (v10);
  }

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v13 = [(HKSleepPeriodSeries *)self inactiveFillStyles];
  uint64_t v14 = [v13 countByEnumeratingWithState:&v19 objects:v31 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v20;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v20 != v16) {
          objc_enumerationMutation(v13);
        }
        [*(id *)(*((void *)&v19 + 1) + 8 * v17++) clearCache];
      }
      while (v15 != v17);
      uint64_t v15 = [v13 countByEnumeratingWithState:&v19 objects:v31 count:16];
    }
    while (v15);
  }

  v18.receiver = self;
  v18.super_class = (Class)HKSleepPeriodSeries;
  [(HKGraphSeries *)&v18 clearCaches];
}

- (BOOL)shouldInvertAxis
{
  return 1;
}

- (BOOL)supportsMultiTouchSelection
{
  return 0;
}

- (void)drawSeriesWithBlockCoordinates:(id)a3 axisRect:(CGRect)a4 zoomLevelConfiguration:(id)a5 pointTransform:(CGAffineTransform *)a6 renderContext:(CGContext *)a7 secondaryRenderContext:(id)a8 seriesRenderingDelegate:(id)a9
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v18 = a3;
  id v19 = a5;
  id v20 = a9;
  long long v21 = [(HKSleepPeriodSeries *)self defaultFillStyles];
  if (v21)
  {

LABEL_4:
    int64_t v23 = [(HKSleepPeriodSeries *)self visibleBarCountWithZoomLevelConfiguration:v19];
    [v19 approximateSeriesPointIntervalAtResolution:0];
    long long v24 = *(_OWORD *)&a6->c;
    v26[0] = *(_OWORD *)&a6->a;
    v26[1] = v24;
    v26[2] = *(_OWORD *)&a6->tx;
    -[HKSleepPeriodSeries _drawWithBlockCoordinates:visibleBarCount:pointTransform:context:axisRect:axisResolution:seriesRenderingDelegate:](self, "_drawWithBlockCoordinates:visibleBarCount:pointTransform:context:axisRect:axisResolution:seriesRenderingDelegate:", v18, v23, v26, a7, v20, x, y, width, height, v25);
    goto LABEL_5;
  }
  long long v22 = [(HKSleepPeriodSeries *)self highlightedFillStyles];

  if (v22) {
    goto LABEL_4;
  }
LABEL_5:
}

- (int64_t)visibleBarCountWithZoomLevelConfiguration:(id)a3
{
  id v3 = a3;
  [v3 canonicalSize];
  double v5 = v4;
  uint64_t v6 = [v3 seriesPointIntervalComponentsAtResolution:0];

  objc_msgSend(v6, "hk_approximateDuration");
  int64_t v8 = vcvtmd_s64_f64(v5 / fmax(v7, 1.0));

  return v8;
}

- (double)barWidthForVisibleBarCount:(int64_t)a3 axisRect:(CGRect)a4 minimumSpacing:(double)a5
{
  double v5 = a4.size.width / (double)a3;
  double v6 = v5 * 0.33;
  if (v5 * 0.33 <= a5) {
    double v6 = a5;
  }
  double result = round(v5 - v6);
  if (result > 29.0) {
    return 29.0;
  }
  return result;
}

- (void)_drawWithBlockCoordinates:(id)a3 visibleBarCount:(int64_t)a4 pointTransform:(CGAffineTransform *)a5 context:(CGContext *)a6 axisRect:(CGRect)a7 axisResolution:(double)a8 seriesRenderingDelegate:(id)a9
{
  double height = a7.size.height;
  double width = a7.size.width;
  double y = a7.origin.y;
  double x = a7.origin.x;
  v117[2] = *MEMORY[0x1E4F143B8];
  id v65 = a3;
  id v66 = a9;
  int v60 = [v66 seriesDrawingDuringTiling];
  if (v60
    && ([(HKSleepPeriodSeries *)self tiledStrokeStyle],
        (id v19 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v67 = [(HKSleepPeriodSeries *)self tiledStrokeStyle];
  }
  else
  {
    v67 = [(HKSleepPeriodSeries *)self strokeStyle];
  }
  [v67 lineWidth];
  double v21 = v20;
  [v66 screenRectForSeries:self];
  -[HKSleepPeriodSeries barWidthForVisibleBarCount:axisRect:minimumSpacing:](self, "barWidthForVisibleBarCount:axisRect:minimumSpacing:", a4);
  double v23 = v22;
  v118.origin.double x = x;
  v118.origin.double y = y;
  v118.size.double width = width;
  v118.size.double height = height;
  CGFloat MaxX = CGRectGetMaxX(v118);
  v119.origin.double x = x;
  v119.origin.double y = y;
  v119.size.double width = width;
  v119.size.double height = height;
  CGFloat MinX = CGRectGetMinX(v119);
  double v25 = [MEMORY[0x1E4FB14C0] bezierPath];
  v117[0] = v25;
  long long v26 = [MEMORY[0x1E4FB14C0] bezierPath];
  v117[1] = v26;
  long long v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v117 count:2];
  long long v28 = (void *)[v27 mutableCopy];

  long long v29 = [MEMORY[0x1E4FB14C0] bezierPath];
  v116[0] = v29;
  long long v30 = [MEMORY[0x1E4FB14C0] bezierPath];
  v116[1] = v30;
  v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:v116 count:2];
  v32 = (void *)[v31 mutableCopy];

  v33 = [MEMORY[0x1E4FB14C0] bezierPath];
  uint64_t v34 = [MEMORY[0x1E4FB14C0] bezierPath];
  uint64_t v110 = 0;
  v111 = &v110;
  uint64_t v112 = 0x3032000000;
  v113 = __Block_byref_object_copy__22;
  v114 = __Block_byref_object_dispose__22;
  id v115 = 0;
  uint64_t v104 = 0;
  v105 = &v104;
  uint64_t v106 = 0x3032000000;
  v107 = __Block_byref_object_copy__22;
  v108 = __Block_byref_object_dispose__22;
  id v109 = 0;
  v103[0] = 0;
  v103[1] = v103;
  v103[2] = 0x2020000000;
  v103[3] = 0xFFEFFFFFFFFFFFFFLL;
  v101[0] = 0;
  v101[1] = v101;
  v101[2] = 0x3032000000;
  v101[3] = __Block_byref_object_copy__22;
  v101[4] = __Block_byref_object_dispose__22;
  id v102 = 0;
  v99[0] = 0;
  v99[1] = v99;
  v99[2] = 0x3032000000;
  v99[3] = __Block_byref_object_copy__22;
  v99[4] = __Block_byref_object_dispose__22;
  id v100 = 0;
  v98[0] = 0;
  v98[1] = v98;
  v98[2] = 0x2020000000;
  v98[3] = 0xFFEFFFFFFFFFFFFFLL;
  uint64_t v94 = 0;
  v95 = &v94;
  uint64_t v96 = 0x2020000000;
  uint64_t v97 = 0;
  id v35 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v36 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  double v37 = v21 + v23 + v21 + v23;
  double v38 = a8 / 86400.0 * 0.05;
  v69[1] = 3221225472;
  double v39 = a8 / 86400.0 - v38;
  v69[0] = MEMORY[0x1E4F143A8];
  v69[2] = __136__HKSleepPeriodSeries__drawWithBlockCoordinates_visibleBarCount_pointTransform_context_axisRect_axisResolution_seriesRenderingDelegate___block_invoke;
  v69[3] = &unk_1E6D55D58;
  double v40 = a8 / 86400.0 + v38;
  CGFloat v84 = MinX;
  double v85 = v37;
  CGFloat v86 = MaxX;
  id v64 = v28;
  id v70 = v64;
  id v62 = v32;
  id v71 = v62;
  v72 = self;
  v77 = &v94;
  v78 = v103;
  double v87 = v23;
  double v88 = v39;
  double v89 = v40;
  v79 = v101;
  v80 = v98;
  v81 = v99;
  id v61 = v33;
  id v73 = v61;
  id v41 = v35;
  id v74 = v41;
  id v42 = v34;
  id v75 = v42;
  id v43 = v36;
  double v90 = x;
  double v91 = y;
  double v92 = width;
  double v93 = height;
  id v76 = v43;
  v82 = &v110;
  v83 = &v104;
  long long v44 = *(_OWORD *)&a5->c;
  v68[0] = *(_OWORD *)&a5->a;
  v68[1] = v44;
  v68[2] = *(_OWORD *)&a5->tx;
  [v65 enumerateCoordinatesWithTransform:v68 roundToViewScale:1 block:v69];
  if ([(HKGraphSeries *)self allowsSelection]) {
    [(HKSleepPeriodSeries *)self defaultFillStyles];
  }
  else {
  v45 = [(HKSleepPeriodSeries *)self inactiveFillStyles];
  }
  -[HKSleepPeriodSeries drawPaths:withFillStyles:strokeStyle:axisRect:context:](self, "drawPaths:withFillStyles:strokeStyle:axisRect:context:", v64, v45, v67, a6, x, y, width, height);
  v46 = [(HKSleepPeriodSeries *)self highlightedFillStyles];
  v47 = v46;
  if (!v46)
  {
    v47 = [(HKSleepPeriodSeries *)self defaultFillStyles];
  }
  -[HKSleepPeriodSeries drawPaths:withFillStyles:strokeStyle:axisRect:context:](self, "drawPaths:withFillStyles:strokeStyle:axisRect:context:", v62, v47, v67, a6, x, y, width, height);
  if (!v46) {

  }
  v48 = [(HKSleepPeriodSeries *)self upperGoalLineMarkerStyle];
  if (v48)
  {
    v49 = [(HKSleepPeriodSeries *)self upperGoalLineMarkerStyle];
    v50 = +[HKChartSeriesPointMarker chartPointWithLineSeriesPresentationStyle:v49];
  }
  else
  {
    v50 = 0;
  }

  v51 = [(HKSleepPeriodSeries *)self lowerGoalLineMarkerStyle];
  if (v51)
  {
    v52 = [(HKSleepPeriodSeries *)self lowerGoalLineMarkerStyle];
    v53 = +[HKChartSeriesPointMarker chartPointWithLineSeriesPresentationStyle:v52];
  }
  else
  {
    v53 = 0;
  }

  [(HKSleepPeriodSeries *)self drawGoalLinePath:v61 goalMarkerPoints:v41 markerImage:v50 context:a6];
  [(HKSleepPeriodSeries *)self drawGoalLinePath:v42 goalMarkerPoints:v43 markerImage:v53 context:a6];
  v54 = [(HKSleepPeriodSeries *)self goalLineStrokeStyle];
  BOOL v55 = v54 == 0;

  if (!v55)
  {
    v56 = [v66 axisAnnotationDelegateForSeries:self];
    v57 = (void *)v111[5];
    if (v57)
    {
      [v57 doubleValue];
      -[HKSleepPeriodSeries addAnnotationForValue:axisAnnotationDelegate:](self, "addAnnotationForValue:axisAnnotationDelegate:", v56);
    }
    v58 = (void *)v105[5];
    if (v58)
    {
      [v58 doubleValue];
      -[HKSleepPeriodSeries addAnnotationForValue:axisAnnotationDelegate:](self, "addAnnotationForValue:axisAnnotationDelegate:", v56);
    }
  }
  if (((v60 | [v66 measuringStartupTime] ^ 1) & 1) == 0 && v95[3] >= 1)
  {
    v59 = [(HKGraphSeries *)self delegate];
    [v59 nonemptyDrawComplete];
  }
  _Block_object_dispose(&v94, 8);
  _Block_object_dispose(v98, 8);
  _Block_object_dispose(v99, 8);

  _Block_object_dispose(v101, 8);
  _Block_object_dispose(v103, 8);
  _Block_object_dispose(&v104, 8);

  _Block_object_dispose(&v110, 8);
}

void __136__HKSleepPeriodSeries__drawWithBlockCoordinates_visibleBarCount_pointTransform_context_axisRect_axisResolution_seriesRenderingDelegate___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v105 = a2;
  id v6 = a4;
  [v105 xValue];
  double v8 = v7;
  double v9 = *(double *)(a1 + 152);
  if (*(double *)(a1 + 144) - v8 <= v9 && v8 - *(double *)(a1 + 160) <= v9)
  {
    uint64_t v10 = [v105 asleepYValues];
    uint64_t v11 = [v10 count];

    uint64_t v12 = v105;
    if (v11)
    {
      v13 = [*(id *)(a1 + 32) objectAtIndexedSubscript:1];
      if ([v105 highlighted])
      {
        uint64_t v14 = [*(id *)(a1 + 40) objectAtIndexedSubscript:1];

        v13 = (void *)v14;
      }
      uint64_t v15 = [v105 asleepYValues];
      uint64_t v16 = [v15 firstObject];

      uint64_t v17 = [v105 asleepYValues];
      unint64_t v18 = [v17 count];

      if (v18 < 2)
      {
        double v21 = v16;
      }
      else
      {
        unint64_t v19 = 1;
        do
        {
          double v20 = [v105 asleepYValues];
          double v21 = [v20 objectAtIndexedSubscript:v19];

          double v22 = [v16 value];
          [v22 doubleValue];
          double v24 = v23;

          double v25 = [v21 value];
          [v25 doubleValue];
          double v27 = v26;

          if (v19)
          {
            if ([v16 continuation]) {
              uint64_t v28 = 0;
            }
            else {
              uint64_t v28 = 3;
            }
            if (![v21 continuation]) {
              v28 |= 0xCuLL;
            }
            if (v27 - v24 >= 0.0) {
              double v30 = v27 - v24;
            }
            else {
              double v30 = -(v27 - v24);
            }
            double v31 = v8;
            double v32 = v24;
            uint64_t v29 = *(void *)(a1 + 168);
            CGRect v107 = CGRectStandardize(*(CGRect *)(&v30 - 3));
            CGRect v108 = CGRectOffset(v107, *(double *)(a1 + 168) * -0.5, 0.0);
            double x = v108.origin.x;
            double y = v108.origin.y;
            double width = v108.size.width;
            double height = v108.size.height;
            [*(id *)(a1 + 48) cornerRadii];
            double v39 = +[HKBarSeries barSeriesRoundedRect:byRoundingCorners:cornerRadii:](HKBarSeries, "barSeriesRoundedRect:byRoundingCorners:cornerRadii:", v28, x, y, width, height, v37, v38);
            [v13 appendPath:v39];

            ++*(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 24);
          }

          ++v19;
          double v40 = [v105 asleepYValues];
          unint64_t v41 = [v40 count];

          uint64_t v16 = v21;
        }
        while (v19 < v41);
      }

      uint64_t v12 = v105;
    }
    id v42 = [v12 inBedYValues];
    uint64_t v43 = [v42 count];

    if (v43)
    {
      long long v44 = [*(id *)(a1 + 32) objectAtIndexedSubscript:0];
      if ([v105 highlighted])
      {
        uint64_t v45 = [*(id *)(a1 + 40) objectAtIndexedSubscript:0];

        long long v44 = (void *)v45;
      }
      v46 = [v105 inBedYValues];
      v47 = [v46 firstObject];

      v48 = [v105 inBedYValues];
      unint64_t v49 = [v48 count];

      if (v49 < 2)
      {
        v53 = v47;
      }
      else
      {
        unint64_t v50 = 1;
        v51 = v105;
        do
        {
          v52 = [v51 inBedYValues];
          v53 = [v52 objectAtIndexedSubscript:v50];

          v54 = [v47 value];
          [v54 doubleValue];
          double v56 = v55;

          v57 = [v53 value];
          [v57 doubleValue];
          double v59 = v58;

          if (v50)
          {
            if ([v47 continuation]) {
              uint64_t v60 = 0;
            }
            else {
              uint64_t v60 = 3;
            }
            if (![v53 continuation]) {
              v60 |= 0xCuLL;
            }
            if (v59 - v56 >= 0.0) {
              double v62 = v59 - v56;
            }
            else {
              double v62 = -(v59 - v56);
            }
            double v63 = v8;
            double v64 = v56;
            uint64_t v61 = *(void *)(a1 + 168);
            CGRect v109 = CGRectStandardize(*(CGRect *)(&v62 - 3));
            CGRect v110 = CGRectOffset(v109, *(double *)(a1 + 168) * -0.5, 0.0);
            double v65 = v110.origin.x;
            double v66 = v110.origin.y;
            double v67 = v110.size.width;
            double v68 = v110.size.height;
            [*(id *)(a1 + 48) cornerRadii];
            id v71 = +[HKBarSeries barSeriesRoundedRect:byRoundingCorners:cornerRadii:](HKBarSeries, "barSeriesRoundedRect:byRoundingCorners:cornerRadii:", v60, v65, v66, v67, v68, v69, v70);
            [v44 appendPath:v71];

            ++*(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 24);
          }

          ++v50;
          v72 = [v105 inBedYValues];
          unint64_t v73 = [v72 count];

          v47 = v53;
          v51 = v105;
        }
        while (v50 < v73);
      }
    }
    [v6 xValue];
    double v75 = vabdd_f64(v74, *(double *)(*(void *)(*(void *)(a1 + 96) + 8) + 24));
    BOOL v76 = v75 < *(double *)(a1 + 176) || v75 > *(double *)(a1 + 184);
    id v77 = v105;
    v78 = *(void **)(*(void *)(*(void *)(a1 + 104) + 8) + 40);
    if (v78
      && ((double v79 = *(double *)(*(void *)(*(void *)(a1 + 112) + 8) + 24), v79 >= v8) ? (v80 = 1) : (v80 = v76),
          (v80 & 1) == 0))
    {
      v82 = (void *)MEMORY[0x1E4F29238];
      [v78 doubleValue];
      uint64_t v84 = objc_msgSend(v82, "valueWithCGPoint:", v79, v83);
      id v77 = v105;
      v81 = (void *)v84;
    }
    else
    {
      v81 = 0;
    }
    double v85 = *(void **)(*(void *)(*(void *)(a1 + 120) + 8) + 40);
    if (v85
      && ((double v86 = *(double *)(*(void *)(*(void *)(a1 + 112) + 8) + 24), v86 >= v8) ? (v87 = 1) : (v87 = v76),
          (v87 & 1) == 0))
    {
      double v89 = (void *)MEMORY[0x1E4F29238];
      [v85 doubleValue];
      uint64_t v91 = objc_msgSend(v89, "valueWithCGPoint:", v86, v90);
      id v77 = v105;
      double v88 = (void *)v91;
    }
    else
    {
      double v88 = 0;
    }
    objc_msgSend(*(id *)(a1 + 48), "addGoalLinePathsToCoordinate:upperGoalLinePath:upperGoalMarkerPoints:previousUpperGoalLinePoint:lowerGoalLinePath:lowerGoalMarkerPoints:previousLowerGoalLinePoint:axisRect:", v77, *(void *)(a1 + 56), *(void *)(a1 + 64), v81, *(void *)(a1 + 72), *(void *)(a1 + 80), *(double *)(a1 + 192), *(double *)(a1 + 200), *(double *)(a1 + 208), *(double *)(a1 + 216), v88);
    if (v8 <= *(double *)(a1 + 160))
    {
      uint64_t v92 = [v6 upperGoalYValue];
      uint64_t v93 = *(void *)(*(void *)(a1 + 128) + 8);
      uint64_t v94 = *(void **)(v93 + 40);
      *(void *)(v93 + 40) = v92;

      uint64_t v95 = [v6 lowerGoalYValue];
      uint64_t v96 = *(void *)(*(void *)(a1 + 136) + 8);
      uint64_t v97 = *(void **)(v96 + 40);
      *(void *)(v96 + 40) = v95;
    }
    [v6 xValue];
    *(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 24) = v98;
    uint64_t v99 = [v105 upperGoalYValue];
    uint64_t v100 = *(void *)(*(void *)(a1 + 104) + 8);
    v101 = *(void **)(v100 + 40);
    *(void *)(v100 + 40) = v99;

    uint64_t v102 = [v105 lowerGoalYValue];
    uint64_t v103 = *(void *)(*(void *)(a1 + 120) + 8);
    uint64_t v104 = *(void **)(v103 + 40);
    *(void *)(v103 + 40) = v102;

    *(double *)(*(void *)(*(void *)(a1 + 112) + 8) + 24) = v8;
  }
}

- (void)addGoalLinePathsToCoordinate:(id)a3 upperGoalLinePath:(id)a4 upperGoalMarkerPoints:(id)a5 previousUpperGoalLinePoint:(id)a6 lowerGoalLinePath:(id)a7 lowerGoalMarkerPoints:(id)a8 previousLowerGoalLinePoint:(id)a9 axisRect:(CGRect)a10
{
  id v34 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v20 = a9;
  [v34 xValue];
  double v22 = v21;
  double v23 = [v34 upperGoalYValue];

  double v24 = v34;
  if (v23)
  {
    double v25 = [v34 upperGoalYValue];
    [v25 doubleValue];
    double v27 = v26;

    if (v17)
    {
      [v17 CGPointValue];
      objc_msgSend(v15, "moveToPoint:");
      objc_msgSend(v15, "addLineToPoint:", v22, v27);
    }
    uint64_t v28 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", v22, v27);
    [v16 addObject:v28];

    double v24 = v34;
  }
  uint64_t v29 = [v24 lowerGoalYValue];

  if (v29)
  {
    double v30 = [v34 lowerGoalYValue];
    [v30 doubleValue];
    double v32 = v31;

    if (v20)
    {
      [v20 CGPointValue];
      objc_msgSend(v18, "moveToPoint:");
      objc_msgSend(v18, "addLineToPoint:", v22, v32);
    }
    v33 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", v22, v32);
    [v19 addObject:v33];
  }
}

- (void)drawGoalLinePath:(id)a3 goalMarkerPoints:(id)a4 markerImage:(id)a5 context:(CGContext *)a6
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (([v10 isEmpty] & 1) == 0)
  {
    v13 = [(HKSleepPeriodSeries *)self goalLineStrokeStyle];

    if (v13)
    {
      CGContextSaveGState(a6);
      uint64_t v14 = [(HKSleepPeriodSeries *)self goalLineStrokeStyle];
      [v14 applyToContext:a6];

      CGContextAddPath(a6, (CGPathRef)[v10 CGPath]);
      CGContextStrokePath(a6);
      CGContextRestoreGState(a6);
    }
  }
  if (v12)
  {
    CGContextSaveGState(a6);
    double v15 = HKChartSeriesPointMarkerBaseRect(v12);
    CGFloat v17 = v16;
    CGFloat v19 = v18;
    CGFloat v21 = v20;
    double v22 = (CGImage *)[v12 CGImage];
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v23 = v11;
    uint64_t v24 = [v23 countByEnumeratingWithState:&v32 objects:v36 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v33;
      do
      {
        uint64_t v27 = 0;
        do
        {
          if (*(void *)v33 != v26) {
            objc_enumerationMutation(v23);
          }
          objc_msgSend(*(id *)(*((void *)&v32 + 1) + 8 * v27), "CGPointValue", (void)v32);
          CGFloat v29 = v28;
          CGFloat v31 = v30;
          v38.origin.double x = v15;
          v38.origin.double y = v17;
          v38.size.double width = v19;
          v38.size.double height = v21;
          CGRect v39 = CGRectOffset(v38, v29, v31);
          CGContextDrawImage(a6, v39, v22);
          ++v27;
        }
        while (v25 != v27);
        uint64_t v25 = [v23 countByEnumeratingWithState:&v32 objects:v36 count:16];
      }
      while (v25);
    }

    CGContextRestoreGState(a6);
  }
}

- (void)drawPaths:(id)a3 withFillStyles:(id)a4 strokeStyle:(id)a5 axisRect:(CGRect)a6 context:(CGContext *)a7
{
  double height = a6.size.height;
  double width = a6.size.width;
  double y = a6.origin.y;
  double x = a6.origin.x;
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  if (v17)
  {
    double v18 = [MEMORY[0x1E4FB14C0] bezierPath];
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v19 = v15;
    uint64_t v20 = [v19 countByEnumeratingWithState:&v31 objects:v35 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v32;
      do
      {
        uint64_t v23 = 0;
        do
        {
          if (*(void *)v32 != v22) {
            objc_enumerationMutation(v19);
          }
          objc_msgSend(v18, "appendPath:", *(void *)(*((void *)&v31 + 1) + 8 * v23++), (void)v31);
        }
        while (v21 != v23);
        uint64_t v21 = [v19 countByEnumeratingWithState:&v31 objects:v35 count:16];
      }
      while (v21);
    }

    CGContextSaveGState(a7);
    [v17 applyToContext:a7];
    id v24 = v18;
    CGContextAddPath(a7, (CGPathRef)[v24 CGPath]);
    CGContextStrokePath(a7);
    CGContextRestoreGState(a7);
  }
  if (objc_msgSend(v15, "count", (void)v31))
  {
    unint64_t v25 = 0;
    do
    {
      uint64_t v26 = [v15 objectAtIndexedSubscript:v25];
      if (([v26 isEmpty] & 1) == 0 && v25 < objc_msgSend(v16, "count"))
      {
        uint64_t v27 = [v16 objectAtIndexedSubscript:v25];
        if (v27)
        {
          double v28 = (void *)v27;
          uint64_t v29 = [v26 CGPath];
          [(HKGraphSeries *)self alpha];
          objc_msgSend(v28, "renderPath:context:axisRect:alpha:", v29, a7, x, y, width, height, v30);
        }
      }

      ++v25;
    }
    while (v25 < [v15 count]);
  }
}

- (id)coordinatesForBlock:(id)a3 blockPath:(HKGraphSeriesDataBlockPath *)a4 xAxis:(id)a5 yAxis:(id)a6
{
  id v11 = a5;
  id v12 = a6;
  v13 = [a3 chartPoints];
  if (!v13)
  {
    uint64_t v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2, self, @"HKSleepPeriodSeries.m", 611, @"Invalid parameter not satisfying: %@", @"points != nil" object file lineNumber description];
  }
  uint64_t v14 = [v11 transform];
  id v15 = [v12 transform];

  id v16 = objc_opt_new();
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __65__HKSleepPeriodSeries_coordinatesForBlock_blockPath_xAxis_yAxis___block_invoke;
  v25[3] = &unk_1E6D55D08;
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

void __65__HKSleepPeriodSeries_coordinatesForBlock_blockPath_xAxis_yAxis___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  double v4 = [v3 yValue];

  if (v4)
  {
    double v5 = *(void **)(a1 + 32);
    id v6 = [v3 xValueAsGenericType];
    [v5 coordinateForValue:v6];
    double v8 = v7;

    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v10 = [v3 allYValues];
    uint64_t v11 = [v10 countByEnumeratingWithState:&v30 objects:v34 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v31;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v31 != v13) {
            objc_enumerationMutation(v10);
          }
          [*(id *)(a1 + 40) coordinateForValue:*(void *)(*((void *)&v30 + 1) + 8 * v14)];
          id v15 = objc_msgSend(NSNumber, "numberWithDouble:");
          [v9 addObject:v15];

          ++v14;
        }
        while (v12 != v14);
        uint64_t v12 = [v10 countByEnumeratingWithState:&v30 objects:v34 count:16];
      }
      while (v12);
    }

    id v16 = [v3 upperGoal];

    if (v16)
    {
      id v17 = NSNumber;
      id v18 = *(void **)(a1 + 40);
      id v19 = [v3 upperGoal];
      [v18 coordinateForValue:v19];
      id v16 = objc_msgSend(v17, "numberWithDouble:");
    }
    uint64_t v20 = [v3 lowerGoal];

    if (v20)
    {
      uint64_t v21 = NSNumber;
      uint64_t v22 = *(void **)(a1 + 40);
      long long v23 = [v3 lowerGoal];
      [v22 coordinateForValue:v23];
      uint64_t v20 = objc_msgSend(v21, "numberWithDouble:");
    }
    id v24 = [v3 userInfo];
    unint64_t v25 = [HKSleepPeriodCoordinate alloc];
    id v26 = [v3 asleepOffsets];
    id v27 = [v3 inBedOffsets];
    id v28 = [v3 allYValues];
    uint64_t v29 = -[HKSleepPeriodCoordinate initWithXValue:asleepYValues:inBedYValues:yValues:upperGoalYValue:lowerGoalYValue:highlighted:userInfo:](v25, "initWithXValue:asleepYValues:inBedYValues:yValues:upperGoalYValue:lowerGoalYValue:highlighted:userInfo:", v26, v27, v28, v16, v20, [v3 highlighted], v8, v24);

    [*(id *)(a1 + 48) addObject:v29];
  }
}

- (double)distanceFromPoint:(CGPoint)a3 blockCoordinate:(id)a4 chartRect:(CGRect)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  [(HKSleepPeriodSeries *)self _assertCoordinateCompatibility:v6];
  id v7 = v6;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  double v8 = objc_msgSend(v7, "yValues", 0);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v18;
    double v12 = 1.79769313e308;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v14 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        [v7 xValue];
        [v14 doubleValue];
        UIDistanceBetweenPoints();
        if (v12 >= v15) {
          double v12 = v15;
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v10);
  }
  else
  {
    double v12 = 1.79769313e308;
  }

  return v12;
}

- (double)xAxisDistanceFromPoint:(CGPoint)a3 blockCoordinate:(id)a4 chartRect:(CGRect)a5
{
  double x = a3.x;
  objc_msgSend(a4, "startXValue", a3.x, a3.y, a5.origin.x, a5.origin.y, a5.size.width, a5.size.height);
  return vabdd_f64(v6, x);
}

- (double)yAxisDifferenceToPoint:(CGPoint)a3 blockCoordinate:(id)a4 chartRect:(CGRect)a5
{
  double y = a3.y;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  [(HKSleepPeriodSeries *)self _assertCoordinateCompatibility:v7];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  double v8 = objc_msgSend(v7, "yValues", 0);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v17;
    double v12 = 1.79769313e308;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        [*(id *)(*((void *)&v16 + 1) + 8 * i) doubleValue];
        if (vabdd_f64(v14, y) < fabs(v12)) {
          double v12 = v14 - y;
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v10);
  }
  else
  {
    double v12 = 1.79769313e308;
  }

  return v12;
}

- (void)_assertCoordinateCompatibility:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"HKSleepPeriodSeries.m", 695, @"Invalid parameter not satisfying: %@", @"[coordinate isKindOfClass:[HKSleepPeriodCoordinate class]]" object file lineNumber description];
  }
}

- (BOOL)blockCoordinateIsVisibleInsideOfChartRect:(CGRect)a3 blockCoordinate:(id)a4
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  id v8 = a4;
  [v8 startXValue];
  double v10 = v9;
  v15.origin.CGFloat x = x;
  v15.origin.CGFloat y = y;
  v15.size.CGFloat width = width;
  v15.size.CGFloat height = height;
  if (v10 >= CGRectGetMinX(v15))
  {
    [v8 endXValue];
    double v13 = v12;
    v16.origin.CGFloat x = x;
    v16.origin.CGFloat y = y;
    v16.size.CGFloat width = width;
    v16.size.CGFloat height = height;
    BOOL v11 = v13 <= CGRectGetMaxX(v16);
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (double)_minimumYForCoordinate:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = objc_msgSend(a3, "yValues", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    double v7 = 1.79769313e308;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * i) doubleValue];
        if (v7 >= v9) {
          double v7 = v9;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
  else
  {
    double v7 = 1.79769313e308;
  }

  return v7;
}

- (double)_maximumYForCoordinate:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = objc_msgSend(a3, "yValues", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    double v7 = -1.79769313e308;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * i) doubleValue];
        if (v7 < v9) {
          double v7 = v9;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
  else
  {
    double v7 = -1.79769313e308;
  }

  return v7;
}

- (BOOL)blockCoordinate:(id)a3 lessThan:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(HKSleepPeriodSeries *)self _assertCoordinateCompatibility:v7];
  [(HKSleepPeriodSeries *)self _minimumYForCoordinate:v7];
  double v9 = v8;

  [(HKSleepPeriodSeries *)self _minimumYForCoordinate:v6];
  double v11 = v10;

  return v9 < v11;
}

- (BOOL)blockCoordinate:(id)a3 greaterThan:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(HKSleepPeriodSeries *)self _assertCoordinateCompatibility:v7];
  [(HKSleepPeriodSeries *)self _maximumYForCoordinate:v7];
  double v9 = v8;

  [(HKSleepPeriodSeries *)self _maximumYForCoordinate:v6];
  double v11 = v10;

  return v9 > v11;
}

- (id)marginsForYAxis:(id)a3 xAxisRange:(id)a4 zoomLevel:(int64_t)a5 chartRect:(CGRect)a6
{
  id v9 = a3;
  id v10 = a4;
  double v11 = [(HKSleepPeriodSeries *)self goalLineStrokeStyle];
  if ((v11 || ![(HKGraphSeries *)self allowsSelection]) && (v11, v9))
  {
    uint64_t v27 = 0;
    id v28 = (double *)&v27;
    uint64_t v29 = 0x2020000000;
    uint64_t v30 = 0;
    long long v12 = [v9 minValue];
    [v12 doubleValue];
    uint64_t v14 = v13;

    uint64_t v30 = v14;
    uint64_t v23 = 0;
    id v24 = (double *)&v23;
    uint64_t v25 = 0x2020000000;
    uint64_t v26 = 0;
    CGRect v15 = [v9 maxValue];
    [v15 doubleValue];
    uint64_t v17 = v16;

    uint64_t v26 = v17;
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __70__HKSleepPeriodSeries_marginsForYAxis_xAxisRange_zoomLevel_chartRect___block_invoke;
    v22[3] = &unk_1E6D55D80;
    v22[4] = &v27;
    v22[5] = &v23;
    [(HKGraphSeries *)self enumerateChartPointsInRange:v10 zoomLevel:a5 resolution:0 block:v22];
    long long v18 = [NSNumber numberWithDouble:v28[3]];
    long long v19 = [NSNumber numberWithDouble:v24[3]];
    id v20 = +[HKValueRange valueRangeWithMinValue:v18 maxValue:v19];

    _Block_object_dispose(&v23, 8);
    _Block_object_dispose(&v27, 8);
  }
  else
  {
    id v20 = v9;
  }

  return v20;
}

uint64_t __70__HKSleepPeriodSeries_marginsForYAxis_xAxisRange_zoomLevel_chartRect___block_invoke(uint64_t a1, void *a2)
{
  id v19 = a2;
  objc_opt_class();
  uint64_t isKindOfClass = objc_opt_isKindOfClass();
  id v4 = v19;
  if (isKindOfClass)
  {
    id v5 = v19;
    id v6 = [v5 upperGoal];

    if (v6)
    {
      double v7 = *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
      double v8 = [v5 upperGoal];
      [v8 doubleValue];
      double v10 = v9;

      if (v7 >= v10) {
        double v11 = v10;
      }
      else {
        double v11 = v7;
      }
      *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v11;
    }
    long long v12 = [v5 lowerGoal];

    if (v12)
    {
      double v13 = *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
      uint64_t v14 = [v5 lowerGoal];
      [v14 doubleValue];
      double v16 = v15;

      if (v13 >= v16) {
        double v17 = v13;
      }
      else {
        double v17 = v16;
      }
      *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v17;
    }

    id v4 = v19;
  }
  return MEMORY[0x1F41817F8](isKindOfClass, v4);
}

- (void)addAnnotationForValue:(double)a3 axisAnnotationDelegate:(id)a4
{
  if (a4)
  {
    id v6 = NSNumber;
    id v7 = a4;
    id v10 = [v6 numberWithDouble:a3];
    double v8 = [(HKSleepPeriodSeries *)self _stringFromTimeSinceNoon:v10];
    double v9 = [(HKSleepPeriodSeries *)self _attributedAxisString:v8];
    [v7 addAxisAnnotation:v9 forSeries:self modelCoordinate:v10];
  }
}

- (id)_stringFromTimeSinceNoon:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F1C9A8];
  id v5 = a3;
  id v6 = [v4 currentCalendar];
  id v7 = [(HKSleepPeriodSeries *)self startOfDayTransform];

  if (v7)
  {
    double v8 = [(HKSleepPeriodSeries *)self startOfDayTransform];
    double v9 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:0.0];
    id v10 = ((void (**)(void, void *, void *))v8)[2](v8, v6, v9);
  }
  else
  {
    double v8 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:0.0];
    id v10 = [v6 startOfDayForDate:v8];
  }

  [v5 doubleValue];
  double v12 = v11;

  double v13 = [v10 dateByAddingTimeInterval:v12];
  uint64_t v14 = HKLocalizedStringForDateAndTemplate(v13, 28);

  return v14;
}

- (id)_attributedAxisString:(id)a3
{
  v11[2] = *MEMORY[0x1E4F143B8];
  v10[0] = *MEMORY[0x1E4FB06F8];
  id v3 = (void *)MEMORY[0x1E4FB08E0];
  id v4 = a3;
  id v5 = objc_msgSend(v3, "hk_chartAxisLabelFont");
  v11[0] = v5;
  v10[1] = *MEMORY[0x1E4FB0700];
  id v6 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_sleepAsleepColor");
  v11[1] = v6;
  id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:2];

  double v8 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v4 attributes:v7];
  return v8;
}

+ (id)_sleepCircleImageWithWidth:(double)a3 diameter:(double)a4 color:(id)a5
{
  id v7 = a5;
  v14.CGFloat width = a3;
  v14.CGFloat height = a3;
  UIGraphicsBeginImageContextWithOptions(v14, 0, 0.0);
  CurrentContext = UIGraphicsGetCurrentContext();
  id v9 = v7;
  id v10 = (CGColor *)[v9 CGColor];

  CGContextSetFillColorWithColor(CurrentContext, v10);
  v15.origin.CGFloat x = a3 * 0.5 - a4 * 0.5;
  v15.origin.CGFloat y = v15.origin.x;
  v15.size.CGFloat width = a4;
  v15.size.CGFloat height = a4;
  CGContextFillEllipseInRect(CurrentContext, v15);
  double v11 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  return v11;
}

+ (id)asleepImageCompatibleWithFont:(id)a3 withColor:(id)a4
{
  id v6 = a4;
  [a3 capHeight];
  double v8 = [a1 _sleepCircleImageWithWidth:v6 diameter:v7 color:v7];

  return v8;
}

+ (id)inBedImageCompatibleWithFont:(id)a3 withColor:(id)a4
{
  id v6 = a4;
  [a3 capHeight];
  double v8 = [a1 _sleepCircleImageWithWidth:v6 diameter:v7 color:v7];

  return v8;
}

- (CGSize)cornerRadii
{
  double width = self->_cornerRadii.width;
  double height = self->_cornerRadii.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setCornerRadii:(CGSize)a3
{
  self->_cornerRadiuint64_t i = a3;
}

- (NSLock)seriesMutableStateLock
{
  return self->_seriesMutableStateLock;
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

- (HKStrokeStyle)strokeStyleStorage
{
  return self->_strokeStyleStorage;
}

- (void)setStrokeStyleStorage:(id)a3
{
}

- (HKStrokeStyle)tiledStrokeStyleStorage
{
  return self->_tiledStrokeStyleStorage;
}

- (void)setTiledStrokeStyleStorage:(id)a3
{
}

- (NSArray)defaultFillStylesStorage
{
  return self->_defaultFillStylesStorage;
}

- (void)setDefaultFillStylesStorage:(id)a3
{
}

- (NSArray)highlightedFillStylesStorage
{
  return self->_highlightedFillStylesStorage;
}

- (void)setHighlightedFillStylesStorage:(id)a3
{
}

- (NSArray)inactiveFillStylesStorage
{
  return self->_inactiveFillStylesStorage;
}

- (void)setInactiveFillStylesStorage:(id)a3
{
}

- (HKStrokeStyle)goalLineStrokeStyleStorage
{
  return self->_goalLineStrokeStyleStorage;
}

- (void)setGoalLineStrokeStyleStorage:(id)a3
{
}

- (HKLineSeriesPointMarkerStyle)upperGoalLineMarkerStyleStorage
{
  return self->_upperGoalLineMarkerStyleStorage;
}

- (void)setUpperGoalLineMarkerStyleStorage:(id)a3
{
}

- (HKLineSeriesPointMarkerStyle)lowerGoalLineMarkerStyleStorage
{
  return self->_lowerGoalLineMarkerStyleStorage;
}

- (void)setLowerGoalLineMarkerStyleStorage:(id)a3
{
}

- (id)startOfDayTransformStorage
{
  return self->_startOfDayTransformStorage;
}

- (void)setStartOfDayTransformStorage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_startOfDayTransformStorage, 0);
  objc_storeStrong((id *)&self->_lowerGoalLineMarkerStyleStorage, 0);
  objc_storeStrong((id *)&self->_upperGoalLineMarkerStyleStorage, 0);
  objc_storeStrong((id *)&self->_goalLineStrokeStyleStorage, 0);
  objc_storeStrong((id *)&self->_inactiveFillStylesStorage, 0);
  objc_storeStrong((id *)&self->_highlightedFillStylesStorage, 0);
  objc_storeStrong((id *)&self->_defaultFillStylesStorage, 0);
  objc_storeStrong((id *)&self->_tiledStrokeStyleStorage, 0);
  objc_storeStrong((id *)&self->_strokeStyleStorage, 0);
  objc_storeStrong((id *)&self->_seriesMutableStateLock, 0);
}

@end