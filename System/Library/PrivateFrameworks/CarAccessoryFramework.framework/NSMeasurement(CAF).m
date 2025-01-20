@interface NSMeasurement(CAF)
- (id)stepWithDoubleValue:()CAF;
@end

@implementation NSMeasurement(CAF)

- (id)stepWithDoubleValue:()CAF
{
  double v4 = fabs(a2);
  id v5 = objc_alloc(MEMORY[0x263F08980]);
  v6 = [a1 unit];
  v7 = (void *)[v5 initWithDoubleValue:v6 unit:v4];

  if (a2 <= 0.0) {
    [a1 measurementBySubtractingMeasurement:v7];
  }
  else {
  v8 = [a1 measurementByAddingMeasurement:v7];
  }

  return v8;
}

@end