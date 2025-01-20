@interface HKFixedValueDateSpanChartPoint
- (HKFixedValueDateSpanChartPoint)initWithTrendSpan:(id)a3 styleIdentifier:(int64_t)a4 localizableTrendDescription:(id)a5 fixedValueScalingBlock:(id)a6;
- (HKQuantity)averageValue;
- (HKUnit)preferredUnit;
- (NSDate)xEnd;
- (NSDate)xStart;
- (NSString)localizableTrendDescription;
- (id)_buildSinglePointData;
- (id)allYValues;
- (id)fixedValueScalingBlock;
- (id)xValueAsGenericType;
- (id)yValue;
- (int64_t)styleIdentifier;
- (void)setPreferredUnit:(id)a3;
@end

@implementation HKFixedValueDateSpanChartPoint

- (HKFixedValueDateSpanChartPoint)initWithTrendSpan:(id)a3 styleIdentifier:(int64_t)a4 localizableTrendDescription:(id)a5 fixedValueScalingBlock:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  v25.receiver = self;
  v25.super_class = (Class)HKFixedValueDateSpanChartPoint;
  v13 = [(HKFixedValueDateSpanChartPoint *)&v25 init];
  if (v13)
  {
    v14 = [v10 trendDateInterval];
    uint64_t v15 = [v14 startDate];
    xStart = v13->_xStart;
    v13->_xStart = (NSDate *)v15;

    v17 = [v10 trendDateInterval];
    uint64_t v18 = [v17 endDate];
    xEnd = v13->_xEnd;
    v13->_xEnd = (NSDate *)v18;

    uint64_t v20 = [v10 trendAverage];
    averageValue = v13->_averageValue;
    v13->_averageValue = (HKQuantity *)v20;

    v13->_styleIdentifier = a4;
    objc_storeStrong((id *)&v13->_localizableTrendDescription, a5);
    v22 = _Block_copy(v12);
    id fixedValueScalingBlock = v13->_fixedValueScalingBlock;
    v13->_id fixedValueScalingBlock = v22;
  }
  return v13;
}

- (id)_buildSinglePointData
{
  v3 = objc_alloc_init(HKInteractiveChartSinglePointData);
  v4 = [(HKFixedValueDateSpanChartPoint *)self preferredUnit];
  if (v4)
  {
    v5 = [(HKFixedValueDateSpanChartPoint *)self preferredUnit];
  }
  else
  {
    v6 = [(HKFixedValueDateSpanChartPoint *)self averageValue];
    v5 = [v6 _unit];
  }
  v7 = [(HKFixedValueDateSpanChartPoint *)self averageValue];
  [v7 doubleValueForUnit:v5];
  -[HKInteractiveChartSinglePointData setValue:](v3, "setValue:");

  [(HKInteractiveChartSinglePointData *)v3 setUnit:v5];
  [(HKInteractiveChartSinglePointData *)v3 setRepresentsRange:0];

  return v3;
}

- (id)xValueAsGenericType
{
  v3 = [(HKFixedValueDateSpanChartPoint *)self xStart];
  v4 = [(HKFixedValueDateSpanChartPoint *)self xEnd];
  v5 = HKDateMidpoint(v3, v4);

  return v5;
}

- (id)yValue
{
  v3 = [(HKFixedValueDateSpanChartPoint *)self preferredUnit];
  if (v3)
  {
    v4 = [(HKFixedValueDateSpanChartPoint *)self preferredUnit];
  }
  else
  {
    v5 = [(HKFixedValueDateSpanChartPoint *)self averageValue];
    v4 = [v5 _unit];
  }
  v6 = [(HKFixedValueDateSpanChartPoint *)self averageValue];
  [v6 doubleValueForUnit:v4];
  double v8 = v7;

  v9 = [NSNumber numberWithDouble:v8];
  id v10 = [(HKFixedValueDateSpanChartPoint *)self fixedValueScalingBlock];

  if (v10)
  {
    id v11 = [(HKFixedValueDateSpanChartPoint *)self fixedValueScalingBlock];
    uint64_t v12 = ((void (**)(void, void *))v11)[2](v11, v9);

    v9 = (void *)v12;
  }

  return v9;
}

- (id)allYValues
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = [(HKFixedValueDateSpanChartPoint *)self yValue];
  v5[0] = v2;
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return v3;
}

- (NSDate)xStart
{
  return self->_xStart;
}

- (NSDate)xEnd
{
  return self->_xEnd;
}

- (HKQuantity)averageValue
{
  return self->_averageValue;
}

- (NSString)localizableTrendDescription
{
  return self->_localizableTrendDescription;
}

- (int64_t)styleIdentifier
{
  return self->_styleIdentifier;
}

- (HKUnit)preferredUnit
{
  return self->_preferredUnit;
}

- (void)setPreferredUnit:(id)a3
{
}

- (id)fixedValueScalingBlock
{
  return self->_fixedValueScalingBlock;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_fixedValueScalingBlock, 0);
  objc_storeStrong((id *)&self->_preferredUnit, 0);
  objc_storeStrong((id *)&self->_localizableTrendDescription, 0);
  objc_storeStrong((id *)&self->_averageValue, 0);
  objc_storeStrong((id *)&self->_xEnd, 0);
  objc_storeStrong((id *)&self->_xStart, 0);
}

@end