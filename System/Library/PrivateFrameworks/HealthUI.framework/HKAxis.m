@interface HKAxis
+ (HKAxisMinMaxDefinition)contractByPointsLow:(double)a3 high:(double)a4 modelRange:(HKAxisMinMaxDefinition)a5 pointRange:(HKAxisMinMaxDefinition)a6;
+ (HKAxisMinMaxDefinition)expandByPointsLow:(double)a3 high:(double)a4 modelRange:(HKAxisMinMaxDefinition)a5 pointRange:(HKAxisMinMaxDefinition)a6;
- (BOOL)_containsTopBaselineWithModelRange:(id)a3 zoomScale:(double)a4;
- (BOOL)_styleIsHorizontal:(id)a3;
- (BOOL)axisAnnotationsExcludeInterstitialAxisLabels;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToAxis:(id)a3;
- (BOOL)overrideNoTopBaseline;
- (BOOL)requiresScaling;
- (BOOL)requiresScalingStorage;
- (CGPoint)renderPositionForLabelLocation:(id)a3 rect:(CGRect)a4 zoomScale:(double)a5 contentOffset:(CGPoint)a6 constantOffset:(double)a7 isHorizontal:(BOOL)a8 optionalOffset:(CGPoint)a9;
- (CGRect)_labelBackgroundRectWithLabels:(id)a3 font:(id)a4 maxAnnotationWidth:(double)a5 rect:(CGRect)a6 style:(id)a7;
- (CGRect)labelRectWithModelRange:(id)a3 chartRect:(CGRect)a4 zoomScale:(double)a5;
- (HKAxis)initWithConfiguration:(id)a3;
- (HKAxisLabelCache)axisLabelCache;
- (HKAxisLabelDataSource)labelDataSource;
- (HKAxisStyle)preferredStyle;
- (HKCoordinateTransform)transform;
- (HKLinearTransform)_pointTransformFromSeriesRanges:(id)a3 linearTransform:(HKLinearTransform)a4 chartRange:(HKRange)a5;
- (HKLinearTransform)pointTransform;
- (HKLinearTransform)pointTransformFittingValueRange:(id)a3 toChartRange:(HKRange)a4;
- (HKLinearTransform)pointTransformStorage;
- (HKRange)_chartRangeForChartRect:(CGRect)a3 zoomScale:(double)a4 contentOffset:(CGPoint)a5;
- (HKValueRange)axisChartableValueRange;
- (HKValueRange)axisChartableValueRangeStorage;
- (HKZoomScale)zoomScaleEngine;
- (NSLock)axisMutableStateLock;
- (NSMutableArray)axisAnnotations;
- (NSMutableArray)axisAnnotationsStorage;
- (NSNumber)horizontalAxisLabelSpacePadding;
- (NSNumber)maxLabelWidth;
- (double)_axisFillWidthForStyle:(id)a3 labels:(id)a4 font:(id)a5;
- (double)_axisOffsetWithStyle:(id)a3 chartRect:(CGRect)a4 horizontalAlignmentOut:(int64_t *)a5;
- (double)_maxLabelWidthFromLabels:(id)a3 font:(id)a4;
- (double)_maximumWidthOfAnnotations:(id)a3 axisStyle:(id)a4;
- (double)bottomBaselineYCoordinateForModelRange:(id)a3 axisRect:(CGRect)a4 zoomScale:(double)a5;
- (double)offsetForLegendView;
- (double)topBaselineYCoordinateForModelRange:(id)a3 axisRect:(CGRect)a4 zoomScale:(double)a5;
- (id)_baselineForModelRange:(id)a3 axisRect:(CGRect)a4 zoomScale:(double)a5 contentOffset:(CGPoint)a6 style:(id)a7;
- (id)_gridLinesForModelRange:(id)a3 axisRect:(CGRect)a4 gridlineRanges:(id)a5 zoomScale:(double)a6 contentOffset:(CGPoint)a7 style:(id)a8 gridLineType:(int64_t)a9;
- (id)adjustValueRangeForLabels:(id)a3;
- (id)adjustedRangeForFittedRange:(id)a3 chartRange:(HKRange)a4;
- (id)axisLabelsInModelRangeFromCache:(id)a3 zoomScale:(double)a4;
- (id)cacheKeysForModelRange:(id)a3 zoomScale:(double)a4;
- (id)extendModelRangeWithRange:(id)a3 zoomScale:(double)a4;
- (id)findAxisLabelsInModelRange:(id)a3 zoomScale:(double)a4;
- (id)rangeForChartRect:(CGRect)a3 zoomScale:(double)a4 contentOffset:(CGPoint)a5;
- (int64_t)_axisLabelCountWithTextInModelRange:(id)a3 zoomScale:(double)a4;
- (int64_t)axisAnnotationCount;
- (int64_t)axisLabelEndings;
- (int64_t)axisLabelEndingsStorage;
- (int64_t)dateZoomForZoomScale:(double)a3;
- (int64_t)maxLabels;
- (int64_t)minLabels;
- (void)_addTickMarksForPosition:(unint64_t)a3 axisRect:(CGRect)a4 modelRange:(id)a5 zoomScale:(double)a6 contentOffset:(CGPoint)a7 toBezierPath:(id)a8 style:(id)a9;
- (void)_drawTextBackgroundWithRect:(CGRect)a3 style:(id)a4 renderView:(id)a5;
- (void)_drawTextForModelRange:(id)a3 inRect:(CGRect)a4 zoomScale:(double)a5 contentOffset:(CGPoint)a6 renderView:(id)a7 style:(id)a8 maximumLabelSize:(CGSize *)a9 omitOffscreenLabels:(BOOL)a10;
- (void)_enumerateAxisLabelsForTextInRange:(id)a3 rect:(CGRect)a4 zoomScale:(double)a5 contentOffset:(CGPoint)a6 constantOffset:(double)a7 isHorizontal:(BOOL)a8 optionalOffset:(CGPoint)a9 gridlineWidth:(double)a10 usingBlock:(id)a11;
- (void)_offsetForChartRect:(CGRect)a3 chartRange:(HKRange)a4 zoomScaleOut:(double *)a5 contentOffsetOut:(CGPoint *)a6;
- (void)_renderTickMarksForModelRange:(id)a3 chartRect:(CGRect)a4 zoomScale:(double)a5 contentOffset:(CGPoint)a6 style:(id)a7 renderView:(id)a8;
- (void)addAxisAnnotation:(id)a3 modelCoordinate:(id)a4;
- (void)clearAnnotations;
- (void)clearCache;
- (void)drawBaselineForModelRange:(id)a3 chartRect:(CGRect)a4 zoomScale:(double)a5 contentOffset:(CGPoint)a6 renderView:(id)a7;
- (void)drawGridlinesForModelRange:(id)a3 chartRect:(CGRect)a4 gridlineRanges:(id)a5 zoomScale:(double)a6 contentOffset:(CGPoint)a7 renderView:(id)a8 blendMode:(int)a9;
- (void)drawLabelsWithModelRange:(id)a3 chartRect:(CGRect)a4 zoomScale:(double)a5 contentOffset:(CGPoint)a6 renderView:(id)a7 maximumLabelSize:(CGSize *)a8 omitOffscreenLabels:(BOOL)a9;
- (void)enumerateTickCoordinatesInModelRange:(id)a3 zoomScale:(double)a4 handler:(id)a5;
- (void)invalidateAxisLabelCache;
- (void)offsetForValueRange:(id)a3 chartRect:(CGRect)a4 zoomScaleOut:(double *)a5 contentOffsetOut:(CGPoint *)a6;
- (void)setAxisAnnotations:(id)a3;
- (void)setAxisAnnotationsStorage:(id)a3;
- (void)setAxisChartableValueRange:(id)a3;
- (void)setAxisChartableValueRangeStorage:(id)a3;
- (void)setAxisLabelEndings:(int64_t)a3;
- (void)setAxisLabelEndingsStorage:(int64_t)a3;
- (void)setMaxLabelWidth:(id)a3;
- (void)setPointTransform:(HKLinearTransform)a3;
- (void)setPointTransformStorage:(HKLinearTransform)a3;
- (void)setRequiresScalingStorage:(BOOL)a3;
@end

@implementation HKAxis

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_axisChartableValueRangeStorage, 0);
  objc_storeStrong((id *)&self->_axisAnnotationsStorage, 0);
  objc_storeStrong((id *)&self->_axisMutableStateLock, 0);
  objc_storeStrong((id *)&self->_axisLabelCache, 0);
  objc_destroyWeak((id *)&self->_labelDataSource);
  objc_storeStrong((id *)&self->_zoomScaleEngine, 0);
  objc_storeStrong((id *)&self->_transform, 0);
  objc_storeStrong((id *)&self->_maxLabelWidth, 0);
  objc_storeStrong((id *)&self->_preferredStyle, 0);
}

