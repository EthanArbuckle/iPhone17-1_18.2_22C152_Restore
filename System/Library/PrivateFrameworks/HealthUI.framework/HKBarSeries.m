@interface HKBarSeries
+ (id)_approximateRoundedRect:(CGRect)a3 byRoundingCorners:(unint64_t)a4 cornerRadii:(CGSize)a5;
+ (id)barSeriesRoundedRect:(CGRect)a3 byRoundingCorners:(unint64_t)a4 cornerRadii:(CGSize)a5;
+ (id)barSeriesRoundedRect:(CGRect)a3 cornerRadius:(double)a4;
- (BOOL)blockCoordinate:(id)a3 greaterThan:(id)a4;
- (BOOL)blockCoordinate:(id)a3 lessThan:(id)a4;
- (BOOL)blockCoordinateIsVisibleInsideOfChartRect:(CGRect)a3 blockCoordinate:(id)a4;
- (BOOL)supportsMultiTouchSelection;
- (CGSize)cornerRadii;
- (CGSize)cornerRadiiStorage;
- (HKBarSeries)init;
- (HKBarSeriesConfiguration)defaultConfiguration;
- (HKBarSeriesConfiguration)defaultConfigurationStorage;
- (HKFillStyle)inactiveFillStyle;
- (HKFillStyle)selectedFillStyle;
- (HKFillStyle)unselectedFillStyle;
- (HKStrokeStyle)selectedStrokeStyle;
- (HKStrokeStyle)selectedStrokeStyleStorage;
- (HKStrokeStyle)tiledStrokeStyle;
- (HKStrokeStyle)tiledStrokeStyleStorage;
- (HKStrokeStyle)unselectedStrokeStyle;
- (HKStrokeStyle)unselectedStrokeStyleStorage;
- (NSLock)seriesMutableStateLock;
- (NSMutableArray)overrideConfigurations;
- (NSMutableArray)overrideConfigurationsStorage;
- (double)barWidthForVisibleBarCount:(int64_t)a3 axisRect:(CGRect)a4 minimumSpacing:(double)a5;
- (double)distanceFromPoint:(CGPoint)a3 blockCoordinate:(id)a4 chartRect:(CGRect)a5;
- (double)xAxisDistanceFromPoint:(CGPoint)a3 blockCoordinate:(id)a4 chartRect:(CGRect)a5;
- (double)yAxisDifferenceToPoint:(CGPoint)a3 blockCoordinate:(id)a4 chartRect:(CGRect)a5;
- (id)coordinatesForBlock:(id)a3 blockPath:(HKGraphSeriesDataBlockPath *)a4 xAxis:(id)a5 yAxis:(id)a6;
- (int64_t)_configurationIndexForCoordinate:(id)a3 inConfigurations:(id)a4;
- (int64_t)visibleBarCountWithZoomLevelConfiguration:(id)a3;
- (void)_drawConfiguration:(id)a3 fillStyleBezierPaths:(id)a4 strokeStyle:(id)a5 axisRect:(CGRect)a6 context:(CGContext *)a7;
- (void)_drawPath:(id)a3 withFillStyle:(id)a4 strokeStyle:(id)a5 axisRect:(CGRect)a6 context:(CGContext *)a7;
- (void)clearCaches;
- (void)drawSeriesWithBlockCoordinates:(id)a3 axisRect:(CGRect)a4 zoomLevelConfiguration:(id)a5 pointTransform:(CGAffineTransform *)a6 renderContext:(CGContext *)a7 secondaryRenderContext:(id)a8 seriesRenderingDelegate:(id)a9;
- (void)drawWithBlockCoordinates:(id)a3 visibleBarCount:(int64_t)a4 pointTransform:(CGAffineTransform *)a5 context:(CGContext *)a6 axisRect:(CGRect)a7 seriesRenderingDelegate:(id)a8;
- (void)setCornerRadii:(CGSize)a3;
- (void)setCornerRadiiStorage:(CGSize)a3;
- (void)setDefaultConfiguration:(id)a3;
- (void)setDefaultConfigurationStorage:(id)a3;
- (void)setInactiveFillStyle:(id)a3;
- (void)setOverrideConfigurations:(id)a3;
- (void)setOverrideConfigurationsStorage:(id)a3;
- (void)setSelectedFillStyle:(id)a3;
- (void)setSelectedStrokeStyle:(id)a3;
- (void)setSelectedStrokeStyleStorage:(id)a3;
- (void)setTiledStrokeStyle:(id)a3;
- (void)setTiledStrokeStyleStorage:(id)a3;
- (void)setUnselectedFillStyle:(id)a3;
- (void)setUnselectedStrokeStyle:(id)a3;
- (void)setUnselectedStrokeStyleStorage:(id)a3;
@end

