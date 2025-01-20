@interface HKInteractiveChartAFibBurdenData
- (BOOL)clampsLowerData;
- (HKInteractiveChartAFibBurdenData)init;
- (id)description;
- (void)setClampsLowerData:(BOOL)a3;
@end

@implementation HKInteractiveChartAFibBurdenData

- (HKInteractiveChartAFibBurdenData)init
{
  v5.receiver = self;
  v5.super_class = (Class)HKInteractiveChartAFibBurdenData;
  v2 = [(HKInteractiveChartAFibBurdenData *)&v5 init];
  v3 = v2;
  if (v2) {
    [(HKInteractiveChartAFibBurdenData *)v2 setClampsLowerData:0];
  }
  return v3;
}

- (id)description
{
  v2 = NSString;
  v6.receiver = self;
  v6.super_class = (Class)HKInteractiveChartAFibBurdenData;
  v3 = [(HKInteractiveChartSinglePointData *)&v6 description];
  v4 = [v2 stringWithFormat:@"%@, AFib Burden", v3];

  return v4;
}

- (BOOL)clampsLowerData
{
  return self->_clampsLowerData;
}

- (void)setClampsLowerData:(BOOL)a3
{
  self->_clampsLowerData = a3;
}

@end