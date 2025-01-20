@interface HKQuantityDistributionSeries
+ (id)segmentsFromChartPoint:(id)a3 minY:(double)a4 maxY:(double)a5 zeroCountForGap:(int64_t)a6;
+ (id)segmentsFromChartPoint:(id)a3 zeroCountForGap:(int64_t)a4;
+ (id)transformedSegmentsFromChartPoint:(id)a3 forX:(double)a4 minY:(double)a5 maxY:(double)a6 zeroCountForGap:(int64_t)a7;
- (BOOL)blockCoordinate:(id)a3 greaterThan:(id)a4;
- (BOOL)blockCoordinate:(id)a3 lessThan:(id)a4;
- (BOOL)excludeDistribution;
- (BOOL)excludeDistributionStorage;
- (BOOL)supportsMultiTouchSelection;
- (CGRect)_textRectForSize:(CGSize)a3 location:(CGPoint)a4 screenRect:(CGRect)a5 yOffset:(double)a6;
- (HKAxisLabelStyle)minMaxLabelStyle;
- (HKAxisLabelStyle)minMaxLabelStyleStorage;
- (HKAxisLabelStyle)minMaxValueStyle;
- (HKAxisLabelStyle)minMaxValueStyleStorage;
- (HKQuantityDistributionSeries)init;
- (HKStrokeStyle)inactiveStrokeStyle;
- (HKStrokeStyle)inactiveStrokeStyleStorage;
- (HKStrokeStyle)minMaxPointStyle;
- (HKStrokeStyle)minMaxPointStyleStorage;
- (HKStrokeStyle)selectedStrokeStyle;
- (HKStrokeStyle)selectedStrokeStyleStorage;
- (HKStrokeStyle)unselectedStrokeStyle;
- (HKStrokeStyle)unselectedStrokeStyleStorage;
- (NSLock)seriesMutableStateLock;
- (double)distanceFromPoint:(CGPoint)a3 blockCoordinate:(id)a4 chartRect:(CGRect)a5;
- (double)hollowLineRatio;
- (double)hollowLineRatioStorage;
- (double)xAxisDistanceFromPoint:(CGPoint)a3 blockCoordinate:(id)a4 chartRect:(CGRect)a5;
- (double)yAxisDifferenceToPoint:(CGPoint)a3 blockCoordinate:(id)a4 chartRect:(CGRect)a5;
- (id)_quickDate:(id)a3;
- (id)coordinatesForBlock:(id)a3 blockPath:(HKGraphSeriesDataBlockPath *)a4 xAxis:(id)a5 yAxis:(id)a6;
- (id)marginsForYAxis:(id)a3 xAxisRange:(id)a4 zoomLevel:(int64_t)a5 chartRect:(CGRect)a6;
- (int64_t)resolutionForTimeScope:(int64_t)a3 traitResolution:(int64_t)a4;
- (int64_t)zeroCountForGap;
- (int64_t)zeroCountForGapStorage;
- (void)_drawMinMaxLabelsForMin:(CGPoint)a3 max:(CGPoint)a4 pointTransform:(CGAffineTransform *)a5 axisRect:(CGRect)a6 context:(CGContext *)a7;
- (void)drawSeriesWithBlockCoordinates:(id)a3 axisRect:(CGRect)a4 zoomLevelConfiguration:(id)a5 pointTransform:(CGAffineTransform *)a6 renderContext:(CGContext *)a7 secondaryRenderContext:(id)a8 seriesRenderingDelegate:(id)a9;
- (void)setExcludeDistribution:(BOOL)a3;
- (void)setExcludeDistributionStorage:(BOOL)a3;
- (void)setHollowLineRatio:(double)a3;
- (void)setHollowLineRatioStorage:(double)a3;
- (void)setInactiveStrokeStyle:(id)a3;
- (void)setInactiveStrokeStyleStorage:(id)a3;
- (void)setMinMaxLabelStyle:(id)a3;
- (void)setMinMaxLabelStyleStorage:(id)a3;
- (void)setMinMaxPointStyle:(id)a3;
- (void)setMinMaxPointStyleStorage:(id)a3;
- (void)setMinMaxValueStyle:(id)a3;
- (void)setMinMaxValueStyleStorage:(id)a3;
- (void)setSelectedStrokeStyle:(id)a3;
- (void)setSelectedStrokeStyleStorage:(id)a3;
- (void)setUnselectedStrokeStyle:(id)a3;
- (void)setUnselectedStrokeStyleStorage:(id)a3;
- (void)setZeroCountForGap:(int64_t)a3;
- (void)setZeroCountForGapStorage:(int64_t)a3;
@end

@implementation HKQuantityDistributionSeries

- (HKQuantityDistributionSeries)init
{
  v12.receiver = self;
  v12.super_class = (Class)HKQuantityDistributionSeries;
  v2 = [(HKGraphSeries *)&v12 init];
  if (v2)
  {
    v3 = (NSLock *)objc_alloc_init(MEMORY[0x1E4F28E08]);
    seriesMutableStateLock = v2->_seriesMutableStateLock;
    v2->_seriesMutableStateLock = v3;

    [(NSLock *)v2->_seriesMutableStateLock setName:@"HKQuantityDistributionSeriesLock"];
    inactiveStrokeStyleStorage = v2->_inactiveStrokeStyleStorage;
    v2->_inactiveStrokeStyleStorage = 0;

    unselectedStrokeStyleStorage = v2->_unselectedStrokeStyleStorage;
    v2->_unselectedStrokeStyleStorage = 0;

    selectedStrokeStyleStorage = v2->_selectedStrokeStyleStorage;
    v2->_selectedStrokeStyleStorage = 0;

    minMaxLabelStyleStorage = v2->_minMaxLabelStyleStorage;
    v2->_minMaxLabelStyleStorage = 0;

    minMaxValueStyleStorage = v2->_minMaxValueStyleStorage;
    v2->_minMaxValueStyleStorage = 0;

    minMaxPointStyleStorage = v2->_minMaxPointStyleStorage;
    v2->_minMaxPointStyleStorage = 0;

    v2->_excludeDistributionStorage = 0;
    v2->_zeroCountForGapStorage = 4;
    v2->_hollowLineRatioStorage = 0.0;
  }
  return v2;
}

- (HKStrokeStyle)inactiveStrokeStyle
{
  v3 = [(HKQuantityDistributionSeries *)self seriesMutableStateLock];
  [v3 lock];

  v4 = self->_inactiveStrokeStyleStorage;
  v5 = [(HKQuantityDistributionSeries *)self seriesMutableStateLock];
  [v5 unlock];

  return v4;
}