@implementation HKBarSeries

- (HKBarSeries)init
{
  v13.receiver = self;
  v13.super_class = (Class)HKBarSeries;
  v2 = [(HKGraphSeries *)&v13 init];
  if (v2)
  {
    v3 = (NSLock *)objc_alloc_init(MEMORY[0x1E4F28E08]);
    seriesMutableStateLock = v2->_seriesMutableStateLock;
    v2->_seriesMutableStateLock = v3;

    [(NSLock *)v2->_seriesMutableStateLock setName:@"HKBarSeriesLock"];
    v5 = objc_alloc_init(HKBarSeriesConfiguration);
    defaultConfigurationStorage = v2->_defaultConfigurationStorage;
    v2->_defaultConfigurationStorage = v5;

    [(HKBarSeriesConfiguration *)v2->_defaultConfigurationStorage setIsIncludedBlock:&__block_literal_global_16];
    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    overrideConfigurationsStorage = v2->_overrideConfigurationsStorage;
    v2->_overrideConfigurationsStorage = v7;

    unselectedStrokeStyleStorage = v2->_unselectedStrokeStyleStorage;
    v2->_unselectedStrokeStyleStorage = 0;

    selectedStrokeStyleStorage = v2->_selectedStrokeStyleStorage;
    v2->_selectedStrokeStyleStorage = 0;

    tiledStrokeStyleStorage = v2->_tiledStrokeStyleStorage;
    v2->_tiledStrokeStyleStorage = 0;

    v2->_cornerRadiiStorage.width = 0.0;
    v2->_cornerRadiiStorage.height = 0.0;
  }
  return v2;
}

- (void)setUnselectedStrokeStyle:(id)a3
{
  v4 = (HKStrokeStyle *)a3;
  v5 = [(HKBarSeries *)self seriesMutableStateLock];
  [v5 lock];

  unselectedStrokeStyleStorage = self->_unselectedStrokeStyleStorage;
  self->_unselectedStrokeStyleStorage = v4;

  id v7 = [(HKBarSeries *)self seriesMutableStateLock];
  [v7 unlock];
}

- (void)setCornerRadii:(CGSize)a3
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  v6 = [(HKBarSeries *)self seriesMutableStateLock];
  [v6 lock];

  self->_cornerRadiiStorage.CGFloat width = width;
  self->_cornerRadiiStorage.CGFloat height = height;
  id v7 = [(HKBarSeries *)self seriesMutableStateLock];
  [v7 unlock];
}

- (void)setTiledStrokeStyle:(id)a3
{
  v4 = (HKStrokeStyle *)a3;
  v5 = [(HKBarSeries *)self seriesMutableStateLock];
  [v5 lock];

  tiledStrokeStyleStorage = self->_tiledStrokeStyleStorage;
  self->_tiledStrokeStyleStorage = v4;

  id v7 = [(HKBarSeries *)self seriesMutableStateLock];
  [v7 unlock];
}

- (void)setUnselectedFillStyle:(id)a3
{
  id v4 = a3;
  v5 = [(HKBarSeries *)self seriesMutableStateLock];
  [v5 lock];

  [(HKBarSeriesConfiguration *)self->_defaultConfigurationStorage setUnselectedFillStyle:v4];
  id v6 = [(HKBarSeries *)self seriesMutableStateLock];
  [v6 unlock];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tiledStrokeStyleStorage, 0);
  objc_storeStrong((id *)&self->_selectedStrokeStyleStorage, 0);
  objc_storeStrong((id *)&self->_unselectedStrokeStyleStorage, 0);
  objc_storeStrong((id *)&self->_overrideConfigurationsStorage, 0);
  objc_storeStrong((id *)&self->_defaultConfigurationStorage, 0);
  objc_storeStrong((id *)&self->_seriesMutableStateLock, 0);
}

uint64_t __19__HKBarSeries_init__block_invoke()
{
  return 1;
}

