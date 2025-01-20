@interface HKSleepDurationSeries
- (BOOL)_currentGoal:(id)a3 differentFrom:(id)a4;
- (BOOL)_dataIsHidden:(int64_t)a3;
- (BOOL)extendGoalLineToAxis;
- (BOOL)extendGoalLineToAxisStorage;
- (BOOL)hideAsleepData;
- (BOOL)hideAsleepDataStorage;
- (BOOL)hideInBedData;
- (BOOL)hideInBedDataStorage;
- (BOOL)supportsMultiTouchSelection;
- (HKLineSeriesPointMarkerStyle)goalLineMarkerStyle;
- (HKLineSeriesPointMarkerStyle)goalLineMarkerStyleStorage;
- (HKSleepDurationSeries)init;
- (HKStrokeStyle)goalLineStrokeStyle;
- (HKStrokeStyle)goalLineStrokeStyleStorage;
- (NSArray)defaultFillStyles;
- (NSArray)defaultFillStylesStorage;
- (NSArray)highlightedFillStyles;
- (NSArray)highlightedFillStylesStorage;
- (NSArray)inactiveFillStyles;
- (NSArray)inactiveFillStylesStorage;
- (NSLock)seriesMutableStateLock;
- (UIImage)goalLineMarkerImageStorage;
- (double)barWidthForVisibleBarCount:(int64_t)a3 axisRect:(CGRect)a4 minimumSpacing:(double)a5;
- (id)_durationAbbreviatedFormatter;
- (id)_durationShortFormatter;
- (id)_stringForDuration:(double)a3;
- (id)coordinatesForBlock:(id)a3 blockPath:(HKGraphSeriesDataBlockPath *)a4 xAxis:(id)a5 yAxis:(id)a6;
- (id)goalLineMarkerImage;
- (id)startOfDayTransform;
- (id)startOfDayTransformStorage;
- (void)_addAnnotationForValue:(double)a3 axisAnnotationDelegate:(id)a4;
- (void)_addGoalAnnotationAtLocation:(double)a3 axisAnnotationDelegate:(id)a4;
- (void)_drawGoalLineMarkers:(id)a3 context:(CGContext *)a4 goalLineMarkerImage:(id)a5;
- (void)_drawGoalLinePath:(id)a3 context:(CGContext *)a4;
- (void)_drawPaths:(id)a3 withFillStyles:(id)a4 strokeStyle:(id)a5 axisRect:(CGRect)a6 context:(CGContext *)a7;
- (void)_rebuildPointMarkerImages;
- (void)addGoalLinePathsToCoordinate:(id)a3 goalLinePath:(id)a4 goalLineMarkerPoints:(id)a5 previousCoordinateGoal:(id)a6 axisRect:(CGRect)a7;
- (void)clearCaches;
- (void)drawSeriesWithBlockCoordinates:(id)a3 axisRect:(CGRect)a4 zoomLevelConfiguration:(id)a5 pointTransform:(CGAffineTransform *)a6 renderContext:(CGContext *)a7 secondaryRenderContext:(id)a8 seriesRenderingDelegate:(id)a9;
- (void)drawWithBlockCoordinates:(id)a3 visibleBarCount:(int64_t)a4 pointTransform:(CGAffineTransform *)a5 context:(CGContext *)a6 axisRect:(CGRect)a7 seriesRenderingDelegate:(id)a8;
- (void)setDefaultFillStyles:(id)a3;
- (void)setDefaultFillStylesStorage:(id)a3;
- (void)setExtendGoalLineToAxis:(BOOL)a3;
- (void)setExtendGoalLineToAxisStorage:(BOOL)a3;
- (void)setGoalLineMarkerImageStorage:(id)a3;
- (void)setGoalLineMarkerStyle:(id)a3;
- (void)setGoalLineMarkerStyleStorage:(id)a3;
- (void)setGoalLineStrokeStyle:(id)a3;
- (void)setGoalLineStrokeStyleStorage:(id)a3;
- (void)setHideAsleepData:(BOOL)a3;
- (void)setHideAsleepDataStorage:(BOOL)a3;
- (void)setHideInBedData:(BOOL)a3;
- (void)setHideInBedDataStorage:(BOOL)a3;
- (void)setHighlightedFillStyles:(id)a3;
- (void)setHighlightedFillStylesStorage:(id)a3;
- (void)setInactiveFillStyles:(id)a3;
- (void)setInactiveFillStylesStorage:(id)a3;
- (void)setStartOfDayTransform:(id)a3;
- (void)setStartOfDayTransformStorage:(id)a3;
@end

@implementation HKSleepDurationSeries

