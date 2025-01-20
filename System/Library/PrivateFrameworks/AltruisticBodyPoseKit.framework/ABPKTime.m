@interface ABPKTime
+ (double)CMTimeToSeconds:(id *)a3;
+ (double)machAbsoluteTimeToSeconds:(unint64_t)a3;
+ (double)nowInSeconds;
@end

@implementation ABPKTime

+ (double)nowInSeconds
{
  uint64_t v2 = mach_absolute_time();
  +[ABPKTime machAbsoluteTimeToSeconds:v2];
  return result;
}

+ (double)machAbsoluteTimeToSeconds:(unint64_t)a3
{
  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  LODWORD(v5) = info.denom;
  LODWORD(v4) = info.numer;
  return (double)v4 / ((double)v5 * 1000000000.0) * (double)a3;
}

+ (double)CMTimeToSeconds:(id *)a3
{
  return (double)a3->var0 / (double)a3->var1;
}

@end