@interface HKGraphSeries
+ (void)drawFilledMarkerInContext:(CGContext *)a3 color:(CGColor *)a4 x:(double)a5 y:(double)a6 radius:(double)a7;
+ (void)drawInnerDotMarkerInContext:(CGContext *)a3 outColor:(CGColor *)a4 inColor:(CGColor *)a5 x:(double)a6 y:(double)a7 radius:(double)a8;
- ($CCD603AA111969479C48B15BFB8EC0F1)selectedPathRange;
- ($CCD603AA111969479C48B15BFB8EC0F1)selectedPathRangeStorage;
- (BOOL)_checkInternalDirtyFlag;
- (BOOL)_setInternalDirtyFlag;
- (BOOL)adjustYAxisForLabels;
- (BOOL)adjustYAxisForLabelsStorage;
- (BOOL)allowsSelection;
- (BOOL)allowsSelectionStorage;
- (BOOL)blockCoordinate:(id)a3 greaterThan:(id)a4;
- (BOOL)blockCoordinate:(id)a3 lessThan:(id)a4;
- (BOOL)blockCoordinateIsVisibleInsideOfChartRect:(CGRect)a3 blockCoordinate:(id)a4;
- (BOOL)containsCoordinatesInChartRect:(CGRect)a3 xAxis:(id)a4 zoomScale:(double)a5 resolution:(int64_t)a6 contentOffset:(CGPoint)a7 xAxisTransform:(CGAffineTransform *)a8;
- (BOOL)drawLegendInsideSeries;
- (BOOL)drawLegendInsideSeriesStorage;
- (BOOL)drawSelectionLineBehindAllSeries;
- (BOOL)drawSelectionLineBehindAllSeriesStorage;
- (BOOL)hasAnyDataLoadedInXAxisRange:(id)a3 dateZoom:(int64_t)a4 resolution:(int64_t)a5;
- (BOOL)internalDirtyFlag;
- (BOOL)invertYAxis;
- (BOOL)invertYAxisStorage;
- (BOOL)isCriticalForAutoscale;
- (BOOL)isCriticalForAutoscaleStorage;
- (BOOL)isHighlighted;
- (BOOL)isRangeHighPriority:(id)a3;
- (BOOL)supportsMultiTouchSelection;
- (BOOL)untransformedChartPointsForTimeScope:(int64_t)a3 resolution:(int64_t)a4 range:(id)a5 completion:(id)a6;
- (BOOL)wantsRoundingDuringYRangeExpansion;
- (BOOL)wantsRoundingDuringYRangeExpansionStorage;
- (CGAffineTransform)coordinateTransformForChartRect:(SEL)a3 xAxisTransform:(CGRect)a4;
- (CGAffineTransform)coordinateTransformFromXAxisTransform:(SEL)a3 chartRect:(CGAffineTransform *)a4;
- (CGRect)adjustRect:(CGRect)a3 forFont:(id)a4;
- (CGRect)backgroundRectFromStringRect:(CGRect)a3 forFont:(id)a4;
- (HKAxis)yAxis;
- (HKAxis)yAxisStorage;
- (HKGraphSeries)init;
- (HKGraphSeriesAxisScalingRule)axisScalingRule;
- (HKGraphSeriesAxisScalingRule)axisScalingRuleStorage;
- (HKGraphSeriesDataSource)dataSource;
- (HKGraphSeriesDataSource)dataSourceStorage;
- (HKSeriesDelegate)delegate;
- (HKSeriesDelegate)delegateStorage;
- (HKValueRange)closestXCoordinateRangeStorage;
- (HKValueRange)visibleValueRange;
- (HKValueRange)visibleValueRangeStorage;
- (NSArray)detailLegendEntries;
- (NSArray)detailLegendEntriesStorage;
- (NSArray)titleLegendEntries;
- (NSArray)titleLegendEntriesStorage;
- (NSLock)seriesMutableStateLock;
- (NSMutableDictionary)cachedCoordinateListsByBlockPath;
- (NSMutableDictionary)cachedDataBlocksByBlockPath;
- (NSUUID)UUID;
- (UIColor)offScreenIndicatorColor;
- (UIColor)offScreenIndicatorColorStorage;
- (double)alpha;
- (double)alphaStorage;
- (double)distanceFromPoint:(CGPoint)a3 blockCoordinate:(id)a4 chartRect:(CGRect)a5;
- (double)distanceFromTouchPoint:(CGPoint)a3 inChartRect:(CGRect)a4 xAxis:(id)a5 zoomScale:(double)a6 resolution:(int64_t)a7 contentOffset:(CGPoint)a8 xAxisTransform:(CGAffineTransform *)a9;
- (double)offscreenIndicatorAlpha;
- (double)offscreenIndicatorAlphaStorage;
- (double)xAxisDistanceFromPoint:(CGPoint)a3 blockCoordinate:(id)a4 chartRect:(CGRect)a5;
- (double)xAxisSelectedCoordinate:(double)a3 blockCoordinate:(id)a4 chartRect:(CGRect)a5;
- (double)yAxisDifferenceToPoint:(CGPoint)a3 blockCoordinate:(id)a4 chartRect:(CGRect)a5;
- (id)_cachedCoordinatesForBlockPath:(HKGraphSeriesDataBlockPath *)a3;
- (id)_clipYAxisValueRangeIfNecessary:(id)a3;
- (id)_coordinateListsForGeneratorWithXAxis:(id)a3 zoomScale:(double)a4 chartRect:(CGRect)a5 contentOffset:(CGPoint)a6 resolution:(int64_t)a7;
- (id)_coordinateListsWithXValueRange:(id)a3 xAxis:(id)a4 zoomLevel:(int64_t)a5 resolution:(int64_t)a6;
- (id)_coordinatesForBlockPath:(HKGraphSeriesDataBlockPath *)a3 xAxis:(id)a4;
- (id)_dataBlockForBlockPath:(HKGraphSeriesDataBlockPath *)a3;
- (id)_expandYRange:(id)a3 withXRange:(id)a4 dateZoom:(int64_t)a5 resolution:(int64_t)a6 chartRect:(CGRect)a7;
- (id)_getBlockFromDataSource:(HKGraphSeriesDataBlockPath *)a3;
- (id)_visibleXValueRangeWithAxis:(id)a3 chartRect:(CGRect)a4 contentOffset:(CGPoint)a5 zoomScale:(double)a6;
- (id)closestXCoordinateRange;
- (id)coordinatesForBlock:(id)a3 blockPath:(HKGraphSeriesDataBlockPath *)a4 xAxis:(id)a5 yAxis:(id)a6;
- (id)filteredPointSelectionContexts:(id)a3 forTouchPoints:(id)a4 resultsDidChange:(BOOL *)a5;
- (id)findVisibleBlockCoordinatesForChartRect:(CGRect)a3 xAxis:(id)a4 zoomScale:(double)a5 resolution:(int64_t)a6 contentOffset:(CGPoint)a7 xAxisTransform:(CGAffineTransform *)a8;
- (id)marginsForYAxis:(id)a3 xAxisRange:(id)a4 zoomLevel:(int64_t)a5 chartRect:(CGRect)a6;
- (id)overlayIdentifier;
- (id)overlayInteractiveViewsWithDelegate:(id)a3;
- (id)seriesCoordinatesWithXAxis:(id)a3 chartRect:(CGRect)a4 zoomScale:(double)a5 contentOffset:(CGPoint)a6 resolution:(int64_t)a7;
- (id)seriesDataSourceContext;
- (id)seriesDataSourceContextStorage;
- (id)valueRangeForYAxisWithXAxisRange:(id)a3 dateZoom:(int64_t)a4 resolution:(int64_t)a5 chartRect:(CGRect)a6;
- (int64_t)overlayType;
- (int64_t)resolutionForTimeScope:(int64_t)a3 traitResolution:(int64_t)a4;
- (unint64_t)_mainThreadJoinTimeout;
- (void)_cacheCoordinates:(id)a3 forBlockPath:(HKGraphSeriesDataBlockPath *)a4;
- (void)_clearInternalDirtyFlag;
- (void)_enumeratePathIndexesInValueRange:(id)a3 zoomLevel:(int64_t)a4 resolution:(int64_t)a5 block:(id)a6;
- (void)_requestDataSourceBlocksFromPath:(HKGraphSeriesDataBlockPath *)a3 toPath:(HKGraphSeriesDataBlockPath *)a4;
- (void)_setDirtyWithNewData:(BOOL)a3;
- (void)dataSourceDidUpdateCache:(id)a3;
- (void)dealloc;
- (void)deselectPath;
- (void)drawSeriesWithBlockCoordinates:(id)a3 axisRect:(CGRect)a4 zoomLevelConfiguration:(id)a5 pointTransform:(CGAffineTransform *)a6 renderContext:(CGContext *)a7 secondaryRenderContext:(id)a8 seriesRenderingDelegate:(id)a9;
- (void)drawWithChartRect:(CGRect)a3 seriesCoordinates:(id)a4 zoomLevelConfiguration:(id)a5 coordinateTransform:(CGAffineTransform *)a6 inContext:(CGContext *)a7 secondaryRenderContext:(id)a8 seriesRenderingDelegate:(id)a9;
- (void)enumerateChartPointsInRange:(id)a3 zoomLevel:(int64_t)a4 resolution:(int64_t)a5 block:(id)a6;
- (void)enumerateCoordinatesInChartRect:(CGRect)a3 xAxis:(id)a4 zoomScale:(double)a5 resolution:(int64_t)a6 contentOffset:(CGPoint)a7 xAxisTransform:(CGAffineTransform *)a8 roundToViewScale:(BOOL)a9 exclusionOptions:(int64_t)a10 block:(id)a11;
- (void)selectPathsinPathRange:(id *)a3 coordinateRange:(id)a4;
- (void)setAdjustYAxisForLabels:(BOOL)a3;
- (void)setAllowsSelection:(BOOL)a3;
- (void)setAlpha:(double)a3;
- (void)setAxisScalingRule:(id)a3;
- (void)setCachedCoordinateListsByBlockPath:(id)a3;
- (void)setCachedDataBlocksByBlockPath:(id)a3;
- (void)setClosestXCoordinateRange:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDetailLegendEntries:(id)a3;
- (void)setDrawLegendInsideSeries:(BOOL)a3;
- (void)setDrawSelectionLineBehindAllSeries:(BOOL)a3;
- (void)setInvertYAxis:(BOOL)a3;
- (void)setIsCriticalForAutoscale:(BOOL)a3;
- (void)setOffScreenIndicatorColor:(id)a3;
- (void)setOffscreenIndicatorAlpha:(double)a3;
- (void)setSelectedPathRange:(id *)a3;
- (void)setSeriesDataSourceContext:(id)a3;
- (void)setTitleLegendEntries:(id)a3;
- (void)setWantsRoundingDuringYRangeExpansion:(BOOL)a3;
- (void)setYAxis:(id)a3;
- (void)updateForAutoscale:(id)a3;
@end

@implementation HKGraphSeries

- (HKGraphSeries)init
{
  v23.receiver = self;
  v23.super_class = (Class)HKGraphSeries;
  v2 = [(HKGraphSeries *)&v23 init];
  if (v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F28E08]);
    v4 = (void *)*((void *)v2 + 3);
    *((void *)v2 + 3) = v3;

    [*((id *)v2 + 3) setName:@"seriesMutableStateLock"];
    v5 = (void *)*((void *)v2 + 4);
    *((void *)v2 + 4) = 0;

    *((_WORD *)v2 + 4) = 1;
    v2[10] = 1;
    v6 = (void *)*((void *)v2 + 6);
    *((void *)v2 + 6) = 0;

    v7 = (void *)*((void *)v2 + 5);
    *((void *)v2 + 5) = 0;

    v8 = (void *)*((void *)v2 + 7);
    *((void *)v2 + 7) = 0;

    v2[11] = 0;
    uint64_t v9 = [MEMORY[0x1E4F29128] UUID];
    v10 = (void *)*((void *)v2 + 2);
    *((void *)v2 + 2) = v9;

    v11 = (void *)*((void *)v2 + 8);
    *((void *)v2 + 8) = 0;

    objc_storeWeak((id *)v2 + 9, 0);
    *((_OWORD *)v2 + 9) = HKGraphSeriesDataPointPathNone;
    *((_OWORD *)v2 + 10) = unk_1E0F05AE0;
    *((_OWORD *)v2 + 11) = HKGraphSeriesDataPointPathNone;
    *((_OWORD *)v2 + 12) = unk_1E0F05AE0;
    __asm { FMOV            V0.2D, #1.0 }
    *((_OWORD *)v2 + 6) = _Q0;
    *(_WORD *)(v2 + 13) = 1;
    v17 = (void *)*((void *)v2 + 15);
    *((void *)v2 + 15) = 0;

    id v18 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v19 = (void *)*((void *)v2 + 16);
    *((void *)v2 + 16) = v18;

    id v20 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v21 = (void *)*((void *)v2 + 17);
    *((void *)v2 + 17) = v20;
  }
  return (HKGraphSeries *)v2;
}

