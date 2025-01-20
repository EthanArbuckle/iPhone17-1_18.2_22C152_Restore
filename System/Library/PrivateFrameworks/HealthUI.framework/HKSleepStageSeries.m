@interface HKSleepStageSeries
- (HKSleepStageSeries)init;
- (NSArray)sleepStageFillStyles;
- (NSArray)sleepStageFillStylesStorage;
- (NSLock)seriesMutableStateLock;
- (NSNumber)highlightedSleepStage;
- (NSNumber)highlightedSleepStageStorage;
- (id)coordinatesForBlock:(id)a3 blockPath:(HKGraphSeriesDataBlockPath *)a4 xAxis:(id)a5 yAxis:(id)a6;
- (id)marginsForYAxis:(id)a3 xAxisRange:(id)a4 zoomLevel:(int64_t)a5 chartRect:(CGRect)a6;
- (void)_drawColumnForLayer:(int64_t)a3 offsets:(id)a4 coordinate:(id)a5 selectedBezierPaths:(id)a6 unselectedBezierPaths:(id)a7 barWidth:(double)a8 pathCount:(int64_t *)a9;
- (void)_drawWithBlockCoordinates:(id)a3 visibleBarCount:(int64_t)a4 pointTransform:(CGAffineTransform *)a5 context:(CGContext *)a6 axisRect:(CGRect)a7 axisResolution:(double)a8 seriesRenderingDelegate:(id)a9;
- (void)_rebuildFillStyles;
- (void)setHighlightedSleepStage:(id)a3;
- (void)setHighlightedSleepStageStorage:(id)a3;
- (void)setSleepStageFillStyles:(id)a3;
- (void)setSleepStageFillStylesStorage:(id)a3;
- (void)updateChartPointUserInfo:(id)a3 forHighlightedSleepStage:(id)a4;
@end

@implementation HKSleepStageSeries

- (HKSleepStageSeries)init
{
  v9.receiver = self;
  v9.super_class = (Class)HKSleepStageSeries;
  v2 = [(HKSleepPeriodSeries *)&v9 init];
  v3 = v2;
  if (v2)
  {
    highlightedSleepStageStorage = v2->_highlightedSleepStageStorage;
    v2->_highlightedSleepStageStorage = 0;

    sleepStageFillStylesStorage = v3->_sleepStageFillStylesStorage;
    v3->_sleepStageFillStylesStorage = (NSArray *)MEMORY[0x1E4F1CBF0];

    v6 = (NSLock *)objc_alloc_init(MEMORY[0x1E4F28E08]);
    seriesMutableStateLock = v3->_seriesMutableStateLock;
    v3->_seriesMutableStateLock = v6;

    [(NSLock *)v3->_seriesMutableStateLock setName:@"HKSleepStageSeriesLock"];
  }
  return v3;
}

- (NSNumber)highlightedSleepStage
{
  v3 = [(HKSleepStageSeries *)self seriesMutableStateLock];
  [v3 lock];

  v4 = self->_highlightedSleepStageStorage;
  v5 = [(HKSleepStageSeries *)self seriesMutableStateLock];
  [v5 unlock];

  return v4;
}

- (void)setHighlightedSleepStage:(id)a3
{
  v4 = (NSNumber *)a3;
  v5 = [(HKSleepStageSeries *)self seriesMutableStateLock];
  [v5 lock];

  highlightedSleepStageStorage = self->_highlightedSleepStageStorage;
  self->_highlightedSleepStageStorage = v4;

  v7 = [(HKSleepStageSeries *)self seriesMutableStateLock];
  [v7 unlock];

  [(HKSleepStageSeries *)self _rebuildFillStyles];
}

- (NSArray)sleepStageFillStyles
{
  v3 = [(HKSleepStageSeries *)self seriesMutableStateLock];
  [v3 lock];

  v4 = self->_sleepStageFillStylesStorage;
  v5 = [(HKSleepStageSeries *)self seriesMutableStateLock];
  [v5 unlock];

  return v4;
}

- (void)setSleepStageFillStyles:(id)a3
{
  id v4 = a3;
  v5 = [(HKSleepStageSeries *)self seriesMutableStateLock];
  [v5 lock];

  v6 = (NSArray *)[v4 copy];
  sleepStageFillStylesStorage = self->_sleepStageFillStylesStorage;
  self->_sleepStageFillStylesStorage = v6;

  v8 = [(HKSleepStageSeries *)self seriesMutableStateLock];
  [v8 unlock];

  [(HKSleepStageSeries *)self _rebuildFillStyles];
}