- (void)clearCaches
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v3 = [(HKBarSeries *)self defaultConfiguration];
  id v4 = [v3 selectedFillStyle];
  [v4 clearCache];

  v5 = [(HKBarSeries *)self defaultConfiguration];
  id v6 = [v5 unselectedFillStyle];
  [v6 clearCache];

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = [(HKBarSeries *)self overrideConfigurations];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        objc_super v13 = [v12 selectedFillStyle];
        [v13 clearCache];

        v14 = [v12 unselectedFillStyle];
        [v14 clearCache];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }

  v15.receiver = self;
  v15.super_class = (Class)HKBarSeries;
  [(HKGraphSeries *)&v15 clearCaches];
}

- (HKBarSeriesConfiguration)defaultConfiguration
{
  v3 = [(HKBarSeries *)self seriesMutableStateLock];
  [v3 lock];

  id v4 = self->_defaultConfigurationStorage;
  v5 = [(HKBarSeries *)self seriesMutableStateLock];
  [v5 unlock];

  return v4;
}

- (void)setDefaultConfiguration:(id)a3
{
  id v4 = (HKBarSeriesConfiguration *)a3;
  v5 = [(HKBarSeries *)self seriesMutableStateLock];
  [v5 lock];

  defaultConfigurationStorage = self->_defaultConfigurationStorage;
  self->_defaultConfigurationStorage = v4;

  id v7 = [(HKBarSeries *)self seriesMutableStateLock];
  [v7 unlock];
}

- (NSMutableArray)overrideConfigurations
{
  v3 = [(HKBarSeries *)self seriesMutableStateLock];
  [v3 lock];

  id v4 = self->_overrideConfigurationsStorage;
  v5 = [(HKBarSeries *)self seriesMutableStateLock];
  [v5 unlock];

  return v4;
}

- (void)setOverrideConfigurations:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  v5 = [(HKBarSeries *)self seriesMutableStateLock];
  [v5 lock];

  overrideConfigurationsStorage = self->_overrideConfigurationsStorage;
  self->_overrideConfigurationsStorage = v4;

  id v7 = [(HKBarSeries *)self seriesMutableStateLock];
  [v7 unlock];
}

- (HKStrokeStyle)unselectedStrokeStyle
{
  v3 = [(HKBarSeries *)self seriesMutableStateLock];
  [v3 lock];

  id v4 = self->_unselectedStrokeStyleStorage;
  v5 = [(HKBarSeries *)self seriesMutableStateLock];
  [v5 unlock];

  return v4;
}

- (HKStrokeStyle)selectedStrokeStyle
{
  v3 = [(HKBarSeries *)self seriesMutableStateLock];
  [v3 lock];

  id v4 = self->_selectedStrokeStyleStorage;
  v5 = [(HKBarSeries *)self seriesMutableStateLock];
  [v5 unlock];

  return v4;
}

- (void)setSelectedStrokeStyle:(id)a3
{
  id v4 = (HKStrokeStyle *)a3;
  v5 = [(HKBarSeries *)self seriesMutableStateLock];
  [v5 lock];

  selectedStrokeStyleStorage = self->_selectedStrokeStyleStorage;
  self->_selectedStrokeStyleStorage = v4;

  id v7 = [(HKBarSeries *)self seriesMutableStateLock];
  [v7 unlock];
}

- (HKStrokeStyle)tiledStrokeStyle
{
  v3 = [(HKBarSeries *)self seriesMutableStateLock];
  [v3 lock];

  id v4 = self->_tiledStrokeStyleStorage;
  v5 = [(HKBarSeries *)self seriesMutableStateLock];
  [v5 unlock];

  return v4;
}

- (HKFillStyle)unselectedFillStyle
{
  v3 = [(HKBarSeries *)self seriesMutableStateLock];
  [v3 lock];

  id v4 = [(HKBarSeriesConfiguration *)self->_defaultConfigurationStorage unselectedFillStyle];
  v5 = [(HKBarSeries *)self seriesMutableStateLock];
  [v5 unlock];

  return (HKFillStyle *)v4;
}

- (HKFillStyle)selectedFillStyle
{
  v3 = [(HKBarSeries *)self seriesMutableStateLock];
  [v3 lock];

  id v4 = [(HKBarSeriesConfiguration *)self->_defaultConfigurationStorage selectedFillStyle];
  v5 = [(HKBarSeries *)self seriesMutableStateLock];
  [v5 unlock];

  return (HKFillStyle *)v4;
}