- (void)dealloc
{
  id v3 = [(HKGraphSeries *)self dataSource];
  [v3 setDelegate:0];

  v4.receiver = self;
  v4.super_class = (Class)HKGraphSeries;
  [(HKGraphSeries *)&v4 dealloc];
}

- (HKGraphSeriesDataSource)dataSource
{
  id v3 = [(HKGraphSeries *)self seriesMutableStateLock];
  [v3 lock];

  objc_super v4 = self->_dataSourceStorage;
  v5 = [(HKGraphSeries *)self seriesMutableStateLock];
  [v5 unlock];

  return v4;
}

- (void)setYAxis:(id)a3
{
  objc_super v4 = (HKAxis *)a3;
  v5 = [(HKGraphSeries *)self seriesMutableStateLock];
  [v5 lock];

  yAxisStorage = self->_yAxisStorage;
  self->_yAxisStorage = v4;

  id v7 = [(HKGraphSeries *)self seriesMutableStateLock];
  [v7 unlock];
}

- (void)setInvertYAxis:(BOOL)a3
{
  v5 = [(HKGraphSeries *)self seriesMutableStateLock];
  [v5 lock];

  self->_invertYAxisStorage = a3;
  id v6 = [(HKGraphSeries *)self seriesMutableStateLock];
  [v6 unlock];
}

- (void)setAxisScalingRule:(id)a3
{
  objc_super v4 = (HKGraphSeriesAxisScalingRule *)a3;
  v5 = [(HKGraphSeries *)self seriesMutableStateLock];
  [v5 lock];

  axisScalingRuleStorage = self->_axisScalingRuleStorage;
  self->_axisScalingRuleStorage = v4;

  id v7 = [(HKGraphSeries *)self seriesMutableStateLock];
  [v7 unlock];
}

- (void)setIsCriticalForAutoscale:(BOOL)a3
{
  v5 = [(HKGraphSeries *)self seriesMutableStateLock];
  [v5 lock];

  self->_isCriticalForAutoscaleStorage = a3;
  id v6 = [(HKGraphSeries *)self seriesMutableStateLock];
  [v6 unlock];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedDataBlocksByBlockPath, 0);
  objc_storeStrong((id *)&self->_cachedCoordinateListsByBlockPath, 0);
  objc_storeStrong((id *)&self->_visibleValueRangeStorage, 0);
  objc_storeStrong((id *)&self->_closestXCoordinateRangeStorage, 0);
  objc_storeStrong((id *)&self->_detailLegendEntriesStorage, 0);
  objc_storeStrong((id *)&self->_titleLegendEntriesStorage, 0);
  objc_destroyWeak((id *)&self->_delegateStorage);
  objc_storeStrong((id *)&self->_yAxisStorage, 0);
  objc_storeStrong((id *)&self->_offScreenIndicatorColorStorage, 0);
  objc_storeStrong((id *)&self->_axisScalingRuleStorage, 0);
  objc_storeStrong(&self->_seriesDataSourceContextStorage, 0);
  objc_storeStrong((id *)&self->_dataSourceStorage, 0);
  objc_storeStrong((id *)&self->_seriesMutableStateLock, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
}

- (void)setDataSource:(id)a3
{
  uint64_t v9 = (HKGraphSeriesDataSource *)a3;
  v5 = [(HKGraphSeries *)self seriesMutableStateLock];
  [v5 lock];

  dataSourceStorage = self->_dataSourceStorage;
  if (dataSourceStorage == v9)
  {
    v8 = [(HKGraphSeries *)self seriesMutableStateLock];
    [v8 unlock];
  }
  else
  {
    if (dataSourceStorage) {
      [(HKGraphSeriesDataSource *)dataSourceStorage setDelegate:0];
    }
    objc_storeStrong((id *)&self->_dataSourceStorage, a3);
    [(HKGraphSeriesDataSource *)self->_dataSourceStorage setDelegate:self];
    id v7 = [(HKGraphSeries *)self seriesMutableStateLock];
    [v7 unlock];

    [(HKGraphSeries *)self _setDirtyWithNewData:0];
  }
}

- (BOOL)adjustYAxisForLabels
{
  id v3 = [(HKGraphSeries *)self seriesMutableStateLock];
  [v3 lock];

  LOBYTE(v3) = self->_adjustYAxisForLabelsStorage;
  objc_super v4 = [(HKGraphSeries *)self seriesMutableStateLock];
  [v4 unlock];

  return (char)v3;
}

- (void)setAdjustYAxisForLabels:(BOOL)a3
{
  v5 = [(HKGraphSeries *)self seriesMutableStateLock];
  [v5 lock];

  self->_adjustYAxisForLabelsStorage = a3;
  id v6 = [(HKGraphSeries *)self seriesMutableStateLock];
  [v6 unlock];
}

- (id)seriesDataSourceContext
{
  id v3 = [(HKGraphSeries *)self seriesMutableStateLock];
  [v3 lock];

  id v4 = self->_seriesDataSourceContextStorage;
  v5 = [(HKGraphSeries *)self seriesMutableStateLock];
  [v5 unlock];

  return v4;
}

- (void)setSeriesDataSourceContext:(id)a3
{
  id v4 = a3;
  v5 = [(HKGraphSeries *)self seriesMutableStateLock];
  [v5 lock];

  id seriesDataSourceContextStorage = self->_seriesDataSourceContextStorage;
  self->_id seriesDataSourceContextStorage = v4;

  id v7 = [(HKGraphSeries *)self seriesMutableStateLock];
  [v7 unlock];
}

- (BOOL)isCriticalForAutoscale
{
  id v3 = [(HKGraphSeries *)self seriesMutableStateLock];
  [v3 lock];

  LOBYTE(v3) = self->_isCriticalForAutoscaleStorage;
  id v4 = [(HKGraphSeries *)self seriesMutableStateLock];
  [v4 unlock];

  return (char)v3;
}

- (BOOL)wantsRoundingDuringYRangeExpansion
{
  id v3 = [(HKGraphSeries *)self seriesMutableStateLock];
  [v3 lock];

  LOBYTE(v3) = self->_wantsRoundingDuringYRangeExpansionStorage;
  id v4 = [(HKGraphSeries *)self seriesMutableStateLock];
  [v4 unlock];

  return (char)v3;
}

- (void)setWantsRoundingDuringYRangeExpansion:(BOOL)a3
{
  v5 = [(HKGraphSeries *)self seriesMutableStateLock];
  [v5 lock];

  self->_wantsRoundingDuringYRangeExpansionStorage = a3;
  id v6 = [(HKGraphSeries *)self seriesMutableStateLock];
  [v6 unlock];
}

- (HKGraphSeriesAxisScalingRule)axisScalingRule
{
  id v3 = [(HKGraphSeries *)self seriesMutableStateLock];
  [v3 lock];

  id v4 = self->_axisScalingRuleStorage;
  v5 = [(HKGraphSeries *)self seriesMutableStateLock];
  [v5 unlock];

  return v4;
}

- (UIColor)offScreenIndicatorColor
{
  id v3 = [(HKGraphSeries *)self seriesMutableStateLock];
  [v3 lock];

  id v4 = [(UIColor *)self->_offScreenIndicatorColorStorage colorWithAlphaComponent:self->_offscreenIndicatorAlphaStorage];
  v5 = [(HKGraphSeries *)self seriesMutableStateLock];
  [v5 unlock];

  return (UIColor *)v4;
}

- (void)setOffScreenIndicatorColor:(id)a3
{
  id v4 = (UIColor *)a3;
  v5 = [(HKGraphSeries *)self seriesMutableStateLock];
  [v5 lock];

  offScreenIndicatorColorStorage = self->_offScreenIndicatorColorStorage;
  self->_offScreenIndicatorColorStorage = v4;

  id v7 = [(HKGraphSeries *)self seriesMutableStateLock];
  [v7 unlock];
}

- (BOOL)invertYAxis
{
  id v3 = [(HKGraphSeries *)self seriesMutableStateLock];
  [v3 lock];

  LOBYTE(v3) = self->_invertYAxisStorage;
  id v4 = [(HKGraphSeries *)self seriesMutableStateLock];
  [v4 unlock];

  return (char)v3;
}

- (HKAxis)yAxis
{
  id v3 = [(HKGraphSeries *)self seriesMutableStateLock];
  [v3 lock];

  id v4 = self->_yAxisStorage;
  v5 = [(HKGraphSeries *)self seriesMutableStateLock];
  [v5 unlock];

  return v4;
}

- (HKSeriesDelegate)delegate
{
  id v3 = [(HKGraphSeries *)self seriesMutableStateLock];
  [v3 lock];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegateStorage);
  v5 = [(HKGraphSeries *)self seriesMutableStateLock];
  [v5 unlock];

  return (HKSeriesDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
  id v4 = a3;
  v5 = [(HKGraphSeries *)self seriesMutableStateLock];
  [v5 lock];

  objc_storeWeak((id *)&self->_delegateStorage, v4);
  id v6 = [(HKGraphSeries *)self seriesMutableStateLock];
  [v6 unlock];
}

- (NSArray)titleLegendEntries
{
  id v3 = [(HKGraphSeries *)self seriesMutableStateLock];
  [v3 lock];

  id v4 = self->_titleLegendEntriesStorage;
  v5 = [(HKGraphSeries *)self seriesMutableStateLock];
  [v5 unlock];

  return v4;
}

- (void)setTitleLegendEntries:(id)a3
{
  id v4 = (NSArray *)a3;
  v5 = [(HKGraphSeries *)self seriesMutableStateLock];
  [v5 lock];

  titleLegendEntriesStorage = self->_titleLegendEntriesStorage;
  self->_titleLegendEntriesStorage = v4;

  id v7 = [(HKGraphSeries *)self seriesMutableStateLock];
  [v7 unlock];
}

- (NSArray)detailLegendEntries
{
  id v3 = [(HKGraphSeries *)self seriesMutableStateLock];
  [v3 lock];

  id v4 = self->_detailLegendEntriesStorage;
  v5 = [(HKGraphSeries *)self seriesMutableStateLock];
  [v5 unlock];

  return v4;
}

- (void)setDetailLegendEntries:(id)a3
{
  id v4 = (NSArray *)a3;
  v5 = [(HKGraphSeries *)self seriesMutableStateLock];
  [v5 lock];

  detailLegendEntriesStorage = self->_detailLegendEntriesStorage;
  self->_detailLegendEntriesStorage = v4;

  id v7 = [(HKGraphSeries *)self seriesMutableStateLock];
  [v7 unlock];
}

- (BOOL)drawLegendInsideSeries
{
  id v3 = [(HKGraphSeries *)self seriesMutableStateLock];
  [v3 lock];

  LOBYTE(v3) = self->_drawLegendInsideSeriesStorage;
  id v4 = [(HKGraphSeries *)self seriesMutableStateLock];
  [v4 unlock];

  return (char)v3;
}

- (void)setDrawLegendInsideSeries:(BOOL)a3
{
  v5 = [(HKGraphSeries *)self seriesMutableStateLock];
  [v5 lock];

  self->_drawLegendInsideSeriesStorage = a3;
  id v6 = [(HKGraphSeries *)self seriesMutableStateLock];
  [v6 unlock];
}

- (double)alpha
{
  id v3 = [(HKGraphSeries *)self seriesMutableStateLock];
  [v3 lock];

  double alphaStorage = self->_alphaStorage;
  v5 = [(HKGraphSeries *)self seriesMutableStateLock];
  [v5 unlock];

  return alphaStorage;
}