- (HKSleepDurationSeries)init
{
  v12.receiver = self;
  v12.super_class = (Class)HKSleepDurationSeries;
  v2 = [(HKBarSeries *)&v12 init];
  if (v2)
  {
    v3 = (NSLock *)objc_alloc_init(MEMORY[0x1E4F28E08]);
    seriesMutableStateLock = v2->_seriesMutableStateLock;
    v2->_seriesMutableStateLock = v3;

    [(NSLock *)v2->_seriesMutableStateLock setName:@"HKSleepDurationSeriesLock"];
    defaultFillStylesStorage = v2->_defaultFillStylesStorage;
    v2->_defaultFillStylesStorage = 0;

    highlightedFillStylesStorage = v2->_highlightedFillStylesStorage;
    v2->_highlightedFillStylesStorage = 0;

    inactiveFillStylesStorage = v2->_inactiveFillStylesStorage;
    v2->_inactiveFillStylesStorage = 0;

    goalLineStrokeStyleStorage = v2->_goalLineStrokeStyleStorage;
    v2->_goalLineStrokeStyleStorage = 0;

    goalLineMarkerStyleStorage = v2->_goalLineMarkerStyleStorage;
    v2->_goalLineMarkerStyleStorage = 0;

    v2->_extendGoalLineToAxisStorage = 0;
    id startOfDayTransformStorage = v2->_startOfDayTransformStorage;
    v2->_id startOfDayTransformStorage = 0;

    v2->_hideInBedDataStorage = 0;
    v2->_hideAsleepDataStorage = 0;
    [(HKSleepDurationSeries *)v2 _rebuildPointMarkerImages];
  }
  return v2;
}

- (NSArray)defaultFillStyles
{
  v3 = [(HKSleepDurationSeries *)self seriesMutableStateLock];
  [v3 lock];

  v4 = self->_defaultFillStylesStorage;
  v5 = [(HKSleepDurationSeries *)self seriesMutableStateLock];
  [v5 unlock];

  return v4;
}

- (void)setDefaultFillStyles:(id)a3
{
  id v4 = a3;
  v5 = [(HKSleepDurationSeries *)self seriesMutableStateLock];
  [v5 lock];

  v6 = (NSArray *)[v4 copy];
  defaultFillStylesStorage = self->_defaultFillStylesStorage;
  self->_defaultFillStylesStorage = v6;

  v8 = [(HKSleepDurationSeries *)self seriesMutableStateLock];
  [v8 unlock];

  id v9 = [v4 lastObject];

  [(HKBarSeries *)self setUnselectedFillStyle:v9];
}

- (NSArray)highlightedFillStyles
{
  v3 = [(HKSleepDurationSeries *)self seriesMutableStateLock];
  [v3 lock];

  id v4 = self->_highlightedFillStylesStorage;
  v5 = [(HKSleepDurationSeries *)self seriesMutableStateLock];
  [v5 unlock];

  return v4;
}

- (void)setHighlightedFillStyles:(id)a3
{
  id v4 = a3;
  v5 = [(HKSleepDurationSeries *)self seriesMutableStateLock];
  [v5 lock];

  v6 = (NSArray *)[v4 copy];
  highlightedFillStylesStorage = self->_highlightedFillStylesStorage;
  self->_highlightedFillStylesStorage = v6;

  id v8 = [(HKSleepDurationSeries *)self seriesMutableStateLock];
  [v8 unlock];
}

- (NSArray)inactiveFillStyles
{
  v3 = [(HKSleepDurationSeries *)self seriesMutableStateLock];
  [v3 lock];

  id v4 = self->_inactiveFillStylesStorage;
  v5 = [(HKSleepDurationSeries *)self seriesMutableStateLock];
  [v5 unlock];

  return v4;
}

- (void)setInactiveFillStyles:(id)a3
{
  id v4 = a3;
  v5 = [(HKSleepDurationSeries *)self seriesMutableStateLock];
  [v5 lock];

  v6 = (NSArray *)[v4 copy];
  inactiveFillStylesStorage = self->_inactiveFillStylesStorage;
  self->_inactiveFillStylesStorage = v6;

  id v8 = [(HKSleepDurationSeries *)self seriesMutableStateLock];
  [v8 unlock];
}

- (HKStrokeStyle)goalLineStrokeStyle
{
  v3 = [(HKSleepDurationSeries *)self seriesMutableStateLock];
  [v3 lock];

  id v4 = self->_goalLineStrokeStyleStorage;
  v5 = [(HKSleepDurationSeries *)self seriesMutableStateLock];
  [v5 unlock];

  return v4;
}

- (void)setGoalLineStrokeStyle:(id)a3
{
  id v4 = a3;
  v5 = [(HKSleepDurationSeries *)self seriesMutableStateLock];
  [v5 lock];

  v6 = (HKStrokeStyle *)[v4 copy];
  goalLineStrokeStyleStorage = self->_goalLineStrokeStyleStorage;
  self->_goalLineStrokeStyleStorage = v6;

  id v8 = [(HKSleepDurationSeries *)self seriesMutableStateLock];
  [v8 unlock];
}

- (HKLineSeriesPointMarkerStyle)goalLineMarkerStyle
{
  v3 = [(HKSleepDurationSeries *)self seriesMutableStateLock];
  [v3 lock];

  id v4 = self->_goalLineMarkerStyleStorage;
  v5 = [(HKSleepDurationSeries *)self seriesMutableStateLock];
  [v5 unlock];

  return v4;
}

- (void)setGoalLineMarkerStyle:(id)a3
{
  id v4 = (HKLineSeriesPointMarkerStyle *)a3;
  v5 = [(HKSleepDurationSeries *)self seriesMutableStateLock];
  [v5 lock];

  goalLineMarkerStyleStorage = self->_goalLineMarkerStyleStorage;
  self->_goalLineMarkerStyleStorage = v4;

  v7 = [(HKSleepDurationSeries *)self seriesMutableStateLock];
  [v7 unlock];

  [(HKSleepDurationSeries *)self _rebuildPointMarkerImages];
}