- (id)coordinatesForBlock:(id)a3 blockPath:(HKGraphSeriesDataBlockPath *)a4 xAxis:(id)a5 yAxis:(id)a6
{
  id v11 = a5;
  id v12 = a6;
  v13 = [a3 chartPoints];
  if (!v13)
  {
    v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2, self, @"HKSleepStageSeries.m", 180, @"Invalid parameter not satisfying: %@", @"points != nil" object file lineNumber description];
  }
  v14 = [v11 transform];
  v15 = [v12 transform];

  v16 = objc_opt_new();
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __64__HKSleepStageSeries_coordinatesForBlock_blockPath_xAxis_yAxis___block_invoke;
  v25[3] = &unk_1E6D54DF8;
  id v26 = v14;
  id v27 = v15;
  v28 = self;
  id v29 = v16;
  id v17 = v16;
  id v18 = v15;
  id v19 = v14;
  [v13 enumerateObjectsUsingBlock:v25];
  long long v23 = *(_OWORD *)&a4->index;
  int64_t resolution = a4->resolution;
  v20 = +[HKGraphSeriesBlockCoordinateList coordinateListWithCoordinates:v17 blockPath:&v23];

  return v20;
}

void __64__HKSleepStageSeries_coordinatesForBlock_blockPath_xAxis_yAxis___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 yValue];

  if (v4)
  {
    v5 = *(void **)(a1 + 32);
    v6 = [v3 xValueAsGenericType];
    [v5 coordinateForValue:v6];
    double v8 = v7;

    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    v10 = [v3 allYValues];
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
          v15 = objc_msgSend(NSNumber, "numberWithDouble:");
          [v9 addObject:v15];

          ++v14;
        }
        while (v12 != v14);
        uint64_t v12 = [v10 countByEnumeratingWithState:&v30 objects:v34 count:16];
      }
      while (v12);
    }

    v16 = *(void **)(a1 + 48);
    id v17 = [v3 userInfo];
    id v18 = [*(id *)(a1 + 48) highlightedSleepStage];
    [v16 updateChartPointUserInfo:v17 forHighlightedSleepStage:v18];

    id v29 = [HKSleepStageCoordinate alloc];
    id v27 = [v3 asleepUnspecifiedOffsets];
    v25 = [v3 asleepDeepOffsets];
    v28 = [v3 asleepCoreOffsets];
    id v26 = [v3 asleepRemOffsets];
    id v19 = [v3 awakeOffsets];
    v20 = [v3 inBedOffsets];
    v21 = [v3 allYValues];
    LOBYTE(v16) = [v3 highlighted];
    v22 = [v3 userInfo];
    LOBYTE(v24) = (_BYTE)v16;
    long long v23 = [(HKSleepStageCoordinate *)v29 initWithXValue:v27 asleepUnspecifiedYValues:v25 asleepDeepYValues:v28 asleepCoreYValues:v26 asleepRemYValues:v19 awakeValues:v20 inBedYValues:v8 yValues:v21 highlighted:v24 userInfo:v22];

    [*(id *)(a1 + 56) addObject:v23];
  }
}

- (void)updateChartPointUserInfo:(id)a3 forHighlightedSleepStage:(id)a4
{
  id v7 = a3;
  [v7 setAnnotationOptions:HKSleepChartPointFormatterOptionsForSleepAnalysis(a4)];
  v5 = [v7 sleepDaySummary];
  int v6 = [v5 hasSleepStageData];

  if (v6)
  {
    objc_msgSend(v7, "setAnnotationOptions:", objc_msgSend(v7, "annotationOptions") | 0x40);
    objc_msgSend(v7, "setCurrentValueViewOptions:", objc_msgSend(v7, "currentValueViewOptions") | 0x40);
    [v7 setCurrentValueViewOptionsPriority:2];
  }
}

