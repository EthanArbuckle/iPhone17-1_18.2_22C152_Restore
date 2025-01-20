@interface CADisplayLink
- (uint64_t)bkui_enableHighFrameRate;
@end

@implementation CADisplayLink

- (uint64_t)bkui_enableHighFrameRate
{
  if (result)
  {
    v1 = (void *)result;
    if (MGGetProductType() == 1060988941
      || MGGetProductType() == 3585085679
      || MGGetProductType() == 689804742
      || (result = MGGetProductType(), result == 2309863438))
    {
      CAFrameRateRange v3 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
      objc_msgSend(v1, "setPreferredFrameRateRange:", *(double *)&v3.minimum, *(double *)&v3.maximum, *(double *)&v3.preferred);
      return [v1 setHighFrameRateReason:2293761];
    }
  }
  return result;
}

@end