- (void)setInactiveStrokeStyle:(id)a3
{
  id v4 = a3;
  v5 = [(HKQuantityDistributionSeries *)self seriesMutableStateLock];
  [v5 lock];

  v6 = (HKStrokeStyle *)[v4 copy];
  inactiveStrokeStyleStorage = self->_inactiveStrokeStyleStorage;
  self->_inactiveStrokeStyleStorage = v6;

  id v8 = [(HKQuantityDistributionSeries *)self seriesMutableStateLock];
  [v8 unlock];
}

- (HKStrokeStyle)unselectedStrokeStyle
{
  v3 = [(HKQuantityDistributionSeries *)self seriesMutableStateLock];
  [v3 lock];

  id v4 = self->_unselectedStrokeStyleStorage;
  v5 = [(HKQuantityDistributionSeries *)self seriesMutableStateLock];
  [v5 unlock];

  return v4;
}

- (void)setUnselectedStrokeStyle:(id)a3
{
  id v4 = a3;
  v5 = [(HKQuantityDistributionSeries *)self seriesMutableStateLock];
  [v5 lock];

  v6 = (HKStrokeStyle *)[v4 copy];
  unselectedStrokeStyleStorage = self->_unselectedStrokeStyleStorage;
  self->_unselectedStrokeStyleStorage = v6;

  id v8 = [(HKQuantityDistributionSeries *)self seriesMutableStateLock];
  [v8 unlock];
}

- (HKStrokeStyle)selectedStrokeStyle
{
  v3 = [(HKQuantityDistributionSeries *)self seriesMutableStateLock];
  [v3 lock];

  id v4 = self->_selectedStrokeStyleStorage;
  v5 = [(HKQuantityDistributionSeries *)self seriesMutableStateLock];
  [v5 unlock];

  return v4;
}

- (void)setSelectedStrokeStyle:(id)a3
{
  id v4 = a3;
  v5 = [(HKQuantityDistributionSeries *)self seriesMutableStateLock];
  [v5 lock];

  v6 = (HKStrokeStyle *)[v4 copy];
  selectedStrokeStyleStorage = self->_selectedStrokeStyleStorage;
  self->_selectedStrokeStyleStorage = v6;

  id v8 = [(HKQuantityDistributionSeries *)self seriesMutableStateLock];
  [v8 unlock];
}

- (HKAxisLabelStyle)minMaxLabelStyle
{
  v3 = [(HKQuantityDistributionSeries *)self seriesMutableStateLock];
  [v3 lock];

  id v4 = self->_minMaxLabelStyleStorage;
  v5 = [(HKQuantityDistributionSeries *)self seriesMutableStateLock];
  [v5 unlock];

  return v4;
}

- (void)setMinMaxLabelStyle:(id)a3
{
  id v4 = a3;
  v5 = [(HKQuantityDistributionSeries *)self seriesMutableStateLock];
  [v5 lock];

  v6 = (HKAxisLabelStyle *)[v4 copy];
  minMaxLabelStyleStorage = self->_minMaxLabelStyleStorage;
  self->_minMaxLabelStyleStorage = v6;

  id v8 = [(HKQuantityDistributionSeries *)self seriesMutableStateLock];
  [v8 unlock];
}

- (HKAxisLabelStyle)minMaxValueStyle
{
  v3 = [(HKQuantityDistributionSeries *)self seriesMutableStateLock];
  [v3 lock];

  id v4 = self->_minMaxValueStyleStorage;
  v5 = [(HKQuantityDistributionSeries *)self seriesMutableStateLock];
  [v5 unlock];

  return v4;
}

- (void)setMinMaxValueStyle:(id)a3
{
  id v4 = a3;
  v5 = [(HKQuantityDistributionSeries *)self seriesMutableStateLock];
  [v5 lock];

  v6 = (HKAxisLabelStyle *)[v4 copy];
  minMaxValueStyleStorage = self->_minMaxValueStyleStorage;
  self->_minMaxValueStyleStorage = v6;

  id v8 = [(HKQuantityDistributionSeries *)self seriesMutableStateLock];
  [v8 unlock];
}

- (HKStrokeStyle)minMaxPointStyle
{
  v3 = [(HKQuantityDistributionSeries *)self seriesMutableStateLock];
  [v3 lock];

  id v4 = self->_minMaxPointStyleStorage;
  v5 = [(HKQuantityDistributionSeries *)self seriesMutableStateLock];
  [v5 unlock];

  return v4;
}

- (void)setMinMaxPointStyle:(id)a3
{
  id v4 = a3;
  v5 = [(HKQuantityDistributionSeries *)self seriesMutableStateLock];
  [v5 lock];

  v6 = (HKStrokeStyle *)[v4 copy];
  minMaxPointStyleStorage = self->_minMaxPointStyleStorage;
  self->_minMaxPointStyleStorage = v6;

  id v8 = [(HKQuantityDistributionSeries *)self seriesMutableStateLock];
  [v8 unlock];
}

- (BOOL)excludeDistribution
{
  v3 = [(HKQuantityDistributionSeries *)self seriesMutableStateLock];
  [v3 lock];

  LOBYTE(v3) = self->_excludeDistributionStorage;
  id v4 = [(HKQuantityDistributionSeries *)self seriesMutableStateLock];
  [v4 unlock];

  return (char)v3;
}

- (void)setExcludeDistribution:(BOOL)a3
{
  v5 = [(HKQuantityDistributionSeries *)self seriesMutableStateLock];
  [v5 lock];

  self->_excludeDistributionStorage = a3;
  id v6 = [(HKQuantityDistributionSeries *)self seriesMutableStateLock];
  [v6 unlock];
}

- (int64_t)zeroCountForGap
{
  v3 = [(HKQuantityDistributionSeries *)self seriesMutableStateLock];
  [v3 lock];

  int64_t zeroCountForGapStorage = self->_zeroCountForGapStorage;
  v5 = [(HKQuantityDistributionSeries *)self seriesMutableStateLock];
  [v5 unlock];

  return zeroCountForGapStorage;
}

- (void)setZeroCountForGap:(int64_t)a3
{
  v5 = [(HKQuantityDistributionSeries *)self seriesMutableStateLock];
  [v5 lock];

  self->_int64_t zeroCountForGapStorage = a3;
  id v6 = [(HKQuantityDistributionSeries *)self seriesMutableStateLock];
  [v6 unlock];
}

- (double)hollowLineRatio
{
  v3 = [(HKQuantityDistributionSeries *)self seriesMutableStateLock];
  [v3 lock];

  double hollowLineRatioStorage = self->_hollowLineRatioStorage;
  v5 = [(HKQuantityDistributionSeries *)self seriesMutableStateLock];
  [v5 unlock];

  return hollowLineRatioStorage;
}