- (void)setAlpha:(double)a3
{
  v5 = [(HKGraphSeries *)self seriesMutableStateLock];
  [v5 lock];

  self->_double alphaStorage = a3;
  id v6 = [(HKGraphSeries *)self seriesMutableStateLock];
  [v6 unlock];
}

- (double)offscreenIndicatorAlpha
{
  id v3 = [(HKGraphSeries *)self seriesMutableStateLock];
  [v3 lock];

  double offscreenIndicatorAlphaStorage = self->_offscreenIndicatorAlphaStorage;
  v5 = [(HKGraphSeries *)self seriesMutableStateLock];
  [v5 unlock];

  return offscreenIndicatorAlphaStorage;
}

- (void)setOffscreenIndicatorAlpha:(double)a3
{
  v5 = [(HKGraphSeries *)self seriesMutableStateLock];
  [v5 lock];

  self->_double offscreenIndicatorAlphaStorage = a3;
  id v6 = [(HKGraphSeries *)self seriesMutableStateLock];
  [v6 unlock];
}

- (BOOL)allowsSelection
{
  id v3 = [(HKGraphSeries *)self seriesMutableStateLock];
  [v3 lock];

  LOBYTE(v3) = self->_allowsSelectionStorage;
  id v4 = [(HKGraphSeries *)self seriesMutableStateLock];
  [v4 unlock];

  return (char)v3;
}

- (void)setAllowsSelection:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(HKGraphSeries *)self seriesMutableStateLock];
  [v5 lock];

  if (self->_allowsSelectionStorage == v3)
  {
    id v7 = [(HKGraphSeries *)self seriesMutableStateLock];
    [v7 unlock];
  }
  else
  {
    self->_allowsSelectionStorage = v3;
    id v6 = [(HKGraphSeries *)self seriesMutableStateLock];
    [v6 unlock];

    [(HKGraphSeries *)self _setDirtyWithNewData:0];
  }
}

- (BOOL)drawSelectionLineBehindAllSeries
{
  BOOL v3 = [(HKGraphSeries *)self seriesMutableStateLock];
  [v3 lock];

  LOBYTE(v3) = self->_drawSelectionLineBehindAllSeriesStorage;
  id v4 = [(HKGraphSeries *)self seriesMutableStateLock];
  [v4 unlock];

  return (char)v3;
}

- (void)setDrawSelectionLineBehindAllSeries:(BOOL)a3
{
  v5 = [(HKGraphSeries *)self seriesMutableStateLock];
  [v5 lock];

  self->_drawSelectionLineBehindAllSeriesStorage = a3;
  id v6 = [(HKGraphSeries *)self seriesMutableStateLock];
  [v6 unlock];
}

- ($CCD603AA111969479C48B15BFB8EC0F1)selectedPathRange
{
  v5 = [(HKGraphSeries *)self seriesMutableStateLock];
  [v5 lock];

  long long v6 = *(_OWORD *)&self->_selectedPathRangeStorage.min.blockPath.resolution;
  *(_OWORD *)&retstr->var0.var0.index = *(_OWORD *)&self->_selectedPathRangeStorage.min.blockPath.index;
  *(_OWORD *)&retstr->var0.var0.resolution = v6;
  long long v7 = *(_OWORD *)&self->_selectedPathRangeStorage.max.blockPath.resolution;
  *(_OWORD *)&retstr->var1.var0.index = *(_OWORD *)&self->_selectedPathRangeStorage.max.blockPath.index;
  *(_OWORD *)&retstr->var1.var0.resolution = v7;
  id v9 = [(HKGraphSeries *)self seriesMutableStateLock];
  [v9 unlock];

  return result;
}

- (void)setSelectedPathRange:(id *)a3
{
  v5 = [(HKGraphSeries *)self seriesMutableStateLock];
  [v5 lock];

  long long v6 = *(_OWORD *)&a3->var0.var0.index;
  long long v7 = *(_OWORD *)&a3->var0.var0.resolution;
  long long v8 = *(_OWORD *)&a3->var1.var0.resolution;
  *(_OWORD *)&self->_selectedPathRangeStorage.max.blockPath.index = *(_OWORD *)&a3->var1.var0.index;
  *(_OWORD *)&self->_selectedPathRangeStorage.max.blockPath.resolution = v8;
  *(_OWORD *)&self->_selectedPathRangeStorage.min.blockPath.index = v6;
  *(_OWORD *)&self->_selectedPathRangeStorage.min.blockPath.resolution = v7;
  id v9 = [(HKGraphSeries *)self seriesMutableStateLock];
  [v9 unlock];
}

- (id)closestXCoordinateRange
{
  BOOL v3 = [(HKGraphSeries *)self seriesMutableStateLock];
  [v3 lock];

  id v4 = self->_closestXCoordinateRangeStorage;
  v5 = [(HKGraphSeries *)self seriesMutableStateLock];
  [v5 unlock];

  return v4;
}

- (void)setClosestXCoordinateRange:(id)a3
{
  id v4 = (HKValueRange *)a3;
  v5 = [(HKGraphSeries *)self seriesMutableStateLock];
  [v5 lock];

  closestXCoordinateRangeStorage = self->_closestXCoordinateRangeStorage;
  self->_closestXCoordinateRangeStorage = v4;

  id v7 = [(HKGraphSeries *)self seriesMutableStateLock];
  [v7 unlock];
}

- (HKValueRange)visibleValueRange
{
  BOOL v3 = [(HKGraphSeries *)self seriesMutableStateLock];
  [v3 lock];

  id v4 = self->_visibleValueRangeStorage;
  v5 = [(HKGraphSeries *)self seriesMutableStateLock];
  [v5 unlock];

  return v4;
}

- (void)updateForAutoscale:(id)a3
{
  id v4 = (HKValueRange *)a3;
  v5 = [(HKGraphSeries *)self seriesMutableStateLock];
  [v5 lock];

  visibleValueRangeStorage = self->_visibleValueRangeStorage;
  self->_visibleValueRangeStorage = v4;

  id v7 = [(HKGraphSeries *)self seriesMutableStateLock];
  [v7 unlock];

  [(HKGraphSeries *)self _setDirtyWithNewData:0];
}

- (id)_expandYRange:(id)a3 withXRange:(id)a4 dateZoom:(int64_t)a5 resolution:(int64_t)a6 chartRect:(CGRect)a7
{
  id v11 = a3;
  id v12 = a4;
  v13 = objc_alloc_init(HKChartPointRangeBuilder);
  v14 = [v12 startDate];
  v15 = [v12 endDate];

  [v15 timeIntervalSinceDate:v14];
  double v17 = v16;
  id v18 = [v14 dateByAddingTimeInterval:v16 * -2.0];
  v19 = [v15 dateByAddingTimeInterval:v17 + v17];
  id v20 = +[HKValueRange valueRangeWithMinValue:v18 maxValue:v19];

  uint64_t v40 = MEMORY[0x1E4F143A8];
  uint64_t v41 = 3221225472;
  v42 = __72__HKGraphSeries__expandYRange_withXRange_dateZoom_resolution_chartRect___block_invoke;
  v43 = &unk_1E6D56380;
  int64_t v46 = a5;
  int64_t v47 = a6;
  v44 = self;
  v21 = v13;
  v45 = v21;
  [(HKGraphSeries *)self _enumeratePathIndexesInValueRange:v20 zoomLevel:a5 resolution:a6 block:&v40];
  v22 = [(HKChartPointRangeBuilder *)v21 suggestedValueRangeWithRounding:[(HKGraphSeries *)self wantsRoundingDuringYRangeExpansion]];
  if (v22)
  {
    objc_super v23 = [v11 maxValue];
    [v23 doubleValue];
    double v25 = v24;

    v26 = [v22 maxValue];
    [v26 doubleValue];
    double v28 = v27;

    if (v25 < v28) {
      double v25 = v28;
    }
    v29 = [v11 minValue];
    [v29 doubleValue];
    double v31 = v30;

    v32 = [v22 minValue];
    [v32 doubleValue];
    double v34 = v33;

    if (v31 >= v34) {
      double v35 = v34;
    }
    else {
      double v35 = v31;
    }
    v36 = [NSNumber numberWithDouble:v35];
    v37 = [NSNumber numberWithDouble:v25];
    id v38 = +[HKValueRange valueRangeWithMinValue:v36 maxValue:v37];
  }
  else
  {
    id v38 = v11;
  }

  return v38;
}

void __72__HKGraphSeries__expandYRange_withXRange_dateZoom_resolution_chartRect___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  BOOL v3 = *(void **)(a1 + 32);
  uint64_t v15 = a2;
  long long v16 = *(_OWORD *)(a1 + 48);
  id v4 = [v3 _dataBlockForBlockPath:&v15];
  v5 = v4;
  if (v4)
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v6 = objc_msgSend(v4, "chartPoints", 0);
    uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v12;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v12 != v9) {
            objc_enumerationMutation(v6);
          }
          [*(id *)(a1 + 40) visitChartPoint:*(void *)(*((void *)&v11 + 1) + 8 * v10++)];
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v17 count:16];
      }
      while (v8);
    }
  }
}

- (BOOL)hasAnyDataLoadedInXAxisRange:(id)a3 dateZoom:(int64_t)a4 resolution:(int64_t)a5
{
  id v8 = a3;
  uint64_t v9 = [(HKGraphSeries *)self yAxis];
  uint64_t v10 = (void *)v9;
  char v11 = 0;
  if (v8 && v9)
  {
    long long v24 = 0uLL;
    uint64_t v25 = 0;
    long long v12 = [(HKGraphSeries *)self dataSource];
    long long v13 = [v8 minValue];
    if (v12)
    {
      [v12 blockPathForX:v13 zoom:a4 resolution:a5];
    }
    else
    {
      long long v24 = 0uLL;
      uint64_t v25 = 0;
    }

    long long v22 = 0uLL;
    uint64_t v23 = 0;
    long long v14 = [(HKGraphSeries *)self dataSource];
    uint64_t v15 = [v8 maxValue];
    if (v14)
    {
      [v14 blockPathForX:v15 zoom:a4 resolution:a5];
    }
    else
    {
      long long v22 = 0uLL;
      uint64_t v23 = 0;
    }

    *(void *)&long long v24 = v24 - 1;
    *(void *)&long long v22 = v22 + 1;
    long long v20 = v24;
    uint64_t v21 = v25;
    long long v18 = v22;
    uint64_t v19 = v23;
    [(HKGraphSeries *)self _requestDataSourceBlocksFromPath:&v20 toPath:&v18];
    long long v16 = [(HKGraphSeries *)self dataSource];
    long long v20 = v24;
    uint64_t v21 = v25;
    long long v18 = v22;
    uint64_t v19 = v23;
    char v11 = [v16 hasAllBlocksAvailableBetweenStartPath:&v20 endPath:&v18];
  }
  return v11;
}

- (int64_t)resolutionForTimeScope:(int64_t)a3 traitResolution:(int64_t)a4
{
  return 0;
}