- (HKAxis)initWithConfiguration:(id)a3
{
  id v4 = a3;
  v33.receiver = self;
  v33.super_class = (Class)HKAxis;
  v5 = [(HKAxis *)&v33 init];
  if (v5)
  {
    v6 = [v4 preferredStyle];
    v7 = v6;
    if (v6)
    {
      id v8 = v6;
    }
    else
    {
      id v8 = +[HKAxisStyle defaultStyle];
    }
    v9 = (void *)*((void *)v5 + 2);
    *((void *)v5 + 2) = v8;

    *((void *)v5 + 3) = [v4 maxLabels];
    *((void *)v5 + 4) = [v4 minLabels];
    uint64_t v10 = [v4 maxLabelWidth];
    v11 = (void *)*((void *)v5 + 5);
    *((void *)v5 + 5) = v10;

    *((void *)v5 + 6) = (id)[v4 horizontalAxisLabelSpacePadding];
    v12 = [v4 transform];
    v13 = v12;
    if (v12) {
      id v14 = v12;
    }
    else {
      id v14 = (id)objc_opt_new();
    }
    v15 = (void *)*((void *)v5 + 7);
    *((void *)v5 + 7) = v14;

    v16 = [v4 zoomScaleEngine];
    v17 = v16;
    if (v16) {
      v18 = v16;
    }
    else {
      v18 = objc_alloc_init(HKScalarZoomScale);
    }
    v19 = (void *)*((void *)v5 + 8);
    *((void *)v5 + 8) = v18;

    uint64_t v20 = [v4 labelDataSource];
    v21 = (void *)v20;
    if (v20) {
      v22 = (void *)v20;
    }
    else {
      v22 = v5;
    }
    objc_storeWeak((id *)v5 + 9, v22);

    v5[8] = [v4 overrideNoTopBaseline];
    v5[9] = [v4 axisAnnotationsExcludeInterstitialAxisLabels];
    v23 = [HKAxisLabelCache alloc];
    id WeakRetained = objc_loadWeakRetained((id *)v5 + 9);
    uint64_t v25 = [(HKAxisLabelCache *)v23 initWithLabelDataSource:WeakRetained];
    v26 = (void *)*((void *)v5 + 10);
    *((void *)v5 + 10) = v25;

    id v27 = objc_alloc_init(MEMORY[0x1E4F28E08]);
    v28 = (void *)*((void *)v5 + 11);
    *((void *)v5 + 11) = v27;

    [*((id *)v5 + 11) setName:@"HKAxisMutableStateLock"];
    v29 = (void *)*((void *)v5 + 12);
    *((void *)v5 + 12) = 0;

    *((void *)v5 + 13) = 0;
    v5[10] = 1;
    *(_OWORD *)(v5 + 120) = HKLinearTransformIdentity;
    v30 = objc_alloc_init(HKValueRange);
    v31 = (void *)*((void *)v5 + 14);
    *((void *)v5 + 14) = v30;
  }
  return (HKAxis *)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (HKAxis *)a3;
  if (v4 && (uint64_t v5 = objc_opt_class(), v5 == objc_opt_class())) {
    BOOL v6 = v4 == self || [(HKAxis *)self isEqualToAxis:v4];
  }
  else {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)isEqualToAxis:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = objc_opt_class();
    if (v5 != objc_opt_class())
    {
      id v23 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:@"Not same type of axis" userInfo:0];
      objc_exception_throw(v23);
    }
    uint64_t v6 = [v4 maxLabels];
    if (v6 == [(HKAxis *)self maxLabels])
    {
      uint64_t v7 = [v4 minLabels];
      BOOL v8 = v7 == [(HKAxis *)self minLabels];
    }
    else
    {
      BOOL v8 = 0;
    }
    uint64_t v10 = [(HKAxis *)self transform];
    v11 = [v4 transform];
    if (v10 == v11)
    {
      char v15 = 1;
    }
    else
    {
      v12 = [(HKAxis *)self transform];
      if (v12)
      {
        v13 = [v4 transform];
        id v14 = [(HKAxis *)self transform];
        char v15 = [v13 isEqual:v14];
      }
      else
      {
        char v15 = 0;
      }
    }
    v16 = [(HKAxis *)self zoomScaleEngine];
    v17 = [v4 zoomScaleEngine];
    if (v16 == v17)
    {
      char v21 = 1;
    }
    else
    {
      v18 = [(HKAxis *)self zoomScaleEngine];
      if (v18)
      {
        v19 = [v4 zoomScaleEngine];
        uint64_t v20 = [(HKAxis *)self zoomScaleEngine];
        char v21 = [v19 isEqual:v20];
      }
      else
      {
        char v21 = 0;
      }
    }
    BOOL v9 = v15 & v8 & v21;
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (NSMutableArray)axisAnnotations
{
  id v4 = [(HKAxis *)self axisMutableStateLock];
  [v4 lock];

  if (self->_axisAnnotationsStorage && ([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    BOOL v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"HKAxis.m" lineNumber:223 description:@"Axis annotations may only be accessed on the main thread"];
  }
  uint64_t v5 = self->_axisAnnotationsStorage;
  uint64_t v6 = [(HKAxis *)self axisMutableStateLock];
  [v6 unlock];

  return v5;
}

- (void)setAxisAnnotations:(id)a3
{
  uint64_t v5 = (NSMutableArray *)a3;
  uint64_t v6 = [(HKAxis *)self axisMutableStateLock];
  [v6 lock];

  if (v5 && ([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    BOOL v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"HKAxis.m" lineNumber:235 description:@"Axis annotations may only be set from the main thread"];
  }
  axisAnnotationsStorage = self->_axisAnnotationsStorage;
  self->_axisAnnotationsStorage = v5;

  id v9 = [(HKAxis *)self axisMutableStateLock];
  [v9 unlock];
}

- (BOOL)requiresScaling
{
  v3 = [(HKAxis *)self axisMutableStateLock];
  [v3 lock];

  LOBYTE(v3) = self->_requiresScalingStorage;
  id v4 = [(HKAxis *)self axisMutableStateLock];
  [v4 unlock];

  return (char)v3;
}

- (int64_t)axisLabelEndings
{
  v3 = [(HKAxis *)self axisMutableStateLock];
  [v3 lock];

  int64_t v4 = self->_axisLabelEndingsStorage != 0;
  uint64_t v5 = [(HKAxis *)self axisMutableStateLock];
  [v5 unlock];

  return v4;
}

- (void)setAxisLabelEndings:(int64_t)a3
{
  uint64_t v5 = [(HKAxis *)self axisMutableStateLock];
  [v5 lock];

  self->_axisLabelEndingsStorage = a3;
  id v6 = [(HKAxis *)self axisMutableStateLock];
  [v6 unlock];
}

- (HKLinearTransform)pointTransform
{
  v3 = [(HKAxis *)self axisMutableStateLock];
  [v3 lock];

  double offset = self->_pointTransformStorage.offset;
  double scale = self->_pointTransformStorage.scale;
  id v6 = [(HKAxis *)self axisMutableStateLock];
  [v6 unlock];

  double v7 = offset;
  double v8 = scale;
  result.double scale = v8;
  result.double offset = v7;
  return result;
}

- (void)setPointTransform:(HKLinearTransform)a3
{
  double scale = a3.scale;
  double offset = a3.offset;
  id v6 = [(HKAxis *)self axisMutableStateLock];
  [v6 lock];

  self->_pointTransformStorage.double offset = offset;
  self->_pointTransformStorage.double scale = scale;
  self->_requiresScalingStorage = 0;
  id v7 = [(HKAxis *)self axisMutableStateLock];
  [v7 unlock];
}

- (HKValueRange)axisChartableValueRange
{
  v3 = [(HKAxis *)self axisMutableStateLock];
  [v3 lock];

  int64_t v4 = [(HKValueRange *)self->_axisChartableValueRangeStorage minValue];
  uint64_t v5 = [(HKValueRange *)self->_axisChartableValueRangeStorage maxValue];
  id v6 = +[HKValueRange valueRangeWithMinValue:v4 maxValue:v5];

  id v7 = [(HKAxis *)self axisMutableStateLock];
  [v7 unlock];

  return (HKValueRange *)v6;
}

- (void)setAxisChartableValueRange:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HKAxis *)self axisMutableStateLock];
  [v5 lock];

  id v6 = [v4 minValue];
  id v7 = [v4 maxValue];

  double v8 = +[HKValueRange valueRangeWithMinValue:v6 maxValue:v7];
  axisChartableValueRangeStorage = self->_axisChartableValueRangeStorage;
  self->_axisChartableValueRangeStorage = v8;

  id v10 = [(HKAxis *)self axisMutableStateLock];
  [v10 unlock];
}

- (HKLinearTransform)pointTransformFittingValueRange:(id)a3 toChartRange:(HKRange)a4
{
  double var1 = a4.var1;
  double var0 = a4.var0;
  id v7 = a3;
  double v8 = [(HKAxis *)self transform];
  id v9 = [v7 minValue];
  [v8 coordinateForValue:v9];
  double v11 = v10;

  v12 = [(HKAxis *)self transform];
  v13 = [v7 maxValue];

  [v12 coordinateForValue:v13];
  double v15 = v14;

  double v16 = var1 / (v15 - v11);
  if (v15 - v11 <= 0.00000011920929) {
    double v16 = 0.0;
  }
  double v17 = var0 - v16 * v11;
  result.double scale = v16;
  result.double offset = v17;
  return result;
}

- (HKLinearTransform)_pointTransformFromSeriesRanges:(id)a3 linearTransform:(HKLinearTransform)a4 chartRange:(HKRange)a5
{
  double var1 = a5.var1;
  double var0 = a5.var0;
  double scale = a4.scale;
  double offset = a4.offset;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  double v11 = objc_opt_new();
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v12 = v10;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v25;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v25 != v15) {
          objc_enumerationMutation(v12);
        }
        objc_msgSend(v11, "unionRange:", *(void *)(*((void *)&v24 + 1) + 8 * v16++), (void)v24);
      }
      while (v14 != v16);
      uint64_t v14 = [v12 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v14);
  }

  double v17 = -[HKAxis adjustedRangeForFittedRange:chartRange:](self, "adjustedRangeForFittedRange:chartRange:", v11, var0, var1);
  -[HKAxis pointTransformFittingValueRange:toChartRange:](self, "pointTransformFittingValueRange:toChartRange:", v17, var0, var1);
  double v19 = v18;
  double v21 = v20;

  double v22 = scale * v21;
  double v23 = offset + v19 * scale;
  result.double scale = v22;
  result.double offset = v23;
  return result;
}

- (id)axisLabelsInModelRangeFromCache:(id)a3 zoomScale:(double)a4
{
  id v6 = -[HKAxis extendModelRangeWithRange:zoomScale:](self, "extendModelRangeWithRange:zoomScale:", a3);
  id v7 = [(HKAxis *)self axisLabelCache];
  double v8 = [v7 allAxisLabelsForRange:v6 zoomScale:a4];

  return v8;
}

