@interface HKSleepStageDaySeries
- (BOOL)supportsMultiTouchSelection;
- (CGPoint)renderPositionForLabelLocation:(id)a3 rect:(CGRect)a4 zoomScale:(double)a5 contentOffset:(CGPoint)a6 constantOffset:(double)a7 isHorizontal:(BOOL)a8 optionalOffset:(CGPoint)a9;
- (CGRect)_enumerationRectForStage:(int64_t)a3 axisRect:(CGRect)a4;
- (CGRect)_nonSleepStageBarRectForCoordinate:(id)a3 axisRect:(CGRect)a4;
- (CGRect)_sleepStageBarRectForCoordinate:(id)a3 axisRect:(CGRect)a4;
- (CGSize)cornerRadii;
- (CGSize)cornerRadiiStorage;
- (HKFillStyle)sleepStageBackgroundFillStyle;
- (HKFillStyle)sleepStageBackgroundFillStyleStorage;
- (HKFillStyle)sleepStageBackgroundInactiveFillStyle;
- (HKFillStyle)sleepStageBackgroundInactiveFillStyleStorage;
- (HKSleepStageDaySeries)init;
- (NSArray)sleepStageFillStyles;
- (NSArray)sleepStageFillStylesStorage;
- (NSLock)seriesMutableStateLock;
- (NSNumber)highlightedSleepStage;
- (NSNumber)highlightedSleepStageStorage;
- (UIColor)sleepStageLabelColor;
- (UIColor)sleepStageLabelColorStorage;
- (UIFont)sleepStageLabelFont;
- (UIFont)sleepStageLabelFontStorage;
- (double)_yAxisOffsetForCoordinate:(id)a3 axisRect:(CGRect)a4;
- (double)distanceFromPoint:(CGPoint)a3 blockCoordinate:(id)a4 chartRect:(CGRect)a5;
- (double)xAxisDistanceFromPoint:(CGPoint)a3 blockCoordinate:(id)a4 chartRect:(CGRect)a5;
- (double)xAxisSelectedCoordinate:(double)a3 blockCoordinate:(id)a4 chartRect:(CGRect)a5;
- (double)yAxisDifferenceToPoint:(CGPoint)a3 blockCoordinate:(id)a4 chartRect:(CGRect)a5;
- (id)_buildConnectionFromStageRect:(CGRect)a3 toStageRect:(CGRect)a4;
- (id)_buildConnectionPathFromBackgroundRects:(id)a3;
- (id)_visibleSleepStagesInBlockCoordinates:(id)a3 pointTransform:(CGAffineTransform *)a4 screenRect:(CGRect)a5;
- (id)cacheKeysForModelRange:(id)a3 zoomScale:(double)a4;
- (id)coordinatesForBlock:(id)a3 blockPath:(HKGraphSeriesDataBlockPath *)a4 xAxis:(id)a5 yAxis:(id)a6;
- (id)determineBottomConnectionPathFromRect:(CGRect)a3 toRect:(CGRect)a4 cornerRadius:(double)a5;
- (id)determineTopConnectionPathFromRect:(CGRect)a3 toRect:(CGRect)a4 cornerRadius:(double)a5;
- (id)findAxisLabelsInModelRange:(id)a3 zoomScale:(double)a4;
- (id)mergeOverlappingRects:(id)a3;
- (int64_t)overlayType;
- (void)_addSomnogramConnectionPath:(id)a3 toBezierPath:(id)a4;
- (void)_drawLabelAndRuleLineForString:(id)a3 inRect:(CGRect)a4 horizontalOffset:(double)a5 verticalOffset:(double)a6 axisRect:(CGRect)a7 context:(CGContext *)a8;
- (void)_drawPaths:(id)a3 withFillStyles:(id)a4 axisRect:(CGRect)a5 context:(CGContext *)a6;
- (void)_drawSleepStageLabels:(CGContext *)a3 axisRect:(CGRect)a4;
- (void)_drawStagesBackgroundWithRects:(id)a3 buildPath:(id)a4 cornerRadii:(CGSize)a5 highlightedSleepStage:(id)a6 axisRect:(CGRect)a7 renderContext:(CGContext *)a8;
- (void)_rebuildFillStyles;
- (void)drawOverlayInContext:(CGContext *)a3 seriesOverlayData:(id)a4;
- (void)drawSeriesWithBlockCoordinates:(id)a3 axisRect:(CGRect)a4 zoomLevelConfiguration:(id)a5 pointTransform:(CGAffineTransform *)a6 renderContext:(CGContext *)a7 secondaryRenderContext:(id)a8 seriesRenderingDelegate:(id)a9;
- (void)setCornerRadii:(CGSize)a3;
- (void)setCornerRadiiStorage:(CGSize)a3;
- (void)setHighlightedSleepStage:(id)a3;
- (void)setHighlightedSleepStageStorage:(id)a3;
- (void)setSleepStageBackgroundFillStyle:(id)a3;
- (void)setSleepStageBackgroundFillStyleStorage:(id)a3;
- (void)setSleepStageBackgroundInactiveFillStyle:(id)a3;
- (void)setSleepStageBackgroundInactiveFillStyleStorage:(id)a3;
- (void)setSleepStageFillStyles:(id)a3;
- (void)setSleepStageFillStylesStorage:(id)a3;
- (void)setSleepStageLabelColor:(id)a3;
- (void)setSleepStageLabelColorStorage:(id)a3;
- (void)setSleepStageLabelFont:(id)a3;
- (void)setSleepStageLabelFontStorage:(id)a3;
@end

@implementation HKSleepStageDaySeries

- (HKSleepStageDaySeries)init
{
  v12.receiver = self;
  v12.super_class = (Class)HKSleepStageDaySeries;
  v2 = [(HKGraphSeries *)&v12 init];
  v3 = v2;
  if (v2)
  {
    v2->_cornerRadiiStorage.width = 0.0;
    v2->_cornerRadiiStorage.height = 0.0;
    sleepStageFillStylesStorage = v2->_sleepStageFillStylesStorage;
    v2->_sleepStageFillStylesStorage = (NSArray *)MEMORY[0x1E4F1CBF0];

    sleepStageBackgroundFillStyleStorage = v3->_sleepStageBackgroundFillStyleStorage;
    v3->_sleepStageBackgroundFillStyleStorage = 0;

    sleepStageBackgroundInactiveFillStyleStorage = v3->_sleepStageBackgroundInactiveFillStyleStorage;
    v3->_sleepStageBackgroundInactiveFillStyleStorage = 0;

    sleepStageLabelFontStorage = v3->_sleepStageLabelFontStorage;
    v3->_sleepStageLabelFontStorage = 0;

    sleepStageLabelColorStorage = v3->_sleepStageLabelColorStorage;
    v3->_sleepStageLabelColorStorage = 0;

    v9 = (NSLock *)objc_alloc_init(MEMORY[0x1E4F28E08]);
    seriesMutableStateLock = v3->_seriesMutableStateLock;
    v3->_seriesMutableStateLock = v9;

    [(NSLock *)v3->_seriesMutableStateLock setName:@"HKSleepStageDaySeriesLock"];
  }
  return v3;
}