- (void)setSelectedFillStyle:(id)a3
{
  id v4 = a3;
  v5 = [(HKBarSeries *)self seriesMutableStateLock];
  [v5 lock];

  [(HKBarSeriesConfiguration *)self->_defaultConfigurationStorage setSelectedFillStyle:v4];
  id v6 = [(HKBarSeries *)self seriesMutableStateLock];
  [v6 unlock];
}

- (HKFillStyle)inactiveFillStyle
{
  v3 = [(HKBarSeries *)self seriesMutableStateLock];
  [v3 lock];

  id v4 = [(HKBarSeriesConfiguration *)self->_defaultConfigurationStorage inactiveFillStyle];
  v5 = [(HKBarSeries *)self seriesMutableStateLock];
  [v5 unlock];

  return (HKFillStyle *)v4;
}

- (void)setInactiveFillStyle:(id)a3
{
  id v4 = a3;
  v5 = [(HKBarSeries *)self seriesMutableStateLock];
  [v5 lock];

  [(HKBarSeriesConfiguration *)self->_defaultConfigurationStorage setInactiveFillStyle:v4];
  id v6 = [(HKBarSeries *)self seriesMutableStateLock];
  [v6 unlock];
}

- (CGSize)cornerRadii
{
  v3 = [(HKBarSeries *)self seriesMutableStateLock];
  [v3 lock];

  CGFloat width = self->_cornerRadiiStorage.width;
  CGFloat height = self->_cornerRadiiStorage.height;
  id v6 = [(HKBarSeries *)self seriesMutableStateLock];
  [v6 unlock];

  double v7 = width;
  double v8 = height;
  result.CGFloat height = v8;
  result.CGFloat width = v7;
  return result;
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
  uint64_t v21 = [(HKBarSeries *)self unselectedStrokeStyle];
  if (v21
    || ([(HKBarSeries *)self unselectedFillStyle],
        (uint64_t v21 = objc_claimAutoreleasedReturnValue()) != 0))
  {
  }
  else
  {
    v24 = [(HKBarSeries *)self overrideConfigurations];
    uint64_t v25 = [v24 count];

    if (!v25) {
      goto LABEL_5;
    }
  }
  int64_t v22 = [(HKBarSeries *)self visibleBarCountWithZoomLevelConfiguration:v19];
  long long v23 = *(_OWORD *)&a6->c;
  v26[0] = *(_OWORD *)&a6->a;
  v26[1] = v23;
  v26[2] = *(_OWORD *)&a6->tx;
  -[HKBarSeries drawWithBlockCoordinates:visibleBarCount:pointTransform:context:axisRect:seriesRenderingDelegate:](self, "drawWithBlockCoordinates:visibleBarCount:pointTransform:context:axisRect:seriesRenderingDelegate:", v18, v22, v26, a7, v20, x, y, width, height);
LABEL_5:
}

- (int64_t)visibleBarCountWithZoomLevelConfiguration:(id)a3
{
  return [a3 visibleSeriesPointCountAtResolution:0];
}

- (double)barWidthForVisibleBarCount:(int64_t)a3 axisRect:(CGRect)a4 minimumSpacing:(double)a5
{
  double v5 = a4.size.width / (double)a3;
  double v6 = v5 * 0.33;
  if (v5 * 0.33 <= a5) {
    double v6 = a5;
  }
  return floor(v5 - v6 + -1.0) + HKUIOnePixel();
}

