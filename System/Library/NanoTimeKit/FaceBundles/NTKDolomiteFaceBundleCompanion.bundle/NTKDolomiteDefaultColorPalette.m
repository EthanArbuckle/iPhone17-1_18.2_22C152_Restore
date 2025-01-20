@interface NTKDolomiteDefaultColorPalette
- (NSNumber)dynamicPercent;
- (NSNumber)isHardwareColor;
- (NSNumber)isJetBlack;
- (UIColor)northColor;
- (UIColor)southColor;
@end

@implementation NTKDolomiteDefaultColorPalette

- (NSNumber)dynamicPercent
{
  LODWORD(v2) = 1.0;
  return +[NSNumber numberWithFloat:v2];
}

- (UIColor)northColor
{
  return +[UIColor redColor];
}

- (UIColor)southColor
{
  return +[UIColor blueColor];
}

- (NSNumber)isHardwareColor
{
  return +[NSNumber numberWithFloat:0.0];
}

- (NSNumber)isJetBlack
{
  return +[NSNumber numberWithFloat:0.0];
}

@end