- (id)cacheKeysForModelRange:(id)a3 zoomScale:(double)a4
{
  id v6 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4);
  [v6 handleFailureInMethod:a2 object:self file:@"HKAxis.m" lineNumber:340 description:@"No implementation for cacheKeysForModelRange"];

  return 0;
}

- (id)findAxisLabelsInModelRange:(id)a3 zoomScale:(double)a4
{
  id v6 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4);
  [v6 handleFailureInMethod:a2 object:self file:@"HKAxis.m" lineNumber:346 description:@"No implementation for findAxisLabelsInChartRange"];

  return 0;
}

- (id)adjustValueRangeForLabels:(id)a3
{
  id v3 = a3;
  return v3;
}

- (int64_t)_axisLabelCountWithTextInModelRange:(id)a3 zoomScale:(double)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = [(HKAxis *)self axisLabelsInModelRangeFromCache:a3 zoomScale:a4];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    int64_t v7 = 0;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v4);
        }
        id v10 = [*(id *)(*((void *)&v12 + 1) + 8 * i) text];

        if (v10) {
          ++v7;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
  else
  {
    int64_t v7 = 0;
  }

  return v7;
}

- (void)enumerateTickCoordinatesInModelRange:(id)a3 zoomScale:(double)a4 handler:(id)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = (void (**)(id, void *, uint64_t, void *, unsigned char *, double))a5;
  [(HKAxis *)self axisLabelsInModelRangeFromCache:a3 zoomScale:a4];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = [v9 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v28;
LABEL_3:
    uint64_t v13 = 0;
    while (1)
    {
      if (*(void *)v28 != v12) {
        objc_enumerationMutation(v9);
      }
      long long v14 = *(void **)(*((void *)&v27 + 1) + 8 * v13);
      [(HKAxis *)self pointTransform];
      double v16 = v15;
      double v18 = v17;
      double v19 = [(HKAxis *)self transform];
      double v20 = [v14 location];
      [v19 coordinateForValue:v20];
      double v22 = v16 + v21 * v18;

      char v26 = 0;
      double v23 = [v14 location];
      uint64_t v24 = [v14 labelType];
      long long v25 = [v14 text];
      v8[2](v8, v23, v24, v25, &v26, v22);

      if (v26) {
        break;
      }
      if (v11 == ++v13)
      {
        uint64_t v11 = [v9 countByEnumeratingWithState:&v27 objects:v31 count:16];
        if (v11) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

- (id)extendModelRangeWithRange:(id)a3 zoomScale:(double)a4
{
  id v4 = a3;
  return v4;
}

- (id)adjustedRangeForFittedRange:(id)a3 chartRange:(HKRange)a4
{
  id v4 = a3;
  return v4;
}

- (double)_axisOffsetWithStyle:(id)a3 chartRect:(CGRect)a4 horizontalAlignmentOut:(int64_t *)a5
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  id v10 = a3;
  switch([v10 location])
  {
    case 0:
      v21.origin.CGFloat x = x;
      v21.origin.CGFloat y = y;
      v21.size.CGFloat width = width;
      v21.size.CGFloat height = height;
      double MinY = CGRectGetMinY(v21);
      [v10 fillOuterPadding];
      double v13 = MinY + v12;
      int64_t v14 = 1;
      break;
    case 1:
      v22.origin.CGFloat x = x;
      v22.origin.CGFloat y = y;
      v22.size.CGFloat width = width;
      v22.size.CGFloat height = height;
      double MinX = CGRectGetMinX(v22);
      [v10 fillInnerPadding];
      goto LABEL_7;
    case 2:
      v23.origin.CGFloat x = x;
      v23.origin.CGFloat y = y;
      v23.size.CGFloat width = width;
      v23.size.CGFloat height = height;
      double MaxY = CGRectGetMaxY(v23);
      [v10 fillOuterPadding];
      double v13 = MaxY - v18;
      double v19 = [v10 labelStyle];
      int64_t v14 = [v19 horizontalAlignment];

      break;
    case 3:
      v24.origin.CGFloat x = x;
      v24.origin.CGFloat y = y;
      v24.size.CGFloat width = width;
      v24.size.CGFloat height = height;
      double MinX = CGRectGetMinX(v24);
      [v10 fillOuterPadding];
LABEL_7:
      int64_t v14 = 0;
      double v13 = MinX + v16;
      break;
    default:
      int64_t v14 = 0;
      double v13 = 0.0;
      break;
  }
  if (a5) {
    *a5 = v14;
  }

  return v13;
}

- (CGRect)labelRectWithModelRange:(id)a3 chartRect:(CGRect)a4 zoomScale:(double)a5
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v11 = a3;
  double v12 = [(HKAxis *)self preferredStyle];
  double v13 = [(HKAxis *)self axisLabelsInModelRangeFromCache:v11 zoomScale:a5];

  int64_t v14 = [(HKAxis *)self axisAnnotations];

  if (v14)
  {
    double v15 = [(HKAxis *)self axisAnnotations];
    [(HKAxis *)self _maximumWidthOfAnnotations:v15 axisStyle:v12];
    double v17 = v16;
  }
  else
  {
    double v17 = 0.0;
  }
  double v18 = [v12 labelStyle];
  double v19 = [v18 font];
  -[HKAxis _labelBackgroundRectWithLabels:font:maxAnnotationWidth:rect:style:](self, "_labelBackgroundRectWithLabels:font:maxAnnotationWidth:rect:style:", v13, v19, v12, v17, x, y, width, height);
  double v21 = v20;
  double v23 = v22;
  double v25 = v24;
  double v27 = v26;

  double v28 = v21;
  double v29 = v23;
  double v30 = v25;
  double v31 = v27;
  result.size.double height = v31;
  result.size.double width = v30;
  result.origin.double y = v29;
  result.origin.double x = v28;
  return result;
}

- (void)drawLabelsWithModelRange:(id)a3 chartRect:(CGRect)a4 zoomScale:(double)a5 contentOffset:(CGPoint)a6 renderView:(id)a7 maximumLabelSize:(CGSize *)a8 omitOffscreenLabels:(BOOL)a9
{
  BOOL v9 = a9;
  double y = a6.y;
  double x = a6.x;
  double height = a4.size.height;
  double width = a4.size.width;
  double v16 = a4.origin.y;
  double v17 = a4.origin.x;
  id v20 = a7;
  id v21 = a3;
  id v22 = [(HKAxis *)self preferredStyle];
  -[HKAxis _drawTextForModelRange:inRect:zoomScale:contentOffset:renderView:style:maximumLabelSize:omitOffscreenLabels:](self, "_drawTextForModelRange:inRect:zoomScale:contentOffset:renderView:style:maximumLabelSize:omitOffscreenLabels:", v21, v20, v22, a8, v9, v17, v16, width, height, a5, x, y);
}

- (void)drawBaselineForModelRange:(id)a3 chartRect:(CGRect)a4 zoomScale:(double)a5 contentOffset:(CGPoint)a6 renderView:(id)a7
{
  double y = a6.y;
  double x = a6.x;
  double height = a4.size.height;
  double width = a4.size.width;
  double v13 = a4.origin.y;
  double v14 = a4.origin.x;
  id v22 = a3;
  id v16 = a7;
  double v17 = [(HKAxis *)self preferredStyle];
  if ([v17 showGridLines])
  {
    double v18 = -[HKAxis _baselineForModelRange:axisRect:zoomScale:contentOffset:style:](self, "_baselineForModelRange:axisRect:zoomScale:contentOffset:style:", v22, v17, v14, v13, width, height, a5, x, y);
    double v19 = [v17 gridLineStyle];
    id v20 = [v19 strokeColor];
    LOBYTE(v21) = 0;
    [v16 drawPath:v18 strokeColor:v20 fillColor:0 markerImage:0 useGradientFill:0 blendMode:0 clipToAxes:v21];
  }
}

- (void)drawGridlinesForModelRange:(id)a3 chartRect:(CGRect)a4 gridlineRanges:(id)a5 zoomScale:(double)a6 contentOffset:(CGPoint)a7 renderView:(id)a8 blendMode:(int)a9
{
  uint64_t v9 = *(void *)&a9;
  double y = a7.y;
  double x = a7.x;
  double height = a4.size.height;
  double width = a4.size.width;
  double v17 = a4.origin.y;
  double v18 = a4.origin.x;
  id v36 = a3;
  id v20 = a5;
  id v21 = a8;
  id v22 = [(HKAxis *)self preferredStyle];
  if ([v22 showGridLines])
  {
    double v23 = [v22 minorGridLineStyle];

    if (v23)
    {
      double v24 = -[HKAxis _gridLinesForModelRange:axisRect:gridlineRanges:zoomScale:contentOffset:style:gridLineType:](self, "_gridLinesForModelRange:axisRect:gridlineRanges:zoomScale:contentOffset:style:gridLineType:", v36, v20, v22, 2, v18, v17, width, height, a6, x, y);
      double v25 = [v22 minorGridLineStyle];
      double v26 = [v25 strokeColor];
      LOBYTE(v35) = 0;
      [v21 drawPath:v24 strokeColor:v26 fillColor:0 markerImage:0 useGradientFill:0 blendMode:v9 clipToAxes:v35];
    }
    double v27 = [v22 gridLineStyle];

    if (v27)
    {
      double v28 = -[HKAxis _gridLinesForModelRange:axisRect:gridlineRanges:zoomScale:contentOffset:style:gridLineType:](self, "_gridLinesForModelRange:axisRect:gridlineRanges:zoomScale:contentOffset:style:gridLineType:", v36, v20, v22, 1, v18, v17, width, height, a6, x, y);
      double v29 = [v22 gridLineStyle];
      double v30 = [v29 strokeColor];
      LOBYTE(v35) = 0;
      [v21 drawPath:v28 strokeColor:v30 fillColor:0 markerImage:0 useGradientFill:0 blendMode:v9 clipToAxes:v35];
    }
    double v31 = [v22 referenceGridLineStyle];

    if (v31)
    {
      uint64_t v32 = -[HKAxis _gridLinesForModelRange:axisRect:gridlineRanges:zoomScale:contentOffset:style:gridLineType:](self, "_gridLinesForModelRange:axisRect:gridlineRanges:zoomScale:contentOffset:style:gridLineType:", v36, v20, v22, 0, v18, v17, width, height, a6, x, y);
      objc_super v33 = [v22 referenceGridLineStyle];
      v34 = [v33 strokeColor];
      LOBYTE(v35) = 0;
      [v21 drawPath:v32 strokeColor:v34 fillColor:0 markerImage:0 useGradientFill:0 blendMode:v9 clipToAxes:v35];
    }
  }
}

- (BOOL)_styleIsHorizontal:(id)a3
{
  return ([a3 location] & 0xFFFFFFFFFFFFFFFDLL) == 0;
}

- (HKRange)_chartRangeForChartRect:(CGRect)a3 zoomScale:(double)a4 contentOffset:(CGPoint)a5
{
  double x = a5.x;
  CGFloat height = a3.size.height;
  double width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat v10 = a3.origin.x;
  id v11 = self;
  double v12 = [(HKAxis *)self preferredStyle];
  LODWORD(v11) = [(HKAxis *)v11 _styleIsHorizontal:v12];

  if (v11)
  {
    CGFloat v13 = x / a4;
    double v14 = width / a4 + -2.22507386e-308;
    if (v14 < 0.0) {
      double v14 = 0.0;
    }
  }
  else
  {
    v16.origin.double x = v10;
    v16.origin.CGFloat y = y;
    v16.size.double width = width;
    v16.size.CGFloat height = height;
    CGFloat v13 = CGRectGetHeight(v16);
    double v14 = -v13;
  }
  result.double var1 = v14;
  result.double var0 = v13;
  return result;
}

- (void)_offsetForChartRect:(CGRect)a3 chartRange:(HKRange)a4 zoomScaleOut:(double *)a5 contentOffsetOut:(CGPoint *)a6
{
  double var1 = a4.var1;
  double var0 = a4.var0;
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  double v15 = self;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  CGRect v16 = (double *)MEMORY[0x1E4F1DAD8];
  double v17 = [(HKAxis *)self preferredStyle];
  LODWORD(v15) = [(HKAxis *)v15 _styleIsHorizontal:v17];

  if (v15)
  {
    CGFloat v18 = 1.0;
    if (var1 > 0.0 && a5)
    {
      v27.origin.CGFloat x = x;
      v27.origin.CGFloat y = y;
      v27.size.CGFloat width = width;
      v27.size.CGFloat height = height;
      CGFloat v18 = CGRectGetWidth(v27) / var1;
    }
    double v19 = var0 * v18;
  }
  else
  {
    double v19 = *v16;
    _HKInitializeLogging();
    id v20 = (void *)*MEMORY[0x1E4F29F28];
    CGFloat v18 = 1.0;
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F28], OS_LOG_TYPE_DEFAULT))
    {
      id v21 = v20;
      id v22 = NSStringFromSelector(a2);
      int v24 = 138543362;
      double v25 = v22;
      _os_log_impl(&dword_1E0B26000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@ called on vertical axis. This was probably not intentional", (uint8_t *)&v24, 0xCu);
    }
  }
  if (a5) {
    *a5 = v18;
  }
  if (a6)
  {
    CGFloat v23 = v16[1];
    a6->CGFloat x = v19;
    a6->CGFloat y = v23;
  }
}

