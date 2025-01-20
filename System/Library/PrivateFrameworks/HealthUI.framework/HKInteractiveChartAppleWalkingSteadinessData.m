@interface HKInteractiveChartAppleWalkingSteadinessData
- (id)description;
@end

@implementation HKInteractiveChartAppleWalkingSteadinessData

- (id)description
{
  v2 = NSString;
  v6.receiver = self;
  v6.super_class = (Class)HKInteractiveChartAppleWalkingSteadinessData;
  v3 = [(HKInteractiveChartSinglePointData *)&v6 description];
  v4 = [v2 stringWithFormat:@"%@, walking steadiness", v3];

  return v4;
}

@end