- (BOOL)extendGoalLineToAxis
{
  v3 = [(HKSleepDurationSeries *)self seriesMutableStateLock];
  [v3 lock];

  LOBYTE(v3) = self->_extendGoalLineToAxisStorage;
  id v4 = [(HKSleepDurationSeries *)self seriesMutableStateLock];
  [v4 unlock];

  return (char)v3;
}

- (void)setExtendGoalLineToAxis:(BOOL)a3
{
  v5 = [(HKSleepDurationSeries *)self seriesMutableStateLock];
  [v5 lock];

  self->_extendGoalLineToAxisStorage = a3;
  id v6 = [(HKSleepDurationSeries *)self seriesMutableStateLock];
  [v6 unlock];
}

- (id)startOfDayTransform
{
  v3 = [(HKSleepDurationSeries *)self seriesMutableStateLock];
  [v3 lock];

  id v4 = _Block_copy(self->_startOfDayTransformStorage);
  v5 = [(HKSleepDurationSeries *)self seriesMutableStateLock];
  [v5 unlock];

  id v6 = _Block_copy(v4);
  return v6;
}

- (void)setStartOfDayTransform:(id)a3
{
  id v4 = a3;
  v5 = [(HKSleepDurationSeries *)self seriesMutableStateLock];
  [v5 lock];

  id v6 = (void *)[v4 copy];
  id startOfDayTransformStorage = self->_startOfDayTransformStorage;
  self->_id startOfDayTransformStorage = v6;

  id v8 = [(HKSleepDurationSeries *)self seriesMutableStateLock];
  [v8 unlock];
}

- (BOOL)hideInBedData
{
  v3 = [(HKSleepDurationSeries *)self seriesMutableStateLock];
  [v3 lock];

  LOBYTE(v3) = self->_hideInBedDataStorage;
  id v4 = [(HKSleepDurationSeries *)self seriesMutableStateLock];
  [v4 unlock];

  return (char)v3;
}

- (void)setHideInBedData:(BOOL)a3
{
  v5 = [(HKSleepDurationSeries *)self seriesMutableStateLock];
  [v5 lock];

  self->_hideInBedDataStorage = a3;
  id v6 = [(HKSleepDurationSeries *)self seriesMutableStateLock];
  [v6 unlock];
}

- (BOOL)hideAsleepData
{
  v3 = [(HKSleepDurationSeries *)self seriesMutableStateLock];
  [v3 lock];

  LOBYTE(v3) = self->_hideAsleepDataStorage;
  id v4 = [(HKSleepDurationSeries *)self seriesMutableStateLock];
  [v4 unlock];

  return (char)v3;
}

- (void)setHideAsleepData:(BOOL)a3
{
  v5 = [(HKSleepDurationSeries *)self seriesMutableStateLock];
  [v5 lock];

  self->_hideAsleepDataStorage = a3;
  id v6 = [(HKSleepDurationSeries *)self seriesMutableStateLock];
  [v6 unlock];
}

- (id)goalLineMarkerImage
{
  v3 = [(HKSleepDurationSeries *)self seriesMutableStateLock];
  [v3 lock];

  id v4 = self->_goalLineMarkerImageStorage;
  v5 = [(HKSleepDurationSeries *)self seriesMutableStateLock];
  [v5 unlock];

  return v4;
}

- (void)_rebuildPointMarkerImages
{
  v3 = [(HKSleepDurationSeries *)self seriesMutableStateLock];
  [v3 lock];

  if (self->_goalLineMarkerStyleStorage)
  {
    +[HKChartSeriesPointMarker chartPointWithLineSeriesPresentationStyle:](HKChartSeriesPointMarker, "chartPointWithLineSeriesPresentationStyle:");
    id v4 = (UIImage *)objc_claimAutoreleasedReturnValue();
    goalLineMarkerImageStorage = self->_goalLineMarkerImageStorage;
    self->_goalLineMarkerImageStorage = v4;
  }
  else
  {
    goalLineMarkerImageStorage = self->_goalLineMarkerImageStorage;
    self->_goalLineMarkerImageStorage = 0;
  }

  id v6 = [(HKSleepDurationSeries *)self seriesMutableStateLock];
  [v6 unlock];
}

- (BOOL)supportsMultiTouchSelection
{
  return 0;
}

- (void)clearCaches
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  v3 = [(HKSleepDurationSeries *)self defaultFillStyles];
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
  id v8 = [(HKSleepDurationSeries *)self highlightedFillStyles];
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
  v13 = [(HKSleepDurationSeries *)self inactiveFillStyles];
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

  [(HKSleepDurationSeries *)self _rebuildPointMarkerImages];
  v18.receiver = self;
  v18.super_class = (Class)HKSleepDurationSeries;
  [(HKBarSeries *)&v18 clearCaches];
}