- (void)drawWithBlockCoordinates:(id)a3 visibleBarCount:(int64_t)a4 pointTransform:(CGAffineTransform *)a5 context:(CGContext *)a6 axisRect:(CGRect)a7 seriesRenderingDelegate:(id)a8
{
  double height = a7.size.height;
  double width = a7.size.width;
  double y = a7.origin.y;
  double x = a7.origin.x;
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  id v45 = a3;
  id v46 = a8;
  int v43 = [v46 seriesDrawingDuringTiling];
  if (v43
    && ([(HKBarSeries *)self tiledStrokeStyle],
        (long long v17 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v47 = [(HKBarSeries *)self tiledStrokeStyle];
  }
  else
  {
    v47 = [(HKBarSeries *)self unselectedStrokeStyle];
  }
  [v47 lineWidth];
  double v19 = v18;
  id v20 = [(HKBarSeries *)self selectedStrokeStyle];
  [v20 lineWidth];
  double v22 = v21;

  if (v22 >= v19) {
    double v23 = v22;
  }
  else {
    double v23 = v19;
  }
  [v46 screenRectForSeries:self];
  -[HKBarSeries barWidthForVisibleBarCount:axisRect:minimumSpacing:](self, "barWidthForVisibleBarCount:axisRect:minimumSpacing:", a4);
  double v25 = v24;
  v75.origin.double x = x;
  v75.origin.double y = y;
  v75.size.double width = width;
  v75.size.double height = height;
  CGFloat MaxX = CGRectGetMaxX(v75);
  v76.origin.double x = x;
  v76.origin.double y = y;
  v76.size.double width = width;
  v76.size.double height = height;
  CGFloat MinX = CGRectGetMinX(v76);
  v28 = objc_alloc_init(HKBarSeriesFillStyleBezierPaths);
  v29 = [(HKBarSeries *)self overrideConfigurations];
  v30 = objc_msgSend(v29, "hk_map:", &__block_literal_global_334_0);

  long long v71 = 0u;
  long long v72 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  [(HKGraphSeries *)self selectedPathRange];
  uint64_t v65 = 0;
  v66 = &v65;
  uint64_t v67 = 0x2020000000;
  uint64_t v68 = 0;
  v53[0] = MEMORY[0x1E4F143A8];
  v53[1] = 3221225472;
  v53[2] = __112__HKBarSeries_drawWithBlockCoordinates_visibleBarCount_pointTransform_context_axisRect_seriesRenderingDelegate___block_invoke_2;
  v53[3] = &unk_1E6D524E8;
  CGFloat v57 = MinX;
  double v58 = v23 + v25;
  CGFloat v59 = MaxX;
  v53[4] = self;
  id v31 = v30;
  id v54 = v31;
  v32 = v28;
  long long v60 = v69;
  long long v61 = v70;
  long long v62 = v71;
  long long v63 = v72;
  double v64 = v25;
  v44 = v32;
  v55 = v32;
  v56 = &v65;
  long long v33 = *(_OWORD *)&a5->c;
  v52[0] = *(_OWORD *)&a5->a;
  v52[1] = v33;
  v52[2] = *(_OWORD *)&a5->tx;
  [v45 enumerateCoordinatesWithTransform:v52 roundToViewScale:1 block:v53];
  v34 = [(HKBarSeries *)self defaultConfiguration];
  -[HKBarSeries _drawConfiguration:fillStyleBezierPaths:strokeStyle:axisRect:context:](self, "_drawConfiguration:fillStyleBezierPaths:strokeStyle:axisRect:context:", v34, v44, v47, a6, x, y, width, height);

  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  v35 = [(HKBarSeries *)self overrideConfigurations];
  uint64_t v36 = [v35 countByEnumeratingWithState:&v48 objects:v73 count:16];
  if (v36)
  {
    uint64_t v37 = 0;
    uint64_t v38 = *(void *)v49;
    do
    {
      uint64_t v39 = 0;
      do
      {
        if (*(void *)v49 != v38) {
          objc_enumerationMutation(v35);
        }
        uint64_t v40 = *(void *)(*((void *)&v48 + 1) + 8 * v39);
        v41 = [v31 objectAtIndexedSubscript:v37 + v39];
        -[HKBarSeries _drawConfiguration:fillStyleBezierPaths:strokeStyle:axisRect:context:](self, "_drawConfiguration:fillStyleBezierPaths:strokeStyle:axisRect:context:", v40, v41, v47, a6, x, y, width, height);

        ++v39;
      }
      while (v36 != v39);
      uint64_t v36 = [v35 countByEnumeratingWithState:&v48 objects:v73 count:16];
      v37 += v39;
    }
    while (v36);
  }

  if (((v43 | [v46 measuringStartupTime] ^ 1) & 1) == 0 && v66[3] >= 1)
  {
    v42 = [(HKGraphSeries *)self delegate];
    [v42 nonemptyDrawComplete];
  }
  _Block_object_dispose(&v65, 8);
}

HKBarSeriesFillStyleBezierPaths *__112__HKBarSeries_drawWithBlockCoordinates_visibleBarCount_pointTransform_context_axisRect_seriesRenderingDelegate___block_invoke()
{
  v0 = objc_alloc_init(HKBarSeriesFillStyleBezierPaths);
  return v0;
}

void __112__HKBarSeries_drawWithBlockCoordinates_visibleBarCount_pointTransform_context_axisRect_seriesRenderingDelegate___block_invoke_2(uint64_t a1, void *a2, _OWORD *a3)
{
  id v5 = a2;
  [v5 min];
  double v7 = v6;
  double v9 = v8;
  [v5 max];
  double v11 = v10;
  double v13 = v12;
  double v14 = *(double *)(a1 + 72);
  if (*(double *)(a1 + 64) - v7 <= v14 && v7 - *(double *)(a1 + 80) <= v14)
  {
    objc_super v15 = *(void **)(a1 + 32);
    long long v16 = [v15 overrideConfigurations];
    uint64_t v17 = [v15 _configurationIndexForCoordinate:v5 inConfigurations:v16];

    if (v17 < 0)
    {
      id v18 = *(id *)(a1 + 48);
    }
    else
    {
      id v18 = [*(id *)(a1 + 40) objectAtIndexedSubscript:v17];
    }
    double v19 = v18;
    id v20 = [v18 unselectedBezierPath];
    long long v21 = a3[1];
    v37[0] = *a3;
    v37[1] = v21;
    long long v22 = *(_OWORD *)(a1 + 104);
    v36[0] = *(_OWORD *)(a1 + 88);
    v36[1] = v22;
    long long v23 = *(_OWORD *)(a1 + 136);
    v36[2] = *(_OWORD *)(a1 + 120);
    v36[3] = v23;
    if (HKGraphSeriesDataPointPathInRangeInclusive((uint64_t *)v37, (uint64_t *)v36))
    {
      uint64_t v24 = [v19 selectedBezierPath];

      id v20 = (void *)v24;
    }
    if (v7 - v11 >= 0.0) {
      double v25 = v7 - v11;
    }
    else {
      double v25 = -(v7 - v11);
    }
    if (v9 - v13 >= 0.0) {
      double v26 = v9 - v13;
    }
    else {
      double v26 = -(v9 - v13);
    }
    double v27 = v11;
    double v28 = v13;
    CGRect v38 = CGRectStandardize(*(CGRect *)(&v25 - 2));
    CGRect v39 = CGRectOffset(v38, *(double *)(a1 + 152) * -0.5, 0.0);
    double x = v39.origin.x;
    double y = v39.origin.y;
    double height = v39.size.height;
    double v32 = *(double *)(a1 + 152) + v39.size.width;
    [*(id *)(a1 + 32) cornerRadii];
    v35 = +[HKBarSeries barSeriesRoundedRect:byRoundingCorners:cornerRadii:](HKBarSeries, "barSeriesRoundedRect:byRoundingCorners:cornerRadii:", 3, x, y, v32, height, v33, v34);
    [v20 appendPath:v35];

    ++*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
  }
}

+ (id)_approximateRoundedRect:(CGRect)a3 byRoundingCorners:(unint64_t)a4 cornerRadii:(CGSize)a5
{
  double height = a5.height;
  double width = a5.width;
  char v7 = a4;
  double v25 = a3.size.height;
  double v8 = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v11 = objc_alloc_init(MEMORY[0x1E4FB14C0]);
  double v12 = v11;
  double v13 = height * 0.707106781;
  double v26 = height * 0.707106781;
  double v27 = height;
  if (v7)
  {
    double v15 = y + height;
    objc_msgSend(v11, "moveToPoint:", x, y + height);
    double v14 = width * 0.707106781;
    objc_msgSend(v12, "addLineToPoint:", x + width - width * 0.707106781, v15 - v13);
    objc_msgSend(v12, "addLineToPoint:", x + width, y);
  }
  else
  {
    double v14 = width * 0.707106781;
    objc_msgSend(v11, "moveToPoint:", x, y);
  }
  double v16 = x + v8;
  if ((v7 & 2) != 0)
  {
    double v17 = y + v27;
    objc_msgSend(v12, "addLineToPoint:", v16 - width, y);
    double v18 = v14;
    objc_msgSend(v12, "addLineToPoint:", v16 - width + v14, y + v27 - v26);
  }
  else
  {
    double v17 = y;
    double v18 = v14;
  }
  double v19 = y + v25;
  objc_msgSend(v12, "addLineToPoint:", v16, v17);
  if ((v7 & 8) != 0)
  {
    double v20 = v27;
    objc_msgSend(v12, "addLineToPoint:", v16, v19 - v27);
    double v21 = v26;
    objc_msgSend(v12, "addLineToPoint:", v16 - width + v18, v19 - v27 + v26);
    double v16 = v16 - width;
  }
  else
  {
    double v21 = v26;
    double v20 = v27;
  }
  objc_msgSend(v12, "addLineToPoint:", v16, v19);
  if ((v7 & 4) != 0)
  {
    double v22 = x + width;
    double v23 = v19 - v20;
    objc_msgSend(v12, "addLineToPoint:", v22, v19);
    objc_msgSend(v12, "addLineToPoint:", v22 - v18, v23 + v21);
    double v19 = v23;
  }
  objc_msgSend(v12, "addLineToPoint:", x, v19);
  [v12 closePath];
  return v12;
}

+ (id)barSeriesRoundedRect:(CGRect)a3 byRoundingCorners:(unint64_t)a4 cornerRadii:(CGSize)a5
{
  if (a5.width > 2.5 && a5.height > 2.5) {
    objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:", a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  }
  else {
  double v6 = objc_msgSend(a1, "_approximateRoundedRect:byRoundingCorners:cornerRadii:", a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  }
  return v6;
}

+ (id)barSeriesRoundedRect:(CGRect)a3 cornerRadius:(double)a4
{
  return (id)objc_msgSend(a1, "barSeriesRoundedRect:byRoundingCorners:cornerRadii:", -1, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4, a4);
}

- (int64_t)_configurationIndexForCoordinate:(id)a3 inConfigurations:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v6 = a4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = 0;
    uint64_t v10 = *(void *)v18;
    while (2)
    {
      uint64_t v11 = 0;
      uint64_t v12 = v9 + v8;
      do
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * v11), "isIncludedBlock", (void)v17);
        double v13 = (uint64_t (**)(void, void))objc_claimAutoreleasedReturnValue();
        char v14 = ((uint64_t (**)(void, id))v13)[2](v13, v5);

        if (v14)
        {
          int64_t v15 = v9 + v11;
          goto LABEL_11;
        }
        ++v11;
      }
      while (v8 != v11);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
      uint64_t v9 = v12;
      if (v8) {
        continue;
      }
      break;
    }
  }
  int64_t v15 = -1;