- (void)setHollowLineRatio:(double)a3
{
  v5 = [(HKQuantityDistributionSeries *)self seriesMutableStateLock];
  [v5 lock];

  double v6 = 1.0;
  if (a3 <= 1.0) {
    double v6 = a3;
  }
  self->_double hollowLineRatioStorage = fmax(v6, 0.0);
  id v7 = [(HKQuantityDistributionSeries *)self seriesMutableStateLock];
  [v7 unlock];
}

- (id)_quickDate:(id)a3
{
  v3 = (objc_class *)MEMORY[0x1E4F28C10];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  [v5 setDateFormat:@"MM/dd/YYYY-HH:mm:ss"];
  double v6 = [MEMORY[0x1E4F1CAF0] localTimeZone];
  [v5 setTimeZone:v6];

  id v7 = [v5 stringFromDate:v4];

  return v7;
}

- (BOOL)supportsMultiTouchSelection
{
  return 1;
}

- (id)marginsForYAxis:(id)a3 xAxisRange:(id)a4 zoomLevel:(int64_t)a5 chartRect:(CGRect)a6
{
  double height = a6.size.height;
  double y = a6.origin.y;
  id v9 = a3;
  uint64_t v10 = [(HKQuantityDistributionSeries *)self minMaxLabelStyle];
  if (v10
    && (v11 = (void *)v10,
        [(HKQuantityDistributionSeries *)self minMaxValueStyle],
        objc_super v12 = objc_claimAutoreleasedReturnValue(),
        v12,
        v11,
        v9)
    && v12
    && height > 0.0)
  {
    v13 = [v9 minValue];
    [v13 doubleValue];
    double v15 = v14;
    v16 = [v9 maxValue];
    [v16 doubleValue];
    double v18 = v17;

    +[HKAxis expandByPointsLow:high:modelRange:pointRange:](HKAxis, "expandByPointsLow:high:modelRange:pointRange:", 36.0, 36.0, v15, v18, y, y + height);
    double v20 = v19;
    v21 = objc_msgSend(NSNumber, "numberWithDouble:");
    v22 = [NSNumber numberWithDouble:v20];
    id v23 = +[HKValueRange valueRangeWithMinValue:v21 maxValue:v22];
  }
  else
  {
    id v23 = v9;
  }

  return v23;
}

- (void)drawSeriesWithBlockCoordinates:(id)a3 axisRect:(CGRect)a4 zoomLevelConfiguration:(id)a5 pointTransform:(CGAffineTransform *)a6 renderContext:(CGContext *)a7 secondaryRenderContext:(id)a8 seriesRenderingDelegate:(id)a9
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v19 = a3;
  id v53 = a5;
  id v52 = a8;
  id v20 = a9;
  CGContextSaveGState(a7);
  if ([(HKGraphSeries *)self allowsSelection]) {
    [(HKQuantityDistributionSeries *)self unselectedStrokeStyle];
  }
  else {
  v21 = [(HKQuantityDistributionSeries *)self inactiveStrokeStyle];
  }
  [v21 applyToContext:a7];
  [v21 lineWidth];
  double v23 = v22;
  v24 = [(HKQuantityDistributionSeries *)self selectedStrokeStyle];
  [v24 lineWidth];
  double v26 = v25;

  long long v105 = 0u;
  long long v106 = 0u;
  long long v103 = 0u;
  long long v104 = 0u;
  [(HKGraphSeries *)self selectedPathRange];
  v54 = v20;
  [v20 virtualMarginInsets];
  double v50 = v28;
  double v51 = v27;
  double v30 = v29;
  double v32 = v31;
  v101[0] = 0;
  v101[1] = v101;
  v101[2] = 0x2020000000;
  char v102 = 1;
  v99[0] = 0;
  v99[1] = v99;
  v99[2] = 0x2020000000;
  char v100 = 1;
  uint64_t v93 = 0;
  v94 = (double *)&v93;
  uint64_t v95 = 0x3010000000;
  uint64_t v98 = 0;
  v96 = &unk_1E0F50A5E;
  uint64_t v97 = 0;
  uint64_t v87 = 0;
  v88 = (double *)&v87;
  uint64_t v89 = 0x3010000000;
  uint64_t v91 = 0;
  uint64_t v92 = 0;
  v90 = &unk_1E0F50A5E;
  v85[0] = 0;
  v85[1] = v85;
  v85[2] = 0x2020000000;
  char v86 = 0;
  uint64_t v81 = 0;
  v82 = &v81;
  uint64_t v83 = 0x2020000000;
  char v84 = 0;
  v79[0] = 0;
  v79[1] = v79;
  v79[2] = 0x2020000000;
  BOOL v80 = 0;
  BOOL v80 = [(HKQuantityDistributionSeries *)self excludeDistribution];
  v58[0] = MEMORY[0x1E4F143A8];
  v58[1] = 3221225472;
  v58[2] = __171__HKQuantityDistributionSeries_drawSeriesWithBlockCoordinates_axisRect_zoomLevelConfiguration_pointTransform_renderContext_secondaryRenderContext_seriesRenderingDelegate___block_invoke;
  v58[3] = &unk_1E6D543A8;
  double v49 = v30;
  double v33 = x + v30;
  if (v23 >= v26) {
    double v34 = v23;
  }
  else {
    double v34 = v26;
  }
  double v67 = x;
  double v68 = y;
  double v69 = width;
  double v70 = height;
  double v71 = v34;
  double v72 = v33;
  double v73 = x + width - v32;
  v61 = &v93;
  v62 = v99;
  v63 = &v87;
  v64 = v79;
  v74 = a7;
  v60 = v101;
  v58[4] = self;
  long long v78 = v106;
  long long v77 = v105;
  long long v76 = v104;
  long long v75 = v103;
  v65 = v85;
  v66 = &v81;
  id v35 = v21;
  id v59 = v35;
  long long v36 = *(_OWORD *)&a6->c;
  long long v55 = *(_OWORD *)&a6->a;
  long long v56 = v36;
  long long v57 = *(_OWORD *)&a6->tx;
  [v19 enumerateCoordinatesWithTransform:&v55 roundToViewScale:0 block:v58];
  int v37 = [v20 seriesDrawingDuringScrolling];
  int v38 = [v20 seriesDrawingDuringTiling];
  if ([(HKGraphSeries *)self allowsSelection])
  {
    if (!*((unsigned char *)v82 + 24))
    {
      v39 = [(HKQuantityDistributionSeries *)self minMaxLabelStyle];
      if (v39)
      {
        v40 = [(HKQuantityDistributionSeries *)self minMaxValueStyle];
        v41 = v40;
        if (v40) {
          int v42 = v38;
        }
        else {
          int v42 = 1;
        }
        if ((v42 | v37))
        {
        }
        else
        {
          BOOL v43 = [(HKQuantityDistributionSeries *)self excludeDistribution];

          if (v43)
          {
            double v44 = v94[4];
            double v45 = v94[5];
            double v46 = v88[4];
            double v47 = v88[5];
            long long v48 = *(_OWORD *)&a6->c;
            long long v55 = *(_OWORD *)&a6->a;
            long long v56 = v48;
            long long v57 = *(_OWORD *)&a6->tx;
            -[HKQuantityDistributionSeries _drawMinMaxLabelsForMin:max:pointTransform:axisRect:context:](self, "_drawMinMaxLabelsForMin:max:pointTransform:axisRect:context:", &v55, a7, v44, v45, v46, v47, v33, y + v51, width - (v49 + v32), height - (v51 + v50));
          }
        }
      }
    }
  }
  CGContextRestoreGState(a7);

  _Block_object_dispose(v79, 8);
  _Block_object_dispose(&v81, 8);
  _Block_object_dispose(v85, 8);
  _Block_object_dispose(&v87, 8);
  _Block_object_dispose(&v93, 8);
  _Block_object_dispose(v99, 8);
  _Block_object_dispose(v101, 8);
}