- (id)valueRangeForYAxisWithXAxisRange:(id)a3 dateZoom:(int64_t)a4 resolution:(int64_t)a5 chartRect:(CGRect)a6
{
  double height = a6.size.height;
  double width = a6.size.width;
  double y = a6.origin.y;
  double x = a6.origin.x;
  id v13 = a3;
  uint64_t v14 = [(HKGraphSeries *)self yAxis];
  uint64_t v15 = (void *)v14;
  long long v16 = 0;
  if (!v13 || !v14) {
    goto LABEL_19;
  }
  double v17 = [v13 minValue];
  [v17 doubleValue];
  uint64_t v19 = v18;

  long long v20 = [v13 maxValue];
  [v20 doubleValue];
  uint64_t v22 = v21;

  v55[0] = 0;
  v55[1] = v55;
  v55[2] = 0x3032000000;
  v55[3] = __Block_byref_object_copy__24;
  v55[4] = __Block_byref_object_dispose__24;
  id v56 = 0;
  uint64_t v51 = 0;
  v52 = (double *)&v51;
  uint64_t v53 = 0x2020000000;
  uint64_t v54 = 0x7FEFFFFFFFFFFFFFLL;
  uint64_t v47 = 0;
  v48 = (double *)&v47;
  uint64_t v49 = 0x2020000000;
  unint64_t v50 = 0xFFEFFFFFFFFFFFFFLL;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __80__HKGraphSeries_valueRangeForYAxisWithXAxisRange_dateZoom_resolution_chartRect___block_invoke;
  aBlock[3] = &unk_1E6D563A8;
  aBlock[4] = &v51;
  aBlock[5] = &v47;
  uint64_t v23 = _Block_copy(aBlock);
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __80__HKGraphSeries_valueRangeForYAxisWithXAxisRange_dateZoom_resolution_chartRect___block_invoke_2;
  v37[3] = &unk_1E6D563D0;
  int64_t v42 = a4;
  int64_t v43 = a5;
  v37[4] = self;
  v39 = v55;
  uint64_t v44 = v22;
  id v24 = v23;
  uint64_t v45 = v19;
  id v38 = v24;
  uint64_t v40 = &v51;
  uint64_t v41 = &v47;
  [(HKGraphSeries *)self _enumeratePathIndexesInValueRange:v13 zoomLevel:a4 resolution:a5 block:v37];
  if (v52[3] >= 1.79769313e308)
  {
    double v28 = [(HKGraphSeries *)self axisScalingRule];

    if (!v28) {
      goto LABEL_11;
    }
    v29 = [(HKGraphSeries *)self axisScalingRule];
    id v25 = [v29 noDataStartingRange];

    if (v25)
    {
      id v25 = v25;
      double v27 = v25;
    }
    else
    {
      double v27 = 0;
    }
  }
  else
  {
    objc_msgSend(NSNumber, "numberWithDouble:");
    id v25 = (id)objc_claimAutoreleasedReturnValue();
    v26 = [NSNumber numberWithDouble:v48[3]];
    double v27 = +[HKValueRange valueRangeWithMinValue:v25 maxValue:v26];
  }
  if (v27)
  {
    double v30 = -[HKGraphSeries _expandYRange:withXRange:dateZoom:resolution:chartRect:](self, "_expandYRange:withXRange:dateZoom:resolution:chartRect:", v27, v13, a4, a5, x, y, width, height);

    goto LABEL_12;
  }
LABEL_11:
  double v30 = 0;
LABEL_12:
  double v31 = [(HKGraphSeries *)self axisScalingRule];

  if (v31 && v30)
  {
    v32 = [(HKGraphSeries *)self axisScalingRule];
    uint64_t v33 = [v32 yValueRangeForRange:v30 zoomLevel:a4];

    double v30 = (void *)v33;
  }
  double v34 = -[HKGraphSeries marginsForYAxis:xAxisRange:zoomLevel:chartRect:](self, "marginsForYAxis:xAxisRange:zoomLevel:chartRect:", v30, v13, a4, x, y, width, height);

  long long v16 = [(HKGraphSeries *)self _clipYAxisValueRangeIfNecessary:v34];

  if ([(HKGraphSeries *)self adjustYAxisForLabels])
  {
    [v15 setAxisLabelEndings:0];
    uint64_t v35 = [v15 adjustValueRangeForLabels:v16];

    long long v16 = (void *)v35;
  }
  else
  {
    [v15 setAxisLabelEndings:3];
  }

  _Block_object_dispose(&v47, 8);
  _Block_object_dispose(&v51, 8);
  _Block_object_dispose(v55, 8);

LABEL_19:
  return v16;
}

void __80__HKGraphSeries_valueRangeForYAxisWithXAxisRange_dateZoom_resolution_chartRect___block_invoke(uint64_t a1, void *a2, void *a3, double a4)
{
  id v7 = a3;
  id v8 = a2;
  uint64_t v9 = [v8 xValueAsGenericType];
  [v9 doubleValue];
  double v11 = v10;

  long long v12 = [v7 xValueAsGenericType];
  [v12 doubleValue];
  double v14 = v13;

  uint64_t v15 = [v8 maxYValue];
  [v15 doubleValue];
  double v17 = v16;

  uint64_t v18 = [v7 maxYValue];
  [v18 doubleValue];
  double v20 = v19;

  uint64_t v21 = [v8 minYValue];

  [v21 doubleValue];
  double v23 = v22;

  id v24 = [v7 minYValue];

  [v24 doubleValue];
  double v26 = v25;

  double v27 = v14 - v11;
  double v28 = 1.0 - (v14 - a4) / (v14 - v11);
  double v29 = v17 + (v20 - v17) * v28;
  double v30 = v23 + (v26 - v23) * v28;
  if (v17 >= v20) {
    double v31 = v17;
  }
  else {
    double v31 = v20;
  }
  if (v23 >= v26) {
    double v32 = v26;
  }
  else {
    double v32 = v23;
  }
  BOOL v33 = v27 < 0.00000011920929;
  if (v27 < 0.00000011920929) {
    double v34 = v31;
  }
  else {
    double v34 = v29;
  }
  if (v33) {
    double v35 = v32;
  }
  else {
    double v35 = v30;
  }
  uint64_t v36 = *(void *)(*(void *)(a1 + 32) + 8);
  if (v35 >= *(double *)(v36 + 24)) {
    double v35 = *(double *)(v36 + 24);
  }
  *(double *)(v36 + 24) = v35;
  uint64_t v37 = *(void *)(*(void *)(a1 + 40) + 8);
  if (v34 < *(double *)(v37 + 24)) {
    double v34 = *(double *)(v37 + 24);
  }
  *(double *)(v37 + 24) = v34;
}

void __80__HKGraphSeries_valueRangeForYAxisWithXAxisRange_dateZoom_resolution_chartRect___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  BOOL v3 = *(void **)(a1 + 32);
  uint64_t v39 = a2;
  long long v40 = *(_OWORD *)(a1 + 72);
  id v4 = [v3 _dataBlockForBlockPath:&v39];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  v5 = objc_msgSend(v4, "chartPoints", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v35 objects:v41 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v36;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v36 != v8) {
          objc_enumerationMutation(v5);
        }
        double v10 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        double v11 = [v10 minXValueAsGenericType];
        [v11 doubleValue];
        double v13 = v12;

        double v14 = [v10 maxXValueAsGenericType];
        [v14 doubleValue];
        double v16 = v15;

        double v17 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) xValueAsGenericType];
        [v17 doubleValue];
        double v19 = v18;

        double v20 = *(double *)(a1 + 88);
        if (v13 <= v20)
        {
          if (v16 >= *(double *)(a1 + 96) && v13 <= v20)
          {
            double v25 = [v10 maxYValue];
            [v25 doubleValue];
            double v27 = v26;

            double v28 = [v10 minYValue];
            [v28 doubleValue];
            double v30 = v29;

            uint64_t v31 = *(void *)(*(void *)(a1 + 56) + 8);
            double v32 = *(double *)(v31 + 24);
            if (v30 < v32) {
              double v32 = v30;
            }
            *(double *)(v31 + 24) = v32;
            uint64_t v33 = *(void *)(*(void *)(a1 + 64) + 8);
            double v34 = *(double *)(v33 + 24);
            if (v27 >= v34) {
              double v34 = v27;
            }
            *(double *)(v33 + 24) = v34;
            uint64_t v23 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
            if (v23)
            {
              if (v19 < *(double *)(a1 + 96))
              {
                uint64_t v22 = *(void *)(a1 + 40);
                goto LABEL_25;
              }
            }
          }
        }
        else
        {
          if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)) {
            BOOL v21 = v19 < v20;
          }
          else {
            BOOL v21 = 0;
          }
          if (v21)
          {
            (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
            if (v19 < *(double *)(a1 + 96))
            {
              uint64_t v22 = *(void *)(a1 + 40);
              uint64_t v23 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
LABEL_25:
              (*(void (**)(uint64_t, uint64_t, void *))(v22 + 16))(v22, v23, v10);
            }
          }
        }
        objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v10);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v35 objects:v41 count:16];
    }
    while (v7);
  }
}

- (id)_clipYAxisValueRangeIfNecessary:(id)a3
{
  id v4 = a3;
  v5 = [v4 minValue];
  [v5 doubleValue];
  double v7 = v6;

  uint64_t v8 = [v4 maxValue];
  [v8 doubleValue];
  double v10 = v9;

  if (v4)
  {
    double v11 = [(HKGraphSeries *)self axisScalingRule];
    if (objc_opt_respondsToSelector())
    {
      double v12 = [v11 yAxisBounds];
      double v13 = [v12 minValue];
      double v14 = [v12 maxValue];
      if (v13)
      {
        double v15 = [v4 minValue];

        if (v15)
        {
          [v13 doubleValue];
          if (v16 >= v7) {
            double v7 = v16;
          }
        }
      }
      if (v14)
      {
        double v17 = [v4 maxValue];

        if (v17)
        {
          [v14 doubleValue];
          if (v18 < v10) {
            double v10 = v18;
          }
        }
      }
    }
    double v19 = [NSNumber numberWithDouble:v7];
    double v20 = [NSNumber numberWithDouble:v10];
    BOOL v21 = +[HKValueRange valueRangeWithMinValue:v19 maxValue:v20];
  }
  else
  {
    BOOL v21 = 0;
  }

  return v21;
}

- (double)xAxisSelectedCoordinate:(double)a3 blockCoordinate:(id)a4 chartRect:(CGRect)a5
{
  objc_msgSend(a4, "startXValue", a3, a5.origin.x, a5.origin.y, a5.size.width, a5.size.height);
  return result;
}

- (BOOL)blockCoordinateIsVisibleInsideOfChartRect:(CGRect)a3 blockCoordinate:(id)a4
{
  return 1;
}

- (id)seriesCoordinatesWithXAxis:(id)a3 chartRect:(CGRect)a4 zoomScale:(double)a5 contentOffset:(CGPoint)a6 resolution:(int64_t)a7
{
  double y = a6.y;
  double x = a6.x;
  double height = a4.size.height;
  double width = a4.size.width;
  double v13 = a4.origin.y;
  double v14 = a4.origin.x;
  id v16 = a3;
  double v17 = -[HKGraphSeries _coordinateListsForGeneratorWithXAxis:zoomScale:chartRect:contentOffset:resolution:](self, "_coordinateListsForGeneratorWithXAxis:zoomScale:chartRect:contentOffset:resolution:", v16, a7, a5, v14, v13, width, height, x, y);
  double v18 = NSNumber;
  double v19 = [v16 transform];
  double v20 = [v16 axisChartableValueRange];
  BOOL v21 = [v20 minValue];
  [v19 coordinateForValue:v21];
  uint64_t v22 = objc_msgSend(v18, "numberWithDouble:");
  uint64_t v23 = NSNumber;
  id v24 = [v16 transform];
  double v25 = [v16 axisChartableValueRange];

  double v26 = [v25 maxValue];
  [v24 coordinateForValue:v26];
  double v27 = objc_msgSend(v23, "numberWithDouble:");
  double v28 = +[HKValueRange valueRangeWithMinValue:v22 maxValue:v27];

  double v29 = +[HKGraphSeriesBlockCoordinateList coordinateListByCombiningSubCoordinates:v17 chartableValueRange:v28];

  return v29;
}

- (CGAffineTransform)coordinateTransformFromXAxisTransform:(SEL)a3 chartRect:(CGAffineTransform *)a4
{
  long long v5 = *(_OWORD *)&a4->c;
  v7[0] = *(_OWORD *)&a4->a;
  v7[1] = v5;
  v7[2] = *(_OWORD *)&a4->tx;
  return -[HKGraphSeries coordinateTransformForChartRect:xAxisTransform:](self, "coordinateTransformForChartRect:xAxisTransform:", v7, a5.origin.x, a5.origin.y, a5.size.width, a5.size.height);
}

