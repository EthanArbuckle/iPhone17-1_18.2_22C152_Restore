@interface NSDate(SensorKit)
+ (uint64_t)dateWithSRAbsoluteTime:()SensorKit;
- (double)srAbsoluteTime;
- (uint64_t)initWithSRAbsoluteTime:()SensorKit;
@end

@implementation NSDate(SensorKit)

+ (uint64_t)dateWithSRAbsoluteTime:()SensorKit
{
  v1 = (void *)MEMORY[0x263EFF910];
  double v2 = SRAbsoluteTimeToCFAbsoluteTime(a1);

  return [v1 dateWithTimeIntervalSinceReferenceDate:v2];
}

- (uint64_t)initWithSRAbsoluteTime:()SensorKit
{
  double v3 = SRAbsoluteTimeToCFAbsoluteTime(a2);

  return [a1 initWithTimeIntervalSinceReferenceDate:v3];
}

- (double)srAbsoluteTime
{
  [a1 timeIntervalSinceReferenceDate];

  return SRAbsoluteTimeFromCFAbsoluteTime(v1);
}

@end