void __171__HKQuantityDistributionSeries_drawSeriesWithBlockCoordinates_axisRect_zoomLevelConfiguration_pointTransform_renderContext_secondaryRenderContext_seriesRenderingDelegate___block_invoke(uint64_t a1, void *a2, _OWORD *a3, void *a4)
{
  id v7 = a2;
  id v8 = a4;
  double v9 = *(double *)(a1 + 104);
  double v10 = *(double *)(a1 + 120);
  [v7 minPoint];
  double v12 = v11;
  double v13 = *(double *)(a1 + 136);
  if (v11 >= *(double *)(a1 + 104) - v13 && v11 <= v9 + v10 + v13)
  {
    double v15 = [v7 distributionSegments];
    char v16 = [v15 count];

    if ((v16 & 1) == 0)
    {
      if (v12 >= *(double *)(a1 + 144) && v12 <= *(double *)(a1 + 152))
      {
        if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)
          || ([v8 minPoint], v17 < *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)))
        {
          [v8 minPoint];
          uint64_t v18 = *(void *)(*(void *)(a1 + 56) + 8);
          *(void *)(v18 + 32) = v19;
          *(void *)(v18 + 40) = v20;
          *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
        }
        if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)
          || ([v8 maxPoint], v21 >= *(double *)(*(void *)(*(void *)(a1 + 72) + 8) + 40)))
        {
          [v8 maxPoint];
          uint64_t v22 = *(void *)(*(void *)(a1 + 72) + 8);
          *(void *)(v22 + 32) = v23;
          *(void *)(v22 + 40) = v24;
          *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
        }
      }
      if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24))
      {
        double v25 = [v7 distributionSegments];
        uint64_t v26 = [v25 count];

        if (v26)
        {
          unint64_t v27 = 0;
          do
          {
            double v28 = [v7 distributionSegments];
            double v29 = [v28 objectAtIndexedSubscript:v27];
            [v29 CGPointValue];
            double v31 = v30;
            CGFloat v33 = v32;

            double v34 = [v7 distributionSegments];
            id v35 = [v34 objectAtIndexedSubscript:v27 + 1];
            [v35 CGPointValue];
            double v37 = v36;
            CGFloat v39 = v38;

            v40 = *(CGContext **)(a1 + 160);
            double v41 = HKUIFloorToScreenScale(v31);
            CGContextMoveToPoint(v40, v41, v33);
            int v42 = *(CGContext **)(a1 + 160);
            double v43 = HKUIFloorToScreenScale(v37);
            CGContextAddLineToPoint(v42, v43, v39);
            CGContextStrokePath(*(CGContextRef *)(a1 + 160));
            double v44 = [v7 distributionSegments];
            unint64_t v45 = [v44 count];

            v27 += 2;
          }
          while (v27 < v45);
        }
        [*(id *)(a1 + 32) hollowLineRatio];
        if (v46 > 0.0)
        {
          CGContextSaveGState(*(CGContextRef *)(a1 + 160));
          double v47 = *(CGContext **)(a1 + 160);
          double v48 = *(double *)(a1 + 136);
          [*(id *)(a1 + 32) hollowLineRatio];
          CGContextSetLineWidth(v47, v48 * v49);
          double v50 = *(CGContext **)(a1 + 160);
          objc_msgSend(MEMORY[0x1E4FB1618], "hk_chartBackgroundColor");
          id v51 = objc_claimAutoreleasedReturnValue();
          CGContextSetStrokeColorWithColor(v50, (CGColorRef)[v51 CGColor]);

          id v52 = [v7 distributionSegments];
          uint64_t v53 = [v52 count];

          if (v53)
          {
            unint64_t v54 = 0;
            do
            {
              long long v55 = [v7 distributionSegments];
              long long v56 = [v55 objectAtIndexedSubscript:v54];
              [v56 CGPointValue];
              double v58 = v57;
              CGFloat v60 = v59;

              v61 = [v7 distributionSegments];
              v62 = [v61 objectAtIndexedSubscript:v54 + 1];
              [v62 CGPointValue];
              double v64 = v63;
              CGFloat v66 = v65;

              double v67 = *(CGContext **)(a1 + 160);
              double v68 = HKUIFloorToScreenScale(v58);
              CGContextMoveToPoint(v67, v68, v60);
              double v69 = *(CGContext **)(a1 + 160);
              double v70 = HKUIFloorToScreenScale(v64);
              CGContextAddLineToPoint(v69, v70, v66);
              CGContextStrokePath(*(CGContextRef *)(a1 + 160));
              double v71 = [v7 distributionSegments];
              unint64_t v72 = [v71 count];

              v54 += 2;
            }
            while (v54 < v72);
          }
          CGContextRestoreGState(*(CGContextRef *)(a1 + 160));
        }
      }
      long long v73 = a3[1];
      v79[0] = *a3;
      v79[1] = v73;
      long long v74 = *(_OWORD *)(a1 + 184);
      v78[0] = *(_OWORD *)(a1 + 168);
      v78[1] = v74;
      long long v75 = *(_OWORD *)(a1 + 216);
      v78[2] = *(_OWORD *)(a1 + 200);
      v78[3] = v75;
      if (HKGraphSeriesDataPointPathInRangeInclusive((uint64_t *)v79, (uint64_t *)v78))
      {
        if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24))
        {
          long long v76 = [*(id *)(a1 + 32) selectedStrokeStyle];

          if (v76)
          {
            long long v77 = [*(id *)(a1 + 32) selectedStrokeStyle];
            [v77 applyToContext:*(void *)(a1 + 160)];

            *(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = 1;
          }
        }
        *(unsigned char *)(*(void *)(*(void *)(a1 + 96) + 8) + 24) = 1;
      }
      else if (*(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24))
      {
        [*(id *)(a1 + 40) applyToContext:*(void *)(a1 + 160)];
        *(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = 0;
      }
    }
  }
}

