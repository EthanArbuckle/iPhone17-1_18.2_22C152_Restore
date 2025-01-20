@interface CSMachAbsoluteTimeRate
@end

@implementation CSMachAbsoluteTimeRate

double ___CSMachAbsoluteTimeRate_block_invoke()
{
  mach_timebase_info info = 0;
  if (!mach_timebase_info(&info))
  {
    LODWORD(result) = info.numer;
    LODWORD(v1) = info.denom;
    double result = (double)*(unint64_t *)&result / (double)v1;
    _CSMachAbsoluteTimeRate_rate = *(void *)&result;
  }
  return result;
}

@end