- (CGSize)cornerRadii
{
  v3 = [(HKSleepStageDaySeries *)self seriesMutableStateLock];
  [v3 lock];

  CGFloat width = self->_cornerRadiiStorage.width;
  CGFloat height = self->_cornerRadiiStorage.height;
  v6 = [(HKSleepStageDaySeries *)self seriesMutableStateLock];
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
  v6 = [(HKSleepStageDaySeries *)self seriesMutableStateLock];
  [v6 lock];

  self->_cornerRadiiStorage.CGFloat width = width;
  self->_cornerRadiiStorage.CGFloat height = height;
  id v7 = [(HKSleepStageDaySeries *)self seriesMutableStateLock];
  [v7 unlock];
}

- (HKFillStyle)sleepStageBackgroundFillStyle
{
  v3 = [(HKSleepStageDaySeries *)self seriesMutableStateLock];
  [v3 lock];

  v4 = self->_sleepStageBackgroundFillStyleStorage;
  v5 = [(HKSleepStageDaySeries *)self seriesMutableStateLock];
  [v5 unlock];

  return v4;
}

- (void)setSleepStageBackgroundFillStyle:(id)a3
{
  id v4 = a3;
  v5 = [(HKSleepStageDaySeries *)self seriesMutableStateLock];
  [v5 lock];

  v6 = (HKFillStyle *)[v4 copy];
  sleepStageBackgroundFillStyleStorage = self->_sleepStageBackgroundFillStyleStorage;
  self->_sleepStageBackgroundFillStyleStorage = v6;

  id v8 = [(HKSleepStageDaySeries *)self seriesMutableStateLock];
  [v8 unlock];
}

- (HKFillStyle)sleepStageBackgroundInactiveFillStyle
{
  v3 = [(HKSleepStageDaySeries *)self seriesMutableStateLock];
  [v3 lock];

  id v4 = self->_sleepStageBackgroundInactiveFillStyleStorage;
  v5 = [(HKSleepStageDaySeries *)self seriesMutableStateLock];
  [v5 unlock];

  return v4;
}

- (void)setSleepStageBackgroundInactiveFillStyle:(id)a3
{
  id v4 = a3;
  v5 = [(HKSleepStageDaySeries *)self seriesMutableStateLock];
  [v5 lock];

  v6 = (HKFillStyle *)[v4 copy];
  sleepStageBackgroundInactiveFillStyleStorage = self->_sleepStageBackgroundInactiveFillStyleStorage;
  self->_sleepStageBackgroundInactiveFillStyleStorage = v6;

  id v8 = [(HKSleepStageDaySeries *)self seriesMutableStateLock];
  [v8 unlock];
}

- (NSArray)sleepStageFillStyles
{
  v3 = [(HKSleepStageDaySeries *)self seriesMutableStateLock];
  [v3 lock];

  id v4 = self->_sleepStageFillStylesStorage;
  v5 = [(HKSleepStageDaySeries *)self seriesMutableStateLock];
  [v5 unlock];

  return v4;
}

- (void)setSleepStageFillStyles:(id)a3
{
  id v4 = a3;
  v5 = [(HKSleepStageDaySeries *)self seriesMutableStateLock];
  [v5 lock];

  v6 = (NSArray *)[v4 copy];
  sleepStageFillStylesStorage = self->_sleepStageFillStylesStorage;
  self->_sleepStageFillStylesStorage = v6;

  id v8 = [(HKSleepStageDaySeries *)self seriesMutableStateLock];
  [v8 unlock];
}

- (NSNumber)highlightedSleepStage
{
  v3 = [(HKSleepStageDaySeries *)self seriesMutableStateLock];
  [v3 lock];

  id v4 = self->_highlightedSleepStageStorage;
  v5 = [(HKSleepStageDaySeries *)self seriesMutableStateLock];
  [v5 unlock];

  return v4;
}

- (void)setHighlightedSleepStage:(id)a3
{
  id v4 = (NSNumber *)a3;
  v5 = [(HKSleepStageDaySeries *)self seriesMutableStateLock];
  [v5 lock];

  highlightedSleepStageStorage = self->_highlightedSleepStageStorage;
  self->_highlightedSleepStageStorage = v4;

  id v7 = [(HKSleepStageDaySeries *)self seriesMutableStateLock];
  [v7 unlock];

  [(HKSleepStageDaySeries *)self _rebuildFillStyles];
}

- (UIFont)sleepStageLabelFont
{
  v3 = [(HKSleepStageDaySeries *)self seriesMutableStateLock];
  [v3 lock];

  id v4 = self->_sleepStageLabelFontStorage;
  v5 = [(HKSleepStageDaySeries *)self seriesMutableStateLock];
  [v5 unlock];

  return v4;
}

- (void)setSleepStageLabelFont:(id)a3
{
  id v4 = (UIFont *)a3;
  v5 = [(HKSleepStageDaySeries *)self seriesMutableStateLock];
  [v5 lock];

  sleepStageLabelFontStorage = self->_sleepStageLabelFontStorage;
  self->_sleepStageLabelFontStorage = v4;

  id v7 = [(HKSleepStageDaySeries *)self seriesMutableStateLock];
  [v7 unlock];
}

- (UIColor)sleepStageLabelColor
{
  v3 = [(HKSleepStageDaySeries *)self seriesMutableStateLock];
  [v3 lock];

  id v4 = self->_sleepStageLabelColorStorage;
  v5 = [(HKSleepStageDaySeries *)self seriesMutableStateLock];
  [v5 unlock];

  return v4;
}

- (void)setSleepStageLabelColor:(id)a3
{
  id v4 = (UIColor *)a3;
  v5 = [(HKSleepStageDaySeries *)self seriesMutableStateLock];
  [v5 lock];

  sleepStageLabelColorStorage = self->_sleepStageLabelColorStorage;
  self->_sleepStageLabelColorStorage = v4;

  id v7 = [(HKSleepStageDaySeries *)self seriesMutableStateLock];
  [v7 unlock];
}