- (id)coordinatesForBlock:(id)a3 blockPath:(HKGraphSeriesDataBlockPath *)a4 xAxis:(id)a5 yAxis:(id)a6
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v10 = a5;
  id v11 = a6;
  uint64_t v12 = [a3 chartPoints];
  if (!v12)
  {
    v41 = [MEMORY[0x1E4F28B00] currentHandler];
    [v41 handleFailureInMethod:a2, self, @"HKSleepDurationSeries.m", 271, @"Invalid parameter not satisfying: %@", @"points != nil" object file lineNumber description];
  }
  v44 = v10;
  v48 = [v10 transform];
  v43 = v11;
  v13 = [v11 transform];
  v47 = [MEMORY[0x1E4F1CA48] array];
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  obuint64_t j = v12;
  uint64_t v49 = [obj countByEnumeratingWithState:&v56 objects:v61 count:16];
  if (v49)
  {
    uint64_t v46 = *(void *)v57;
    do
    {
      for (uint64_t i = 0; i != v49; ++i)
      {
        if (*(void *)v57 != v46) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = *(void **)(*((void *)&v56 + 1) + 8 * i);
        uint64_t v16 = [v15 xValueAsGenericType];
        [v48 coordinateForValue:v16];
        double v18 = v17;

        double v19 = v18 + -0.25;
        [v13 coordinateForValue:&unk_1F3C20AB8];
        double v21 = v20;
        long long v22 = [v15 allYValues];
        long long v23 = [MEMORY[0x1E4F1CA48] array];
        long long v24 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", v19, v21);
        [v23 addObject:v24];

        long long v54 = 0u;
        long long v55 = 0u;
        long long v52 = 0u;
        long long v53 = 0u;
        id v25 = v22;
        uint64_t v26 = [v25 countByEnumeratingWithState:&v52 objects:v60 count:16];
        if (v26)
        {
          uint64_t v27 = v26;
          uint64_t v28 = *(void *)v53;
          do
          {
            for (uint64_t j = 0; j != v27; ++j)
            {
              if (*(void *)v53 != v28) {
                objc_enumerationMutation(v25);
              }
              [v13 coordinateForValue:*(void *)(*((void *)&v52 + 1) + 8 * j)];
              v31 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", v19, v30);
              [v23 addObject:v31];
            }
            uint64_t v27 = [v25 countByEnumeratingWithState:&v52 objects:v60 count:16];
          }
          while (v27);
        }

        v32 = [v15 goalValue];

        if (v32)
        {
          v33 = NSNumber;
          uint64_t v34 = [v15 goalValue];
          [v13 coordinateForValue:v34];
          v32 = objc_msgSend(v33, "numberWithDouble:");
        }
        v35 = [HKSleepDurationCoordinate alloc];
        uint64_t v36 = [v15 highlighted];
        v37 = [v15 userInfo];
        v38 = [(HKSleepDurationCoordinate *)v35 initWithStackPoints:v23 goalLineYValue:v32 highlighted:v36 userInfo:v37];

        [v47 addObject:v38];
      }
      uint64_t v49 = [obj countByEnumeratingWithState:&v56 objects:v61 count:16];
    }
    while (v49);
  }

  long long v50 = *(_OWORD *)&a4->index;
  int64_t resolution = a4->resolution;
  v39 = +[HKGraphSeriesBlockCoordinateList coordinateListWithCoordinates:v47 blockPath:&v50];

  return v39;
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

- (void)drawSeriesWithBlockCoordinates:(id)a3 axisRect:(CGRect)a4 zoomLevelConfiguration:(id)a5 pointTransform:(CGAffineTransform *)a6 renderContext:(CGContext *)a7 secondaryRenderContext:(id)a8 seriesRenderingDelegate:(id)a9
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v18 = a9;
  id v19 = a3;
  int64_t v20 = [(HKBarSeries *)self visibleBarCountWithZoomLevelConfiguration:a5];
  long long v21 = *(_OWORD *)&a6->c;
  v22[0] = *(_OWORD *)&a6->a;
  v22[1] = v21;
  v22[2] = *(_OWORD *)&a6->tx;
  -[HKSleepDurationSeries drawWithBlockCoordinates:visibleBarCount:pointTransform:context:axisRect:seriesRenderingDelegate:](self, "drawWithBlockCoordinates:visibleBarCount:pointTransform:context:axisRect:seriesRenderingDelegate:", v19, v20, v22, a7, v18, x, y, width, height);
}