- (void)drawWithChartRect:(CGRect)a3 seriesCoordinates:(id)a4 zoomLevelConfiguration:(id)a5 coordinateTransform:(CGAffineTransform *)a6 inContext:(CGContext *)a7 secondaryRenderContext:(id)a8 seriesRenderingDelegate:(id)a9
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v19 = a4;
  id v20 = a5;
  id v21 = a8;
  id v22 = a9;
  uint64_t v23 = [(HKGraphSeries *)self yAxis];
  char v24 = [v23 requiresScaling];

  if ((v24 & 1) == 0)
  {
    CGContextSaveGState(a7);
    v29.origin.double x = x;
    v29.origin.double y = y;
    v29.size.double width = width;
    v29.size.double height = height;
    if (!CGRectEqualToRect(v29, *MEMORY[0x1E4F1DB20]))
    {
      v30.origin.double x = x;
      v30.origin.double y = y;
      v30.size.double width = width;
      v30.size.double height = height;
      CGContextClipToRect(a7, v30);
    }
    [(HKGraphSeries *)self alpha];
    if (v25 < 1.0)
    {
      [(HKGraphSeries *)self alpha];
      CGContextSetAlpha(a7, v26);
    }
    long long v27 = *(_OWORD *)&a6->c;
    v28[0] = *(_OWORD *)&a6->a;
    v28[1] = v27;
    v28[2] = *(_OWORD *)&a6->tx;
    -[HKGraphSeries drawSeriesWithBlockCoordinates:axisRect:zoomLevelConfiguration:pointTransform:renderContext:secondaryRenderContext:seriesRenderingDelegate:](self, "drawSeriesWithBlockCoordinates:axisRect:zoomLevelConfiguration:pointTransform:renderContext:secondaryRenderContext:seriesRenderingDelegate:", v19, v20, v28, a7, v21, v22, x, y, width, height);
    CGContextRestoreGState(a7);
  }
}

- (CGAffineTransform)coordinateTransformForChartRect:(SEL)a3 xAxisTransform:(CGRect)a4
{
  long long v14 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  *(_OWORD *)&v19.a = *MEMORY[0x1E4F1DAB8];
  *(_OWORD *)&v19.c = v14;
  *(_OWORD *)&v19.tdouble x = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  CGFloat MinY = CGRectGetMinY(a4);
  *(_OWORD *)&v18.a = *(_OWORD *)&v19.a;
  *(_OWORD *)&v18.c = v14;
  *(_OWORD *)&v18.tdouble x = *(_OWORD *)&v19.tx;
  CGAffineTransformTranslate(&v19, &v18, 0.0, MinY);
  memset(&v18, 0, sizeof(v18));
  double v9 = [(HKGraphSeries *)self yAxis];
  [v9 pointTransform];
  HKAffineTransformFromLinearTransforms((uint64_t)&v18, 0.0, 1.0, v10, v11);

  CGAffineTransform t1 = v18;
  CGAffineTransform t2 = v19;
  CGAffineTransformConcat(&v17, &t1, &t2);
  CGAffineTransform v18 = v17;
  long long v12 = *(_OWORD *)&a5->c;
  *(_OWORD *)&t1.a = *(_OWORD *)&a5->a;
  *(_OWORD *)&t1.c = v12;
  *(_OWORD *)&t1.tdouble x = *(_OWORD *)&a5->tx;
  return CGAffineTransformConcat(retstr, &v17, &t1);
}

- (BOOL)containsCoordinatesInChartRect:(CGRect)a3 xAxis:(id)a4 zoomScale:(double)a5 resolution:(int64_t)a6 contentOffset:(CGPoint)a7 xAxisTransform:(CGAffineTransform *)a8
{
  double y = a7.y;
  double x = a7.x;
  double height = a3.size.height;
  double width = a3.size.width;
  double v15 = a3.origin.y;
  double v16 = a3.origin.x;
  id v18 = a4;
  uint64_t v23 = 0;
  char v24 = &v23;
  uint64_t v25 = 0x2020000000;
  char v26 = 0;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __104__HKGraphSeries_containsCoordinatesInChartRect_xAxis_zoomScale_resolution_contentOffset_xAxisTransform___block_invoke;
  v22[3] = &unk_1E6D563F8;
  v22[4] = &v23;
  long long v19 = *(_OWORD *)&a8->c;
  v21[0] = *(_OWORD *)&a8->a;
  v21[1] = v19;
  v21[2] = *(_OWORD *)&a8->tx;
  -[HKGraphSeries enumerateCoordinatesInChartRect:xAxis:zoomScale:resolution:contentOffset:xAxisTransform:roundToViewScale:exclusionOptions:block:](self, "enumerateCoordinatesInChartRect:xAxis:zoomScale:resolution:contentOffset:xAxisTransform:roundToViewScale:exclusionOptions:block:", v18, a6, v21, 1, 2, v22, v16, v15, width, height, a5, x, y);
  LOBYTE(a6) = *((unsigned char *)v24 + 24);
  _Block_object_dispose(&v23, 8);

  return a6;
}

uint64_t __104__HKGraphSeries_containsCoordinatesInChartRect_xAxis_zoomScale_resolution_contentOffset_xAxisTransform___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
  *a5 = 1;
  return result;
}

- (void)enumerateCoordinatesInChartRect:(CGRect)a3 xAxis:(id)a4 zoomScale:(double)a5 resolution:(int64_t)a6 contentOffset:(CGPoint)a7 xAxisTransform:(CGAffineTransform *)a8 roundToViewScale:(BOOL)a9 exclusionOptions:(int64_t)a10 block:(id)a11
{
  double y = a7.y;
  double x = a7.x;
  double height = a3.size.height;
  double width = a3.size.width;
  double v21 = a3.origin.y;
  double v22 = a3.origin.x;
  id v25 = a4;
  id v26 = a11;
  if (!v26)
  {
    double v32 = [MEMORY[0x1E4F28B00] currentHandler];
    [v32 handleFailureInMethod:a2, self, @"HKGraphSeries.m", 888, @"Invalid parameter not satisfying: %@", @"block != NULL" object file lineNumber description];
  }
  long long v27 = -[HKGraphSeries _coordinateListsForGeneratorWithXAxis:zoomScale:chartRect:contentOffset:resolution:](self, "_coordinateListsForGeneratorWithXAxis:zoomScale:chartRect:contentOffset:resolution:", v25, a6, a5, v22, v21, width, height, x, y);
  long long v48 = 0u;
  long long v49 = 0u;
  long long v47 = 0u;
  long long v28 = *(_OWORD *)&a8->c;
  v46[0] = *(_OWORD *)&a8->a;
  v46[1] = v28;
  v46[2] = *(_OWORD *)&a8->tx;
  -[HKGraphSeries coordinateTransformForChartRect:xAxisTransform:](self, "coordinateTransformForChartRect:xAxisTransform:", v46, v22, v21, width, height);
  v50.origin.double x = v22;
  v50.origin.double y = v21;
  v50.size.double width = width;
  v50.size.double height = height;
  CGFloat MinX = CGRectGetMinX(v50);
  v51.origin.double x = v22;
  v51.origin.double y = v21;
  v51.size.double width = width;
  v51.size.double height = height;
  CGFloat MaxX = CGRectGetMaxX(v51);
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __145__HKGraphSeries_enumerateCoordinatesInChartRect_xAxis_zoomScale_resolution_contentOffset_xAxisTransform_roundToViewScale_exclusionOptions_block___block_invoke;
  v33[3] = &unk_1E6D56448;
  long long v35 = v47;
  long long v36 = v48;
  long long v37 = v49;
  BOOL v45 = a9;
  CGFloat v38 = MaxX;
  CGFloat v39 = MinX;
  int64_t v40 = a10;
  double v41 = v22;
  double v42 = v21;
  double v43 = width;
  double v44 = height;
  v33[4] = self;
  id v34 = v26;
  id v31 = v26;
  [v27 enumerateObjectsUsingBlock:v33];
}

void __145__HKGraphSeries_enumerateCoordinatesInChartRect_xAxis_zoomScale_resolution_contentOffset_xAxisTransform_roundToViewScale_exclusionOptions_block___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 0;
  uint64_t v7 = *(unsigned __int8 *)(a1 + 152);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __145__HKGraphSeries_enumerateCoordinatesInChartRect_xAxis_zoomScale_resolution_contentOffset_xAxisTransform_roundToViewScale_exclusionOptions_block___block_invoke_2;
  v12[3] = &unk_1E6D56420;
  long long v15 = *(_OWORD *)(a1 + 96);
  uint64_t v16 = *(void *)(a1 + 112);
  uint64_t v8 = *(void **)(a1 + 40);
  v12[4] = *(void *)(a1 + 32);
  long long v9 = *(_OWORD *)(a1 + 136);
  long long v17 = *(_OWORD *)(a1 + 120);
  long long v18 = v9;
  id v13 = v8;
  long long v14 = &v19;
  long long v10 = *(_OWORD *)(a1 + 64);
  v11[0] = *(_OWORD *)(a1 + 48);
  v11[1] = v10;
  v11[2] = *(_OWORD *)(a1 + 80);
  [v6 enumerateCoordinatesWithTransform:v11 roundToViewScale:v7 block:v12];
  *a4 = *((unsigned char *)v20 + 24);

  _Block_object_dispose(&v19, 8);
}

void __145__HKGraphSeries_enumerateCoordinatesInChartRect_xAxis_zoomScale_resolution_contentOffset_xAxisTransform_roundToViewScale_exclusionOptions_block___block_invoke_2(uint64_t a1, void *a2, _OWORD *a3, void *a4, unsigned char *a5)
{
  id v9 = a2;
  id v10 = a4;
  [v9 startXValue];
  double v12 = v11;
  [v9 endXValue];
  BOOL v14 = v12 > *(double *)(a1 + 56) || v13 < *(double *)(a1 + 64);
  uint64_t v15 = *(void *)(a1 + 72);
  if (v15 != 2)
  {
    if (v15 == 1 && v14) {
      goto LABEL_11;
    }
LABEL_10:
    uint64_t v16 = *(void *)(a1 + 40);
    long long v17 = *(void (**)(uint64_t, id, id, _OWORD *))(v16 + 16);
    long long v18 = a3[1];
    v19[0] = *a3;
    v19[1] = v18;
    v17(v16, v10, v9, v19);
    *a5 = *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
    goto LABEL_11;
  }
  if (!v14
    && objc_msgSend(*(id *)(a1 + 32), "blockCoordinateIsVisibleInsideOfChartRect:blockCoordinate:", v9, *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96), *(double *)(a1 + 104)))
  {
    goto LABEL_10;
  }
LABEL_11:
}

- (void)dataSourceDidUpdateCache:(id)a3
{
  id v4 = [(HKGraphSeries *)self seriesMutableStateLock];
  [v4 lock];

  long long v5 = [(HKGraphSeries *)self cachedCoordinateListsByBlockPath];
  [v5 removeAllObjects];

  id v6 = [(HKGraphSeries *)self cachedDataBlocksByBlockPath];
  [v6 removeAllObjects];

  uint64_t v7 = [(HKGraphSeries *)self seriesMutableStateLock];
  [v7 unlock];

  [(HKGraphSeries *)self _setDirtyWithNewData:1];
}

- (BOOL)_setInternalDirtyFlag
{
  BOOL v3 = [(HKGraphSeries *)self seriesMutableStateLock];
  [v3 lock];

  LOBYTE(v3) = self->_internalDirtyFlag;
  self->_internalDirtyFlag = 1;
  id v4 = [(HKGraphSeries *)self seriesMutableStateLock];
  [v4 unlock];

  return (char)v3;
}

- (void)_clearInternalDirtyFlag
{
  BOOL v3 = [(HKGraphSeries *)self seriesMutableStateLock];
  [v3 lock];

  self->_internalDirtyFlag = 0;
  id v4 = [(HKGraphSeries *)self seriesMutableStateLock];
  [v4 unlock];
}

- (BOOL)_checkInternalDirtyFlag
{
  BOOL v3 = [(HKGraphSeries *)self seriesMutableStateLock];
  [v3 lock];

  LOBYTE(v3) = self->_internalDirtyFlag;
  id v4 = [(HKGraphSeries *)self seriesMutableStateLock];
  [v4 unlock];

  return (char)v3;
}

- (void)_setDirtyWithNewData:(BOOL)a3
{
  if (![(HKGraphSeries *)self _setInternalDirtyFlag])
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __38__HKGraphSeries__setDirtyWithNewData___block_invoke;
    v5[3] = &unk_1E6D53A88;
    v5[4] = self;
    BOOL v6 = a3;
    dispatch_async(MEMORY[0x1E4F14428], v5);
  }
}