- (BOOL)supportsMultiTouchSelection
{
  return 0;
}

- (int64_t)overlayType
{
  return 2;
}

- (id)coordinatesForBlock:(id)a3 blockPath:(HKGraphSeriesDataBlockPath *)a4 xAxis:(id)a5 yAxis:(id)a6
{
  id v10 = a5;
  v11 = [a3 chartPoints];
  if (!v11)
  {
    v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"HKSleepStageDaySeries.m", 340, @"Invalid parameter not satisfying: %@", @"points != nil" object file lineNumber description];
  }
  objc_super v12 = [v10 transform];
  v13 = objc_opt_new();
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __67__HKSleepStageDaySeries_coordinatesForBlock_blockPath_xAxis_yAxis___block_invoke;
  v21[3] = &unk_1E6D55E48;
  id v22 = v12;
  v23 = self;
  id v24 = v13;
  id v14 = v13;
  id v15 = v12;
  [v11 enumerateObjectsUsingBlock:v21];
  long long v19 = *(_OWORD *)&a4->index;
  int64_t resolution = a4->resolution;
  v16 = +[HKGraphSeriesBlockCoordinateList coordinateListWithCoordinates:v14 blockPath:&v19];

  return v16;
}

void __67__HKSleepStageDaySeries_coordinatesForBlock_blockPath_xAxis_yAxis___block_invoke(uint64_t a1, void *a2)
{
  id v20 = a2;
  v3 = [v20 yValue];

  if (v3)
  {
    id v4 = *(void **)(a1 + 32);
    v5 = [v20 startDate];
    [v4 coordinateForValue:v5];
    double v7 = v6;

    id v8 = *(void **)(a1 + 32);
    v9 = [v20 endDate];
    [v8 coordinateForValue:v9];
    double v11 = v10;

    objc_super v12 = [*(id *)(a1 + 40) highlightedSleepStage];

    if (v12)
    {
      v13 = [v20 userInfo];
      [v13 setAnnotationOverridePrefixColorsActive:MEMORY[0x1E4F1CC28]];
    }
    id v14 = *(void **)(a1 + 48);
    id v15 = [HKSleepStageDayCoordinate alloc];
    v16 = [v20 yValue];
    uint64_t v17 = (int)[v16 intValue];
    v18 = [v20 userInfo];
    long long v19 = [(HKSleepStageDayCoordinate *)v15 initWithXValueStart:v17 xValueEnd:v18 sleepStage:v7 userInfo:v11];
    [v14 addObject:v19];
  }
}

- (void)drawSeriesWithBlockCoordinates:(id)a3 axisRect:(CGRect)a4 zoomLevelConfiguration:(id)a5 pointTransform:(CGAffineTransform *)a6 renderContext:(CGContext *)a7 secondaryRenderContext:(id)a8 seriesRenderingDelegate:(id)a9
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  v60[6] = *MEMORY[0x1E4F143B8];
  id v14 = (void *)MEMORY[0x1E4FB14C0];
  id v41 = a3;
  id v15 = [v14 bezierPath];
  v60[0] = v15;
  v16 = [MEMORY[0x1E4FB14C0] bezierPath];
  v60[1] = v16;
  uint64_t v17 = [MEMORY[0x1E4FB14C0] bezierPath];
  v60[2] = v17;
  v18 = [MEMORY[0x1E4FB14C0] bezierPath];
  v60[3] = v18;
  long long v19 = [MEMORY[0x1E4FB14C0] bezierPath];
  v60[4] = v19;
  id v20 = [MEMORY[0x1E4FB14C0] bezierPath];
  v60[5] = v20;
  v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v60 count:6];
  id v22 = (void *)[v21 mutableCopy];

  uint64_t v23 = 6;
  id v24 = objc_alloc_init(MEMORY[0x1E4FB14C0]);
  id v25 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [(HKSleepStageDaySeries *)self cornerRadii];
  double v27 = v26;
  double v29 = v28;
  v30 = [(HKSleepStageDaySeries *)self highlightedSleepStage];
  v31 = v30;
  if (v30)
  {
    unsigned int v32 = [v30 intValue];
    if (v32 > 5) {
      uint64_t v23 = 0;
    }
    else {
      uint64_t v23 = qword_1E0F06000[v32];
    }
  }
  BOOL v33 = [(HKGraphSeries *)self allowsSelection];
  v44[0] = MEMORY[0x1E4F143A8];
  v44[1] = 3221225472;
  v44[2] = __164__HKSleepStageDaySeries_drawSeriesWithBlockCoordinates_axisRect_zoomLevelConfiguration_pointTransform_renderContext_secondaryRenderContext_seriesRenderingDelegate___block_invoke;
  v44[3] = &unk_1E6D55E70;
  BOOL v59 = v33;
  id v45 = v31;
  v46 = self;
  double v51 = x;
  double v52 = y;
  double v53 = width;
  double v54 = height;
  double v55 = v27;
  double v56 = v29;
  double v57 = v27 + 0.75;
  double v58 = v29 + 0.75;
  id v47 = v22;
  id v48 = v24;
  id v49 = v25;
  uint64_t v50 = v23;
  long long v34 = *(_OWORD *)&a6->c;
  v43[0] = *(_OWORD *)&a6->a;
  v43[1] = v34;
  v43[2] = *(_OWORD *)&a6->tx;
  id v35 = v25;
  id v36 = v24;
  id v37 = v22;
  id v38 = v31;
  [v41 enumerateCoordinatesWithTransform:v43 roundToViewScale:1 block:v44];

  -[HKSleepStageDaySeries _drawStagesBackgroundWithRects:buildPath:cornerRadii:highlightedSleepStage:axisRect:renderContext:](self, "_drawStagesBackgroundWithRects:buildPath:cornerRadii:highlightedSleepStage:axisRect:renderContext:", v35, v36, v38, a7, v27 + 0.75, v29 + 0.75, x, y, width, height);
  v39 = [(HKSleepStageDaySeries *)self sleepStageFillStyles];
  -[HKSleepStageDaySeries _drawPaths:withFillStyles:axisRect:context:](self, "_drawPaths:withFillStyles:axisRect:context:", v37, v39, a7, x, y, width, height);
}