LABEL_11:

  return v15;
}

- (void)_drawConfiguration:(id)a3 fillStyleBezierPaths:(id)a4 strokeStyle:(id)a5 axisRect:(CGRect)a6 context:(CGContext *)a7
{
  double height = a6.size.height;
  double width = a6.size.width;
  double y = a6.origin.y;
  double x = a6.origin.x;
  id v21 = a3;
  id v15 = a5;
  id v16 = a4;
  if ([(HKGraphSeries *)self allowsSelection]) {
    [v21 unselectedFillStyle];
  }
  else {
  long long v17 = [v21 inactiveFillStyle];
  }
  long long v18 = [v16 unselectedBezierPath];
  -[HKBarSeries _drawPath:withFillStyle:strokeStyle:axisRect:context:](self, "_drawPath:withFillStyle:strokeStyle:axisRect:context:", v18, v17, v15, a7, x, y, width, height);

  long long v19 = [v16 selectedBezierPath];

  long long v20 = [v21 selectedFillStyle];
  -[HKBarSeries _drawPath:withFillStyle:strokeStyle:axisRect:context:](self, "_drawPath:withFillStyle:strokeStyle:axisRect:context:", v19, v20, v15, a7, x, y, width, height);
}

- (void)_drawPath:(id)a3 withFillStyle:(id)a4 strokeStyle:(id)a5 axisRect:(CGRect)a6 context:(CGContext *)a7
{
  double height = a6.size.height;
  double width = a6.size.width;
  double y = a6.origin.y;
  double x = a6.origin.x;
  id v19 = a3;
  id v15 = a4;
  id v16 = a5;
  if (([v19 isEmpty] & 1) == 0)
  {
    if (v16)
    {
      CGContextSaveGState(a7);
      [v16 applyToContext:a7];
      CGContextAddPath(a7, (CGPathRef)[v19 CGPath]);
      CGContextStrokePath(a7);
      CGContextRestoreGState(a7);
    }
    if (v15)
    {
      uint64_t v17 = [v19 CGPath];
      [(HKGraphSeries *)self alpha];
      objc_msgSend(v15, "renderPath:context:axisRect:alpha:", v17, a7, x, y, width, height, v18);
    }
  }
}

