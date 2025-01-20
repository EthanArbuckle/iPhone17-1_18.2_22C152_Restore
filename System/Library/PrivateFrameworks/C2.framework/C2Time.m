@interface C2Time
+ (double)converServerTimeToTimeInterval:(unint64_t)a3;
+ (unint64_t)convertTimeIntervalToServerTime:(double)a3;
@end

@implementation C2Time

+ (unint64_t)convertTimeIntervalToServerTime:(double)a3
{
  return (unint64_t)((a3 + 978307200.0) * 1000.0);
}

+ (double)converServerTimeToTimeInterval:(unint64_t)a3
{
  return (double)a3 / 1000.0 + -978307200.0;
}

@end