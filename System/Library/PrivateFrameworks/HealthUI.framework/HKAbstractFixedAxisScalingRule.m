@interface HKAbstractFixedAxisScalingRule
- (BOOL)shouldExpandBoundsForOutliers;
- (HKAbstractFixedAxisScalingRule)init;
- (HKValueRange)defaultAxisBounds;
- (NSDictionary)axisBoundsOverrides;
- (id)_valueRangeForZoomLevel:(int64_t)a3;
- (id)noDataStartingRange;
- (id)yAxisBounds;
- (id)yValueRangeForRange:(id)a3 zoomLevel:(int64_t)a4;
- (void)setShouldExpandBoundsForOutliers:(BOOL)a3;
@end

@implementation HKAbstractFixedAxisScalingRule

- (HKAbstractFixedAxisScalingRule)init
{
  v3.receiver = self;
  v3.super_class = (Class)HKAbstractFixedAxisScalingRule;
  result = [(HKAbstractFixedAxisScalingRule *)&v3 init];
  if (result) {
    result->_shouldExpandBoundsForOutliers = 1;
  }
  return result;
}

- (void)setShouldExpandBoundsForOutliers:(BOOL)a3
{
  self->_shouldExpandBoundsForOutliers = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maximumValue, 0);
  objc_storeStrong((id *)&self->_minimumValue, 0);
  objc_storeStrong((id *)&self->_axisBoundsOverrides, 0);
  objc_storeStrong((id *)&self->_defaultAxisBounds, 0);
}

- (id)yValueRangeForRange:(id)a3 zoomLevel:(int64_t)a4
{
  id v6 = a3;
  v7 = [(HKAbstractFixedAxisScalingRule *)self _valueRangeForZoomLevel:a4];
  v8 = v7;
  if (self->_shouldExpandBoundsForOutliers) {
    [v7 unionRange:v6];
  }
  minimumValue = self->_minimumValue;
  if (minimumValue)
  {
    v10 = [v8 minValue];
    uint64_t v11 = [(NSNumber *)minimumValue compare:v10];

    if (v11 == 1) {
      [v8 setMinValue:self->_minimumValue];
    }
  }
  maximumValue = self->_maximumValue;
  if (maximumValue)
  {
    v13 = [v8 maxValue];
    uint64_t v14 = [(NSNumber *)maximumValue compare:v13];

    if (v14 == -1) {
      [v8 setMaxValue:self->_maximumValue];
    }
  }

  return v8;
}

- (id)yAxisBounds
{
  return +[HKValueRange valueRangeWithMinValue:self->_minimumValue maxValue:self->_maximumValue];
}

- (id)noDataStartingRange
{
  return 0;
}

- (id)_valueRangeForZoomLevel:(int64_t)a3
{
  axisBoundsOverrides = self->_axisBoundsOverrides;
  if (!axisBoundsOverrides
    || ([NSNumber numberWithInteger:a3],
        v5 = objc_claimAutoreleasedReturnValue(),
        [(NSDictionary *)axisBoundsOverrides objectForKeyedSubscript:v5],
        id v6 = (HKValueRange *)objc_claimAutoreleasedReturnValue(),
        v5,
        (defaultAxisBounds = v6) == 0))
  {
    id v6 = 0;
    defaultAxisBounds = self->_defaultAxisBounds;
  }
  v8 = defaultAxisBounds;

  v9 = (void *)[(HKValueRange *)v8 copy];
  return v9;
}

- (BOOL)shouldExpandBoundsForOutliers
{
  return self->_shouldExpandBoundsForOutliers;
}

- (HKValueRange)defaultAxisBounds
{
  return self->_defaultAxisBounds;
}

- (NSDictionary)axisBoundsOverrides
{
  return self->_axisBoundsOverrides;
}

@end