- (void)drawWithBlockCoordinates:(id)a3 visibleBarCount:(int64_t)a4 pointTransform:(CGAffineTransform *)a5 context:(CGContext *)a6 axisRect:(CGRect)a7 seriesRenderingDelegate:(id)a8
{
  double height = a7.size.height;
  double width = a7.size.width;
  double y = a7.origin.y;
  double x = a7.origin.x;
  id v16 = a3;
  id v17 = a8;
  int v51 = [v17 seriesDrawingDuringTiling];
  long long v52 = v16;
  if (v51
    && ([(HKBarSeries *)self tiledStrokeStyle], (uint64_t v18 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v19 = (void *)v18;
    int64_t v20 = [(HKBarSeries *)self tiledStrokeStyle];
  }
  else
  {
    int64_t v20 = [(HKBarSeries *)self unselectedStrokeStyle];
  }
  long long v54 = v20;
  [v20 lineWidth];
  double v22 = v21;
  long long v23 = [(HKBarSeries *)self selectedStrokeStyle];
  [v23 lineWidth];
  double v25 = v24;

  if (v25 < v22) {
    double v25 = v22;
  }
  [v17 screenRectForSeries:self];
  -[HKSleepDurationSeries barWidthForVisibleBarCount:axisRect:minimumSpacing:](self, "barWidthForVisibleBarCount:axisRect:minimumSpacing:", a4);
  double v27 = v26;
  double v28 = v25 + v26 + v25 + v26;
  v92.origin.double x = x;
  v92.origin.double y = y;
  v92.size.double width = width;
  v92.size.double height = height;
  CGFloat MaxX = CGRectGetMaxX(v92);
  v93.origin.double x = x;
  v93.origin.double y = y;
  v93.size.double width = width;
  v93.size.double height = height;
  CGFloat MinX = CGRectGetMinX(v93);
  v31 = [MEMORY[0x1E4F1CA48] array];
  v32 = [MEMORY[0x1E4F1CA48] array];
  v33 = [MEMORY[0x1E4FB14C0] bezierPath];
  id v34 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v86 = 0;
  v87 = &v86;
  uint64_t v88 = 0x3032000000;
  v89 = __Block_byref_object_copy__9;
  v90 = __Block_byref_object_dispose__9;
  id v91 = 0;
  uint64_t v80 = 0;
  v81 = &v80;
  uint64_t v82 = 0x3032000000;
  v83 = __Block_byref_object_copy__9;
  v84 = __Block_byref_object_dispose__9;
  id v85 = 0;
  v78[0] = 0;
  v78[1] = v78;
  v78[2] = 0x3032000000;
  v78[3] = __Block_byref_object_copy__9;
  v78[4] = __Block_byref_object_dispose__9;
  id v79 = 0;
  uint64_t v74 = 0;
  v75 = &v74;
  uint64_t v76 = 0x2020000000;
  char v77 = 0;
  v56[0] = MEMORY[0x1E4F143A8];
  v56[1] = 3221225472;
  v56[2] = __122__HKSleepDurationSeries_drawWithBlockCoordinates_visibleBarCount_pointTransform_context_axisRect_seriesRenderingDelegate___block_invoke;
  v56[3] = &unk_1E6D539A8;
  CGFloat v66 = MinX;
  double v67 = v28;
  CGFloat v68 = MaxX;
  id v35 = v31;
  id v57 = v35;
  id v36 = v32;
  double v69 = v27;
  id v58 = v36;
  long long v59 = self;
  id v37 = v33;
  id v60 = v37;
  id v38 = v34;
  id v61 = v38;
  uint64_t v62 = v78;
  double v70 = x;
  double v71 = y;
  double v72 = width;
  double v73 = height;
  v63 = &v74;
  v64 = &v86;
  v65 = &v80;
  long long v39 = *(_OWORD *)&a5->c;
  v55[0] = *(_OWORD *)&a5->a;
  v55[1] = v39;
  v55[2] = *(_OWORD *)&a5->tx;
  [v52 enumerateCoordinatesWithTransform:v55 roundToViewScale:1 block:v56];
  v40 = [(HKSleepDurationSeries *)self defaultFillStyles];

  if (v40)
  {
    if ([(HKGraphSeries *)self allowsSelection]) {
      [(HKSleepDurationSeries *)self defaultFillStyles];
    }
    else {
    v41 = [(HKSleepDurationSeries *)self inactiveFillStyles];
    }
    -[HKSleepDurationSeries _drawPaths:withFillStyles:strokeStyle:axisRect:context:](self, "_drawPaths:withFillStyles:strokeStyle:axisRect:context:", v35, v41, v20, a6, x, y, width, height);
    v42 = [(HKSleepDurationSeries *)self highlightedFillStyles];
    v43 = v42;
    if (!v42)
    {
      v43 = [(HKSleepDurationSeries *)self defaultFillStyles];
    }
    uint64_t v44 = [(HKBarSeries *)self selectedStrokeStyle];
    v45 = (void *)v44;
    if (v44) {
      uint64_t v46 = (void *)v44;
    }
    else {
      uint64_t v46 = v54;
    }
    -[HKSleepDurationSeries _drawPaths:withFillStyles:strokeStyle:axisRect:context:](self, "_drawPaths:withFillStyles:strokeStyle:axisRect:context:", v36, v43, v46, a6, x, y, width, height);

    if (!v42) {
  }
    }
  if (([v37 isEmpty] & 1) == 0)
  {
    v47 = [(HKSleepDurationSeries *)self goalLineStrokeStyle];

    if (v47)
    {
      if (v81[5] && [(HKSleepDurationSeries *)self extendGoalLineToAxis])
      {
        [(id)v81[5] doubleValue];
        objc_msgSend(v37, "addLineToPoint:", x + width, v48);
      }
      [(HKSleepDurationSeries *)self _drawGoalLinePath:v37 context:a6];
      uint64_t v49 = [(HKSleepDurationSeries *)self goalLineMarkerImage];
      if (v49) {
        [(HKSleepDurationSeries *)self _drawGoalLineMarkers:v38 context:a6 goalLineMarkerImage:v49];
      }
      if (v87[5])
      {
        long long v50 = [v17 axisAnnotationDelegateForSeries:self];
        if ((v51 & 1) != 0 || !*((unsigned char *)v75 + 24))
        {
          [(id)v87[5] doubleValue];
          -[HKSleepDurationSeries _addAnnotationForValue:axisAnnotationDelegate:](self, "_addAnnotationForValue:axisAnnotationDelegate:", v50);
        }
        else
        {
          [(id)v87[5] doubleValue];
          -[HKSleepDurationSeries _addGoalAnnotationAtLocation:axisAnnotationDelegate:](self, "_addGoalAnnotationAtLocation:axisAnnotationDelegate:", v50);
        }
      }
    }
  }

  _Block_object_dispose(&v74, 8);
  _Block_object_dispose(v78, 8);

  _Block_object_dispose(&v80, 8);
  _Block_object_dispose(&v86, 8);
}

void __122__HKSleepDurationSeries_drawWithBlockCoordinates_visibleBarCount_pointTransform_context_axisRect_seriesRenderingDelegate___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v54 = a2;
  id v6 = a4;
  uint64_t v7 = [v54 stackPoints];
  id v8 = [v7 firstObject];
  [v8 CGPointValue];
  double v10 = v9;
  double v12 = v11;

  double v13 = *(double *)(a1 + 112);
  if (*(double *)(a1 + 104) - v10 <= v13 && v10 - *(double *)(a1 + 120) <= v13)
  {
    uint64_t v14 = [v54 stackPoints];
    uint64_t v15 = [v14 count];

    if (v15 != 1)
    {
      unint64_t v16 = 0;
      do
      {
        if ([*(id *)(a1 + 32) count] <= v16)
        {
          id v17 = *(void **)(a1 + 32);
          uint64_t v18 = [MEMORY[0x1E4FB14C0] bezierPath];
          [v17 addObject:v18];

          id v19 = *(void **)(a1 + 40);
          int64_t v20 = [MEMORY[0x1E4FB14C0] bezierPath];
          [v19 addObject:v20];
        }
        double v21 = [*(id *)(a1 + 32) objectAtIndexedSubscript:v16];
        if ([v54 highlighted])
        {
          uint64_t v22 = [*(id *)(a1 + 40) objectAtIndexedSubscript:v16];

          double v21 = (void *)v22;
        }
        long long v23 = [v54 stackPoints];
        double v24 = [v23 objectAtIndexedSubscript:++v16];
        [v24 CGPointValue];
        double v26 = v25;
        double v28 = v27;

        if (v26 != v10 || v28 != v12)
        {
          if (v12 - v28 >= 0.0) {
            double v30 = v12 - v28;
          }
          else {
            double v30 = -(v12 - v28);
          }
          double v31 = v26;
          double v32 = v28;
          uint64_t v29 = *(void *)(a1 + 128);
          CGRect v56 = CGRectStandardize(*(CGRect *)(&v30 - 3));
          CGRect v57 = CGRectOffset(v56, *(double *)(a1 + 128) * -0.5, 0.0);
          double x = v57.origin.x;
          double y = v57.origin.y;
          double width = v57.size.width;
          double height = v57.size.height;
          [*(id *)(a1 + 48) cornerRadii];
          long long v39 = +[HKBarSeries barSeriesRoundedRect:byRoundingCorners:cornerRadii:](HKBarSeries, "barSeriesRoundedRect:byRoundingCorners:cornerRadii:", 3, x, y, width, height, v37, v38);
          [v21 appendPath:v39];
        }
        v40 = [v54 stackPoints];
        unint64_t v41 = [v40 count] - 1;
      }
      while (v16 < v41);
    }
    objc_msgSend(*(id *)(a1 + 48), "addGoalLinePathsToCoordinate:goalLinePath:goalLineMarkerPoints:previousCoordinateGoal:axisRect:", v54, *(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), *(double *)(a1 + 136), *(double *)(a1 + 144), *(double *)(a1 + 152), *(double *)(a1 + 160));
    v42 = [v54 goalLineYValue];

    if (v42)
    {
      if (*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40))
      {
        v43 = *(void **)(a1 + 48);
        uint64_t v44 = [v54 goalLineYValue];
        LODWORD(v43) = [v43 _currentGoal:v44 differentFrom:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40)];

        if (v43) {
          *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = 1;
        }
      }
      uint64_t v45 = [v6 goalLineYValue];
      uint64_t v46 = *(void *)(*(void *)(a1 + 88) + 8);
      v47 = *(void **)(v46 + 40);
      *(void *)(v46 + 40) = v45;

      uint64_t v48 = [v54 goalLineYValue];
      uint64_t v49 = *(void *)(*(void *)(a1 + 96) + 8);
      long long v50 = *(void **)(v49 + 40);
      *(void *)(v49 + 40) = v48;
    }
    uint64_t v51 = [v54 goalLineYValue];
    uint64_t v52 = *(void *)(*(void *)(a1 + 72) + 8);
    long long v53 = *(void **)(v52 + 40);
    *(void *)(v52 + 40) = v51;
  }
}

