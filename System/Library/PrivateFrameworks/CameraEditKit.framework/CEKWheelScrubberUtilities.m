@interface CEKWheelScrubberUtilities
+ (UIColor)dotIndicatorBackgroundColor;
+ (double)dotIndicatorDiameter;
@end

@implementation CEKWheelScrubberUtilities

+ (double)dotIndicatorDiameter
{
  int v2 = CEKIsSmallPhone();
  double result = 5.0;
  if (v2) {
    return 4.0;
  }
  return result;
}

+ (UIColor)dotIndicatorBackgroundColor
{
  return (UIColor *)[MEMORY[0x1E4FB1618] labelColor];
}

@end