- (void)_drawMinMaxLabelsForMin:(CGPoint)a3 max:(CGPoint)a4 pointTransform:(CGAffineTransform *)a5 axisRect:(CGRect)a6 context:(CGContext *)a7
{
  CGFloat height = a6.size.height;
  double width = a6.size.width;
  double x = a6.origin.x;
  double y = a6.origin.y;
  double v10 = a4.y;
  double v11 = a4.x;
  double v12 = a3.y;
  double v13 = a3.x;
  v179[2] = *MEMORY[0x1E4F143B8];
  double v15 = [(HKQuantityDistributionSeries *)self minMaxLabelStyle];
  uint64_t v16 = [v15 font];

  double v17 = [(HKQuantityDistributionSeries *)self minMaxLabelStyle];
  uint64_t v18 = [v17 textColor];

  uint64_t v20 = *MEMORY[0x1E4FB0700];
  v178[0] = *MEMORY[0x1E4FB06F8];
  uint64_t v19 = v178[0];
  v178[1] = v20;
  v166 = (void *)v16;
  v179[0] = v16;
  v179[1] = v18;
  v168 = (void *)v18;
  double v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v179 forKeys:v178 count:2];
  uint64_t v22 = [(HKQuantityDistributionSeries *)self minMaxValueStyle];
  uint64_t v23 = [v22 font];

  uint64_t v24 = [(HKQuantityDistributionSeries *)self minMaxValueStyle];
  uint64_t v25 = [v24 textColor];

  v176[0] = v19;
  v176[1] = v20;
  v167 = (void *)v23;
  v177[0] = v23;
  v177[1] = v25;
  uint64_t v26 = (void *)v25;
  unint64_t v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v177 forKeys:v176 count:2];
  double v28 = [MEMORY[0x1E4FB1618] clearColor];
  double v29 = [(HKQuantityDistributionSeries *)self minMaxValueStyle];
  double v30 = [v29 numberFormatter];

  double rect = height;
  if (v30)
  {
    double v31 = [(HKQuantityDistributionSeries *)self minMaxValueStyle];
    double v32 = [v31 numberFormatter];
  }
  else
  {
    double v32 = objc_msgSend(MEMORY[0x1E4F28EE0], "hk_wholeNumberFormatter");
  }
  CGFloat v33 = [NSNumber numberWithDouble:v12];
  double v34 = [v32 stringFromNumber:v33 displayType:0 unitController:0];

  uint64_t v35 = [NSNumber numberWithDouble:v10];
  double v36 = v32;
  double v37 = (void *)v35;
  v169 = v36;
  double v38 = [v36 stringFromNumber:v35 displayType:0 unitController:0];

  double a = a5->a;
  double b = a5->b;
  double v41 = a5->c;
  double d = a5->d;
  tdouble x = a5->tx;
  tdouble y = a5->ty;
  unint64_t v45 = v38;
  double v172 = tx + v12 * v41 + a * v13;
  double v46 = ty + v12 * d + b * v13;
  double v47 = tx + v10 * v41 + a * v11;
  double v48 = ty + v10 * d + b * v11;
  CGFloat v171 = v46;
  if ([v34 isEqualToString:v38])
  {
    [v38 sizeWithAttributes:v27];
    double v160 = v49;
    double v51 = v50;
    v180.origin.double x = x;
    v180.origin.double y = y;
    v180.size.double width = width;
    v180.size.CGFloat height = rect;
    BOOL v52 = v48 + -26.0 > CGRectGetMinY(v180);
    double v53 = -3.0;
    if (v52) {
      double v53 = 26.0;
    }
    -[HKQuantityDistributionSeries _textRectForSize:location:screenRect:yOffset:](self, "_textRectForSize:location:screenRect:yOffset:", v160, v51, v47, v48, x, y, width, rect, *(void *)&v53);
    objc_msgSend(v38, "hk_drawInRect:withAttributes:outlineWidth:outlineColor:context:", v27, v28, a7);
    unint64_t v54 = v169;
  }
  else
  {
    double v158 = v47;
    double v159 = v48;
    long long v55 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    [v55 localizedStringForKey:@"HEART_RATE_MIN_TITLE" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
    long long v56 = v157 = v34;
    double v57 = [v56 localizedUppercaseString];

    double v34 = v157;
    [v57 sizeWithAttributes:v21];
    double v59 = v58;
    double v61 = v60;
    [v157 sizeWithAttributes:v27];
    double r2 = v62;
    double v64 = v63;
    CGFloat v65 = v46 + 14.0 + v63;
    uint64_t v66 = CTFontCopySystemUIFontExcessiveLineHeightCharacterSet();
    v181.origin.double x = x;
    v181.origin.double y = y;
    v181.size.double width = width;
    v181.size.CGFloat height = rect;
    v161 = v21;
    v156 = (void *)v66;
    if (v65 >= CGRectGetMaxY(v181))
    {
      -[HKQuantityDistributionSeries _textRectForSize:location:screenRect:yOffset:](self, "_textRectForSize:location:screenRect:yOffset:", v59, v61, v172, v46, x, y, width, rect, 0x4042800000000000);
      double v146 = v80;
      double v147 = v79;
      double v144 = v82;
      double v145 = v81;
      -[HKQuantityDistributionSeries _textRectForSize:location:screenRect:yOffset:](self, "_textRectForSize:location:screenRect:yOffset:", r2, v64, v172, v46, x, y, width, rect, 0x403A000000000000);
      double v72 = v83;
      double v152 = v84;
      double v153 = v85;
      r2double a = v86;
    }
    else
    {
      -[HKQuantityDistributionSeries _textRectForSize:location:screenRect:yOffset:](self, "_textRectForSize:location:screenRect:yOffset:", v59, v61, v172, v46, x, y, width, rect, 0xC008000000000000);
      double v146 = v68;
      double v147 = v67;
      double v144 = v70;
      double v145 = v69;
      -[HKQuantityDistributionSeries _textRectForSize:location:screenRect:yOffset:](self, "_textRectForSize:location:screenRect:yOffset:", r2, v64, v172, v46, x, y, width, rect, 0xC02C000000000000);
      double v72 = v71;
      double v74 = v73;
      double v153 = v76;
      r2double a = v75;
      uint64_t v77 = [v57 rangeOfCharacterFromSet:v66];
      double v78 = v74 + 3.0;
      if (v77 == 0x7FFFFFFFFFFFFFFFLL) {
        double v78 = v74;
      }
      double v152 = v78;
    }
    double v87 = x;
    v88 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    uint64_t v89 = [v88 localizedStringForKey:@"HEART_RATE_MAX_TITLE" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
    v90 = [v89 localizedUppercaseString];

    double v21 = v161;
    [v90 sizeWithAttributes:v161];
    double v92 = v91;
    double v94 = v93;
    [v45 sizeWithAttributes:v27];
    double v140 = v95;
    double v142 = v96;
    v182.origin.double x = x;
    v182.origin.double y = y;
    v182.size.double width = width;
    v182.size.CGFloat height = rect;
    double v163 = v72;
    if (v159 + -37.0 <= CGRectGetMinY(v182))
    {
      CGFloat v97 = v158;
      -[HKQuantityDistributionSeries _textRectForSize:location:screenRect:yOffset:](self, "_textRectForSize:location:screenRect:yOffset:", v92, v94, v158, v159, v87, y, width, rect, 0xC008000000000000);
      double v99 = v114;
      double v148 = v115;
      double v149 = v116;
      double r1 = v117;
      -[HKQuantityDistributionSeries _textRectForSize:location:screenRect:yOffset:](self, "_textRectForSize:location:screenRect:yOffset:", v140, v142, v158, v159, v87, y, width, rect, 0xC02C000000000000);
      CGFloat v105 = v118;
      CGFloat v107 = v119;
      double v109 = v120;
      double v111 = v121;
    }
    else
    {
      CGFloat v97 = v158;
      -[HKQuantityDistributionSeries _textRectForSize:location:screenRect:yOffset:](self, "_textRectForSize:location:screenRect:yOffset:", v92, v94, v158, v159, v87, y, width, rect, 0x4042800000000000);
      double v99 = v98;
      double v101 = v100;
      double v149 = v103;
      double r1 = v102;
      -[HKQuantityDistributionSeries _textRectForSize:location:screenRect:yOffset:](self, "_textRectForSize:location:screenRect:yOffset:", v140, v142, v158, v159, v87, y, width, rect, 0x403A000000000000);
      CGFloat v105 = v104;
      CGFloat v107 = v106;
      double v109 = v108;
      double v111 = v110;
      uint64_t v112 = [v90 rangeOfCharacterFromSet:v156];
      double v113 = v101 + -3.0;
      if (v112 == 0x7FFFFFFFFFFFFFFFLL) {
        double v113 = v101;
      }
      double v148 = v113;
    }
    unint64_t v54 = v169;
    v183.origin.double x = v99;
    v183.origin.double y = v148;
    v183.size.CGFloat height = v149;
    v183.size.double width = r1;
    double v141 = v107;
    double v143 = v105;
    v188.origin.double x = v105;
    v188.origin.double y = v107;
    v188.size.double width = v109;
    v188.size.CGFloat height = v111;
    CGRect v184 = CGRectUnion(v183, v188);
    v189.size.double width = 0.0;
    v189.size.CGFloat height = 0.0;
    v189.origin.double x = v97;
    v189.origin.double y = v159;
    CGRect v185 = CGRectUnion(v184, v189);
    CGFloat v122 = v185.origin.x;
    CGFloat v123 = v185.origin.y;
    CGFloat v124 = v185.size.width;
    CGFloat v125 = v185.size.height;
    v185.origin.double x = v147;
    v185.origin.double y = v146;
    v185.size.double width = v145;
    v185.size.CGFloat height = v144;
    v190.origin.double x = v163;
    v190.origin.double y = v152;
    v190.size.CGFloat height = v153;
    v190.size.double width = r2a;
    CGRect v186 = CGRectUnion(v185, v190);
    v191.size.double width = 0.0;
    v191.size.CGFloat height = 0.0;
    v191.origin.double y = v171;
    v191.origin.double x = v172;
    CGRect v192 = CGRectUnion(v186, v191);
    v187.origin.double x = v122;
    v187.origin.double y = v123;
    v187.size.double width = v124;
    v187.size.CGFloat height = v125;
    CGRect v193 = CGRectIntersection(v187, v192);
    if (CGRectEqualToRect(*MEMORY[0x1E4F1DB20], v193))
    {
      rectdouble a = v28;
      r1double a = +[HKStringDrawing stringDrawingWithText:inRect:withAttributes:](HKStringDrawing, "stringDrawingWithText:inRect:withAttributes:", v90, v161, v99, v148, r1, v149);
      v175[0] = r1a;
      v126 = +[HKStringDrawing stringDrawingWithText:inRect:withAttributes:](HKStringDrawing, "stringDrawingWithText:inRect:withAttributes:", v45, v27, v143, v141, v109, v111);
      v175[1] = v126;
      +[HKStringDrawing stringDrawingWithText:inRect:withAttributes:](HKStringDrawing, "stringDrawingWithText:inRect:withAttributes:", v57, v161, v147, v146, v145, v144);
      v127 = v165 = v90;
      v175[2] = v127;
      +[HKStringDrawing stringDrawingWithText:inRect:withAttributes:](HKStringDrawing, "stringDrawingWithText:inRect:withAttributes:", v157, v27, v163, v152, r2a, v153);
      v129 = v128 = v26;
      v175[3] = v129;
      v130 = [MEMORY[0x1E4F1C978] arrayWithObjects:v175 count:4];
      +[HKStringDrawing drawStrings:v130 outlineWidth:recta outlineColor:a7 context:8.0];

      double v28 = recta;
      uint64_t v26 = v128;
      double v34 = v157;

      v90 = v165;
      unint64_t v54 = v169;

      double v21 = v161;
    }

    double v47 = v158;
    double v48 = v159;
  }
  v131 = [(HKQuantityDistributionSeries *)self minMaxPointStyle];

  if (v131)
  {
    v132 = [(HKQuantityDistributionSeries *)self minMaxPointStyle];
    [v132 lineWidth];
    CGFloat v134 = v133;

    v135 = [(HKQuantityDistributionSeries *)self minMaxPointStyle];
    [v135 strokeColor];
    v136 = v28;
    id v137 = objc_claimAutoreleasedReturnValue();
    CGContextSetFillColorWithColor(a7, (CGColorRef)[v137 CGColor]);

    double v28 = v136;
    double v138 = HKUIFloorToScreenScale(v172);
    CGContextAddArc(a7, v138, v171, v134, 0.0, 6.28318531, 1);
    CGContextFillPath(a7);
    double v139 = HKUIFloorToScreenScale(v47);
    CGContextAddArc(a7, v139, v48, v134, 0.0, 6.28318531, 1);
    CGContextFillPath(a7);
  }
}

- (CGRect)_textRectForSize:(CGSize)a3 location:(CGPoint)a4 screenRect:(CGRect)a5 yOffset:(double)a6
{
  CGFloat height = a5.size.height;
  CGFloat width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  CGFloat v10 = a3.height;
  CGFloat v11 = a3.width;
  double v12 = a4.x + a3.width * -0.5;
  double v13 = a4.y - a6;
  v24.origin.double x = v12;
  v24.origin.double y = a4.y - a6;
  v24.size.CGFloat width = v11;
  v24.size.CGFloat height = v10;
  CGRect v25 = CGRectIntersection(v24, a5);
  if (!CGRectIsNull(v25))
  {
    if (v12 < x) {
      double v12 = x;
    }
    if (v13 < y) {
      double v13 = y;
    }
    v26.origin.double x = v12;
    v26.origin.double y = v13;
    v26.size.CGFloat width = v11;
    v26.size.CGFloat height = v10;
    CGFloat MaxX = CGRectGetMaxX(v26);
    v27.size.CGFloat height = height;
    double v15 = MaxX;
    v27.origin.double x = x;
    v27.origin.double y = y;
    v27.size.CGFloat width = width;
    CGFloat rect = v27.size.height;
    if (v15 > CGRectGetMaxX(v27))
    {
      v28.origin.double x = v12;
      v28.origin.double y = v13;
      v28.size.CGFloat width = v11;
      v28.size.CGFloat height = v10;
      double v16 = CGRectGetMaxX(v28);
      v29.origin.double x = x;
      v29.origin.double y = y;
      v29.size.CGFloat width = width;
      v29.size.CGFloat height = rect;
      double v12 = v12 - (v16 - CGRectGetMaxX(v29));
    }
    v30.origin.double x = v12;
    v30.origin.double y = v13;
    v30.size.CGFloat width = v11;
    v30.size.CGFloat height = v10;
    double MaxY = CGRectGetMaxY(v30);
    v31.origin.double x = x;
    v31.origin.double y = y;
    v31.size.CGFloat width = width;
    v31.size.CGFloat height = rect;
    if (MaxY > CGRectGetMaxY(v31))
    {
      v32.origin.double x = v12;
      v32.origin.double y = v13;
      v32.size.CGFloat width = v11;
      v32.size.CGFloat height = v10;
      double v18 = CGRectGetMaxY(v32);
      v33.origin.double x = x;
      v33.origin.double y = y;
      v33.size.CGFloat width = width;
      v33.size.CGFloat height = rect;
      double v13 = v13 - (v18 - CGRectGetMaxY(v33));
    }
  }
  double v19 = v12;
  double v20 = v13;
  double v21 = v11;
  double v22 = v10;
  result.size.CGFloat height = v22;
  result.size.CGFloat width = v21;
  result.origin.double y = v20;
  result.origin.double x = v19;
  return result;
}

- (id)coordinatesForBlock:(id)a3 blockPath:(HKGraphSeriesDataBlockPath *)a4 xAxis:(id)a5 yAxis:(id)a6
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v10 = a5;
  id v11 = a6;
  double v12 = [a3 chartPoints];
  if (!v12)
  {
    uint64_t v23 = [MEMORY[0x1E4F28B00] currentHandler];
    [v23 handleFailureInMethod:a2, self, @"HKQuantityDistributionSeries.m", 491, @"Invalid parameter not satisfying: %@", @"points != nil" object file lineNumber description];
  }
  CGRect v26 = v10;
  double v13 = [v10 transform];
  CGRect v25 = v11;
  double v14 = [v11 transform];
  double v15 = objc_opt_new();
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id obj = v12;
  uint64_t v16 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v31 != v18) {
          objc_enumerationMutation(obj);
        }
        double v20 = [[HKDistributionBlockPoint alloc] initWithChartPoint:*(void *)(*((void *)&v30 + 1) + 8 * i) xAxisTransform:v13 yAxisTransform:v14 gapZeroCount:[(HKQuantityDistributionSeries *)self zeroCountForGap]];
        [v15 addObject:v20];
      }
      uint64_t v17 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v17);
  }

  long long v28 = *(_OWORD *)&a4->index;
  int64_t resolution = a4->resolution;
  double v21 = +[HKGraphSeriesBlockCoordinateList coordinateListWithCoordinates:v15 blockPath:&v28];

  return v21;
}

