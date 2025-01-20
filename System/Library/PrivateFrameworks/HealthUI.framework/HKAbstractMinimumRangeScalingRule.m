@interface HKAbstractMinimumRangeScalingRule
- (HKAbstractMinimumRangeScalingRule)init;
- (HKValueRange)axisBounds;
- (NSDictionary)axisRangeOverrides;
- (NSNumber)anchorValue;
- (double)_rangeForZoomLevel:(int64_t)a3;
- (double)defaultYAxisRange;
- (id)noDataStartingRange;
- (id)yAxisBounds;
- (id)yValueRangeForRange:(id)a3 zoomLevel:(int64_t)a4;
- (void)setAxisBounds:(id)a3;
@end

@implementation HKAbstractMinimumRangeScalingRule

- (void)setAxisBounds:(id)a3
{
}

- (HKAbstractMinimumRangeScalingRule)init
{
  v3.receiver = self;
  v3.super_class = (Class)HKAbstractMinimumRangeScalingRule;
  return [(HKAbstractMinimumRangeScalingRule *)&v3 init];
}

- (id)yValueRangeForRange:(id)a3 zoomLevel:(int64_t)a4
{
  id v6 = a3;
  v7 = [v6 minValue];
  [v7 doubleValue];
  double v9 = v8;

  v10 = [v6 maxValue];

  [v10 doubleValue];
  double v12 = v11;

  [(HKAbstractMinimumRangeScalingRule *)self _rangeForZoomLevel:a4];
  double v14 = v13;
  anchorValue = self->_anchorValue;
  if (anchorValue)
  {
    [(NSNumber *)anchorValue doubleValue];
    double v17 = v12 - v16;
    if (v12 - v16 < v16 - v9) {
      double v17 = v16 - v9;
    }
    if (v17 < 0.0) {
      double v17 = 0.0;
    }
    double v9 = v16 - v17;
    double v12 = v16 + v17;
  }
  axisBounds = self->_axisBounds;
  if (axisBounds)
  {
    v19 = [(HKValueRange *)axisBounds minValue];
    v20 = [(HKValueRange *)self->_axisBounds maxValue];
    if (v19)
    {
      [v19 doubleValue];
      if (v9 < v21) {
        double v9 = v21;
      }
    }
    if (v20)
    {
      [v20 doubleValue];
      if (v12 >= v22) {
        double v12 = v22;
      }
    }
  }
  else
  {
    v20 = 0;
    v19 = 0;
  }
  if (v12 - v9 < v14)
  {
    double v23 = (v14 - (v12 - v9)) * 0.5;
    double v9 = v9 - v23;
    double v12 = v12 + v23;
    if (v19)
    {
      [v19 doubleValue];
      if (v9 < v24)
      {
        [v19 doubleValue];
        double v26 = vabdd_f64(v9, v25);
        double v9 = v9 + v26;
        double v12 = v12 + v26;
      }
    }
    if (v20)
    {
      [v20 doubleValue];
      if (v12 > v27)
      {
        [v20 doubleValue];
        double v29 = vabdd_f64(v12, v28);
        double v9 = v9 - v29;
        double v12 = v12 - v29;
      }
    }
  }
  v30 = [NSNumber numberWithDouble:v9];
  v31 = [NSNumber numberWithDouble:v12];
  v32 = +[HKValueRange valueRangeWithMinValue:v30 maxValue:v31];

  return v32;
}

- (id)yAxisBounds
{
  return self->_axisBounds;
}

- (id)noDataStartingRange
{
  return 0;
}

- (double)_rangeForZoomLevel:(int64_t)a3
{
  axisRangeOverrides = self->_axisRangeOverrides;
  v5 = [NSNumber numberWithInteger:a3];
  id v6 = [(NSDictionary *)axisRangeOverrides objectForKeyedSubscript:v5];

  if (v6)
  {
    [v6 doubleValue];
    double defaultYAxisRange = v7;
  }
  else
  {
    double defaultYAxisRange = self->_defaultYAxisRange;
  }

  return defaultYAxisRange;
}

- (double)defaultYAxisRange
{
  return self->_defaultYAxisRange;
}

- (HKValueRange)axisBounds
{
  return self->_axisBounds;
}

- (NSNumber)anchorValue
{
  return self->_anchorValue;
}

- (NSDictionary)axisRangeOverrides
{
  return self->_axisRangeOverrides;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_axisBounds, 0);
  objc_storeStrong((id *)&self->_anchorValue, 0);
  objc_storeStrong((id *)&self->_axisRangeOverrides, 0);
}

@end