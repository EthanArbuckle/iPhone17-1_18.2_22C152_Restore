@interface AXMTScalarSampleSeriesStatistics
- (AXMTQueue)_samplesQueue;
- (AXMTScalarSampleSeriesStatistics)initWithQueue:(id)a3;
- (BOOL)valid;
- (double)maximumValue;
- (double)mean;
- (double)minimumValue;
- (double)standardDeviation;
- (unint64_t)count;
- (void)queue:(id)a3 dequeuedValue:(id)a4;
- (void)queue:(id)a3 enqueuedValue:(id)a4;
- (void)setCount:(unint64_t)a3;
- (void)setMaximumValue:(double)a3;
- (void)setMean:(double)a3;
- (void)setMinimumValue:(double)a3;
- (void)setStandardDeviation:(double)a3;
@end

@implementation AXMTScalarSampleSeriesStatistics

- (AXMTScalarSampleSeriesStatistics)initWithQueue:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AXMTScalarSampleSeriesStatistics;
  v6 = [(AXMTScalarSampleSeriesStatistics *)&v9 init];
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
  v2 = [(AXMTScalarSampleSeriesStatistics *)self _samplesQueue];
  unsigned __int8 v3 = [v2 filled];

  return v3;
}

- (void)queue:(id)a3 enqueuedValue:(id)a4
{
  id v14 = a3;
  [a4 doubleValue];
  double v7 = v6;
  id v8 = [v14 count];
  [(AXMTScalarSampleSeriesStatistics *)self setCount:v8];
  if (v8 == (id)1)
  {
    [(AXMTScalarSampleSeriesStatistics *)self setMean:v7];
    [(AXMTScalarSampleSeriesStatistics *)self setMaximumValue:v7];
    [(AXMTScalarSampleSeriesStatistics *)self setMinimumValue:v7];
    [(AXMTScalarSampleSeriesStatistics *)self setStandardDeviation:0.0];
  }
  else
  {
    [(AXMTScalarSampleSeriesStatistics *)self mean];
    [(AXMTScalarSampleSeriesStatistics *)self setMean:(v7 + v9 * (double)((unint64_t)v8 - 1)) / (double)(unint64_t)v8];
    [(AXMTScalarSampleSeriesStatistics *)self maximumValue];
    if (v10 < v7) {
      double v10 = v7;
    }
    [(AXMTScalarSampleSeriesStatistics *)self setMaximumValue:v10];
    [(AXMTScalarSampleSeriesStatistics *)self minimumValue];
    if (v11 >= v7) {
      double v11 = v7;
    }
    [(AXMTScalarSampleSeriesStatistics *)self setMinimumValue:v11];
    v12 = [v14 values];
    [(AXMTScalarSampleSeriesStatistics *)self mean];
    [(AXMTScalarSampleSeriesStatistics *)self setStandardDeviation:AXMTMathStandardDeviationOfValuesWithPrecalculatedMean(v12, v13)];
  }
}

- (void)queue:(id)a3 dequeuedValue:(id)a4
{
  id v22 = a3;
  id v6 = a4;
  id v7 = [v22 count];
  [(AXMTScalarSampleSeriesStatistics *)self setCount:v7];
  if ((unint64_t)v7 > 1)
  {
    [v6 doubleValue];
    double v13 = v12;
    [(AXMTScalarSampleSeriesStatistics *)self mean];
    [(AXMTScalarSampleSeriesStatistics *)self setMean:-(v13 - v14 * (double)((unint64_t)v7 + 1)) / (double)(unint64_t)v7];
    [(AXMTScalarSampleSeriesStatistics *)self maximumValue];
    if (vabdd_f64(v13, v15) <= 0.00001)
    {
      v18 = [v22 values];
      v19 = [v18 valueForKeyPath:@"@max.doubleValue"];
      [v19 doubleValue];
      -[AXMTScalarSampleSeriesStatistics setMaximumValue:](self, "setMaximumValue:");
    }
    else
    {
      [(AXMTScalarSampleSeriesStatistics *)self minimumValue];
      v17 = v22;
      if (vabdd_f64(v13, v16) > 0.00001)
      {
LABEL_10:
        v20 = [v17 values];
        [(AXMTScalarSampleSeriesStatistics *)self mean];
        [(AXMTScalarSampleSeriesStatistics *)self setStandardDeviation:AXMTMathStandardDeviationOfValuesWithPrecalculatedMean(v20, v21)];

        goto LABEL_11;
      }
      v18 = [v22 values];
      v19 = [v18 valueForKeyPath:@"@min.doubleValue"];
      [v19 doubleValue];
      -[AXMTScalarSampleSeriesStatistics setMinimumValue:](self, "setMinimumValue:");
    }

    v17 = v22;
    goto LABEL_10;
  }
  double v8 = 0.0;
  if (v7 == (id)1)
  {
    double v9 = [v22 values];
    double v10 = [v9 firstObject];
    [v10 doubleValue];
    double v8 = v11;
  }
  [(AXMTScalarSampleSeriesStatistics *)self setMean:v8];
  [(AXMTScalarSampleSeriesStatistics *)self setMaximumValue:v8];
  [(AXMTScalarSampleSeriesStatistics *)self setMinimumValue:v8];
  [(AXMTScalarSampleSeriesStatistics *)self setStandardDeviation:0.0];
LABEL_11:
}

- (unint64_t)count
{
  return self->_count;
}

- (void)setCount:(unint64_t)a3
{
  self->_count = a3;
}

- (double)mean
{
  return self->_mean;
}

- (void)setMean:(double)a3
{
  self->_mean = a3;
}

- (double)minimumValue
{
  return self->_minimumValue;
}

- (void)setMinimumValue:(double)a3
{
  self->_minimumValue = a3;
}

- (double)maximumValue
{
  return self->_maximumValue;
}

- (void)setMaximumValue:(double)a3
{
  self->_maximumValue = a3;
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
  return (AXMTQueue *)objc_getProperty(self, a2, 48, 1);
}

- (void).cxx_destruct
{
}

@end