- (int64_t)resolutionForTimeScope:(int64_t)a3 traitResolution:(int64_t)a4
{
  return a3 == 5 && a4 == 1;
}

- (double)distanceFromPoint:(CGPoint)a3 blockCoordinate:(id)a4 chartRect:(CGRect)a5
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = objc_msgSend(a4, "distributionSegments", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    double v9 = 1.79769313e308;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v13 + 1) + 8 * i) CGPointValue];
        UIDistanceBetweenPoints();
        if (v9 >= v11) {
          double v9 = v11;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }
  else
  {
    double v9 = 1.79769313e308;
  }

  return v9;
}

- (double)xAxisDistanceFromPoint:(CGPoint)a3 blockCoordinate:(id)a4 chartRect:(CGRect)a5
{
  double x = a3.x;
  objc_msgSend(a4, "minPoint", a3.x, a3.y, a5.origin.x, a5.origin.y, a5.size.width, a5.size.height);
  return vabdd_f64(x, v6);
}

- (double)yAxisDifferenceToPoint:(CGPoint)a3 blockCoordinate:(id)a4 chartRect:(CGRect)a5
{
  double y = a3.y;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  double v6 = objc_msgSend(a4, "distributionSegments", 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    double v10 = 1.79769313e308;
    double v11 = -1.79769313e308;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v16 + 1) + 8 * i) CGPointValue];
        if (v13 - y < 0.0 && v11 < v13 - y) {
          double v11 = v13 - y;
        }
        if (v10 >= v13 - y && v13 - y >= 0.0) {
          double v10 = v13 - y;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }
  else
  {
    double v10 = 1.79769313e308;
    double v11 = -1.79769313e308;
  }

  if (v10 >= -v11) {
    return v11;
  }
  else {
    return v10;
  }
}

