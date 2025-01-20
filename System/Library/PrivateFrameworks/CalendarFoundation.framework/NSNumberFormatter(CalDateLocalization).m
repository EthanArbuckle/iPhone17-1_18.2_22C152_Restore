@interface NSNumberFormatter(CalDateLocalization)
- (id)stringFromInteger:()CalDateLocalization;
@end

@implementation NSNumberFormatter(CalDateLocalization)

- (id)stringFromInteger:()CalDateLocalization
{
  v2 = objc_msgSend(NSNumber, "numberWithInteger:");
  v3 = [a1 stringFromNumber:v2];

  return v3;
}

@end