@interface MCMachTimeToSeconds
@end

@implementation MCMachTimeToSeconds

double ___MCMachTimeToSeconds_block_invoke()
{
  mach_timebase_info info = 0;
  if (!mach_timebase_info(&info))
  {
    LODWORD(result) = info.numer;
    LODWORD(v1) = info.denom;
    double result = (double)*(unint64_t *)&result / (double)v1 / 1000000000.0;
    _MCMachTimeToSeconds_sFactor = *(void *)&result;
  }
  return result;
}

@end