- (id)rangeForChartRect:(CGRect)a3 zoomScale:(double)a4 contentOffset:(CGPoint)a5
{
  -[HKAxis _chartRangeForChartRect:zoomScale:contentOffset:](self, "_chartRangeForChartRect:zoomScale:contentOffset:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4, a5.x, a5.y);
  double v7 = v6;
  double v9 = v8;
  [(HKAxis *)self pointTransform];
  double v12 = -v10 / v11;
  double v13 = 1.0 / v11;
  double v14 = v12 + v7 * v13;
  double v15 = v9 * v13;
  CGRect v16 = [(HKAxis *)self transform];
  double v17 = objc_msgSend(v16, "valueForCoordinate:", HKRangeMin(v14, v15));

  CGFloat v18 = [(HKAxis *)self transform];
  double v19 = objc_msgSend(v18, "valueForCoordinate:", HKRangeMax(v14, v15));

  id v20 = +[HKValueRange valueRangeWithMinValue:v17 maxValue:v19];

  return v20;
}

- (void)offsetForValueRange:(id)a3 chartRect:(CGRect)a4 zoomScaleOut:(double *)a5 contentOffsetOut:(CGPoint *)a6
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v13 = a3;
  double v14 = [v13 minValue];
  [v14 doubleValue];
  double v16 = v15;

  double v17 = [v13 maxValue];

  [v17 doubleValue];
  double v19 = v18;

  [(HKAxis *)self pointTransform];
  double v22 = (v19 - v16) * v21;
  if (v22 > 0.0)
  {
    -[HKAxis _offsetForChartRect:chartRange:zoomScaleOut:contentOffsetOut:](self, "_offsetForChartRect:chartRange:zoomScaleOut:contentOffsetOut:", a5, a6, x, y, width, height, v20 + v16 * v21, v22);
  }
}

- (int64_t)dateZoomForZoomScale:(double)a3
{
  return 5;
}

- (void)_drawTextForModelRange:(id)a3 inRect:(CGRect)a4 zoomScale:(double)a5 contentOffset:(CGPoint)a6 renderView:(id)a7 style:(id)a8 maximumLabelSize:(CGSize *)a9 omitOffscreenLabels:(BOOL)a10
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  uint64_t v113 = *MEMORY[0x1E4F143B8];
  id v68 = a3;
  id v73 = a7;
  id v69 = a8;
  double v16 = [v69 labelStyle];

  if (v16)
  {
    BOOL v17 = [(HKAxis *)self _styleIsHorizontal:v69];
    v67 = [v69 labelStyle];
    v64 = [v67 hyphenationFactor];
    uint64_t v18 = [v67 verticalAlignment];
    v63 = [v67 textColor];
    v62 = [v67 font];
    uint64_t v110 = 0;
    -[HKAxis _axisOffsetWithStyle:chartRect:horizontalAlignmentOut:](self, "_axisOffsetWithStyle:chartRect:horizontalAlignmentOut:", v69, &v110, x, y, width, height);
    double v70 = v19;
    uint64_t v105 = 0;
    v106 = (float64x2_t *)&v105;
    uint64_t v107 = 0x3010000000;
    v108 = &unk_1E0F50A5E;
    CGSize v109 = *a9;
    uint64_t v20 = v110;
    if (v110) {
      BOOL v21 = 0;
    }
    else {
      BOOL v21 = v17;
    }
    if (v21)
    {
      [v69 fillInnerPadding];
      double v23 = v22;
      uint64_t v20 = v110;
    }
    else
    {
      double v23 = 0.0;
    }
    if (v20 == 2 && v17)
    {
      [v69 fillInnerPadding];
      double v23 = -v25;
    }
    -[HKAxis _drawTextBackgroundWithRect:style:renderView:](self, "_drawTextBackgroundWithRect:style:renderView:", v69, v73, x, y, width, height);
    uint64_t v26 = [(HKAxis *)self axisAnnotations];
    BOOL v27 = v26 == 0;

    if (v27)
    {
      double v28 = 0;
    }
    else
    {
      double v28 = objc_alloc_init(HKAxisExclusion);
      long long v103 = 0u;
      long long v104 = 0u;
      long long v101 = 0u;
      long long v102 = 0u;
      double v29 = [(HKAxis *)self axisAnnotations];
      uint64_t v30 = [v29 countByEnumeratingWithState:&v101 objects:v112 count:16];
      if (v30)
      {
        uint64_t v31 = *(void *)v102;
        do
        {
          for (uint64_t i = 0; i != v30; ++i)
          {
            if (*(void *)v102 != v31) {
              objc_enumerationMutation(v29);
            }
            objc_super v33 = *(void **)(*((void *)&v101 + 1) + 8 * i);
            v34 = [v33 annotationText];
            BOOL v35 = v34 == 0;

            if (!v35)
            {
              id v36 = [(HKAxis *)self labelDataSource];
              v37 = [v33 position];
              objc_msgSend(v36, "renderPositionForLabelLocation:rect:zoomScale:contentOffset:constantOffset:isHorizontal:optionalOffset:", v37, v17, x, y, width, height, a5, a6.x, a6.y, v70, *(void *)&v23, 0);
              double v39 = v38;
              double v41 = v40;

              v42 = [v33 annotationText];
              objc_msgSend(v73, "drawAttributedText:atPoint:axisRect:horizontalAlignment:verticalAlignment:exclusion:", v42, v110, v18, v28, v39, v41, x, y, width, height);
              float64_t v75 = v44;
              float64_t v76 = v43;

              v45.f64[0] = v76;
              v45.f64[1] = v75;
              v106[2] = (float64x2_t)vbslq_s8((int8x16_t)vcgtq_f64(v45, v106[2]), (int8x16_t)v45, (int8x16_t)v106[2]);
            }
          }
          uint64_t v30 = [v29 countByEnumeratingWithState:&v101 objects:v112 count:16];
        }
        while (v30);
      }
    }
    if ([(HKAxis *)self axisAnnotationsExcludeInterstitialAxisLabels]) {
      [(HKAxisExclusion *)v28 unifyExclusion];
    }
    v46 = (void *)CTFontCopySystemUIFontExcessiveLineHeightCharacterSet();
    uint64_t v97 = 0;
    v98 = &v97;
    uint64_t v99 = 0x2020000000;
    char v100 = 0;
    v47 = [(HKAxis *)self axisLabelsInModelRangeFromCache:v68 zoomScale:a5];
    long long v95 = 0u;
    long long v96 = 0u;
    long long v93 = 0u;
    long long v94 = 0u;
    id v48 = v47;
    uint64_t v49 = [v48 countByEnumeratingWithState:&v93 objects:v111 count:16];
    if (v49)
    {
      uint64_t v50 = *(void *)v94;
      do
      {
        for (uint64_t j = 0; j != v49; ++j)
        {
          if (*(void *)v94 != v50) {
            objc_enumerationMutation(v48);
          }
          if (v17)
          {
            v52 = [*(id *)(*((void *)&v93 + 1) + 8 * j) text];
            BOOL v53 = [v52 rangeOfCharacterFromSet:v46] != 0x7FFFFFFFFFFFFFFFLL
               || *((unsigned char *)v98 + 24) != 0;
            *((unsigned char *)v98 + 24) = v53;
          }
        }
        uint64_t v49 = [v48 countByEnumeratingWithState:&v93 objects:v111 count:16];
      }
      while (v49);
    }

    v54 = [v69 gridLineStyle];
    [v54 lineWidth];
    uint64_t v56 = v55;
    v77[0] = MEMORY[0x1E4F143A8];
    v77[1] = 3221225472;
    v77[2] = __118__HKAxis__drawTextForModelRange_inRect_zoomScale_contentOffset_renderView_style_maximumLabelSize_omitOffscreenLabels___block_invoke;
    v77[3] = &unk_1E6D566E0;
    BOOL v92 = a10;
    double v86 = x;
    double v87 = y;
    double v88 = width;
    double v89 = height;
    id v78 = v73;
    uint64_t v90 = v110;
    uint64_t v91 = v18;
    id v57 = v64;
    id v79 = v57;
    id v58 = v63;
    id v80 = v58;
    id v59 = v62;
    id v81 = v59;
    v60 = v28;
    v82 = v60;
    id v61 = v67;
    id v83 = v61;
    v84 = &v97;
    v85 = &v105;
    -[HKAxis _enumerateAxisLabelsForTextInRange:rect:zoomScale:contentOffset:constantOffset:isHorizontal:optionalOffset:gridlineWidth:usingBlock:](self, "_enumerateAxisLabelsForTextInRange:rect:zoomScale:contentOffset:constantOffset:isHorizontal:optionalOffset:gridlineWidth:usingBlock:", v68, v17, v77, x, y, width, height, a5, a6.x, a6.y, v70, *(void *)&v23, 0, v56);

    *a9 = (CGSize)v106[2];
    _Block_object_dispose(&v97, 8);

    _Block_object_dispose(&v105, 8);
  }
}

