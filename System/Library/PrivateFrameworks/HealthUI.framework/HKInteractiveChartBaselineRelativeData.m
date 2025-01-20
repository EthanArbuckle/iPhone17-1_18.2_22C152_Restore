@interface HKInteractiveChartBaselineRelativeData
- (HKInteractiveChartBaselineRelativeData)init;
- (NSNumber)relativeValueState;
- (id)description;
- (void)setRelativeValueState:(id)a3;
@end

@implementation HKInteractiveChartBaselineRelativeData

- (HKInteractiveChartBaselineRelativeData)init
{
  v5.receiver = self;
  v5.super_class = (Class)HKInteractiveChartBaselineRelativeData;
  v2 = [(HKInteractiveChartBaselineRelativeData *)&v5 init];
  v3 = v2;
  if (v2) {
    [(HKInteractiveChartBaselineRelativeData *)v2 setRelativeValueState:0];
  }
  return v3;
}

- (id)description
{
  v2 = NSString;
  v6.receiver = self;
  v6.super_class = (Class)HKInteractiveChartBaselineRelativeData;
  v3 = [(HKInteractiveChartSinglePointData *)&v6 description];
  v4 = [v2 stringWithFormat:@"%@ (relative)", v3];

  return v4;
}

- (NSNumber)relativeValueState
{
  return self->_relativeValueState;
}

- (void)setRelativeValueState:(id)a3
{
  self->_relativeValueState = (NSNumber *)a3;
}

@end