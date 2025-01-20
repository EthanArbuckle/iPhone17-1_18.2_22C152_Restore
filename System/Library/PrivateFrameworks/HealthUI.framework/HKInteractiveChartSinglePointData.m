@interface HKInteractiveChartSinglePointData
- (BOOL)representsRange;
- (HKUnit)unit;
- (NSDateComponents)statisticsInterval;
- (NSDictionary)metadata;
- (NSString)description;
- (double)maxValue;
- (double)minValue;
- (double)value;
- (int64_t)recordCount;
- (void)setMaxValue:(double)a3;
- (void)setMetadata:(id)a3;
- (void)setMinValue:(double)a3;
- (void)setRecordCount:(int64_t)a3;
- (void)setRepresentsRange:(BOOL)a3;
- (void)setStatisticsInterval:(id)a3;
- (void)setUnit:(id)a3;
- (void)setValue:(double)a3;
@end

@implementation HKInteractiveChartSinglePointData

- (double)minValue
{
  uint64_t v2 = 40;
  if (!self->_representsRange) {
    uint64_t v2 = 16;
  }
  return *(double *)((char *)&self->super.isa + v2);
}

- (double)maxValue
{
  uint64_t v2 = 48;
  if (!self->_representsRange) {
    uint64_t v2 = 16;
  }
  return *(double *)((char *)&self->super.isa + v2);
}

- (NSString)description
{
  v3 = NSString;
  if (self->_representsRange)
  {
    [(HKInteractiveChartSinglePointData *)self minValue];
    uint64_t v5 = v4;
    [(HKInteractiveChartSinglePointData *)self maxValue];
    uint64_t v7 = v6;
    v8 = [(HKInteractiveChartSinglePointData *)self unit];
    v9 = [v8 unitString];
    [v3 stringWithFormat:@"HKInteractiveChartSinglePointData(%lg - %lg, %@)", v5, v7, v9];
  }
  else
  {
    [(HKInteractiveChartSinglePointData *)self value];
    uint64_t v11 = v10;
    v8 = [(HKInteractiveChartSinglePointData *)self unit];
    v9 = [v8 unitString];
    [v3 stringWithFormat:@"HKInteractiveChartSinglePointData(%lg, %@)", v11, v9, v14];
  v12 = };

  return (NSString *)v12;
}

- (double)value
{
  return self->_value;
}

- (void)setValue:(double)a3
{
  self->_value = a3;
}

- (HKUnit)unit
{
  return self->_unit;
}

- (void)setUnit:(id)a3
{
}

- (BOOL)representsRange
{
  return self->_representsRange;
}

- (void)setRepresentsRange:(BOOL)a3
{
  self->_representsRange = a3;
}

- (int64_t)recordCount
{
  return self->_recordCount;
}

- (void)setRecordCount:(int64_t)a3
{
  self->_recordCount = a3;
}

- (void)setMinValue:(double)a3
{
  self->_minValue = a3;
}

- (void)setMaxValue:(double)a3
{
  self->_maxValue = a3;
}

- (NSDateComponents)statisticsInterval
{
  return self->_statisticsInterval;
}

- (void)setStatisticsInterval:(id)a3
{
}

- (NSDictionary)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_statisticsInterval, 0);
  objc_storeStrong((id *)&self->_unit, 0);
}

@end