void __118__HKAxis__drawTextForModelRange_inRect_zoomScale_contentOffset_renderView_style_maximumLabelSize_omitOffscreenLabels___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v27 = a2;
  id v7 = a4;
  [a3 CGPointValue];
  double v9 = v8;
  double v11 = v10;
  if (!*(unsigned char *)(a1 + 144) || v8 >= *(double *)(a1 + 96))
  {
    uint64_t v12 = *(void *)(a1 + 128);
    uint64_t v13 = *(void *)(a1 + 136);
    double v14 = *(void **)(a1 + 32);
    uint64_t v15 = *(void *)(a1 + 40);
    uint64_t v16 = *(void *)(a1 + 48);
    uint64_t v17 = *(void *)(a1 + 56);
    uint64_t v18 = *(void *)(a1 + 64);
    char v19 = [*(id *)(a1 + 72) isSystemSymbol];
    BYTE1(v26) = *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24);
    LOBYTE(v26) = v19;
    LOBYTE(v25) = 0;
    [v14 drawText:v27 atPoint:v7 spaceAvailable:v12 horizontalAlignment:v13 verticalAlignment:v15 hyphenationFactor:v16 textColor:v9 font:v11 clipToAxis:v17 exclusion:v25 isSystemSymbol:v18 isTallText:v26];
    uint64_t v22 = *(void *)(*(void *)(a1 + 88) + 8);
    if (*(double *)(v22 + 32) >= v20) {
      double v20 = *(double *)(v22 + 32);
    }
    *(double *)(v22 + 32) = v20;
    uint64_t v23 = *(void *)(*(void *)(a1 + 88) + 8);
    double v24 = *(double *)(v23 + 40);
    if (v24 < v21) {
      double v24 = v21;
    }
    *(double *)(v23 + 40) = v24;
  }
}

- (CGPoint)renderPositionForLabelLocation:(id)a3 rect:(CGRect)a4 zoomScale:(double)a5 contentOffset:(CGPoint)a6 constantOffset:(double)a7 isHorizontal:(BOOL)a8 optionalOffset:(CGPoint)a9
{
  BOOL v9 = a8;
  double x = a6.x;
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat v16 = a4.origin.x;
  -[HKCoordinateTransform coordinateForValue:](self->_transform, "coordinateForValue:", a3, a8, *(void *)&a9.x, *(void *)&a9.y);
  double v19 = v18;
  [(HKAxis *)self pointTransform];
  double v22 = v20 + v19 * v21;
  CGFloat v23 = v16;
  CGFloat v24 = y;
  CGFloat v25 = width;
  CGFloat v26 = height;
  if (v9)
  {
    CGFloat MinX = CGRectGetMinX(*(CGRect *)&v23);
    double v28 = HKUIFloorToScreenScale(MinX - (x - v22 * a5));
    double v29 = HKUIFloorToScreenScale(v28);
  }
  else
  {
    CGFloat MinY = CGRectGetMinY(*(CGRect *)&v23);
    double v31 = HKUIFloorToScreenScale(v22 + MinY);
    double v32 = HKUIFloorToScreenScale(v31);
    double v29 = a7;
    a7 = v32;
  }
  double v33 = v36 + a7;
  double v34 = v35 + v29;
  result.CGFloat y = v33;
  result.double x = v34;
  return result;
}

- (void)_enumerateAxisLabelsForTextInRange:(id)a3 rect:(CGRect)a4 zoomScale:(double)a5 contentOffset:(CGPoint)a6 constantOffset:(double)a7 isHorizontal:(BOOL)a8 optionalOffset:(CGPoint)a9 gridlineWidth:(double)a10 usingBlock:(id)a11
{
  CGFloat x = a9.x;
  BOOL v12 = a8;
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double v16 = a4.origin.x;
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v18 = a3;
  double v19 = (void (**)(id, void *, void *, void *))*(id *)&x;
  double v20 = [(HKAxis *)self axisLabelsInModelRangeFromCache:v18 zoomScale:a5];
  v60 = [(HKAxis *)self labelDataSource];
  v54 = v20;
  if (v12)
  {
    [v20 count];
    double v21 = 0;
    double v22 = 0;
    CGFloat v23 = 0;
    uint64_t v24 = -1;
    CGFloat v25 = v20;
    while (v24 + 1 != [v25 count])
    {
      CGFloat v26 = [v25 objectAtIndexedSubscript:v24 + 1];
      id v27 = [v26 text];

      if (v27)
      {
        double v28 = [v26 location];
        objc_msgSend(v60, "renderPositionForLabelLocation:rect:zoomScale:contentOffset:constantOffset:isHorizontal:optionalOffset:", v28, 1, v16, y, width, height, a5, a6.x, a6.y, a7, *(void *)&a10, v67);
        double v30 = v29;
        double v55 = v31;

        [v22 CGPointValue];
        double v32 = NSNumber;
        double v33 = v30;
        double v35 = v30 - v34 - a10 - v68;
        [(NSNumber *)self->_horizontalAxisLabelSpacePadding doubleValue];
        v37 = [v32 numberWithDouble:v35 - v36];

        if (v23 && HKUIObjectIsLarger(v37, (uint64_t)&unk_1F3C22798)) {
          v19[2](v19, v23, v22, v37);
        }
        uint64_t v38 = [v26 text];

        uint64_t v39 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", v33, v55);

        CGFloat v23 = (void *)v38;
        double v22 = (void *)v39;
        double v21 = v37;
        CGFloat v25 = v54;
      }
      else
      {
        v37 = v21;
      }

      if (++v24 >= (unint64_t)[v25 count]) {
        goto LABEL_26;
      }
    }
    if (v23 && HKUIObjectIsLarger(v21, (uint64_t)&unk_1F3C22798)) {
      v19[2](v19, v23, v22, v21);
    }
    v37 = v21;
LABEL_26:
  }
  else
  {
    id v56 = v18;
    long long v63 = 0u;
    long long v64 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    id v40 = v20;
    uint64_t v41 = [v40 countByEnumeratingWithState:&v61 objects:v65 count:16];
    if (v41)
    {
      uint64_t v42 = v41;
      uint64_t v43 = *(void *)v62;
      do
      {
        for (uint64_t i = 0; i != v42; ++i)
        {
          if (*(void *)v62 != v43) {
            objc_enumerationMutation(v40);
          }
          float64x2_t v45 = *(void **)(*((void *)&v61 + 1) + 8 * i);
          v46 = [v45 text];

          if (v46)
          {
            v47 = [v45 location];
            objc_msgSend(v60, "renderPositionForLabelLocation:rect:zoomScale:contentOffset:constantOffset:isHorizontal:optionalOffset:", v47, 0, v16, y, width, height, a5, a6.x, a6.y, a7, *(void *)&a10, v67);
            double v49 = v48;
            double v51 = v50;

            v52 = [v45 text];
            BOOL v53 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", v49, v51);
            v19[2](v19, v52, v53, self->_maxLabelWidth);
          }
        }
        uint64_t v42 = [v40 countByEnumeratingWithState:&v61 objects:v65 count:16];
      }
      while (v42);
    }

    CGFloat v25 = v20;
    id v18 = v56;
  }
}

