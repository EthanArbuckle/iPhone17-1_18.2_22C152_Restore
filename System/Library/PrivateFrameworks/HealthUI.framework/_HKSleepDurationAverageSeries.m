@interface _HKSleepDurationAverageSeries
- (NSLock)seriesMutableStateLock;
- (NSNumber)averageValueType;
- (NSNumber)averageValueTypeStorage;
- (_HKSleepDurationAverageSeries)init;
- (double)averageValueStorage;
- (id)coordinatesForBlock:(id)a3 blockPath:(HKGraphSeriesDataBlockPath *)a4 xAxis:(id)a5 yAxis:(id)a6;
- (int64_t)overlayType;
- (void)drawOverlayInContext:(CGContext *)a3 seriesOverlayData:(id)a4;
- (void)drawSeriesWithBlockCoordinates:(id)a3 axisRect:(CGRect)a4 zoomLevelConfiguration:(id)a5 pointTransform:(CGAffineTransform *)a6 renderContext:(CGContext *)a7 secondaryRenderContext:(id)a8 seriesRenderingDelegate:(id)a9;
- (void)setAverageValue:(double)a3;
- (void)setAverageValueStorage:(double)a3;
- (void)setAverageValueType:(id)a3;
- (void)setAverageValueTypeStorage:(id)a3;
@end

@implementation _HKSleepDurationAverageSeries

- (_HKSleepDurationAverageSeries)init
{
  v7.receiver = self;
  v7.super_class = (Class)_HKSleepDurationAverageSeries;
  v2 = [(HKSleepDurationSeries *)&v7 init];
  if (v2)
  {
    v3 = (NSLock *)objc_alloc_init(MEMORY[0x1E4F28E08]);
    seriesMutableStateLock = v2->_seriesMutableStateLock;
    v2->_seriesMutableStateLock = v3;

    [(NSLock *)v2->_seriesMutableStateLock setName:@"_HKSleepDurationAverageSeriesLock"];
    v2->_averageValueStorage = -1.0;
    averageValueTypeStorage = v2->_averageValueTypeStorage;
    v2->_averageValueTypeStorage = 0;
  }
  return v2;
}

- (void)setAverageValue:(double)a3
{
  v5 = [(_HKSleepDurationAverageSeries *)self seriesMutableStateLock];
  [v5 lock];

  self->_averageValueStorage = a3;
  id v6 = [(_HKSleepDurationAverageSeries *)self seriesMutableStateLock];
  [v6 unlock];
}

- (NSNumber)averageValueType
{
  v3 = [(_HKSleepDurationAverageSeries *)self seriesMutableStateLock];
  [v3 lock];

  v4 = self->_averageValueTypeStorage;
  v5 = [(_HKSleepDurationAverageSeries *)self seriesMutableStateLock];
  [v5 unlock];

  return v4;
}

- (void)setAverageValueType:(id)a3
{
  v4 = (NSNumber *)a3;
  v5 = [(_HKSleepDurationAverageSeries *)self seriesMutableStateLock];
  [v5 lock];

  averageValueTypeStorage = self->_averageValueTypeStorage;
  self->_averageValueTypeStorage = v4;

  id v7 = [(_HKSleepDurationAverageSeries *)self seriesMutableStateLock];
  [v7 unlock];
}

- (int64_t)overlayType
{
  return 2;
}

- (id)coordinatesForBlock:(id)a3 blockPath:(HKGraphSeriesDataBlockPath *)a4 xAxis:(id)a5 yAxis:(id)a6
{
  v12.receiver = self;
  v12.super_class = (Class)_HKSleepDurationAverageSeries;
  HKGraphSeriesDataBlockPath v11 = *a4;
  id v7 = [(HKSleepDurationSeries *)&v12 coordinatesForBlock:a3 blockPath:&v11 xAxis:a5 yAxis:a6];
  v8 = [v7 coordinates];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __75___HKSleepDurationAverageSeries_coordinatesForBlock_blockPath_xAxis_yAxis___block_invoke;
  v10[3] = &unk_1E6D56118;
  v10[4] = self;
  [v8 enumerateObjectsUsingBlock:v10];

  return v7;
}