- (id)coordinatesForBlock:(id)a3 blockPath:(HKGraphSeriesDataBlockPath *)a4 xAxis:(id)a5 yAxis:(id)a6
{
  id v11 = a5;
  id v12 = a6;
  double v13 = [a3 chartPoints];
  if (!v13)
  {
    uint64_t v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2, self, @"HKBarSeries.m", 473, @"Invalid parameter not satisfying: %@", @"points != nil" object file lineNumber description];
  }
  char v14 = [v11 transform];
  id v15 = [v12 transform];

  id v16 = objc_opt_new();
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __57__HKBarSeries_coordinatesForBlock_blockPath_xAxis_yAxis___block_invoke;
  v25[3] = &unk_1E6D52280;
  id v26 = v14;
  id v27 = v15;
  id v28 = v16;
  id v17 = v16;
  id v18 = v15;
  id v19 = v14;
  [v13 enumerateObjectsUsingBlock:v25];
  long long v23 = *(_OWORD *)&a4->index;
  int64_t resolution = a4->resolution;
  long long v20 = +[HKGraphSeriesBlockCoordinateList coordinateListWithCoordinates:v17 blockPath:&v23];

  return v20;
}

void __57__HKBarSeries_coordinatesForBlock_blockPath_xAxis_yAxis___block_invoke(uint64_t a1, void *a2)
{
  id v16 = a2;
  v3 = [v16 yValue];

  if (v3)
  {
    id v4 = *(void **)(a1 + 32);
    id v5 = [v16 xValueAsGenericType];
    [v4 coordinateForValue:v5];
    double v7 = v6;

    [*(id *)(a1 + 40) coordinateForValue:&unk_1F3C204D0];
    double v9 = v8;
    uint64_t v10 = *(void **)(a1 + 40);
    id v11 = [v16 maxYValue];
    [v10 coordinateForValue:v11];
    double v13 = v12;

    char v14 = [v16 userInfo];
    id v15 = -[HKMinMaxCoordinate initWithMin:max:userInfo:]([HKMinMaxCoordinate alloc], "initWithMin:max:userInfo:", v14, v7, v9, v7, v13);
    [*(id *)(a1 + 48) addObject:v15];
  }
}