void __164__HKSleepStageDaySeries_drawSeriesWithBlockCoordinates_axisRect_zoomLevelConfiguration_pointTransform_renderContext_secondaryRenderContext_seriesRenderingDelegate___block_invoke(uint64_t a1, void *a2)
{
  id v38 = a2;
  v3 = [v38 userInfo];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v5 = [v38 userInfo];
    double v6 = [v5 sleepDaySummary];
  }
  else
  {
    double v6 = 0;
  }
  if ([v38 sleepStage] == 5 || (uint64_t v7 = objc_msgSend(v38, "sleepStage"), v8 = v38, v7 == 4))
  {
    int v9 = 0;
    BOOL v10 = ([v6 hasSleepStageData] & 1) == 0 && *(unsigned char *)(a1 + 144) != 0;
    id v8 = v38;
  }
  else
  {
    BOOL v10 = 0;
    int v9 = 1;
  }
  int v11 = *(unsigned __int8 *)(a1 + 144);
  if (*(unsigned char *)(a1 + 144))
  {
    if (*(void *)(a1 + 32))
    {
      uint64_t v12 = *(void *)(a1 + 72);
      uint64_t v13 = [v8 sleepStage];
      id v8 = v38;
      int v11 = v12 == v13;
      BOOL v14 = *(unsigned char *)(a1 + 144) == 0;
    }
    else
    {
      BOOL v14 = 0;
      int v11 = 1;
    }
  }
  else
  {
    BOOL v14 = 1;
  }
  BOOL v15 = v10 || v14;
  if (v10)
  {
    objc_msgSend(*(id *)(a1 + 40), "_nonSleepStageBarRectForCoordinate:axisRect:", v8, *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96), *(double *)(a1 + 104));
    double v17 = v16;
    double v19 = v18;
    double v21 = v20;
    double v23 = v22;
  }
  else
  {
    int v24 = v9 & v11;
    objc_msgSend(*(id *)(a1 + 40), "_sleepStageBarRectForCoordinate:axisRect:", v8, *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96), *(double *)(a1 + 104));
    double v17 = v25;
    double v19 = v26;
    double v21 = v27;
    double v23 = v28;
    if (v24 != 1) {
      goto LABEL_20;
    }
  }
  double v29 = objc_msgSend(*(id *)(a1 + 48), "objectAtIndexedSubscript:", objc_msgSend(v38, "sleepStage"));
  v30 = +[HKBarSeries barSeriesRoundedRect:byRoundingCorners:cornerRadii:](HKBarSeries, "barSeriesRoundedRect:byRoundingCorners:cornerRadii:", -1, v17, v19, v21, v23, *(double *)(a1 + 112), *(double *)(a1 + 120));
  [v29 appendPath:v30];

LABEL_20:
  if (!v15)
  {
    double v31 = v17 + -1.5;
    double v32 = v19 + -1.5;
    double v33 = v21 + 3.0;
    double v34 = v23 + 3.0;
    id v35 = +[HKBarSeries barSeriesRoundedRect:byRoundingCorners:cornerRadii:](HKBarSeries, "barSeriesRoundedRect:byRoundingCorners:cornerRadii:", -1, v31, v32, v33, v34, *(double *)(a1 + 128), *(double *)(a1 + 136));
    [*(id *)(a1 + 56) appendPath:v35];
    id v36 = *(void **)(a1 + 64);
    id v37 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRect:", v31, v32, v33, v34);
    [v36 addObject:v37];
  }
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
      BOOL v15 = [v19 objectAtIndexedSubscript:v14];
      if (([v15 isEmpty] & 1) == 0)
      {
        double v16 = [v13 objectAtIndexedSubscript:v14];
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

- (void)_drawStagesBackgroundWithRects:(id)a3 buildPath:(id)a4 cornerRadii:(CGSize)a5 highlightedSleepStage:(id)a6 axisRect:(CGRect)a7 renderContext:(CGContext *)a8
{
  double height = a7.size.height;
  double width = a7.size.width;
  double y = a7.origin.y;
  double x = a7.origin.x;
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v16 = a4;
  uint64_t v17 = [(HKSleepStageDaySeries *)self mergeOverlappingRects:a3];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v27 objects:v33 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v28 != v20) {
          objc_enumerationMutation(v17);
        }
        [*(id *)(*((void *)&v27 + 1) + 8 * i) CGRectValue];
        double v22 = +[HKBarSeries barSeriesRoundedRect:byRoundingCorners:cornerRadii:](HKBarSeries, "barSeriesRoundedRect:byRoundingCorners:cornerRadii:", -1);
        [v16 appendPath:v22];
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v27 objects:v33 count:16];
    }
    while (v19);
  }
  double v23 = [(HKSleepStageDaySeries *)self _buildConnectionPathFromBackgroundRects:v17];
  [v16 appendPath:v23];
  if (a6) {
    [(HKSleepStageDaySeries *)self sleepStageBackgroundInactiveFillStyle];
  }
  else {
  int v24 = [(HKSleepStageDaySeries *)self sleepStageBackgroundFillStyle];
  }
  id v32 = v16;
  double v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v32 count:1];
  double v31 = v24;
  double v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v31 count:1];
  -[HKSleepStageDaySeries _drawPaths:withFillStyles:axisRect:context:](self, "_drawPaths:withFillStyles:axisRect:context:", v25, v26, a8, x, y, width, height);
}