void __38__HKGraphSeries__setDirtyWithNewData___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) _checkInternalDirtyFlag])
  {
    [*(id *)(a1 + 32) _clearInternalDirtyFlag];
    id v2 = [*(id *)(a1 + 32) delegate];
    [v2 seriesDidInvalidatePaths:*(void *)(a1 + 32) newDataArrived:*(unsigned __int8 *)(a1 + 40)];
  }
}

- (id)_visibleXValueRangeWithAxis:(id)a3 chartRect:(CGRect)a4 contentOffset:(CGPoint)a5 zoomScale:(double)a6
{
  if (a3)
  {
    double v6 = a5.x / a6;
    id v7 = a3;
    [v7 pointTransform];
    double v10 = HKLinearTransformInvert(v8, v9);
    double v12 = HKLinearTransformRange(v10, v11, v6);
    double v14 = v13;
    uint64_t v15 = [v7 transform];
    uint64_t v16 = objc_msgSend(v15, "valueForCoordinate:", HKRangeMin(v12, v14));

    long long v17 = [v7 transform];

    long long v18 = objc_msgSend(v17, "valueForCoordinate:", HKRangeMax(v12, v14));

    if (v16) {
      BOOL v19 = v18 == 0;
    }
    else {
      BOOL v19 = 1;
    }
    if (v19)
    {
      id v20 = 0;
    }
    else
    {
      id v20 = +[HKValueRange valueRangeWithMinValue:v16 maxValue:v18];
    }
  }
  else
  {
    id v20 = 0;
  }
  return v20;
}

- (id)_coordinateListsForGeneratorWithXAxis:(id)a3 zoomScale:(double)a4 chartRect:(CGRect)a5 contentOffset:(CGPoint)a6 resolution:(int64_t)a7
{
  double y = a6.y;
  double x = a6.x;
  double height = a5.size.height;
  double width = a5.size.width;
  double v12 = a5.origin.y;
  double v13 = a5.origin.x;
  id v16 = a3;
  long long v17 = -[HKGraphSeries _visibleXValueRangeWithAxis:chartRect:contentOffset:zoomScale:](self, "_visibleXValueRangeWithAxis:chartRect:contentOffset:zoomScale:", v16, v13, v12, width, height, x, y, a4);
  long long v18 = [v16 zoomScaleEngine];
  uint64_t v19 = [v18 zoomForZoomScale:a4];

  id v20 = [(HKGraphSeries *)self _coordinateListsWithXValueRange:v17 xAxis:v16 zoomLevel:v19 resolution:a7];

  return v20;
}

- (void)_enumeratePathIndexesInValueRange:(id)a3 zoomLevel:(int64_t)a4 resolution:(int64_t)a5 block:(id)a6
{
  id v10 = a3;
  double v11 = (void (**)(id, uint64_t, _OWORD *))a6;
  long long v24 = 0uLL;
  uint64_t v25 = 0;
  double v12 = [(HKGraphSeries *)self dataSource];
  double v13 = [v10 minValue];
  if (v12)
  {
    [v12 blockPathForX:v13 zoom:a4 resolution:a5];
  }
  else
  {
    long long v24 = 0uLL;
    uint64_t v25 = 0;
  }

  long long v22 = 0uLL;
  uint64_t v23 = 0;
  double v14 = [(HKGraphSeries *)self dataSource];
  uint64_t v15 = [v10 maxValue];
  if (v14)
  {
    [v14 blockPathForX:v15 zoom:a4 resolution:a5];
  }
  else
  {
    long long v22 = 0uLL;
    uint64_t v23 = 0;
  }

  *(void *)&long long v24 = v24 - 1;
  *(void *)&long long v22 = v22 + 1;
  long long v20 = v24;
  uint64_t v21 = v25;
  long long v18 = v22;
  uint64_t v19 = v23;
  [(HKGraphSeries *)self _requestDataSourceBlocksFromPath:&v20 toPath:&v18];
  uint64_t v16 = v24;
  if ((uint64_t)v24 <= (uint64_t)v22)
  {
    do
    {
      LOBYTE(v20) = 0;
      v11[2](v11, v16, &v20);
      if ((_BYTE)v20) {
        break;
      }
    }
    while (v16++ < (uint64_t)v22);
  }
}

- (id)_coordinateListsWithXValueRange:(id)a3 xAxis:(id)a4 zoomLevel:(int64_t)a5 resolution:(int64_t)a6
{
  id v10 = a4;
  if (a3)
  {
    id v11 = a3;
    double v12 = objc_opt_new();
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __76__HKGraphSeries__coordinateListsWithXValueRange_xAxis_zoomLevel_resolution___block_invoke;
    v17[3] = &unk_1E6D56470;
    int64_t v20 = a5;
    int64_t v21 = a6;
    v17[4] = self;
    id v18 = v10;
    id v13 = v12;
    id v19 = v13;
    [(HKGraphSeries *)self _enumeratePathIndexesInValueRange:v11 zoomLevel:a5 resolution:a6 block:v17];

    double v14 = v19;
    id v15 = v13;
  }
  else
  {
    id v15 = 0;
  }

  return v15;
}

void __76__HKGraphSeries__coordinateListsWithXValueRange_xAxis_zoomLevel_resolution___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a1 + 56);
  uint64_t v5 = *(void *)(a1 + 64);
  double v6 = *(void **)(a1 + 32);
  uint64_t v10 = a2;
  uint64_t v11 = v4;
  uint64_t v12 = v5;
  id v7 = [v6 _cachedCoordinatesForBlockPath:&v10];
  if (v7
    || (double v8 = *(void **)(a1 + 32),
        uint64_t v9 = *(void *)(a1 + 40),
        uint64_t v10 = a2,
        uint64_t v11 = v4,
        uint64_t v12 = v5,
        [v8 _coordinatesForBlockPath:&v10 xAxis:v9],
        (id v7 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    [*(id *)(a1 + 48) addObject:v7];
  }
}

- (id)_cachedCoordinatesForBlockPath:(HKGraphSeriesDataBlockPath *)a3
{
  uint64_t v5 = [(HKGraphSeries *)self seriesMutableStateLock];
  [v5 lock];

  double v6 = [(HKGraphSeries *)self cachedCoordinateListsByBlockPath];
  HKGraphSeriesDataBlockPath v11 = *a3;
  id v7 = [MEMORY[0x1E4F29238] valueWithHKGraphSeriesDataBlockPath:&v11];
  double v8 = [v6 objectForKeyedSubscript:v7];

  uint64_t v9 = [(HKGraphSeries *)self seriesMutableStateLock];
  [v9 unlock];

  return v8;
}

- (void)_cacheCoordinates:(id)a3 forBlockPath:(HKGraphSeriesDataBlockPath *)a4
{
  id v6 = a3;
  id v7 = [(HKGraphSeries *)self seriesMutableStateLock];
  [v7 lock];

  HKGraphSeriesDataBlockPath v12 = *a4;
  double v8 = [MEMORY[0x1E4F29238] valueWithHKGraphSeriesDataBlockPath:&v12];
  uint64_t v9 = [(HKGraphSeries *)self cachedCoordinateListsByBlockPath];
  uint64_t v10 = v9;
  if (v6) {
    [v9 setObject:v6 forKeyedSubscript:v8];
  }
  else {
    [v9 removeObjectForKey:v8];
  }

  HKGraphSeriesDataBlockPath v11 = [(HKGraphSeries *)self seriesMutableStateLock];
  [v11 unlock];
}

- (id)_coordinatesForBlockPath:(HKGraphSeriesDataBlockPath *)a3 xAxis:(id)a4
{
  id v6 = a4;
  HKGraphSeriesDataBlockPath v11 = *a3;
  id v7 = [(HKGraphSeries *)self _dataBlockForBlockPath:&v11];
  if (v7)
  {
    double v8 = [(HKGraphSeries *)self yAxis];
    HKGraphSeriesDataBlockPath v11 = *a3;
    uint64_t v9 = [(HKGraphSeries *)self coordinatesForBlock:v7 blockPath:&v11 xAxis:v6 yAxis:v8];

    HKGraphSeriesDataBlockPath v11 = *a3;
    [(HKGraphSeries *)self _cacheCoordinates:v9 forBlockPath:&v11];
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (id)_dataBlockForBlockPath:(HKGraphSeriesDataBlockPath *)a3
{
  HKGraphSeriesDataBlockPath v14 = *a3;
  uint64_t v5 = [MEMORY[0x1E4F29238] valueWithHKGraphSeriesDataBlockPath:&v14];
  id v6 = [(HKGraphSeries *)self seriesMutableStateLock];
  [v6 lock];

  id v7 = [(HKGraphSeries *)self cachedDataBlocksByBlockPath];
  double v8 = [v7 objectForKeyedSubscript:v5];

  uint64_t v9 = [(HKGraphSeries *)self seriesMutableStateLock];
  [v9 unlock];

  if (!v8)
  {
    HKGraphSeriesDataBlockPath v14 = *a3;
    double v8 = [(HKGraphSeries *)self _getBlockFromDataSource:&v14];
    if (v8)
    {
      uint64_t v10 = [(HKGraphSeries *)self seriesMutableStateLock];
      [v10 lock];

      HKGraphSeriesDataBlockPath v11 = [(HKGraphSeries *)self cachedDataBlocksByBlockPath];
      [v11 setObject:v8 forKeyedSubscript:v5];

      HKGraphSeriesDataBlockPath v12 = [(HKGraphSeries *)self seriesMutableStateLock];
      [v12 unlock];
    }
  }

  return v8;
}

- (id)_getBlockFromDataSource:(HKGraphSeriesDataBlockPath *)a3
{
  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    dataSourceStorage = self->_dataSourceStorage;
    id seriesDataSourceContextStorage = self->_seriesDataSourceContextStorage;
    long long v21 = *(_OWORD *)&a3->index;
    int64_t resolution = a3->resolution;
    id v7 = [(HKGraphSeriesDataSource *)dataSourceStorage cachedBlockForPath:&v21 context:seriesDataSourceContextStorage];
  }
  else
  {
    double v8 = dispatch_group_create();
    *(void *)&long long v21 = 0;
    *((void *)&v21 + 1) = &v21;
    int64_t resolution = 0x3032000000;
    uint64_t v23 = __Block_byref_object_copy__24;
    long long v24 = __Block_byref_object_dispose__24;
    id v25 = 0;
    dispatch_group_enter(v8);
    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    HKGraphSeriesDataBlockPath v14 = __41__HKGraphSeries__getBlockFromDataSource___block_invoke;
    id v15 = &unk_1E6D56498;
    id v18 = &v21;
    uint64_t v16 = self;
    long long v19 = *(_OWORD *)&a3->index;
    int64_t v20 = a3->resolution;
    uint64_t v9 = v8;
    long long v17 = v9;
    dispatch_async(MEMORY[0x1E4F14428], &v12);
    if (dispatch_group_wait(v9, [(HKGraphSeries *)self _mainThreadJoinTimeout]))
    {
      _HKInitializeLogging();
      uint64_t v10 = *MEMORY[0x1E4F29FB0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB0], OS_LOG_TYPE_ERROR)) {
        -[HKGraphSeries _getBlockFromDataSource:](v10);
      }
      id v7 = 0;
    }
    else
    {
      id v7 = *(id *)(*((void *)&v21 + 1) + 40);
    }

    _Block_object_dispose(&v21, 8);
  }
  return v7;
}

void __41__HKGraphSeries__getBlockFromDataSource___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  BOOL v3 = *(void **)(v2 + 32);
  uint64_t v4 = *(void *)(v2 + 40);
  long long v8 = *(_OWORD *)(a1 + 56);
  uint64_t v9 = *(void *)(a1 + 72);
  uint64_t v5 = [v3 cachedBlockForPath:&v8 context:v4];
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