- (CGRect)_labelBackgroundRectWithLabels:(id)a3 font:(id)a4 maxAnnotationWidth:(double)a5 rect:(CGRect)a6 style:(id)a7
{
  CGFloat height = a6.size.height;
  CGFloat width = a6.size.width;
  CGFloat y = a6.origin.y;
  CGFloat x = a6.origin.x;
  id v15 = a3;
  id v16 = a4;
  id v17 = a7;
  id v18 = [v17 fillStyle];
  BOOL v19 = [(HKAxis *)self _styleIsHorizontal:v17];
  if (!v18 || v19)
  {
    double MinX = *MEMORY[0x1E4F1DB28];
    CGFloat MinY = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    a5 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    CGFloat v21 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }
  else
  {
    [(HKAxis *)self _axisFillWidthForStyle:v17 labels:v15 font:v16];
    if (v20 > a5) {
      a5 = v20;
    }
    v33.origin.CGFloat x = x;
    v33.origin.CGFloat y = y;
    v33.size.CGFloat width = width;
    v33.size.CGFloat height = height;
    CGFloat v21 = CGRectGetHeight(v33);
    uint64_t v22 = [v17 location];
    CGFloat v23 = x;
    CGFloat v24 = y;
    CGFloat v25 = width;
    CGFloat v26 = height;
    if (v22 == 3) {
      double MinX = CGRectGetMinX(*(CGRect *)&v23);
    }
    else {
      double MinX = CGRectGetMaxX(*(CGRect *)&v23) - a5;
    }
    v34.origin.CGFloat x = x;
    v34.origin.CGFloat y = y;
    v34.size.CGFloat width = width;
    v34.size.CGFloat height = height;
    CGFloat MinY = CGRectGetMinY(v34);
  }

  double v29 = MinX;
  double v30 = MinY;
  double v31 = a5;
  double v32 = v21;
  result.size.CGFloat height = v32;
  result.size.CGFloat width = v31;
  result.origin.CGFloat y = v30;
  result.origin.CGFloat x = v29;
  return result;
}

- (double)_maximumWidthOfAnnotations:(id)a3 axisStyle:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v7 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v20;
    double v10 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(v5);
        }
        BOOL v12 = [*(id *)(*((void *)&v19 + 1) + 8 * i) annotationText];
        [v12 size];
        double v14 = v13;

        if (v10 < v14) {
          double v10 = v14;
        }
      }
      uint64_t v8 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v8);
    if (v10 > 0.0)
    {
      [v6 fillInnerPadding];
      double v16 = v15;
      [v6 fillOuterPadding];
      double v10 = v10 + v16 + v17;
    }
  }
  else
  {
    double v10 = 0.0;
  }

  return v10;
}

- (void)_drawTextBackgroundWithRect:(CGRect)a3 style:(id)a4 renderView:(id)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v11 = a5;
  double v10 = [a4 fillStyle];
  if (v10)
  {
    v13.origin.double x = x;
    v13.origin.double y = y;
    v13.size.double width = width;
    v13.size.double height = height;
    if (!CGRectEqualToRect(v13, *MEMORY[0x1E4F1DB28])) {
      objc_msgSend(v11, "fillRect:withFillStyle:axisRect:alpha:", v10, x, y, width, height, x, y, width, height, 0x3FF0000000000000);
    }
  }
}

- (double)_axisFillWidthForStyle:(id)a3 labels:(id)a4 font:(id)a5
{
  id v8 = a3;
  [(HKAxis *)self _maxLabelWidthFromLabels:a4 font:a5];
  double v10 = v9;
  [v8 fillInnerPadding];
  double v12 = v10 + v11;
  [v8 fillOuterPadding];
  double v14 = v13;

  return ceil(v12 + v14);
}

- (double)_maxLabelWidthFromLabels:(id)a3 font:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v8 = [v6 countByEnumeratingWithState:&v21 objects:v27 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v22;
    uint64_t v11 = *MEMORY[0x1E4FB06F8];
    double v12 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v22 != v10) {
          objc_enumerationMutation(v6);
        }
        double v14 = [*(id *)(*((void *)&v21 + 1) + 8 * i) text];
        uint64_t v25 = v11;
        id v26 = v7;
        double v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v26 forKeys:&v25 count:1];
        [v14 sizeWithAttributes:v15];
        double v17 = v16;

        if (v12 < v17) {
          double v12 = v17;
        }
      }
      uint64_t v9 = [v6 countByEnumeratingWithState:&v21 objects:v27 count:16];
    }
    while (v9);
  }
  else
  {
    double v12 = 0.0;
  }
  maxLabelWidth = self->_maxLabelWidth;
  if (maxLabelWidth)
  {
    [(NSNumber *)maxLabelWidth doubleValue];
    if (v12 >= v19) {
      double v12 = v19;
    }
  }

  return v12;
}

- (double)bottomBaselineYCoordinateForModelRange:(id)a3 axisRect:(CGRect)a4 zoomScale:(double)a5
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  id v11 = a3;
  uint64_t v15 = 0;
  double v16 = (double *)&v15;
  uint64_t v17 = 0x2020000000;
  unint64_t v18 = 0xC7EFFFFFE0000000;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __68__HKAxis_bottomBaselineYCoordinateForModelRange_axisRect_zoomScale___block_invoke;
  v14[3] = &unk_1E6D56708;
  *(CGFloat *)&v14[5] = x;
  *(CGFloat *)&v14[6] = y;
  *(CGFloat *)&v14[7] = width;
  *(CGFloat *)&v14[8] = height;
  v14[4] = &v15;
  [(HKAxis *)self enumerateTickCoordinatesInModelRange:v11 zoomScale:v14 handler:a5];
  if (v16[3] == -3.40282347e38) {
    double v12 = -1.0;
  }
  else {
    double v12 = v16[3];
  }
  _Block_object_dispose(&v15, 8);

  return v12;
}

void __68__HKAxis_bottomBaselineYCoordinateForModelRange_axisRect_zoomScale___block_invoke(uint64_t a1, double a2)
{
  CGFloat MinY = CGRectGetMinY(*(CGRect *)(a1 + 40));
  double v5 = HKUIFloorToScreenScale(MinY + a2);
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  if (v5 > *(double *)(v6 + 24)) {
    *(double *)(v6 + 24) = v5;
  }
}

- (BOOL)_containsTopBaselineWithModelRange:(id)a3 zoomScale:(double)a4
{
  return !self->_overrideNoTopBaseline
      && [(HKAxis *)self _axisLabelCountWithTextInModelRange:a3 zoomScale:a4] > 0;
}

- (double)topBaselineYCoordinateForModelRange:(id)a3 axisRect:(CGRect)a4 zoomScale:(double)a5
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  double y = a4.origin.y;
  CGFloat x = a4.origin.x;
  id v11 = a3;
  if ([(HKAxis *)self _containsTopBaselineWithModelRange:v11 zoomScale:a5])
  {
    uint64_t v14 = 0;
    uint64_t v15 = (double *)&v14;
    uint64_t v16 = 0x2020000000;
    uint64_t v17 = 0x47EFFFFFE0000000;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __65__HKAxis_topBaselineYCoordinateForModelRange_axisRect_zoomScale___block_invoke;
    v13[3] = &unk_1E6D56708;
    *(CGFloat *)&v13[5] = x;
    *(double *)&v13[6] = y;
    *(CGFloat *)&v13[7] = width;
    *(CGFloat *)&v13[8] = height;
    v13[4] = &v14;
    [(HKAxis *)self enumerateTickCoordinatesInModelRange:v11 zoomScale:v13 handler:a5];
    if (v15[3] == 3.40282347e38) {
      double y = -1.0;
    }
    else {
      double y = v15[3];
    }
    _Block_object_dispose(&v14, 8);
  }

  return y;
}

void __65__HKAxis_topBaselineYCoordinateForModelRange_axisRect_zoomScale___block_invoke(uint64_t a1, double a2)
{
  CGFloat MinY = CGRectGetMinY(*(CGRect *)(a1 + 40));
  double v5 = HKUIFloorToScreenScale(MinY + a2);
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  if (v5 < *(double *)(v6 + 24)) {
    *(double *)(v6 + 24) = v5;
  }
}

- (id)_baselineForModelRange:(id)a3 axisRect:(CGRect)a4 zoomScale:(double)a5 contentOffset:(CGPoint)a6 style:(id)a7
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v14 = a7;
  id v15 = a3;
  uint64_t v16 = objc_opt_new();
  uint64_t v17 = [v14 gridLineStyle];

  [v17 lineWidth];
  double v19 = v18;

  [v16 setLineWidth:v19];
  -[HKAxis bottomBaselineYCoordinateForModelRange:axisRect:zoomScale:](self, "bottomBaselineYCoordinateForModelRange:axisRect:zoomScale:", v15, x, y, width, height, a5);
  double v21 = v20;

  if (v21 >= -0.00000011920929)
  {
    objc_msgSend(v16, "moveToPoint:", x, v21);
    v24.origin.double x = x;
    v24.origin.double y = y;
    v24.size.double width = width;
    v24.size.double height = height;
    objc_msgSend(v16, "addLineToPoint:", CGRectGetMaxX(v24), v21);
  }
  return v16;
}

