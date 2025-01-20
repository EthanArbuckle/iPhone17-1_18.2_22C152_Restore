@interface AXPISystemPointerLargeAppearance
- (double)fingerInnerRadius;
- (double)unpressedAlpha;
@end

@implementation AXPISystemPointerLargeAppearance

- (double)fingerInnerRadius
{
  v4.receiver = self;
  v4.super_class = (Class)AXPISystemPointerLargeAppearance;
  [(AXPISystemPointerPreciseAppearance *)&v4 fingerInnerRadius];
  return fmax(v2, 23.5);
}

- (double)unpressedAlpha
{
  return 0.7;
}

@end