- (void)addGoalLinePathsToCoordinate:(id)a3 goalLinePath:(id)a4 goalLineMarkerPoints:(id)a5 previousCoordinateGoal:(id)a6 axisRect:(CGRect)a7
{
  id v23 = a3;
  id v10 = a4;
  id v11 = a5;
  double v12 = [v23 goalLineYValue];

  if (v12)
  {
    [v23 startXValue];
    double v14 = v13;
    uint64_t v15 = [v23 goalLineYValue];
    [v15 doubleValue];
    if (a6) {
      objc_msgSend(v10, "addLineToPoint:", v14, v16);
    }
    else {
      objc_msgSend(v10, "moveToPoint:", v14, v16);
    }

    id v17 = (void *)MEMORY[0x1E4F29238];
    [v23 startXValue];
    double v19 = v18;
    int64_t v20 = [v23 goalLineYValue];
    [v20 doubleValue];
    uint64_t v22 = objc_msgSend(v17, "valueWithCGPoint:", v19, v21);
    [v11 addObject:v22];
  }
}

- (BOOL)_currentGoal:(id)a3 differentFrom:(id)a4
{
  id v5 = a4;
  [a3 doubleValue];
  double v7 = v6;
  [v5 doubleValue];
  double v9 = v8;

  return vabdd_f64(v7, v9) >= 0.000001;
}