- (id)_gridLinesForModelRange:(id)a3 axisRect:(CGRect)a4 gridlineRanges:(id)a5 zoomScale:(double)a6 contentOffset:(CGPoint)a7 style:(id)a8 gridLineType:(int64_t)a9
{
  CGFloat y = a7.y;
  CGFloat x = a7.x;
  double height = a4.size.height;
  double width = a4.size.width;
  double v17 = a4.origin.y;
  double v18 = a4.origin.x;
  id v20 = a3;
  id v21 = a5;
  id v22 = a8;
  BOOL v23 = [(HKAxis *)self _styleIsHorizontal:v22];
  BOOL v24 = v23;
  CGRectEdge v25 = !v23;
  switch(a9)
  {
    case 0:
      uint64_t v26 = [v22 referenceGridLineStyle];
      goto LABEL_7;
    case 1:
      uint64_t v26 = [v22 gridLineStyle];
      goto LABEL_7;
    case 2:
      uint64_t v26 = [v22 minorGridLineStyle];
LABEL_7:
      id v27 = (void *)v26;
      goto LABEL_9;
  }
  id v27 = 0;
LABEL_9:
  [v27 lineWidth];
  CGFloat v29 = v28;
  memset(&slice, 0, sizeof(slice));
  memset(&remainder, 0, sizeof(remainder));
  v55.origin.CGFloat x = v18;
  v55.origin.CGFloat y = v17;
  v55.size.double width = width;
  v55.size.double height = height;
  CGRectDivide(v55, &slice, &remainder, v29, v25);
  double v30 = objc_opt_new();
  [v30 setLineWidth:v29];
  if ([v27 dashStyle]) {
    [v30 setLineDash:&_HKNonSolidGridLineDash count:1 phase:0.0];
  }
  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  CGRect v43 = slice;
  v39[2] = __101__HKAxis__gridLinesForModelRange_axisRect_gridlineRanges_zoomScale_contentOffset_style_gridLineType___block_invoke;
  v39[3] = &unk_1E6D56730;
  int64_t v42 = a9;
  BOOL v51 = v24;
  double v44 = a6;
  CGFloat v45 = x;
  CGFloat v46 = y;
  double v47 = v18;
  double v48 = v17;
  double v49 = width;
  double v50 = height;
  id v31 = v30;
  id v40 = v31;
  id v41 = v21;
  id v32 = v21;
  [(HKAxis *)self enumerateTickCoordinatesInModelRange:v20 zoomScale:v39 handler:a6];
  if (self->_overrideNoTopBaseline && !v24)
  {
    -[HKAxis topBaselineYCoordinateForModelRange:axisRect:zoomScale:](self, "topBaselineYCoordinateForModelRange:axisRect:zoomScale:", v20, v18, v17, width, height, a6);
    double v34 = v33;
    CGFloat v35 = slice.origin.x + slice.size.width;
    objc_msgSend(v31, "moveToPoint:");
    objc_msgSend(v31, "addLineToPoint:", v35, v34);
  }
  double v36 = v41;
  id v37 = v31;

  return v37;
}

void __101__HKAxis__gridLinesForModelRange_axisRect_gridlineRanges_zoomScale_contentOffset_style_gridLineType___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4, double a5)
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v9 = a2;
  id v10 = a4;
  if (*(void *)(a1 + 48) == a3)
  {
    if (*(unsigned char *)(a1 + 144))
    {
      double v11 = *(double *)(a1 + 64);
      CGFloat v12 = *(double *)(a1 + 80);
      double v13 = -(*(double *)(a1 + 96) - a5 * *(double *)(a1 + 88));
      CGFloat MinX = CGRectGetMinX(*(CGRect *)(a1 + 112));
      double v15 = HKUIFloorToScreenScale(v13 + MinX);
      CGFloat v16 = 0.0;
    }
    else
    {
      CGFloat v16 = *(double *)(a1 + 72);
      double v15 = *(double *)(a1 + 56);
      CGFloat MinY = CGRectGetMinY(*(CGRect *)(a1 + 112));
      double v11 = HKUIFloorToScreenScale(MinY + a5);
      CGFloat v12 = 0.0;
    }
    v55.origin.CGFloat x = v15;
    v55.origin.CGFloat y = v11;
    v55.size.double width = v16;
    v55.size.double height = v12;
    if (CGRectContainsRect(*(CGRect *)(a1 + 112), v55))
    {
      double v18 = *(void **)(a1 + 32);
      v49.origin.CGFloat x = v15;
      v49.origin.CGFloat y = v11;
      v49.size.double width = v16;
      v49.size.double height = v12;
      double v19 = CGRectGetMinX(v49);
      v50.origin.CGFloat x = v15;
      v50.origin.CGFloat y = v11;
      v50.size.double width = v16;
      v50.size.double height = v12;
      objc_msgSend(v18, "moveToPoint:", v19, CGRectGetMinY(v50));
      if (*(unsigned char *)(a1 + 144))
      {
        double v20 = 0.0;
        double v21 = 48.0;
        if (!v10) {
          double v21 = 0.0;
        }
        if (!a3) {
          double v20 = v21;
        }
        if (a3 == 1) {
          double v20 = 48.0;
        }
        if (a3 == 2) {
          double v22 = -2.0;
        }
        else {
          double v22 = v20;
        }
        v51.origin.CGFloat x = v15;
        v51.origin.CGFloat y = v11;
        v51.size.double width = v16;
        v51.size.double height = v12;
        double MaxX = CGRectGetMaxX(v51);
        v52.origin.CGFloat x = v15;
        v52.origin.CGFloat y = v11;
        v52.size.double width = v16;
        v52.size.double height = v12;
        double MaxY = CGRectGetMaxY(v52);
        CGRectEdge v25 = *(void **)(a1 + 40);
        if (v25 && [v25 count])
        {
          double v26 = v22 + MaxY;
          long long v45 = 0u;
          long long v46 = 0u;
          long long v43 = 0u;
          long long v44 = 0u;
          id v27 = *(id *)(a1 + 40);
          uint64_t v28 = [v27 countByEnumeratingWithState:&v43 objects:v47 count:16];
          if (v28)
          {
            uint64_t v29 = v28;
            uint64_t v30 = *(void *)v44;
            do
            {
              for (uint64_t i = 0; i != v29; ++i)
              {
                if (*(void *)v44 != v30) {
                  objc_enumerationMutation(v27);
                }
                id v32 = *(void **)(*((void *)&v43 + 1) + 8 * i);
                double v33 = objc_msgSend(v32, "minValue", (void)v43);
                [v33 floatValue];
                double v35 = v34;

                double v36 = [v32 maxValue];
                [v36 floatValue];
                double v38 = v37;

                objc_msgSend(*(id *)(a1 + 32), "moveToPoint:", MaxX, v35);
                objc_msgSend(*(id *)(a1 + 32), "addLineToPoint:", MaxX, v38);
              }
              uint64_t v29 = [v27 countByEnumeratingWithState:&v43 objects:v47 count:16];
            }
            while (v29);
          }
          else
          {
            double v38 = v22 + MaxY;
          }

          objc_msgSend(*(id *)(a1 + 32), "moveToPoint:", MaxX, v38);
          double v42 = MaxX;
          if (v22 == 0.0) {
            double v40 = v38;
          }
          else {
            double v40 = v26;
          }
          uint64_t v39 = *(void **)(a1 + 32);
          goto LABEL_34;
        }
        uint64_t v39 = *(void **)(a1 + 32);
        double v40 = v22 + MaxY;
      }
      else
      {
        id v41 = *(void **)(a1 + 32);
        v53.origin.CGFloat x = v15;
        v53.origin.CGFloat y = v11;
        v53.size.double width = v16;
        v53.size.double height = v12;
        double MaxX = CGRectGetMaxX(v53);
        v54.origin.CGFloat x = v15;
        v54.origin.CGFloat y = v11;
        v54.size.double width = v16;
        v54.size.double height = v12;
        double v40 = CGRectGetMaxY(v54);
        uint64_t v39 = v41;
      }
      double v42 = MaxX;
LABEL_34:
      objc_msgSend(v39, "addLineToPoint:", v42, v40, (void)v43);
    }
  }
}

- (void)_addTickMarksForPosition:(unint64_t)a3 axisRect:(CGRect)a4 modelRange:(id)a5 zoomScale:(double)a6 contentOffset:(CGPoint)a7 toBezierPath:(id)a8 style:(id)a9
{
  CGFloat y = a7.y;
  CGFloat x = a7.x;
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat v16 = a4.origin.y;
  CGFloat v17 = a4.origin.x;
  CGRect remainder = a4;
  id v20 = a5;
  id v21 = a8;
  id v22 = a9;
  BOOL v23 = [v22 tickStyle];
  uint64_t v24 = [v22 axisLineStyle];
  CGRectEdge v25 = (void *)v24;
  if (v23 && v24)
  {
    [v23 tickLength];
    double v27 = v26;
    uint64_t v28 = [v23 tickDirection];
    BOOL v29 = [(HKAxis *)self _styleIsHorizontal:v22];
    uint64_t v30 = [v22 location];
    BOOL v37 = v29;
    if ((unint64_t)(v30 - 1) > 2) {
      int v31 = 1;
    }
    else {
      int v31 = dword_1E0F060F8[v30 - 1];
    }
    CGRectEdge edge = v31;
    id v32 = [v22 tickStyle];
    char v33 = [v32 shouldRenderMajorTickMarks];

    if (v28 == 2)
    {
      if (a3 == 2) {
        uint64_t v28 = 4;
      }
      else {
        uint64_t v28 = 3;
      }
    }
    else if (v28 == 1)
    {
      if (a3 == 2) {
        uint64_t v28 = 3;
      }
      else {
        uint64_t v28 = 4;
      }
    }
    memset(&slice, 0, sizeof(slice));
    [v25 lineWidth];
    CGFloat v35 = v34;
    v52.origin.CGFloat x = v17;
    v52.origin.CGFloat y = v16;
    v52.size.CGFloat width = width;
    v52.size.CGFloat height = height;
    CGRectDivide(v52, &slice, &remainder, v35, edge);
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __98__HKAxis__addTickMarksForPosition_axisRect_modelRange_zoomScale_contentOffset_toBezierPath_style___block_invoke;
    v38[3] = &unk_1E6D56758;
    char v48 = v33;
    uint64_t v41 = (uint64_t)v27;
    uint64_t v42 = v28;
    id v39 = v25;
    BOOL v49 = v37;
    double v43 = a6;
    CGFloat v44 = x;
    CGFloat v45 = y;
    CGRect v46 = remainder;
    CGRect v47 = slice;
    id v40 = v21;
    [(HKAxis *)self enumerateTickCoordinatesInModelRange:v20 zoomScale:v38 handler:a6];
  }
}