- (BOOL)blockCoordinate:(id)a3 lessThan:(id)a4
{
  id v5 = a4;
  [a3 minPoint];
  double v7 = v6;
  [v5 minPoint];
  double v9 = v8;

  return v7 < v9;
}

- (BOOL)blockCoordinate:(id)a3 greaterThan:(id)a4
{
  id v5 = a4;
  [a3 maxPoint];
  double v7 = v6;
  [v5 maxPoint];
  double v9 = v8;

  return v7 > v9;
}

+ (id)segmentsFromChartPoint:(id)a3 zeroCountForGap:(int64_t)a4
{
  id v6 = a3;
  double v7 = [v6 minYValue];
  double v8 = [v6 maxYValue];
  [v7 doubleValue];
  double v10 = v9;
  [v8 doubleValue];
  double v12 = [a1 segmentsFromChartPoint:v6 minY:a4 maxY:v10 zeroCountForGap:v11];

  return v12;
}

+ (id)segmentsFromChartPoint:(id)a3 minY:(double)a4 maxY:(double)a5 zeroCountForGap:(int64_t)a6
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v9 minimumBucketValue];
  double v12 = v11;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  double v13 = objc_msgSend(v9, "bucketCounts", 0);
  uint64_t v14 = [v13 countByEnumeratingWithState:&v36 objects:v40 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    int64_t v16 = 0;
    uint64_t v17 = *(void *)v37;
    double v18 = v12;
    double v19 = v12;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v37 != v17) {
          objc_enumerationMutation(v13);
        }
        if ([*(id *)(*((void *)&v36 + 1) + 8 * i) integerValue])
        {
          BOOL v21 = v16 < a6;
          int64_t v16 = 0;
          if (!v21)
          {
            double v12 = v19;
            double v18 = v19;
          }
        }
        else
        {
          if (!v16) {
            double v12 = v19;
          }
          if (++v16 == a6)
          {
            double v22 = [NSNumber numberWithDouble:v18];
            uint64_t v23 = [NSNumber numberWithDouble:v12];
            [v10 addObject:v22];
            [v10 addObject:v23];

            int64_t v16 = a6;
          }
        }
        [v9 bucketIncrement];
        double v19 = v19 + v24;
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v36 objects:v40 count:16];
    }
    while (v15);
  }
  else
  {
    double v18 = v12;
    double v19 = v12;
  }

  CGRect v25 = [NSNumber numberWithDouble:v18];
  CGRect v26 = [NSNumber numberWithDouble:v19];
  [v10 addObject:v25];
  [v10 addObject:v26];
  if ([v10 count])
  {
    CGRect v27 = [v10 firstObject];
    [v27 doubleValue];
    double v29 = v28;

    if (v29 < a4)
    {
      long long v30 = [NSNumber numberWithDouble:a4];
      [v10 setObject:v30 atIndexedSubscript:0];
    }
    long long v31 = [v10 lastObject];
    [v31 doubleValue];
    double v33 = v32;

    if (v33 > a5)
    {
      double v34 = [NSNumber numberWithDouble:a5];
      objc_msgSend(v10, "setObject:atIndexedSubscript:", v34, objc_msgSend(v10, "count") - 1);
    }
  }

  return v10;
}