- (void)_drawWithBlockCoordinates:(id)a3 visibleBarCount:(int64_t)a4 pointTransform:(CGAffineTransform *)a5 context:(CGContext *)a6 axisRect:(CGRect)a7 axisResolution:(double)a8 seriesRenderingDelegate:(id)a9
{
  double height = a7.size.height;
  double width = a7.size.width;
  double y = a7.origin.y;
  double x = a7.origin.x;
  v93[6] = *MEMORY[0x1E4F143B8];
  id v53 = a3;
  id v56 = a9;
  int v51 = [v56 seriesDrawingDuringTiling];
  if (v51
    && ([(HKSleepPeriodSeries *)self tiledStrokeStyle],
        (id v17 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v57 = [(HKSleepPeriodSeries *)self tiledStrokeStyle];
  }
  else
  {
    v57 = [(HKSleepPeriodSeries *)self strokeStyle];
  }
  [v57 lineWidth];
  double v19 = v18;
  [v56 screenRectForSeries:self];
  -[HKSleepPeriodSeries barWidthForVisibleBarCount:axisRect:minimumSpacing:](self, "barWidthForVisibleBarCount:axisRect:minimumSpacing:", a4);
  double v21 = v20;
  v94.origin.double x = x;
  v94.origin.double y = y;
  v94.size.double width = width;
  v94.size.double height = height;
  CGFloat MaxX = CGRectGetMaxX(v94);
  v95.origin.double x = x;
  v95.origin.double y = y;
  v95.size.double width = width;
  v95.size.double height = height;
  CGFloat MinX = CGRectGetMinX(v95);
  uint64_t v24 = [MEMORY[0x1E4FB14C0] bezierPath];
  v93[0] = v24;
  v25 = [MEMORY[0x1E4FB14C0] bezierPath];
  v93[1] = v25;
  id v26 = [MEMORY[0x1E4FB14C0] bezierPath];
  v93[2] = v26;
  id v27 = [MEMORY[0x1E4FB14C0] bezierPath];
  v93[3] = v27;
  v28 = [MEMORY[0x1E4FB14C0] bezierPath];
  v93[4] = v28;
  id v29 = [MEMORY[0x1E4FB14C0] bezierPath];
  v93[5] = v29;
  v55 = [MEMORY[0x1E4F1C978] arrayWithObjects:v93 count:6];

  long long v30 = (void *)[v55 mutableCopy];
  long long v31 = (void *)[v55 mutableCopy];
  long long v32 = [MEMORY[0x1E4FB14C0] bezierPath];
  long long v33 = [MEMORY[0x1E4FB14C0] bezierPath];
  v91[0] = 0;
  v91[1] = v91;
  v91[2] = 0x3032000000;
  v91[3] = __Block_byref_object_copy__16;
  v91[4] = __Block_byref_object_dispose__16;
  id v92 = 0;
  v89[0] = 0;
  v89[1] = v89;
  v89[2] = 0x3032000000;
  v89[3] = __Block_byref_object_copy__16;
  v89[4] = __Block_byref_object_dispose__16;
  id v90 = 0;
  v88[0] = 0;
  v88[1] = v88;
  v88[2] = 0x2020000000;
  v88[3] = 0xFFEFFFFFFFFFFFFFLL;
  v86[0] = 0;
  v86[1] = v86;
  v86[2] = 0x3032000000;
  v86[3] = __Block_byref_object_copy__16;
  v86[4] = __Block_byref_object_dispose__16;
  id v87 = 0;
  v84[0] = 0;
  v84[1] = v84;
  v84[2] = 0x3032000000;
  v84[3] = __Block_byref_object_copy__16;
  v84[4] = __Block_byref_object_dispose__16;
  id v85 = 0;
  v83[0] = 0;
  v83[1] = v83;
  v83[2] = 0x2020000000;
  v83[3] = 0xFFEFFFFFFFFFFFFFLL;
  uint64_t v79 = 0;
  v80 = &v79;
  uint64_t v81 = 0x2020000000;
  uint64_t v82 = 0;
  id v34 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v35 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  double v36 = v19 + v21 + v19 + v21;
  double v37 = a8 / 86400.0 * 0.05;
  v59[1] = 3221225472;
  double v38 = a8 / 86400.0 - v37;
  v59[0] = MEMORY[0x1E4F143A8];
  v59[2] = __135__HKSleepStageSeries__drawWithBlockCoordinates_visibleBarCount_pointTransform_context_axisRect_axisResolution_seriesRenderingDelegate___block_invoke;
  v59[3] = &unk_1E6D54E20;
  CGFloat v73 = MinX;
  double v74 = v36;
  double v39 = a8 / 86400.0 + v37;
  CGFloat v75 = MaxX;
  v59[4] = self;
  id v40 = v31;
  id v60 = v40;
  id v41 = v30;
  id v61 = v41;
  v66 = &v79;
  double v76 = v21;
  double v77 = v38;
  double v78 = v39;
  v67 = v88;
  v68 = v86;
  v69 = v83;
  id v42 = v32;
  id v62 = v42;
  id v43 = v34;
  id v63 = v43;
  v70 = v84;
  id v44 = v33;
  id v64 = v44;
  id v45 = v35;
  id v65 = v45;
  v71 = v91;
  v72 = v89;
  long long v46 = *(_OWORD *)&a5->c;
  v58[0] = *(_OWORD *)&a5->a;
  v58[1] = v46;
  v58[2] = *(_OWORD *)&a5->tx;
  [v53 enumerateCoordinatesWithTransform:v58 roundToViewScale:1 block:v59];
  if ([(HKGraphSeries *)self allowsSelection]) {
    [(HKSleepPeriodSeries *)self defaultFillStyles];
  }
  else {
  v47 = [(HKSleepPeriodSeries *)self inactiveFillStyles];
  }
  -[HKSleepPeriodSeries drawPaths:withFillStyles:strokeStyle:axisRect:context:](self, "drawPaths:withFillStyles:strokeStyle:axisRect:context:", v41, v47, v57, a6, x, y, width, height);
  v48 = [(HKSleepPeriodSeries *)self highlightedFillStyles];
  v49 = v48;
  if (!v48)
  {
    v49 = [(HKSleepPeriodSeries *)self defaultFillStyles];
  }
  -[HKSleepPeriodSeries drawPaths:withFillStyles:strokeStyle:axisRect:context:](self, "drawPaths:withFillStyles:strokeStyle:axisRect:context:", v40, v49, v57, a6, x, y, width, height);
  if (!v48) {

  }
  if (((v51 | [v56 measuringStartupTime] ^ 1) & 1) == 0 && v80[3] >= 1)
  {
    v50 = [(HKGraphSeries *)self delegate];
    [v50 nonemptyDrawComplete];
  }
  _Block_object_dispose(&v79, 8);
  _Block_object_dispose(v83, 8);
  _Block_object_dispose(v84, 8);

  _Block_object_dispose(v86, 8);
  _Block_object_dispose(v88, 8);
  _Block_object_dispose(v89, 8);

  _Block_object_dispose(v91, 8);
}

void __135__HKSleepStageSeries__drawWithBlockCoordinates_visibleBarCount_pointTransform_context_axisRect_axisResolution_seriesRenderingDelegate___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v59 = a2;
  id v6 = a4;
  [v59 xValue];
  double v8 = v7;
  double v9 = *(double *)(a1 + 152);
  if (*(double *)(a1 + 144) - v8 <= v9 && v8 - *(double *)(a1 + 160) <= v9)
  {
    v10 = *(void **)(a1 + 32);
    uint64_t v11 = [v59 awakeValues];
    [v10 _drawColumnForLayer:0 offsets:v11 coordinate:v59 selectedBezierPaths:*(void *)(a1 + 40) unselectedBezierPaths:*(void *)(a1 + 48) barWidth:*(void *)(*(void *)(a1 + 88) + 8) + 24 pathCount:*(double *)(a1 + 168)];

    uint64_t v12 = *(void **)(a1 + 32);
    uint64_t v13 = [v59 asleepRemYValues];
    BOOL v14 = 1;
    [v12 _drawColumnForLayer:1 offsets:v13 coordinate:v59 selectedBezierPaths:*(void *)(a1 + 40) unselectedBezierPaths:*(void *)(a1 + 48) barWidth:*(void *)(*(void *)(a1 + 88) + 8) + 24 pathCount:*(double *)(a1 + 168)];

    v15 = *(void **)(a1 + 32);
    v16 = [v59 asleepCoreYValues];
    [v15 _drawColumnForLayer:2 offsets:v16 coordinate:v59 selectedBezierPaths:*(void *)(a1 + 40) unselectedBezierPaths:*(void *)(a1 + 48) barWidth:*(void *)(*(void *)(a1 + 88) + 8) + 24 pathCount:*(double *)(a1 + 168)];

    id v17 = *(void **)(a1 + 32);
    double v18 = [v59 asleepDeepYValues];
    [v17 _drawColumnForLayer:3 offsets:v18 coordinate:v59 selectedBezierPaths:*(void *)(a1 + 40) unselectedBezierPaths:*(void *)(a1 + 48) barWidth:*(void *)(*(void *)(a1 + 88) + 8) + 24 pathCount:*(double *)(a1 + 168)];

    double v19 = *(void **)(a1 + 32);
    double v20 = [v59 asleepUnspecifiedYValues];
    [v19 _drawColumnForLayer:5 offsets:v20 coordinate:v59 selectedBezierPaths:*(void *)(a1 + 40) unselectedBezierPaths:*(void *)(a1 + 48) barWidth:*(void *)(*(void *)(a1 + 88) + 8) + 24 pathCount:*(double *)(a1 + 168)];

    double v21 = *(void **)(a1 + 32);
    v22 = [v59 inBedYValues];
    [v21 _drawColumnForLayer:4 offsets:v22 coordinate:v59 selectedBezierPaths:*(void *)(a1 + 40) unselectedBezierPaths:*(void *)(a1 + 48) barWidth:*(void *)(*(void *)(a1 + 88) + 8) + 24 pathCount:*(double *)(a1 + 168)];

    [v6 xValue];
    double v24 = vabdd_f64(v23, *(double *)(*(void *)(*(void *)(a1 + 96) + 8) + 24));
    if (v24 >= *(double *)(a1 + 176)) {
      BOOL v14 = v24 > *(double *)(a1 + 184);
    }
    v25 = [v59 upperGoalYValue];

    id v26 = v59;
    if (v25)
    {
      id v27 = [v59 upperGoalYValue];
      [v27 doubleValue];
      double v29 = v28;

      long long v30 = *(void **)(*(void *)(*(void *)(a1 + 104) + 8) + 40);
      if (v30)
      {
        double v31 = *(double *)(*(void *)(*(void *)(a1 + 112) + 8) + 24);
        char v32 = v31 >= v8 || v14;
        if ((v32 & 1) == 0)
        {
          [v30 doubleValue];
          objc_msgSend(*(id *)(a1 + 56), "moveToPoint:", v31, v33);
          objc_msgSend(*(id *)(a1 + 56), "addLineToPoint:", v8, v29);
        }
      }
      id v34 = *(void **)(a1 + 64);
      id v35 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", v8, v29);
      [v34 addObject:v35];

      id v26 = v59;
    }
    double v36 = [v26 lowerGoalYValue];

    if (v36)
    {
      double v37 = [v59 lowerGoalYValue];
      [v37 doubleValue];
      double v39 = v38;

      id v40 = *(void **)(*(void *)(*(void *)(a1 + 120) + 8) + 40);
      if (v40)
      {
        double v41 = *(double *)(*(void *)(*(void *)(a1 + 112) + 8) + 24);
        char v42 = v41 >= v8 || v14;
        if ((v42 & 1) == 0)
        {
          [v40 doubleValue];
          objc_msgSend(*(id *)(a1 + 72), "moveToPoint:", v41, v43);
          objc_msgSend(*(id *)(a1 + 72), "addLineToPoint:", v8, v39);
        }
      }
      id v44 = *(void **)(a1 + 80);
      id v45 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", v8, v39);
      [v44 addObject:v45];
    }
    if (v8 <= *(double *)(a1 + 160))
    {
      uint64_t v46 = [v6 upperGoalYValue];
      uint64_t v47 = *(void *)(*(void *)(a1 + 128) + 8);
      v48 = *(void **)(v47 + 40);
      *(void *)(v47 + 40) = v46;

      uint64_t v49 = [v6 lowerGoalYValue];
      uint64_t v50 = *(void *)(*(void *)(a1 + 136) + 8);
      int v51 = *(void **)(v50 + 40);
      *(void *)(v50 + 40) = v49;
    }
    [v6 xValue];
    *(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 24) = v52;
    uint64_t v53 = [v59 upperGoalYValue];
    uint64_t v54 = *(void *)(*(void *)(a1 + 104) + 8);
    v55 = *(void **)(v54 + 40);
    *(void *)(v54 + 40) = v53;

    uint64_t v56 = [v59 lowerGoalYValue];
    uint64_t v57 = *(void *)(*(void *)(a1 + 120) + 8);
    v58 = *(void **)(v57 + 40);
    *(void *)(v57 + 40) = v56;

    *(double *)(*(void *)(*(void *)(a1 + 112) + 8) + 24) = v8;
  }
}

- (void)_drawColumnForLayer:(int64_t)a3 offsets:(id)a4 coordinate:(id)a5 selectedBezierPaths:(id)a6 unselectedBezierPaths:(id)a7 barWidth:(double)a8 pathCount:(int64_t *)a9
{
  id v48 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  if ([v48 count])
  {
    uint64_t v47 = a9;
    [v16 xValue];
    uint64_t v20 = v19;
    id v46 = v17;
    if ([v16 highlighted]) {
      double v21 = v17;
    }
    else {
      double v21 = v18;
    }
    v22 = [v21 objectAtIndexedSubscript:a3];
    double v23 = [v48 firstObject];
    if ((unint64_t)[v48 count] < 2)
    {
      int64_t v24 = 0;
    }
    else
    {
      int64_t v24 = 0;
      unint64_t v25 = 1;
      id v26 = v23;
      do
      {
        double v23 = [v48 objectAtIndexedSubscript:v25];
        id v27 = [v26 value];
        [v27 doubleValue];
        double v29 = v28;

        long long v30 = [v23 value];
        [v30 doubleValue];
        double v32 = v31;

        if (v25)
        {
          if ([v26 continuation]) {
            uint64_t v33 = 0;
          }
          else {
            uint64_t v33 = 3;
          }
          if ([v23 continuation]) {
            uint64_t v34 = v33;
          }
          else {
            uint64_t v34 = v33 | 0xC;
          }
          if (v32 - v29 >= 0.0) {
            double v35 = v32 - v29;
          }
          else {
            double v35 = -(v32 - v29);
          }
          uint64_t v36 = v20;
          double v37 = v29;
          double v38 = a8;
          CGRect v50 = CGRectStandardize(*(CGRect *)(&v35 - 3));
          CGRect v51 = CGRectOffset(v50, a8 * -0.5, 0.0);
          double x = v51.origin.x;
          double y = v51.origin.y;
          double width = v51.size.width;
          double height = v51.size.height;
          [(HKSleepPeriodSeries *)self cornerRadii];
          id v45 = +[HKBarSeries barSeriesRoundedRect:byRoundingCorners:cornerRadii:](HKBarSeries, "barSeriesRoundedRect:byRoundingCorners:cornerRadii:", v34, x, y, width, height, v43, v44);
          [v22 appendPath:v45];

          ++v24;
        }

        ++v25;
        id v26 = v23;
      }
      while (v25 < [v48 count]);
    }
    int64_t *v47 = v24;

    id v17 = v46;
  }
}

- (void)_rebuildFillStyles
{
  id v3 = [(HKSleepStageSeries *)self highlightedSleepStage];
  id v4 = +[HKSleepUtilities sleepStageFillStylesWithActiveSleepStage:v3];

  [(HKSleepPeriodSeries *)self setHighlightedFillStyles:v4];
  [(HKSleepPeriodSeries *)self setDefaultFillStyles:v4];
}

- (id)marginsForYAxis:(id)a3 xAxisRange:(id)a4 zoomLevel:(int64_t)a5 chartRect:(CGRect)a6
{
  id v6 = a3;
  return v6;
}

- (NSNumber)highlightedSleepStageStorage
{
  return self->_highlightedSleepStageStorage;
}

- (void)setHighlightedSleepStageStorage:(id)a3
{
}

- (NSArray)sleepStageFillStylesStorage
{
  return self->_sleepStageFillStylesStorage;
}

- (void)setSleepStageFillStylesStorage:(id)a3
{
}

- (NSLock)seriesMutableStateLock
{
  return self->_seriesMutableStateLock;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_seriesMutableStateLock, 0);
  objc_storeStrong((id *)&self->_sleepStageFillStylesStorage, 0);
  objc_storeStrong((id *)&self->_highlightedSleepStageStorage, 0);
}

@end