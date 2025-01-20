@interface UIColor(AXATV_Extras)
- (double)_atvaccessibilityAlphaComponent;
@end

@implementation UIColor(AXATV_Extras)

- (double)_atvaccessibilityAlphaComponent
{
  double v3 = 1.0;
  if (([a1 getWhite:0 alpha:&v3] & 1) == 0
    && ([a1 getHue:0 saturation:0 brightness:0 alpha:&v3] & 1) == 0)
  {
    [a1 getRed:0 green:0 blue:0 alpha:&v3];
  }
  return v3;
}

@end