- (BOOL)supportsMultiTouchSelection
{
  return 1;
}

- (double)distanceFromPoint:(CGPoint)a3 blockCoordinate:(id)a4 chartRect:(CGRect)a5
{
  id v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2 object:self file:@"HKBarSeries.m" lineNumber:510 description:@"distanceFromPoint type class failure"];
  }
  [v7 max];
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
    [v12 handleFailureInMethod:a2 object:self file:@"HKBarSeries.m" lineNumber:518 description:@"xAxisDistanceFromPoint type class failure"];
  }
  [v8 startXValue];
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
    [v12 handleFailureInMethod:a2 object:self file:@"HKBarSeries.m" lineNumber:526 description:@"yAxisDifferenceToPoint\x13 type class failure"];
  }
  [v8 max];
  double v10 = v9 - y;

  return v10;
}

- (BOOL)blockCoordinateIsVisibleInsideOfChartRect:(CGRect)a3 blockCoordinate:(id)a4
{
  return objc_msgSend(a4, "isVisibleInChartRect:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (BOOL)blockCoordinate:(id)a3 lessThan:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2 object:self file:@"HKBarSeries.m" lineNumber:537 description:@"compare type class failure"];
  }
  id v9 = v8;
  [v7 max];
  double v11 = v10;
  [v9 max];
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
    id v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2 object:self file:@"HKBarSeries.m" lineNumber:546 description:@"compare type class failure"];
  }
  id v9 = v8;
  [v7 max];
  double v11 = v10;
  [v9 max];
  double v13 = v12;

  return v11 > v13;
}

- (NSLock)seriesMutableStateLock
{
  return self->_seriesMutableStateLock;
}

- (HKBarSeriesConfiguration)defaultConfigurationStorage
{
  return self->_defaultConfigurationStorage;
}

- (void)setDefaultConfigurationStorage:(id)a3
{
}

- (NSMutableArray)overrideConfigurationsStorage
{
  return self->_overrideConfigurationsStorage;
}

- (void)setOverrideConfigurationsStorage:(id)a3
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

- (HKStrokeStyle)tiledStrokeStyleStorage
{
  return self->_tiledStrokeStyleStorage;
}

- (void)setTiledStrokeStyleStorage:(id)a3
{
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

@end