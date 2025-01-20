@interface AXGSEventConvertFromMachTime
@end

@implementation AXGSEventConvertFromMachTime

double ___AXGSEventConvertFromMachTime_block_invoke()
{
  mach_timebase_info info = 0;
  if (mach_timebase_info(&info))
  {
    LODWORD(v1) = 1;
    LODWORD(v2) = 1;
  }
  else
  {
    LODWORD(v1) = info.numer;
    LODWORD(v2) = info.numer;
    if (info.numer != info.denom)
    {
      if (info.numer >= info.denom) {
        unint64_t denom = info.denom;
      }
      else {
        unint64_t denom = info.numer;
      }
      if (info.numer <= info.denom) {
        unint64_t numer = info.denom;
      }
      else {
        unint64_t numer = info.numer;
      }
      if (denom)
      {
        do
        {
          unint64_t v5 = denom;
          unint64_t denom = numer % denom;
          unint64_t numer = v5;
        }
        while (denom);
      }
      else
      {
        unint64_t v5 = numer;
      }
      unint64_t v2 = info.numer / v5;
      unint64_t v1 = info.denom / v5;
    }
  }
  if (v2)
  {
    if (v1)
    {
      double result = (double)v2 / (double)v1 * *(double *)&_AXGSEventConvertFromMachTime___scale;
      *(double *)&_AXGSEventConvertFromMachTime___scale = result;
    }
  }
  return result;
}

@end