- (id)_buildConnectionPathFromBackgroundRects:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4FB14C0]);
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v35 objects:v40 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v30 = *(void *)v36;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v36 != v30) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v35 + 1) + 8 * i) CGRectValue];
        double v11 = v10;
        double v13 = v12;
        double v15 = v14;
        double v17 = v16;
        long long v31 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        long long v34 = 0u;
        id v18 = v6;
        uint64_t v19 = [v18 countByEnumeratingWithState:&v31 objects:v39 count:16];
        if (v19)
        {
          uint64_t v20 = v19;
          uint64_t v21 = *(void *)v32;
          do
          {
            for (uint64_t j = 0; j != v20; ++j)
            {
              if (*(void *)v32 != v21) {
                objc_enumerationMutation(v18);
              }
              [*(id *)(*((void *)&v31 + 1) + 8 * j) CGRectValue];
              if (v23 > v11 && v23 <= v11 + v15)
              {
                long long v28 = -[HKSleepStageDaySeries _buildConnectionFromStageRect:toStageRect:](self, "_buildConnectionFromStageRect:toStageRect:", v11, v13, v15, v17, v23, v24, v25, v26);
                [v5 appendPath:v28];
              }
            }
            uint64_t v20 = [v18 countByEnumeratingWithState:&v31 objects:v39 count:16];
          }
          while (v20);
        }
      }
      uint64_t v8 = [v18 countByEnumeratingWithState:&v35 objects:v40 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)mergeOverlappingRects:(id)a3
{
  id v3 = a3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithArray:v3];
  if ((unint64_t)[v4 count] >= 2)
  {
    uint64_t v5 = 0;
    do
    {
      unint64_t v6 = v5 + 1;
      unint64_t v7 = v5 + 1;
      do
      {
        uint64_t v8 = [v4 objectAtIndexedSubscript:v5];
        [v8 CGRectValue];
        CGFloat v10 = v9;
        double v12 = v11;
        CGFloat v14 = v13;
        double v16 = v15;

        double v17 = [v4 objectAtIndexedSubscript:v7];
        [v17 CGRectValue];
        CGFloat v19 = v18;
        double v21 = v20;
        CGFloat v23 = v22;
        double v25 = v24;

        v29.origin.double x = v10;
        v29.origin.double y = v12;
        v29.size.double width = v14;
        v29.size.double height = v16;
        v32.origin.double x = v19;
        v32.origin.double y = v21;
        v32.size.double width = v23;
        v32.size.double height = v25;
        if (CGRectIntersectsRect(v29, v32) && vabdd_f64(v16, v25) < 0.1 && vabdd_f64(v12, v21) < 0.1)
        {
          v30.origin.double x = v10;
          v30.origin.double y = v12;
          v30.size.double width = v14;
          v30.size.double height = v16;
          v33.origin.double x = v19;
          v33.origin.double y = v21;
          v33.size.double width = v23;
          v33.size.double height = v25;
          CGRect v31 = CGRectUnion(v30, v33);
          double v26 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:", v31.origin.x, v31.origin.y, v31.size.width, v31.size.height);
          [v4 setObject:v26 atIndexedSubscript:v5];

          [v4 removeObjectAtIndex:v7];
        }
        else
        {
          ++v7;
        }
      }
      while (v7 < [v4 count]);
      ++v5;
    }
    while (v6 < [v4 count] - 1);
  }

  return v4;
}

- (id)_buildConnectionFromStageRect:(CGRect)a3 toStageRect:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  double v8 = a3.size.height;
  double v9 = a3.size.width;
  double v10 = a3.origin.y;
  double v11 = a3.origin.x;
  id v13 = objc_alloc_init(MEMORY[0x1E4FB14C0]);
  [(HKSleepStageDaySeries *)self cornerRadii];
  uint64_t v18 = v14;
  double v15 = -[HKSleepStageDaySeries determineTopConnectionPathFromRect:toRect:cornerRadius:](self, "determineTopConnectionPathFromRect:toRect:cornerRadius:", v11, v10, v9, v8, x, y, width, height, v14);
  [v15 startPoint];
  objc_msgSend(v13, "moveToPoint:");
  [(HKSleepStageDaySeries *)self _addSomnogramConnectionPath:v15 toBezierPath:v13];
  double v16 = -[HKSleepStageDaySeries determineBottomConnectionPathFromRect:toRect:cornerRadius:](self, "determineBottomConnectionPathFromRect:toRect:cornerRadius:", v11, v10, v9, v8, x, y, width, height, v18);
  [v16 startPoint];
  objc_msgSend(v13, "addLineToPoint:");
  [(HKSleepStageDaySeries *)self _addSomnogramConnectionPath:v16 toBezierPath:v13];
  [v13 closePath];

  return v13;
}

- (id)determineTopConnectionPathFromRect:(CGRect)a3 toRect:(CGRect)a4 cornerRadius:(double)a5
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  double v9 = -[HKSleepSomnogramBar initWithBarRect:]([HKSleepSomnogramBar alloc], "initWithBarRect:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  double v10 = -[HKSleepSomnogramBar initWithBarRect:]([HKSleepSomnogramBar alloc], "initWithBarRect:", x, y, width, height);
  double v11 = a5 * 1.5;
  switch(HKSleepSomnogramConnectionOrientationForBars(v9, v10, 1))
  {
    case 0:
    case 1:
      [(HKSleepSomnogramBar *)v10 left];
      double v13 = v12;
      [(HKSleepSomnogramBar *)v10 top];
      double v15 = v14 + a5;
      [(HKSleepSomnogramBar *)v10 left];
      double v17 = v16;
      [(HKSleepSomnogramBar *)v9 left];
      double v19 = v17 - v18;
      [(HKSleepSomnogramBar *)v10 left];
      double v21 = v20;
      if (v19 < v11) {
        goto LABEL_9;
      }
      double v21 = v20 - a5;
      [(HKSleepSomnogramBar *)v9 top];
      goto LABEL_13;
    case 2:
      [(HKSleepSomnogramBar *)v9 right];
      double v21 = v23;
      [(HKSleepSomnogramBar *)v9 top];
      double v25 = v24 + a5;
      [(HKSleepSomnogramBar *)v10 right];
      double v27 = v26;
      [(HKSleepSomnogramBar *)v9 right];
      if (v27 - v28 >= v11)
      {
        [(HKSleepSomnogramBar *)v9 right];
        double v13 = v42 + a5;
LABEL_11:
        [(HKSleepSomnogramBar *)v10 top];
        double v15 = v43;
      }
      else
      {
        [(HKSleepSomnogramBar *)v10 right];
        double v13 = v29;
        [(HKSleepSomnogramBar *)v10 top];
        double v15 = v30 + a5;
      }
LABEL_14:
      v44 = -[HKSleepSomnogramConnection initWithStartPoint:endPoint:]([HKSleepSomnogramConnection alloc], "initWithStartPoint:endPoint:", v21, v25, v13, v15);

      return v44;
    case 3:
      [(HKSleepSomnogramBar *)v10 right];
      double v13 = v34;
      [(HKSleepSomnogramBar *)v10 top];
      double v15 = v35 + a5;
      [(HKSleepSomnogramBar *)v9 right];
      double v37 = v36;
      [(HKSleepSomnogramBar *)v10 right];
      double v39 = v37 - v38;
      [(HKSleepSomnogramBar *)v10 right];
      double v21 = v40;
      if (v39 >= v11)
      {
        double v21 = v40 + a5;
        [(HKSleepSomnogramBar *)v9 bottom];
LABEL_13:
        double v25 = v22;
      }
      else
      {
LABEL_9:
        [(HKSleepSomnogramBar *)v9 top];
        double v25 = v41 + a5;
      }
      goto LABEL_14;
    case 4:
      [(HKSleepSomnogramBar *)v9 horizontalMidpoint];
      double v21 = v31;
      [(HKSleepSomnogramBar *)v9 top];
      double v25 = v32;
      [(HKSleepSomnogramBar *)v10 horizontalMidpoint];
      double v13 = v33;
      goto LABEL_11;
    default:
      double v13 = *MEMORY[0x1E4F1DAD8];
      double v15 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
      double v25 = v15;
      double v21 = *MEMORY[0x1E4F1DAD8];
      goto LABEL_14;
  }
}