- (void)drawSeriesWithBlockCoordinates:(id)a3 axisRect:(CGRect)a4 zoomLevelConfiguration:(id)a5 pointTransform:(CGAffineTransform *)a6 renderContext:(CGContext *)a7 secondaryRenderContext:(id)a8 seriesRenderingDelegate:(id)a9
{
  id v21 = a9;
  v10 = [(_HKSleepDurationAverageSeries *)self seriesMutableStateLock];
  [v10 lock];

  double averageValueStorage = self->_averageValueStorage;
  objc_super v12 = [(_HKSleepDurationAverageSeries *)self seriesMutableStateLock];
  [v12 unlock];

  v13 = [v21 axisAnnotationDelegateForSeries:self];
  if (([v21 seriesDrawingDuringScrolling] & 1) != 0
    || ([v21 seriesDrawingDuringTiling] & 1) != 0
    || averageValueStorage < 0.0)
  {
    [v13 clearAxisAnnotations];
  }
  else
  {
    v14 = objc_msgSend(MEMORY[0x1E4FB08E0], "hk_chartAxisLabelFont");
    v15 = [(HKSleepDurationSeries *)self goalLineStrokeStyle];
    v16 = [v15 strokeColor];
    v17 = [(HKSleepDurationSeries *)self goalLineStrokeStyle];
    v18 = [v17 strokeColor];
    v19 = +[HKAttributedDurationFormatter formattedValueWithDuration:1 unitsStyle:v14 font:v16 valueColor:v18 unitColor:averageValueStorage];

    v20 = [NSNumber numberWithDouble:averageValueStorage];
    [v13 addAxisAnnotation:v19 forSeries:self modelCoordinate:v20];
  }
}

- (void)drawOverlayInContext:(CGContext *)a3 seriesOverlayData:(id)a4
{
  id v6 = a4;
  if ([v6 count] == 1)
  {
    id v7 = [v6 firstObject];
    v8 = [(_HKSleepDurationAverageSeries *)self seriesMutableStateLock];
    [v8 lock];

    double averageValueStorage = self->_averageValueStorage;
    v10 = [(_HKSleepDurationAverageSeries *)self seriesMutableStateLock];
    [v10 unlock];

    HKGraphSeriesDataBlockPath v11 = [v7 graphSeries];

    if (v11 == self && averageValueStorage >= 0.0)
    {
      if (v7)
      {
        [v7 graphSeriesPointTransform];
        double v12 = *((double *)&v21 + 1);
        double v13 = *((double *)&v22 + 1);
        double v14 = *((double *)&v23 + 1);
      }
      else
      {
        long long v22 = 0u;
        long long v23 = 0u;
        long long v21 = 0u;
        double v14 = 0.0;
        double v13 = 0.0;
        double v12 = 0.0;
      }
      CGFloat v15 = v14 + averageValueStorage * v13 + v12 * 0.0;
      v16 = [(HKSleepDurationSeries *)self goalLineStrokeStyle];
      [v16 applyToContext:a3];

      [v7 graphSeriesScreenRect];
      CGContextMoveToPoint(a3, v17, v15);
      [v7 graphSeriesScreenRect];
      double v19 = v18;
      [v7 graphSeriesScreenRect];
      CGContextAddLineToPoint(a3, v19 + v20, v15);
      CGContextStrokePath(a3);
    }
  }
}

- (NSLock)seriesMutableStateLock
{
  return self->_seriesMutableStateLock;
}

- (double)averageValueStorage
{
  return self->_averageValueStorage;
}

- (void)setAverageValueStorage:(double)a3
{
  self->_double averageValueStorage = a3;
}

- (NSNumber)averageValueTypeStorage
{
  return self->_averageValueTypeStorage;
}

- (void)setAverageValueTypeStorage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_averageValueTypeStorage, 0);
  objc_storeStrong((id *)&self->_seriesMutableStateLock, 0);
}

@end