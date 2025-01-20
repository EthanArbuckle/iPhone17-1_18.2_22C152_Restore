@interface AXMT2DPointSampleSeriesStatistics
- (AXMT2DPointSampleSeriesStatistics)initWithQueue:(id)a3;
- (AXMTQueue)_samplesQueue;
- (BOOL)valid;
- (CGPoint)mean;
- (double)standardDeviation;
- (unint64_t)count;
- (void)queue:(id)a3 dequeuedValue:(id)a4;
- (void)queue:(id)a3 enqueuedValue:(id)a4;
- (void)setCount:(unint64_t)a3;
- (void)setMean:(CGPoint)a3;
- (void)setStandardDeviation:(double)a3;
@end

@implementation AXMT2DPointSampleSeriesStatistics

- (AXMT2DPointSampleSeriesStatistics)initWithQueue:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AXMT2DPointSampleSeriesStatistics;
  v6 = [(AXMT2DPointSampleSeriesStatistics *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->__samplesQueue, a3);
    [(AXMTQueue *)v7->__samplesQueue setDelegate:v7];
  }

  return v7;
}

- (BOOL)valid
{
  v2 = [(AXMT2DPointSampleSeriesStatistics *)self _samplesQueue];
  unsigned __int8 v3 = [v2 filled];

  return v3;
}

- (void)queue:(id)a3 enqueuedValue:(id)a4
{
  id v15 = a3;
  id v6 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v6 pointValue];
    double v8 = v7;
    double v10 = v9;
    id v11 = [v15 count];
    [(AXMT2DPointSampleSeriesStatistics *)self setCount:v11];
    if (v11 == (id)1)
    {
      -[AXMT2DPointSampleSeriesStatistics setMean:](self, "setMean:", v8, v10);
      [(AXMT2DPointSampleSeriesStatistics *)self setStandardDeviation:0.0];
    }
    else
    {
      v12 = [v15 values];
      [(AXMT2DPointSampleSeriesStatistics *)self setMean:AXMTGeometryCentroidOfPoints(v12)];
      [(AXMT2DPointSampleSeriesStatistics *)self mean];
      [(AXMT2DPointSampleSeriesStatistics *)self setStandardDeviation:AXMTGeometryStandardDeviationOfPointsWithPrecalculatedCentroid(v12, v13, v14)];
    }
  }
}

- (void)queue:(id)a3 dequeuedValue:(id)a4
{
  id v5 = a3;
  id v6 = [v5 count];
  [(AXMT2DPointSampleSeriesStatistics *)self setCount:v6];
  if ((unint64_t)v6 > 1)
  {
    id v15 = [v5 values];

    [(AXMT2DPointSampleSeriesStatistics *)self setMean:AXMTGeometryCentroidOfPoints(v15)];
    [(AXMT2DPointSampleSeriesStatistics *)self mean];
    double v12 = AXMTGeometryStandardDeviationOfPointsWithPrecalculatedCentroid(v15, v13, v14);
  }
  else
  {
    double x = NSZeroPoint.x;
    double y = NSZeroPoint.y;
    double v9 = [v5 values];

    id v15 = [v9 firstObject];

    if (v6 == (id)1)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v15 pointValue];
        double x = v10;
        double y = v11;
      }
    }
    -[AXMT2DPointSampleSeriesStatistics setMean:](self, "setMean:", x, y);
    double v12 = 0.0;
  }
  [(AXMT2DPointSampleSeriesStatistics *)self setStandardDeviation:v12];
}

- (unint64_t)count
{
  return self->_count;
}

- (void)setCount:(unint64_t)a3
{
  self->_count = a3;
}

- (CGPoint)mean
{
  double x = self->_mean.x;
  double y = self->_mean.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setMean:(CGPoint)a3
{
  self->_mean = a3;
}

- (double)standardDeviation
{
  return self->_standardDeviation;
}

- (void)setStandardDeviation:(double)a3
{
  self->_standardDeviation = a3;
}

- (AXMTQueue)_samplesQueue
{
  return self->__samplesQueue;
}

- (void).cxx_destruct
{
}

@end