- (void)_requestDataSourceBlocksFromPath:(HKGraphSeriesDataBlockPath *)a3 toPath:(HKGraphSeriesDataBlockPath *)a4
{
  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    dataSourceStorage = self->_dataSourceStorage;
    long long v23 = *(_OWORD *)&a3->index;
    int64_t resolution = a3->resolution;
    long long v21 = *(_OWORD *)&a4->index;
    int64_t v22 = a4->resolution;
    [(HKGraphSeriesDataSource *)dataSourceStorage blocksRequestedFromPath:&v23 toPath:&v21 priorityDelegate:self];
  }
  else
  {
    long long v8 = dispatch_group_create();
    dispatch_group_enter(v8);
    uint64_t v11 = MEMORY[0x1E4F143A8];
    uint64_t v12 = 3221225472;
    uint64_t v13 = __57__HKGraphSeries__requestDataSourceBlocksFromPath_toPath___block_invoke;
    HKGraphSeriesDataBlockPath v14 = &unk_1E6D54F00;
    id v15 = self;
    long long v17 = *(_OWORD *)&a3->index;
    int64_t v18 = a3->resolution;
    long long v19 = *(_OWORD *)&a4->index;
    int64_t v20 = a4->resolution;
    uint64_t v9 = v8;
    uint64_t v16 = v9;
    dispatch_async(MEMORY[0x1E4F14428], &v11);
    if (dispatch_group_wait(v9, [(HKGraphSeries *)self _mainThreadJoinTimeout]))
    {
      _HKInitializeLogging();
      uint64_t v10 = *MEMORY[0x1E4F29FB0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB0], OS_LOG_TYPE_ERROR)) {
        -[HKGraphSeries _requestDataSourceBlocksFromPath:toPath:](v10);
      }
    }
  }
}

void __57__HKGraphSeries__requestDataSourceBlocksFromPath_toPath___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 32);
  long long v5 = *(_OWORD *)(a1 + 48);
  uint64_t v6 = *(void *)(a1 + 64);
  long long v3 = *(_OWORD *)(a1 + 72);
  uint64_t v4 = *(void *)(a1 + 88);
  objc_msgSend(v2, "blocksRequestedFromPath:toPath:priorityDelegate:", &v5, &v3);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

- (unint64_t)_mainThreadJoinTimeout
{
  return dispatch_time(0, 3000000000);
}

- (BOOL)isRangeHighPriority:(id)a3
{
  id v4 = a3;
  long long v5 = [(HKGraphSeries *)self delegate];
  char v6 = [v5 rangeIsVisible:v4];

  return v6;
}

- (id)marginsForYAxis:(id)a3 xAxisRange:(id)a4 zoomLevel:(int64_t)a5 chartRect:(CGRect)a6
{
  id v6 = a3;
  return v6;
}

- (void)enumerateChartPointsInRange:(id)a3 zoomLevel:(int64_t)a4 resolution:(int64_t)a5 block:(id)a6
{
  id v10 = a6;
  id v11 = a3;
  uint64_t v12 = [v11 minValue];
  [v12 doubleValue];
  uint64_t v14 = v13;

  id v15 = [v11 maxValue];
  [v15 doubleValue];
  uint64_t v17 = v16;

  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  _OWORD v19[2] = __72__HKGraphSeries_enumerateChartPointsInRange_zoomLevel_resolution_block___block_invoke;
  v19[3] = &unk_1E6D564C0;
  int64_t v21 = a4;
  int64_t v22 = a5;
  uint64_t v23 = v14;
  uint64_t v24 = v17;
  v19[4] = self;
  id v20 = v10;
  id v18 = v10;
  [(HKGraphSeries *)self _enumeratePathIndexesInValueRange:v11 zoomLevel:a4 resolution:a5 block:v19];
}

void __72__HKGraphSeries_enumerateChartPointsInRange_zoomLevel_resolution_block___block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  long long v5 = *(void **)(a1 + 32);
  uint64_t v23 = a2;
  long long v24 = *(_OWORD *)(a1 + 48);
  id v6 = [v5 _dataBlockForBlockPath:&v23];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v7 = objc_msgSend(v6, "chartPoints", 0);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v25 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v20;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        LOBYTE(v23) = 0;
        uint64_t v13 = [v12 minXValueAsGenericType];
        [v13 doubleValue];
        double v15 = v14;

        uint64_t v16 = [v12 maxXValueAsGenericType];
        [v16 doubleValue];
        double v18 = v17;

        if (v15 >= *(double *)(a1 + 64) && v18 <= *(double *)(a1 + 72))
        {
          (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
          if ((_BYTE)v23)
          {
            *a3 = 1;
            goto LABEL_13;
          }
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v19 objects:v25 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
LABEL_13:
}

- (int64_t)overlayType
{
  return 0;
}

- (id)overlayIdentifier
{
  return 0;
}

- (id)overlayInteractiveViewsWithDelegate:(id)a3
{
  return 0;
}

- (BOOL)isHighlighted
{
  [(HKGraphSeries *)self selectedPathRange];
  v4[0] = v3[2];
  v4[1] = v3[3];
  v3[0] = HKGraphSeriesDataPointPathNone;
  v3[1] = unk_1E0F05AE0;
  return !HKGraphSeriesDataPointPathEqualToPath(v4, v3);
}

- (void)selectPathsinPathRange:(id *)a3 coordinateRange:(id)a4
{
  id v6 = a4;
  [(HKGraphSeries *)self selectedPathRange];
  long long v7 = *(_OWORD *)&a3->var0.var0.resolution;
  v12[0] = *(_OWORD *)&a3->var0.var0.index;
  v12[1] = v7;
  long long v8 = *(_OWORD *)&a3->var1.var0.resolution;
  v12[2] = *(_OWORD *)&a3->var1.var0.index;
  v12[3] = v8;
  if (!HKGraphSeriesDataPointPathRangeEqualToRange(v12, v13))
  {
    long long v9 = *(_OWORD *)&a3->var0.var0.resolution;
    v11[0] = *(_OWORD *)&a3->var0.var0.index;
    v11[1] = v9;
    long long v10 = *(_OWORD *)&a3->var1.var0.resolution;
    v11[2] = *(_OWORD *)&a3->var1.var0.index;
    _OWORD v11[3] = v10;
    [(HKGraphSeries *)self setSelectedPathRange:v11];
    [(HKGraphSeries *)self setClosestXCoordinateRange:v6];
    [(HKGraphSeries *)self _setDirtyWithNewData:0];
  }
}

- (void)deselectPath
{
  v2[0] = HKGraphSeriesDataPointPathNone;
  v2[1] = unk_1E0F05AE0;
  v2[2] = HKGraphSeriesDataPointPathNone;
  v2[3] = unk_1E0F05AE0;
  [(HKGraphSeries *)self selectPathsinPathRange:v2 coordinateRange:0];
}

- (double)distanceFromTouchPoint:(CGPoint)a3 inChartRect:(CGRect)a4 xAxis:(id)a5 zoomScale:(double)a6 resolution:(int64_t)a7 contentOffset:(CGPoint)a8 xAxisTransform:(CGAffineTransform *)a9
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  CGFloat v15 = a3.y;
  CGFloat v16 = a3.x;
  id v18 = a5;
  uint64_t v25 = 0;
  uint64_t v26 = (double *)&v25;
  uint64_t v27 = 0x2020000000;
  uint64_t v28 = 0x7FEFFFFFFFFFFFFFLL;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __108__HKGraphSeries_distanceFromTouchPoint_inChartRect_xAxis_zoomScale_resolution_contentOffset_xAxisTransform___block_invoke;
  v24[3] = &unk_1E6D564E8;
  *(CGFloat *)&v24[6] = v16;
  *(CGFloat *)&v24[7] = v15;
  *(double *)&v24[8] = x;
  *(double *)&v24[9] = y;
  *(double *)&v24[10] = width;
  *(double *)&v24[11] = height;
  v24[4] = self;
  v24[5] = &v25;
  long long v19 = *(_OWORD *)&a9->c;
  v23[0] = *(_OWORD *)&a9->a;
  v23[1] = v19;
  v23[2] = *(_OWORD *)&a9->tx;
  -[HKGraphSeries enumerateCoordinatesInChartRect:xAxis:zoomScale:resolution:contentOffset:xAxisTransform:roundToViewScale:exclusionOptions:block:](self, "enumerateCoordinatesInChartRect:xAxis:zoomScale:resolution:contentOffset:xAxisTransform:roundToViewScale:exclusionOptions:block:", v18, a7, v23, 1, 0, v24, x, y, width, height, a6, a8.x, a8.y);
  double v20 = v26[3];
  _Block_object_dispose(&v25, 8);

  return v20;
}

uint64_t __108__HKGraphSeries_distanceFromTouchPoint_inChartRect_xAxis_zoomScale_resolution_contentOffset_xAxisTransform___block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "distanceFromPoint:blockCoordinate:chartRect:", *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88));
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  if (v3 < *(double *)(v4 + 24)) {
    *(double *)(v4 + 24) = v3;
  }
  return result;
}

- (id)findVisibleBlockCoordinatesForChartRect:(CGRect)a3 xAxis:(id)a4 zoomScale:(double)a5 resolution:(int64_t)a6 contentOffset:(CGPoint)a7 xAxisTransform:(CGAffineTransform *)a8
{
  double y = a7.y;
  double x = a7.x;
  double height = a3.size.height;
  double width = a3.size.width;
  double v15 = a3.origin.y;
  double v16 = a3.origin.x;
  id v18 = a4;
  long long v19 = [(HKGraphSeries *)self yAxis];
  char v20 = [v19 requiresScaling];

  if (v20)
  {
    long long v21 = 0;
  }
  else
  {
    long long v22 = -[HKGraphSeries _coordinateListsForGeneratorWithXAxis:zoomScale:chartRect:contentOffset:resolution:](self, "_coordinateListsForGeneratorWithXAxis:zoomScale:chartRect:contentOffset:resolution:", v18, a6, a5, v16, v15, width, height, x, y);
    uint64_t v23 = [v18 axisChartableValueRange];
    long long v24 = +[HKGraphSeriesBlockCoordinateList coordinateListByCombiningSubCoordinates:v22 chartableValueRange:v23];

    long long v46 = 0u;
    long long v47 = 0u;
    long long v25 = *(_OWORD *)&a8->c;
    long long v42 = *(_OWORD *)&a8->a;
    long long v43 = v25;
    long long v44 = *(_OWORD *)&a8->tx;
    long long v45 = 0u;
    -[HKGraphSeries coordinateTransformForChartRect:xAxisTransform:](self, "coordinateTransformForChartRect:xAxisTransform:", &v42, v16, v15, width, height);
    *(void *)&long long v42 = 0;
    *((void *)&v42 + 1) = &v42;
    *(void *)&long long v43 = 0x3032000000;
    *((void *)&v43 + 1) = __Block_byref_object_copy__24;
    *(void *)&long long v44 = __Block_byref_object_dispose__24;
    *((void *)&v44 + 1) = 0;
    uint64_t v36 = 0;
    long long v37 = &v36;
    uint64_t v38 = 0x3032000000;
    CGFloat v39 = __Block_byref_object_copy__24;
    int64_t v40 = __Block_byref_object_dispose__24;
    id v41 = 0;
    uint64_t v30 = 0;
    id v31 = &v30;
    uint64_t v32 = 0x3032000000;
    uint64_t v33 = __Block_byref_object_copy__24;
    id v34 = __Block_byref_object_dispose__24;
    id v35 = 0;
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __113__HKGraphSeries_findVisibleBlockCoordinatesForChartRect_xAxis_zoomScale_resolution_contentOffset_xAxisTransform___block_invoke;
    v29[3] = &unk_1E6D56510;
    *(double *)&v29[8] = v16;
    *(double *)&v29[9] = v15;
    *(double *)&v29[10] = width;
    *(double *)&v29[11] = height;
    v29[4] = self;
    v29[5] = &v42;
    v29[6] = &v36;
    v29[7] = &v30;
    v28[0] = v45;
    v28[1] = v46;
    v28[2] = v47;
    [v24 enumerateCoordinatesWithTransform:v28 roundToViewScale:0 block:v29];
    if (*(void *)(*((void *)&v42 + 1) + 40) && v37[5])
    {
      uint64_t v26 = [HKGraphSeriesVisibleBlockCoordinates alloc];
      long long v21 = [(HKGraphSeriesVisibleBlockCoordinates *)v26 initWithMinimum:*(void *)(*((void *)&v42 + 1) + 40) maximum:v37[5] last:v31[5]];
    }
    else
    {
      long long v21 = 0;
    }
    _Block_object_dispose(&v30, 8);

    _Block_object_dispose(&v36, 8);
    _Block_object_dispose(&v42, 8);
  }
  return v21;
}