- (void)_drawGoalLinePath:(id)a3 context:(CGContext *)a4
{
  id v6 = a3;
  CGContextSaveGState(a4);
  double v7 = [(HKSleepDurationSeries *)self goalLineStrokeStyle];
  [v7 applyToContext:a4];

  id v8 = v6;
  double v9 = (const CGPath *)[v8 CGPath];

  CGContextAddPath(a4, v9);
  CGContextStrokePath(a4);
  CGContextRestoreGState(a4);
}

- (void)_drawGoalLineMarkers:(id)a3 context:(CGContext *)a4 goalLineMarkerImage:(id)a5
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  double v9 = (CGImage *)[v8 CGImage];
  double v10 = HKChartSeriesPointMarkerBaseRect(v8);
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v17 = v7;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v27;
    do
    {
      uint64_t v21 = 0;
      do
      {
        if (*(void *)v27 != v20) {
          objc_enumerationMutation(v17);
        }
        objc_msgSend(*(id *)(*((void *)&v26 + 1) + 8 * v21), "CGPointValue", (void)v26);
        CGFloat v23 = v22;
        CGFloat v25 = v24;
        v32.origin.double x = v10;
        v32.origin.double y = v12;
        v32.size.double width = v14;
        v32.size.double height = v16;
        CGRect v33 = CGRectOffset(v32, v23, v25);
        CGContextDrawImage(a4, v33, v9);
        ++v21;
      }
      while (v19 != v21);
      uint64_t v19 = [v17 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v19);
  }
}

- (void)_drawPaths:(id)a3 withFillStyles:(id)a4 strokeStyle:(id)a5 axisRect:(CGRect)a6 context:(CGContext *)a7
{
  double height = a6.size.height;
  double width = a6.size.width;
  double y = a6.origin.y;
  double x = a6.origin.x;
  id v24 = a3;
  id v15 = a4;
  id v16 = a5;
  uint64_t v17 = [v24 count];
  if (v17 - 1 >= 0)
  {
    uint64_t v18 = v17;
    do
    {
      uint64_t v19 = [v24 objectAtIndexedSubscript:--v18];
      if (([v19 isEmpty] & 1) == 0
        && ![(HKSleepDurationSeries *)self _dataIsHidden:v18])
      {
        if (v16)
        {
          CGContextSaveGState(a7);
          [v16 applyToContext:a7];
          CGContextAddPath(a7, (CGPathRef)[v19 CGPath]);
          CGContextStrokePath(a7);
          CGContextRestoreGState(a7);
        }
        if (v18 < (unint64_t)[v15 count])
        {
          uint64_t v20 = [v15 objectAtIndexedSubscript:v18];
          if (v20)
          {
            uint64_t v21 = (void *)v20;
            uint64_t v22 = [v19 CGPath];
            [(HKGraphSeries *)self alpha];
            objc_msgSend(v21, "renderPath:context:axisRect:alpha:", v22, a7, x, y, width, height, v23);
          }
        }
      }
    }
    while (v18 > 0);
  }
}

- (BOOL)_dataIsHidden:(int64_t)a3
{
  if (a3 == 1) {
    return [(HKSleepDurationSeries *)self hideInBedData];
  }
  if (a3) {
    return 0;
  }
  return [(HKSleepDurationSeries *)self hideAsleepData];
}

- (void)_addAnnotationForValue:(double)a3 axisAnnotationDelegate:(id)a4
{
  v17[2] = *MEMORY[0x1E4F143B8];
  if (a4)
  {
    id v6 = a4;
    id v7 = [(HKGraphSeries *)self seriesDataSourceContext];
    unint64_t v8 = [v7 chartType];
    double v9 = &stru_1F3B9CF20;
    if (v8 <= 6 && ((1 << v8) & 0x65) != 0)
    {
      double v9 = [(HKSleepDurationSeries *)self _stringForDuration:a3];
    }
    v16[0] = *MEMORY[0x1E4FB0700];
    double v10 = [(HKSleepDurationSeries *)self goalLineStrokeStyle];
    double v11 = [v10 strokeColor];
    v17[0] = v11;
    v16[1] = *MEMORY[0x1E4FB06F8];
    CGFloat v12 = objc_msgSend(MEMORY[0x1E4FB08E0], "hk_chartAxisLabelFont");
    v17[1] = v12;
    double v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:2];

    CGFloat v14 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v9 attributes:v13];
    id v15 = [NSNumber numberWithDouble:a3];
    [v6 addAxisAnnotation:v14 forSeries:self modelCoordinate:v15];
  }
}

