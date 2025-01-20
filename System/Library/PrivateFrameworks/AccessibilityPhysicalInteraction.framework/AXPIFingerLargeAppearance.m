@interface AXPIFingerLargeAppearance
- (double)fingerInnerRadius;
- (double)strokeOutlineWidth;
- (double)strokeWidth;
@end

@implementation AXPIFingerLargeAppearance

- (double)strokeWidth
{
  return 3.0;
}

- (double)strokeOutlineWidth
{
  return 3.0;
}

- (double)fingerInnerRadius
{
  return 25.5;
}

@end