void __113__HKGraphSeries_findVisibleBlockCoordinatesForChartRect_xAxis_zoomScale_resolution_contentOffset_xAxisTransform___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v11 = a2;
  id v6 = a4;
  [v11 startXValue];
  if (v7 >= *(double *)(a1 + 64))
  {
    [v11 endXValue];
    if (v8 <= *(double *)(a1 + 64) + *(double *)(a1 + 80))
    {
      uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
      if (*(void *)(v9 + 40))
      {
        if (!objc_msgSend(*(id *)(a1 + 32), "blockCoordinate:lessThan:", v6)) {
          goto LABEL_7;
        }
        uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
      }
      objc_storeStrong((id *)(v9 + 40), a4);
LABEL_7:
      uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
      if (*(void *)(v10 + 40))
      {
        if (!objc_msgSend(*(id *)(a1 + 32), "blockCoordinate:greaterThan:", v6))
        {
LABEL_11:
          objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), a4);
          goto LABEL_12;
        }
        uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
      }
      objc_storeStrong((id *)(v10 + 40), a4);
      goto LABEL_11;
    }
  }
LABEL_12:
}

- (BOOL)untransformedChartPointsForTimeScope:(int64_t)a3 resolution:(int64_t)a4 range:(id)a5 completion:(id)a6
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v10 = a5;
  id v11 = a6;
  uint64_t v12 = [v10 minValue];
  uint64_t v13 = [v10 maxValue];
  long long v50 = 0uLL;
  int64_t v51 = 0;
  uint64_t v38 = self;
  double v14 = [(HKGraphSeries *)self dataSource];
  double v15 = v14;
  if (v14)
  {
    [v14 blockPathForX:v12 zoom:a3 resolution:a4];
  }
  else
  {
    long long v50 = 0uLL;
    int64_t v51 = 0;
  }

  long long v48 = 0uLL;
  uint64_t v49 = 0;
  double v16 = [(HKGraphSeries *)self dataSource];
  double v17 = v16;
  if (v16)
  {
    [v16 blockPathForX:v13 zoom:a3 resolution:a4];
  }
  else
  {
    long long v48 = 0uLL;
    uint64_t v49 = 0;
  }

  *(void *)&long long v50 = v50 - 1;
  *(void *)&long long v48 = v48 + 1;
  id v18 = [(HKGraphSeries *)self dataSource];
  long long v46 = v50;
  int64_t v47 = v51;
  long long v44 = v48;
  uint64_t v45 = v49;
  int v19 = [v18 hasAllBlocksAvailableBetweenStartPath:&v46 endPath:&v44];

  if (v19)
  {
    char v33 = v19;
    id v34 = v11;
    id v35 = v10;
    id v20 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v21 = v50;
    if ((uint64_t)v50 <= (uint64_t)v48)
    {
      int64_t v36 = a3;
      int64_t v37 = a4;
      do
      {
        long long v22 = [(HKGraphSeries *)v38 dataSource];
        *(void *)&long long v46 = v21;
        *((void *)&v46 + 1) = a3;
        int64_t v47 = a4;
        uint64_t v23 = [v22 cachedBlockForPath:&v46 context:0];

        long long v42 = 0u;
        long long v43 = 0u;
        long long v40 = 0u;
        long long v41 = 0u;
        CGFloat v39 = v23;
        long long v24 = [v23 chartPoints];
        uint64_t v25 = [v24 countByEnumeratingWithState:&v40 objects:v52 count:16];
        if (v25)
        {
          uint64_t v26 = v25;
          uint64_t v27 = *(void *)v41;
          do
          {
            for (uint64_t i = 0; i != v26; ++i)
            {
              if (*(void *)v41 != v27) {
                objc_enumerationMutation(v24);
              }
              CGRect v29 = *(void **)(*((void *)&v40 + 1) + 8 * i);
              uint64_t v30 = [v29 xValueAsGenericType];
              if ([v30 compare:v12] != -1 && objc_msgSend(v30, "compare:", v13) != 1) {
                [v20 addObject:v29];
              }
            }
            uint64_t v26 = [v24 countByEnumeratingWithState:&v40 objects:v52 count:16];
          }
          while (v26);
        }

        BOOL v31 = v21++ < (uint64_t)v48;
        a3 = v36;
        a4 = v37;
      }
      while (v31);
    }
    id v11 = v34;
    (*((void (**)(id, id, uint64_t, void))v34 + 2))(v34, v20, 1, 0);

    id v10 = v35;
    LOBYTE(v19) = v33;
  }

  return v19;
}

+ (void)drawFilledMarkerInContext:(CGContext *)a3 color:(CGColor *)a4 x:(double)a5 y:(double)a6 radius:(double)a7
{
  CGContextSetFillColorWithColor(a3, a4);
  CGContextMoveToPoint(a3, a5, a6);
  CGContextAddArc(a3, a5, a6, a7, 0.0, 6.28318531, 0);
  CGContextFillPath(a3);
}

+ (void)drawInnerDotMarkerInContext:(CGContext *)a3 outColor:(CGColor *)a4 inColor:(CGColor *)a5 x:(double)a6 y:(double)a7 radius:(double)a8
{
  CGContextSetFillColorWithColor(a3, a4);
  CGContextMoveToPoint(a3, a6, a7);
  CGContextAddArc(a3, a6, a7, a8, 0.0, 6.28318531, 0);
  CGContextFillPath(a3);
  CGContextSetFillColorWithColor(a3, a5);
  CGContextMoveToPoint(a3, a6, a7);
  CGContextAddArc(a3, a6, a7, a8 * 0.5, 0.0, 6.28318531, 0);
  CGContextFillPath(a3);
}

- (id)filteredPointSelectionContexts:(id)a3 forTouchPoints:(id)a4 resultsDidChange:(BOOL *)a5
{
  id v5 = a3;
  return v5;
}

- (CGRect)adjustRect:(CGRect)a3 forFont:(id)a4
{
  double width = a3.size.width;
  double y = a3.origin.y;
  CGFloat v6 = a3.origin.x + -1.0;
  id v7 = a4;
  [v7 ascender];
  double v9 = v8;
  [v7 capHeight];
  double v11 = y + v9 - v10 + -1.0;
  [v7 capHeight];
  double v13 = v12;

  double v14 = v13 + 2.0;
  double v15 = v6;
  double v16 = v11;
  double v17 = width + 2.0;
  result.size.double height = v14;
  result.size.double width = v17;
  result.origin.double y = v16;
  result.origin.double x = v15;
  return result;
}

- (CGRect)backgroundRectFromStringRect:(CGRect)a3 forFont:(id)a4
{
  double width = a3.size.width;
  double y = a3.origin.y;
  CGFloat v6 = a3.origin.x + -1.0;
  id v7 = a4;
  [v7 ascender];
  double v9 = v8;
  [v7 capHeight];
  double v11 = y + v9 - v10 + -1.0;
  [v7 capHeight];
  double v13 = v12;

  double v14 = v13 + 2.0;
  double v15 = v6;
  double v16 = v11;
  double v17 = width + 2.0;
  result.size.double height = v14;
  result.size.double width = v17;
  result.origin.double y = v16;
  result.origin.double x = v15;
  return result;
}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (NSLock)seriesMutableStateLock
{
  return self->_seriesMutableStateLock;
}

- (HKGraphSeriesDataSource)dataSourceStorage
{
  return self->_dataSourceStorage;
}

- (BOOL)adjustYAxisForLabelsStorage
{
  return self->_adjustYAxisForLabelsStorage;
}

- (id)seriesDataSourceContextStorage
{
  return self->_seriesDataSourceContextStorage;
}

- (BOOL)isCriticalForAutoscaleStorage
{
  return self->_isCriticalForAutoscaleStorage;
}

- (BOOL)wantsRoundingDuringYRangeExpansionStorage
{
  return self->_wantsRoundingDuringYRangeExpansionStorage;
}

- (HKGraphSeriesAxisScalingRule)axisScalingRuleStorage
{
  return self->_axisScalingRuleStorage;
}

- (UIColor)offScreenIndicatorColorStorage
{
  return self->_offScreenIndicatorColorStorage;
}

- (BOOL)invertYAxisStorage
{
  return self->_invertYAxisStorage;
}

- (HKAxis)yAxisStorage
{
  return self->_yAxisStorage;
}

- (HKSeriesDelegate)delegateStorage
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegateStorage);
  return (HKSeriesDelegate *)WeakRetained;
}

- (NSArray)titleLegendEntriesStorage
{
  return self->_titleLegendEntriesStorage;
}

- (NSArray)detailLegendEntriesStorage
{
  return self->_detailLegendEntriesStorage;
}

- (BOOL)drawLegendInsideSeriesStorage
{
  return self->_drawLegendInsideSeriesStorage;
}

- (double)alphaStorage
{
  return self->_alphaStorage;
}

- (double)offscreenIndicatorAlphaStorage
{
  return self->_offscreenIndicatorAlphaStorage;
}

- (BOOL)allowsSelectionStorage
{
  return self->_allowsSelectionStorage;
}

- (BOOL)drawSelectionLineBehindAllSeriesStorage
{
  return self->_drawSelectionLineBehindAllSeriesStorage;
}

- ($CCD603AA111969479C48B15BFB8EC0F1)selectedPathRangeStorage
{
  long long v3 = *(_OWORD *)&self[2].var1.var0.index;
  *(_OWORD *)&retstr->var0.var0.indedouble x = *(_OWORD *)&self[2].var0.var0.resolution;
  *(_OWORD *)&retstr->var0.var0.int64_t resolution = v3;
  long long v4 = *(_OWORD *)&self[3].var0.var0.index;
  *(_OWORD *)&retstr->var1.var0.indedouble x = *(_OWORD *)&self[2].var1.var0.resolution;
  *(_OWORD *)&retstr->var1.var0.int64_t resolution = v4;
  return self;
}

- (HKValueRange)closestXCoordinateRangeStorage
{
  return self->_closestXCoordinateRangeStorage;
}

- (HKValueRange)visibleValueRangeStorage
{
  return self->_visibleValueRangeStorage;
}

- (BOOL)internalDirtyFlag
{
  return self->_internalDirtyFlag;
}

- (NSMutableDictionary)cachedCoordinateListsByBlockPath
{
  return self->_cachedCoordinateListsByBlockPath;
}

- (void)setCachedCoordinateListsByBlockPath:(id)a3
{
}

- (NSMutableDictionary)cachedDataBlocksByBlockPath
{
  return self->_cachedDataBlocksByBlockPath;
}

- (void)setCachedDataBlocksByBlockPath:(id)a3
{
}

- (double)distanceFromPoint:(CGPoint)a3 blockCoordinate:(id)a4 chartRect:(CGRect)a5
{
  return 0.0;
}

- (double)xAxisDistanceFromPoint:(CGPoint)a3 blockCoordinate:(id)a4 chartRect:(CGRect)a5
{
  return 0.0;
}

- (double)yAxisDifferenceToPoint:(CGPoint)a3 blockCoordinate:(id)a4 chartRect:(CGRect)a5
{
  return 0.0;
}

- (BOOL)blockCoordinate:(id)a3 lessThan:(id)a4
{
  return 0;
}

- (BOOL)blockCoordinate:(id)a3 greaterThan:(id)a4
{
  return 0;
}

- (void)drawSeriesWithBlockCoordinates:(id)a3 axisRect:(CGRect)a4 zoomLevelConfiguration:(id)a5 pointTransform:(CGAffineTransform *)a6 renderContext:(CGContext *)a7 secondaryRenderContext:(id)a8 seriesRenderingDelegate:(id)a9
{
  OUTLINED_FUNCTION_1_4();
  NSRequestConcreteImplementation();
}

- (id)coordinatesForBlock:(id)a3 blockPath:(HKGraphSeriesDataBlockPath *)a4 xAxis:(id)a5 yAxis:(id)a6
{
  return 0;
}

- (BOOL)supportsMultiTouchSelection
{
  return 0;
}

- (void)_getBlockFromDataSource:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1E0B26000, log, OS_LOG_TYPE_ERROR, "_getBlockFromDataSource: unexpected time out waiting for a block", v1, 2u);
}

- (void)_requestDataSourceBlocksFromPath:(os_log_t)log toPath:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1E0B26000, log, OS_LOG_TYPE_ERROR, "_requestDataSourceBlocksFromPath: unexpected time out requesting blocks", v1, 2u);
}

@end