- (void)_addGoalAnnotationAtLocation:(double)a3 axisAnnotationDelegate:(id)a4
{
  v17[2] = *MEMORY[0x1E4F143B8];
  id v6 = (void *)MEMORY[0x1E4F28B50];
  id v7 = a4;
  unint64_t v8 = [v6 bundleWithIdentifier:@"com.apple.HealthUI"];
  double v9 = [v8 localizedStringForKey:@"SLEEP_MULTIPLE_GOAL_AXIS" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-Eucalyptus"];

  v16[0] = *MEMORY[0x1E4FB0700];
  double v10 = [(HKSleepDurationSeries *)self goalLineStrokeStyle];
  double v11 = [v10 strokeColor];
  v17[0] = v11;
  v16[1] = *MEMORY[0x1E4FB06F8];
  CGFloat v12 = objc_msgSend(MEMORY[0x1E4FB08E0], "hk_chartAxisLabelFont");
  v17[1] = v12;
  double v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:2];

  CGFloat v14 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v9 attributes:v13];
  id v15 = [NSNumber numberWithDouble:a3];
  [v7 addAxisAnnotation:v14 forSeries:self modelCoordinate:v15];
}

- (id)_durationAbbreviatedFormatter
{
  if (_durationAbbreviatedFormatter_onceToken != -1) {
    dispatch_once(&_durationAbbreviatedFormatter_onceToken, &__block_literal_global_38);
  }
  v2 = (void *)_durationAbbreviatedFormatter___formatter;
  return v2;
}

uint64_t __54__HKSleepDurationSeries__durationAbbreviatedFormatter__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28C00]);
  v1 = (void *)_durationAbbreviatedFormatter___formatter;
  _durationAbbreviatedFormatter___formatter = (uint64_t)v0;

  [(id)_durationAbbreviatedFormatter___formatter setUnitsStyle:1];
  v2 = (void *)_durationAbbreviatedFormatter___formatter;
  return [v2 setAllowedUnits:96];
}

- (id)_durationShortFormatter
{
  if (_durationShortFormatter_onceToken != -1) {
    dispatch_once(&_durationShortFormatter_onceToken, &__block_literal_global_349);
  }
  v2 = (void *)_durationShortFormatter___formatter;
  return v2;
}

uint64_t __48__HKSleepDurationSeries__durationShortFormatter__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28C00]);
  v1 = (void *)_durationShortFormatter___formatter;
  _durationShortFormatter___formatter = (uint64_t)v0;

  [(id)_durationShortFormatter___formatter setUnitsStyle:2];
  v2 = (void *)_durationShortFormatter___formatter;
  return [v2 setAllowedUnits:96];
}

- (id)_stringForDuration:(double)a3
{
  if (__ROR8__(0xFEDCBA987654321 * llround(a3) + 0x91A2B3C4D5E6F0, 4) <= 0x123456789ABCDEuLL) {
    [(HKSleepDurationSeries *)self _durationShortFormatter];
  }
  else {
  uint64_t v4 = [(HKSleepDurationSeries *)self _durationAbbreviatedFormatter];
  }
  id v5 = [v4 stringFromTimeInterval:a3];

  return v5;
}

- (NSLock)seriesMutableStateLock
{
  return self->_seriesMutableStateLock;
}

- (UIImage)goalLineMarkerImageStorage
{
  return self->_goalLineMarkerImageStorage;
}

- (void)setGoalLineMarkerImageStorage:(id)a3
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

- (HKLineSeriesPointMarkerStyle)goalLineMarkerStyleStorage
{
  return self->_goalLineMarkerStyleStorage;
}

- (void)setGoalLineMarkerStyleStorage:(id)a3
{
}

- (BOOL)extendGoalLineToAxisStorage
{
  return self->_extendGoalLineToAxisStorage;
}

- (void)setExtendGoalLineToAxisStorage:(BOOL)a3
{
  self->_extendGoalLineToAxisStorage = a3;
}

- (id)startOfDayTransformStorage
{
  return self->_startOfDayTransformStorage;
}

- (void)setStartOfDayTransformStorage:(id)a3
{
}

- (BOOL)hideInBedDataStorage
{
  return self->_hideInBedDataStorage;
}

- (void)setHideInBedDataStorage:(BOOL)a3
{
  self->_hideInBedDataStorage = a3;
}

- (BOOL)hideAsleepDataStorage
{
  return self->_hideAsleepDataStorage;
}

- (void)setHideAsleepDataStorage:(BOOL)a3
{
  self->_hideAsleepDataStorage = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_startOfDayTransformStorage, 0);
  objc_storeStrong((id *)&self->_goalLineMarkerStyleStorage, 0);
  objc_storeStrong((id *)&self->_goalLineStrokeStyleStorage, 0);
  objc_storeStrong((id *)&self->_inactiveFillStylesStorage, 0);
  objc_storeStrong((id *)&self->_highlightedFillStylesStorage, 0);
  objc_storeStrong((id *)&self->_defaultFillStylesStorage, 0);
  objc_storeStrong((id *)&self->_goalLineMarkerImageStorage, 0);
  objc_storeStrong((id *)&self->_seriesMutableStateLock, 0);
}

@end