- (id)determineBottomConnectionPathFromRect:(CGRect)a3 toRect:(CGRect)a4 cornerRadius:(double)a5
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  double v9 = -[HKSleepSomnogramBar initWithBarRect:]([HKSleepSomnogramBar alloc], "initWithBarRect:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  double v10 = -[HKSleepSomnogramBar initWithBarRect:]([HKSleepSomnogramBar alloc], "initWithBarRect:", x, y, width, height);
  double v11 = a5 * 1.5;
  switch(HKSleepSomnogramConnectionOrientationForBars(v9, v10, 0))
  {
    case 0:
    case 1:
      [(HKSleepSomnogramBar *)v10 left];
      double v13 = v12;
      [(HKSleepSomnogramBar *)v10 bottom];
      double v15 = v14 - a5;
      [(HKSleepSomnogramBar *)v10 left];
      double v17 = v16;
      [(HKSleepSomnogramBar *)v9 left];
      double v19 = v17 - v18;
      [(HKSleepSomnogramBar *)v10 left];
      double v21 = v20;
      if (v19 >= v11)
      {
        double v21 = v20 - a5;
        goto LABEL_11;
      }
      [(HKSleepSomnogramBar *)v9 bottom];
      double v23 = v22 - a5;
      break;
    case 2:
      [(HKSleepSomnogramBar *)v9 right];
      double v21 = v24;
      [(HKSleepSomnogramBar *)v9 bottom];
      double v23 = v25 - a5;
      [(HKSleepSomnogramBar *)v10 right];
      double v27 = v26;
      [(HKSleepSomnogramBar *)v9 right];
      double v29 = v27 - v28;
      [(HKSleepSomnogramBar *)v9 right];
      double v13 = v30;
      if (v29 >= v11)
      {
        double v13 = v30 + a5;
        [(HKSleepSomnogramBar *)v10 bottom];
        double v15 = v44;
      }
      else
      {
        [(HKSleepSomnogramBar *)v10 bottom];
        double v15 = v31 - a5;
      }
      break;
    case 3:
      [(HKSleepSomnogramBar *)v10 right];
      double v13 = v35;
      [(HKSleepSomnogramBar *)v10 top];
      double v15 = v36 + a5;
      [(HKSleepSomnogramBar *)v9 right];
      double v38 = v37;
      [(HKSleepSomnogramBar *)v10 right];
      double v40 = v38 - v39;
      [(HKSleepSomnogramBar *)v10 right];
      double v21 = v41;
      if (v40 >= v11)
      {
        double v21 = v41 + a5;
        [(HKSleepSomnogramBar *)v9 top];
        goto LABEL_14;
      }
      [(HKSleepSomnogramBar *)v9 top];
      double v23 = v42 + a5;
      break;
    case 4:
      [(HKSleepSomnogramBar *)v10 horizontalMidpoint];
      double v13 = v32;
      [(HKSleepSomnogramBar *)v10 bottom];
      double v15 = v33;
      [(HKSleepSomnogramBar *)v9 horizontalMidpoint];
      double v21 = v34;
LABEL_11:
      [(HKSleepSomnogramBar *)v9 bottom];
LABEL_14:
      double v23 = v43;
      break;
    default:
      double v21 = *MEMORY[0x1E4F1DAD8];
      double v23 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
      double v15 = v23;
      double v13 = *MEMORY[0x1E4F1DAD8];
      break;
  }
  id v45 = -[HKSleepSomnogramConnection initWithStartPoint:endPoint:]([HKSleepSomnogramConnection alloc], "initWithStartPoint:endPoint:", v13, v15, v21, v23);

  return v45;
}

- (void)_addSomnogramConnectionPath:(id)a3 toBezierPath:(id)a4
{
  id v22 = a4;
  id v5 = a3;
  [v5 startPoint];
  double v7 = v6;
  double v9 = v8;
  [v5 endPoint];
  double v11 = v10;
  double v13 = v12;

  if (v9 == v13) {
    goto LABEL_2;
  }
  double v14 = v22;
  if (v7 == v11) {
    goto LABEL_4;
  }
  double v15 = vabdd_f64(v11, v7);
  if (v7 < v11 && v9 > v13)
  {
    double v16 = v9 - v15;
    double v17 = 1.57079633;
    double v18 = 6.28318531;
LABEL_19:
    objc_msgSend(v22, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 0, v7, v16, v15, v17, v18);
LABEL_2:
    double v14 = v22;
LABEL_4:
    objc_msgSend(v14, "addLineToPoint:", v11, v13);
    goto LABEL_5;
  }
  if (v7 >= v11 || v9 >= v13)
  {
    if (v7 <= v11 || v9 <= v13)
    {
      double v16 = v9 + v15;
      double v17 = 4.71238898;
      double v18 = 3.14159265;
      goto LABEL_19;
    }
    double v19 = v13 + v15;
    objc_msgSend(v22, "addLineToPoint:", v7, v19);
    double v20 = 6.28318531;
    double v21 = 4.71238898;
  }
  else
  {
    double v19 = v13 - v15;
    objc_msgSend(v22, "addLineToPoint:", v7, v19);
    double v20 = 3.14159265;
    double v21 = 1.57079633;
  }
  objc_msgSend(v22, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 0, v11, v19, v15, v20, v21);
LABEL_5:
}

