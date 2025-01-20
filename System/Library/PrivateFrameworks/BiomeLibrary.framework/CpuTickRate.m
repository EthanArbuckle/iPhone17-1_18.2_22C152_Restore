@interface CpuTickRate
@end

@implementation CpuTickRate

double ___CpuTickRate_block_invoke()
{
  mach_timebase_info info = 0;
  if (!mach_timebase_info(&info))
  {
    LODWORD(result) = info.numer;
    LODWORD(v1) = info.denom;
    double result = (double)*(unint64_t *)&result / (double)v1;
    _CpuTickRate_rate = *(void *)&result;
  }
  return result;
}

@end