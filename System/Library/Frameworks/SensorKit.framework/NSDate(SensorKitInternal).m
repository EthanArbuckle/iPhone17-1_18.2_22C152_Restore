@interface NSDate(SensorKitInternal)
+ (uint64_t)sr_dateWithTimeIntervalSinceReferenceDate:()SensorKitInternal roundedDownToNearest:;
@end

@implementation NSDate(SensorKitInternal)

+ (uint64_t)sr_dateWithTimeIntervalSinceReferenceDate:()SensorKitInternal roundedDownToNearest:
{
  return [MEMORY[0x263EFF910] dateWithTimeIntervalSinceReferenceDate:floor(a1 / a2) * a2];
}

@end