- (void)drawOverlayInContext:(CGContext *)a3 seriesOverlayData:(id)a4
{
  id v6 = a4;
  if ([v6 count] == 1 && -[HKGraphSeries allowsSelection](self, "allowsSelection"))
  {
    double v7 = [v6 firstObject];
    double v8 = [v7 graphSeriesCoordinates];
    double v9 = [v8 coordinates];
    if (v7) {
      [v7 graphSeriesPointTransform];
    }
    else {
      memset(v31, 0, sizeof(v31));
    }
    [v7 graphSeriesScreenRect];
    double v10 = -[HKSleepStageDaySeries _visibleSleepStagesInBlockCoordinates:pointTransform:screenRect:](self, "_visibleSleepStagesInBlockCoordinates:pointTransform:screenRect:", v9, v31);

    double v11 = [MEMORY[0x1E4F1CAD0] setWithArray:&unk_1F3C1FBE8];
    if ([v10 isSubsetOfSet:v11] && objc_msgSend(v10, "count"))
    {
      double v12 = [MEMORY[0x1E4F1CAD0] setWithArray:&unk_1F3C1FC00];
      char v13 = [v10 isEqualToSet:v12];
      double v14 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
      double v15 = v14;
      if (v13)
      {
        double v16 = @"IN_BED";
        double v17 = @"HealthUI-Localizable";
      }
      else
      {
        double v16 = @"ASLEEP_UNSPECIFIED";
        double v17 = @"HealthUI-Localizable-Acacia";
      }
      double v18 = [v14 localizedStringForKey:v16 value:&stru_1F3B9CF20 table:v17];

      [v7 graphSeriesScreenRect];
      double v20 = v19;
      double v22 = v21;
      double v24 = v23;
      double v26 = v25;
      [v7 graphSeriesScreenRect];
      -[HKSleepStageDaySeries _drawLabelAndRuleLineForString:inRect:horizontalOffset:verticalOffset:axisRect:context:](self, "_drawLabelAndRuleLineForString:inRect:horizontalOffset:verticalOffset:axisRect:context:", v18, a3, v20, v22, v24, v26, 6.0, 6.0, v27, v28, v29, v30);
    }
    else
    {
      [v7 graphSeriesScreenRect];
      -[HKSleepStageDaySeries _drawSleepStageLabels:axisRect:](self, "_drawSleepStageLabels:axisRect:", a3);
    }
  }
}

- (void)_drawSleepStageLabels:(CGContext *)a3 axisRect:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  v31[4] = *MEMORY[0x1E4F143B8];
  double v25 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  double v24 = [v25 localizedStringForKey:@"STAGES_OVERLAY_CONTEXT_AWAKE" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-Acacia"];
  v31[0] = v24;
  double v10 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  double v11 = [v10 localizedStringForKey:@"STAGES_OVERLAY_CONTEXT_REM" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-Acacia"];
  v31[1] = v11;
  double v12 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  char v13 = [v12 localizedStringForKey:@"STAGES_OVERLAY_CONTEXT_CORE" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-Acacia"];
  v31[2] = v13;
  double v14 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  double v15 = [v14 localizedStringForKey:@"STAGES_OVERLAY_CONTEXT_DEEP" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-Acacia"];
  _OWORD v31[3] = v15;
  double v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:4];

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v17 = v16;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = 0;
    uint64_t v21 = *(void *)v27;
    do
    {
      uint64_t v22 = 0;
      do
      {
        if (*(void *)v27 != v21) {
          objc_enumerationMutation(v17);
        }
        uint64_t v23 = *(void *)(*((void *)&v26 + 1) + 8 * v22);
        -[HKSleepStageDaySeries _enumerationRectForStage:axisRect:](self, "_enumerationRectForStage:axisRect:", v20 + v22, x, y, width, height);
        [(HKSleepStageDaySeries *)self _drawLabelAndRuleLineForString:v23 inRect:a3 horizontalOffset:*(void *)&x verticalOffset:*(void *)&y axisRect:*(void *)&width context:*(void *)&height];
        ++v22;
      }
      while (v19 != v22);
      uint64_t v19 = [v17 countByEnumeratingWithState:&v26 objects:v30 count:16];
      v20 += v22;
    }
    while (v19);
  }
}

- (void)_drawLabelAndRuleLineForString:(id)a3 inRect:(CGRect)a4 horizontalOffset:(double)a5 verticalOffset:(double)a6 axisRect:(CGRect)a7 context:(CGContext *)a8
{
  double height = a4.size.height;
  double y = a4.origin.y;
  double x = a4.origin.x;
  v29[2] = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  uint64_t v16 = [(HKSleepStageDaySeries *)self sleepStageLabelFont];
  if (v16)
  {
    id v17 = (void *)v16;
    uint64_t v18 = [(HKSleepStageDaySeries *)self sleepStageLabelColor];

    if (v18)
    {
      v28[0] = *MEMORY[0x1E4FB06F8];
      uint64_t v19 = [(HKSleepStageDaySeries *)self sleepStageLabelFont];
      v29[0] = v19;
      v28[1] = *MEMORY[0x1E4FB0700];
      uint64_t v20 = [(HKSleepStageDaySeries *)self sleepStageLabelColor];
      v29[1] = v20;
      uint64_t v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:v28 count:2];

      id v22 = [(HKSleepStageDaySeries *)self sleepStageLabelColor];
      uint64_t v23 = (CGColor *)[v22 CGColor];

      [v15 sizeWithAttributes:v21];
      objc_msgSend(v15, "drawInRect:withAttributes:", v21, x + a5, y + a6, v24, v25);
      CGFloat v26 = y + height;
      CGContextSetStrokeColorWithColor(a8, v23);
      double v27 = HKUIOnePixel();
      CGContextSetLineWidth(a8, v27);
      CGContextMoveToPoint(a8, a7.origin.x, v26);
      CGContextAddLineToPoint(a8, a7.origin.x + a7.size.width, v26);
      CGContextStrokePath(a8);
    }
  }
}

- (id)_visibleSleepStagesInBlockCoordinates:(id)a3 pointTransform:(CGAffineTransform *)a4 screenRect:(CGRect)a5
{
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __89__HKSleepStageDaySeries__visibleSleepStagesInBlockCoordinates_pointTransform_screenRect___block_invoke;
  v8[3] = &__block_descriptor_112_e35__16__0__HKSleepStageDayCoordinate_8l;
  long long v5 = *(_OWORD *)&a4->c;
  long long v9 = *(_OWORD *)&a4->a;
  long long v10 = v5;
  long long v11 = *(_OWORD *)&a4->tx;
  CGRect v12 = a5;
  id v6 = objc_msgSend(a3, "hk_mapToSet:", v8);
  return v6;
}