+ (id)transformedSegmentsFromChartPoint:(id)a3 forX:(double)a4 minY:(double)a5 maxY:(double)a6 zeroCountForGap:(int64_t)a7
{
  double v8 = [a1 segmentsFromChartPoint:a3 minY:a7 maxY:a5 zeroCountForGap:a6];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __97__HKQuantityDistributionSeries_transformedSegmentsFromChartPoint_forX_minY_maxY_zeroCountForGap___block_invoke;
  v11[3] = &__block_descriptor_40_e27___NSValue_16__0__NSNumber_8l;
  *(double *)&v11[4] = a4;
  id v9 = objc_msgSend(v8, "hk_map:", v11);

  return v9;
}

uint64_t __97__HKQuantityDistributionSeries_transformedSegmentsFromChartPoint_forX_minY_maxY_zeroCountForGap___block_invoke(uint64_t a1, void *a2)
{
  double v2 = *(double *)(a1 + 32);
  [a2 doubleValue];
  id v4 = (void *)MEMORY[0x1E4F29238];
  return objc_msgSend(v4, "valueWithCGPoint:", v2, v3);
}

- (NSLock)seriesMutableStateLock
{
  return self->_seriesMutableStateLock;
}

- (HKStrokeStyle)inactiveStrokeStyleStorage
{
  return self->_inactiveStrokeStyleStorage;
}

- (void)setInactiveStrokeStyleStorage:(id)a3
{
}

- (HKStrokeStyle)unselectedStrokeStyleStorage
{
  return self->_unselectedStrokeStyleStorage;
}

- (void)setUnselectedStrokeStyleStorage:(id)a3
{
}

- (HKStrokeStyle)selectedStrokeStyleStorage
{
  return self->_selectedStrokeStyleStorage;
}

- (void)setSelectedStrokeStyleStorage:(id)a3
{
}

- (HKAxisLabelStyle)minMaxLabelStyleStorage
{
  return self->_minMaxLabelStyleStorage;
}

- (void)setMinMaxLabelStyleStorage:(id)a3
{
}

- (HKAxisLabelStyle)minMaxValueStyleStorage
{
  return self->_minMaxValueStyleStorage;
}

- (void)setMinMaxValueStyleStorage:(id)a3
{
}

- (HKStrokeStyle)minMaxPointStyleStorage
{
  return self->_minMaxPointStyleStorage;
}

- (void)setMinMaxPointStyleStorage:(id)a3
{
}

- (BOOL)excludeDistributionStorage
{
  return self->_excludeDistributionStorage;
}

- (void)setExcludeDistributionStorage:(BOOL)a3
{
  self->_excludeDistributionStorage = a3;
}

- (int64_t)zeroCountForGapStorage
{
  return self->_zeroCountForGapStorage;
}

- (void)setZeroCountForGapStorage:(int64_t)a3
{
  self->_int64_t zeroCountForGapStorage = a3;
}

- (double)hollowLineRatioStorage
{
  return self->_hollowLineRatioStorage;
}

- (void)setHollowLineRatioStorage:(double)a3
{
  self->_double hollowLineRatioStorage = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_minMaxPointStyleStorage, 0);
  objc_storeStrong((id *)&self->_minMaxValueStyleStorage, 0);
  objc_storeStrong((id *)&self->_minMaxLabelStyleStorage, 0);
  objc_storeStrong((id *)&self->_selectedStrokeStyleStorage, 0);
  objc_storeStrong((id *)&self->_unselectedStrokeStyleStorage, 0);
  objc_storeStrong((id *)&self->_inactiveStrokeStyleStorage, 0);
  objc_storeStrong((id *)&self->_seriesMutableStateLock, 0);
}

@end