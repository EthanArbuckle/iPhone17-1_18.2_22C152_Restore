@interface HKCumulativeQuantitySeriesSample
- (HKQuantity)sum;
@end

@implementation HKCumulativeQuantitySeriesSample

- (HKQuantity)sum
{
  return (HKQuantity *)objc_getProperty(self, a2, 128, 1);
}

- (void).cxx_destruct
{
}

@end