id __89__HKSleepStageDaySeries__visibleSleepStagesInBlockCoordinates_pointTransform_screenRect___block_invoke(double *a1, void *a2)
{
  id v3 = a2;
  [v3 startXValue];
  double v5 = a1[8] + a1[6] * 0.0 + a1[4] * v4;
  double v6 = a1[10];
  if (v5 >= v6 && v5 <= v6 + a1[12])
  {
    double v7 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v3, "sleepStage"));
  }
  else
  {
    double v7 = 0;
  }

  return v7;
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
  -[HKSleepStageDaySeries xAxisDistanceFromPoint:blockCoordinate:chartRect:](self, "xAxisDistanceFromPoint:blockCoordinate:chartRect:", v12, v10, v9, x, y, width, height);
  double v14 = v13;
  -[HKSleepStageDaySeries yAxisDifferenceToPoint:blockCoordinate:chartRect:](self, "yAxisDifferenceToPoint:blockCoordinate:chartRect:", v12, v10, v9, x, y, width, height);
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
    [v15 handleFailureInMethod:a2 object:self file:@"HKSleepStageDaySeries.m" lineNumber:867 description:@"xAxisSelectedCoordinate type class failure"];
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
    id v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2 object:self file:@"HKSleepStageDaySeries.m" lineNumber:877 description:@"xAxisDistanceFromPoint type class failure"];
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
    [v16 handleFailureInMethod:a2 object:self file:@"HKSleepStageDaySeries.m" lineNumber:892 description:@"yAxisDifferenceToPoint type class failure"];
  }
  -[HKSleepStageDaySeries _yAxisOffsetForCoordinate:axisRect:](self, "_yAxisOffsetForCoordinate:axisRect:", v12, x, y, width, height);
  double v14 = v13 - v9;

  return v14;
}

- (id)cacheKeysForModelRange:(id)a3 zoomScale:(double)a4
{
  return 0;
}

- (id)findAxisLabelsInModelRange:(id)a3 zoomScale:(double)a4
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (CGPoint)renderPositionForLabelLocation:(id)a3 rect:(CGRect)a4 zoomScale:(double)a5 contentOffset:(CGPoint)a6 constantOffset:(double)a7 isHorizontal:(BOOL)a8 optionalOffset:(CGPoint)a9
{
  double v9 = *MEMORY[0x1E4F1DAD8];
  double v10 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  result.double y = v10;
  result.double x = v9;
  return result;
}

- (CGRect)_nonSleepStageBarRectForCoordinate:(id)a3 axisRect:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  double y = a4.origin.y;
  CGFloat x = a4.origin.x;
  id v8 = a3;
  v21.origin.CGFloat x = x;
  v21.origin.double y = y;
  v21.size.CGFloat width = width;
  v21.size.CGFloat height = height;
  double v9 = y + (CGRectGetHeight(v21) + -40.0) * 0.5;
  [v8 xValueStart];
  uint64_t v11 = v10;
  [v8 xValueEnd];
  double v13 = v12;
  [v8 xValueStart];
  double v15 = v14;

  uint64_t v17 = 0x4044000000000000;
  uint64_t v18 = v11;
  double v19 = v9;
  double v16 = v13 - v15;
  return CGRectStandardize(*(CGRect *)&v18);
}

- (CGRect)_sleepStageBarRectForCoordinate:(id)a3 axisRect:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v9 = a3;
  -[HKSleepStageDaySeries _enumerationRectForStage:axisRect:](self, "_enumerationRectForStage:axisRect:", [v9 sleepStage], x, y, width, height);
  if (v11 + -23.0 + -12.0 >= 6.0) {
    double v12 = v11 + -23.0 + -12.0;
  }
  else {
    double v12 = 6.0;
  }
  double v13 = v10 + 23.0;
  [v9 xValueStart];
  uint64_t v15 = v14;
  [v9 xValueEnd];
  double v17 = v16;
  [v9 xValueStart];
  double v19 = v18;

  uint64_t v21 = v15;
  double v22 = v13;
  double v23 = v12;
  double v20 = v17 - v19;
  return CGRectStandardize(*(CGRect *)&v21);
}

- (CGRect)_enumerationRectForStage:(int64_t)a3 axisRect:(CGRect)a4
{
  CGFloat width = a4.size.width;
  double y = a4.origin.y;
  CGFloat x = a4.origin.x;
  double v8 = CGRectGetHeight(a4) * 0.25;
  double v9 = y + v8;
  double v10 = v8 * 3.0;
  if (a3 != 5)
  {
    double v9 = y + (double)a3 * v8;
    double v10 = v8;
  }
  double v11 = v9 + 3.0;
  double v12 = x;
  double v13 = width;
  result.size.double height = v10;
  result.size.CGFloat width = v13;
  result.origin.double y = v11;
  result.origin.CGFloat x = v12;
  return result;
}

- (double)_yAxisOffsetForCoordinate:(id)a3 axisRect:(CGRect)a4
{
  -[HKSleepStageDaySeries _enumerationRectForStage:axisRect:](self, "_enumerationRectForStage:axisRect:", [a3 sleepStage], a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  return v4 + 23.0;
}

- (void)_rebuildFillStyles
{
  id v4 = [(HKSleepStageDaySeries *)self highlightedSleepStage];
  id v3 = +[HKSleepUtilities sleepStageFillStylesWithActiveSleepStage:v4];
  [(HKSleepStageDaySeries *)self setSleepStageFillStyles:v3];
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

- (NSArray)sleepStageFillStylesStorage
{
  return self->_sleepStageFillStylesStorage;
}

- (void)setSleepStageFillStylesStorage:(id)a3
{
}

- (HKFillStyle)sleepStageBackgroundFillStyleStorage
{
  return self->_sleepStageBackgroundFillStyleStorage;
}

- (void)setSleepStageBackgroundFillStyleStorage:(id)a3
{
}

- (HKFillStyle)sleepStageBackgroundInactiveFillStyleStorage
{
  return self->_sleepStageBackgroundInactiveFillStyleStorage;
}

- (void)setSleepStageBackgroundInactiveFillStyleStorage:(id)a3
{
}

- (NSNumber)highlightedSleepStageStorage
{
  return self->_highlightedSleepStageStorage;
}

- (void)setHighlightedSleepStageStorage:(id)a3
{
}

- (UIFont)sleepStageLabelFontStorage
{
  return self->_sleepStageLabelFontStorage;
}

- (void)setSleepStageLabelFontStorage:(id)a3
{
}

- (UIColor)sleepStageLabelColorStorage
{
  return self->_sleepStageLabelColorStorage;
}

- (void)setSleepStageLabelColorStorage:(id)a3
{
}

- (NSLock)seriesMutableStateLock
{
  return self->_seriesMutableStateLock;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_seriesMutableStateLock, 0);
  objc_storeStrong((id *)&self->_sleepStageLabelColorStorage, 0);
  objc_storeStrong((id *)&self->_sleepStageLabelFontStorage, 0);
  objc_storeStrong((id *)&self->_highlightedSleepStageStorage, 0);
  objc_storeStrong((id *)&self->_sleepStageBackgroundInactiveFillStyleStorage, 0);
  objc_storeStrong((id *)&self->_sleepStageBackgroundFillStyleStorage, 0);
  objc_storeStrong((id *)&self->_sleepStageFillStylesStorage, 0);
}

@end