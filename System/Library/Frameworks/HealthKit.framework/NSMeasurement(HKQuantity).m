@interface NSMeasurement(HKQuantity)
- (id)hk_equivalentQuantity;
@end

@implementation NSMeasurement(HKQuantity)

- (id)hk_equivalentQuantity
{
  v2 = [a1 unit];
  [a1 doubleValue];
  v3 = objc_msgSend(v2, "hk_equivalentQuantityWithValue:");

  return v3;
}

@end