void __98__HKAxis__addTickMarksForPosition_axisRect_modelRange_zoomScale_contentOffset_toBezierPath_style___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4, double a5)
{
  id v9 = a2;
  id v10 = a4;
  if (a3 == 2 || *(unsigned char *)(a1 + 152))
  {
    double v11 = 1.7;
    if (a3 == 2) {
      double v11 = 1.0;
    }
    double v12 = floor(v11 * (double)*(uint64_t *)(a1 + 48));
    if (*(void *)(a1 + 56) == 4)
    {
      [*(id *)(a1 + 32) lineWidth];
      double v14 = v13;
    }
    else
    {
      double v14 = -v12;
    }
    if (*(unsigned char *)(a1 + 153))
    {
      double v15 = -(*(double *)(a1 + 72) - a5 * *(double *)(a1 + 64));
      CGFloat MinX = CGRectGetMinX(*(CGRect *)(a1 + 88));
      double v17 = HKUIFloorToScreenScale(v15 + MinX);
      double v18 = v14 + *(double *)(a1 + 128);
      CGFloat width = 0.0;
    }
    else
    {
      CGFloat v20 = *MEMORY[0x1E4F1DB28];
      CGFloat v21 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
      CGAffineTransformMakeRotation(&v28, -1.57079633);
      v29.origin.double x = v20;
      v29.origin.CGFloat y = v14;
      v29.size.CGFloat width = v21;
      v29.size.CGFloat height = v12;
      CGRect v30 = CGRectApplyAffineTransform(v29, &v28);
      double x = v30.origin.x;
      CGFloat width = v30.size.width;
      CGFloat MinY = CGRectGetMinY(*(CGRect *)(a1 + 88));
      double v18 = HKUIFloorToScreenScale(MinY + a5);
      double v17 = x + *(double *)(a1 + 120);
      double v12 = 0.0;
    }
    uint64_t v24 = *(void **)(a1 + 40);
    v31.origin.double x = v17;
    v31.origin.CGFloat y = v18;
    v31.size.CGFloat width = width;
    v31.size.CGFloat height = v12;
    double v25 = CGRectGetMinX(v31);
    v32.origin.double x = v17;
    v32.origin.CGFloat y = v18;
    v32.size.CGFloat width = width;
    v32.size.CGFloat height = v12;
    objc_msgSend(v24, "moveToPoint:", v25, CGRectGetMinY(v32));
    double v26 = *(void **)(a1 + 40);
    v33.origin.double x = v17;
    v33.origin.CGFloat y = v18;
    v33.size.CGFloat width = width;
    v33.size.CGFloat height = v12;
    double MaxX = CGRectGetMaxX(v33);
    v34.origin.double x = v17;
    v34.origin.CGFloat y = v18;
    v34.size.CGFloat width = width;
    v34.size.CGFloat height = v12;
    objc_msgSend(v26, "addLineToPoint:", MaxX, CGRectGetMaxY(v34));
  }
}

- (void)_renderTickMarksForModelRange:(id)a3 chartRect:(CGRect)a4 zoomScale:(double)a5 contentOffset:(CGPoint)a6 style:(id)a7 renderView:(id)a8
{
  double y = a6.y;
  double x = a6.x;
  double height = a4.size.height;
  double width = a4.size.width;
  double v15 = a4.origin.y;
  double v16 = a4.origin.x;
  id v26 = a3;
  id v18 = a7;
  id v19 = a8;
  uint64_t v20 = [v18 tickPositions];
  if (v20)
  {
    char v21 = v20;
    id v22 = objc_opt_new();
    if (v21) {
      -[HKAxis _addTickMarksForPosition:axisRect:modelRange:zoomScale:contentOffset:toBezierPath:style:](self, "_addTickMarksForPosition:axisRect:modelRange:zoomScale:contentOffset:toBezierPath:style:", 1, v26, v22, v18, v16, v15, width, height, a5, x, y);
    }
    if ((v21 & 2) != 0) {
      -[HKAxis _addTickMarksForPosition:axisRect:modelRange:zoomScale:contentOffset:toBezierPath:style:](self, "_addTickMarksForPosition:axisRect:modelRange:zoomScale:contentOffset:toBezierPath:style:", 2, v26, v22, v18, v16, v15, width, height, a5, x, y);
    }
    if (([v22 isEmpty] & 1) == 0)
    {
      BOOL v23 = [v18 tickStyle];
      uint64_t v24 = [v23 strokeColor];
      LOBYTE(v25) = 0;
      [v19 drawPath:v22 strokeColor:v24 fillColor:0 markerImage:0 useGradientFill:0 blendMode:0 clipToAxes:v25];
    }
  }
}

- (void)addAxisAnnotation:(id)a3 modelCoordinate:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(HKAxis *)self axisAnnotations];

  if (!v8)
  {
    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    [(HKAxis *)self setAxisAnnotations:v9];
  }
  double v11 = [[HKAxisAnnotation alloc] initWithAnnotation:v7 position:v6];

  id v10 = [(HKAxis *)self axisAnnotations];
  [v10 addObject:v11];
}

- (int64_t)axisAnnotationCount
{
  v2 = [(HKAxis *)self axisAnnotations];
  int64_t v3 = [v2 count];

  return v3;
}

- (void)clearAnnotations
{
}

- (void)clearCache
{
  id v2 = [(HKAxisStyle *)self->_preferredStyle fillStyle];
  [v2 clearCache];
}

- (void)invalidateAxisLabelCache
{
}

- (double)offsetForLegendView
{
  return 0.0;
}

+ (HKAxisMinMaxDefinition)expandByPointsLow:(double)a3 high:(double)a4 modelRange:(HKAxisMinMaxDefinition)a5 pointRange:(HKAxisMinMaxDefinition)a6
{
  double v6 = a6.var0 + a3;
  double v7 = a6.var1 - a4;
  double v8 = vabdd_f64(v7, a6.var0);
  if (vabdd_f64(v6, v7) >= 0.00000011920929 && v8 >= 0.00000011920929)
  {
    a5.double var0 = (a5.var0 * (a6.var0 - v7) + a5.var1 * (v6 - a6.var0)) / (v6 - v7);
    a5.double var1 = a5.var0 + (a6.var1 - a6.var0) * (a5.var1 - a5.var0) / (v7 - a6.var0);
  }
  double var0 = a5.var0;
  double var1 = a5.var1;
  result.double var1 = var1;
  result.double var0 = var0;
  return result;
}

+ (HKAxisMinMaxDefinition)contractByPointsLow:(double)a3 high:(double)a4 modelRange:(HKAxisMinMaxDefinition)a5 pointRange:(HKAxisMinMaxDefinition)a6
{
  if (vabdd_f64(a6.var1, a6.var0) >= 0.00000011920929)
  {
    double v6 = a6.var1 - a4;
    double v7 = (a5.var1 - a5.var0) / (a6.var1 - a6.var0);
    a5.double var1 = a5.var0 + (v6 - a6.var0) * v7;
    a5.double var0 = a5.var0 + (a6.var0 + a3 - a6.var0) * v7;
  }
  double var0 = a5.var0;
  double var1 = a5.var1;
  result.double var1 = var1;
  result.double var0 = var0;
  return result;
}

- (HKAxisStyle)preferredStyle
{
  return self->_preferredStyle;
}

- (int64_t)maxLabels
{
  return self->_maxLabels;
}

- (int64_t)minLabels
{
  return self->_minLabels;
}

- (NSNumber)maxLabelWidth
{
  return self->_maxLabelWidth;
}

- (void)setMaxLabelWidth:(id)a3
{
}

- (NSNumber)horizontalAxisLabelSpacePadding
{
  return self->_horizontalAxisLabelSpacePadding;
}

- (HKCoordinateTransform)transform
{
  return self->_transform;
}

- (HKZoomScale)zoomScaleEngine
{
  return self->_zoomScaleEngine;
}

- (HKAxisLabelDataSource)labelDataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_labelDataSource);
  return (HKAxisLabelDataSource *)WeakRetained;
}

- (BOOL)overrideNoTopBaseline
{
  return self->_overrideNoTopBaseline;
}

- (BOOL)axisAnnotationsExcludeInterstitialAxisLabels
{
  return self->_axisAnnotationsExcludeInterstitialAxisLabels;
}

- (HKAxisLabelCache)axisLabelCache
{
  return self->_axisLabelCache;
}

- (NSLock)axisMutableStateLock
{
  return self->_axisMutableStateLock;
}

- (NSMutableArray)axisAnnotationsStorage
{
  return self->_axisAnnotationsStorage;
}

- (void)setAxisAnnotationsStorage:(id)a3
{
}

- (BOOL)requiresScalingStorage
{
  return self->_requiresScalingStorage;
}

- (void)setRequiresScalingStorage:(BOOL)a3
{
  self->_requiresScalingStorage = a3;
}

- (int64_t)axisLabelEndingsStorage
{
  return self->_axisLabelEndingsStorage;
}

- (void)setAxisLabelEndingsStorage:(int64_t)a3
{
  self->_axisLabelEndingsStorage = a3;
}

- (HKLinearTransform)pointTransformStorage
{
  double offset = self->_pointTransformStorage.offset;
  double scale = self->_pointTransformStorage.scale;
  result.double scale = scale;
  result.double offset = offset;
  return result;
}

- (void)setPointTransformStorage:(HKLinearTransform)a3
{
  self->_pointTransformStorage = a3;
}

- (HKValueRange)axisChartableValueRangeStorage
{
  return self->_axisChartableValueRangeStorage;
}

- (void)setAxisChartableValueRangeStorage:(id)a3
{
}

@end