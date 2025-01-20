@interface PUTransparentViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
@end

@implementation PUTransparentViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PUTransparentView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  if (UIAccessibilityIsVoiceOverRunning())
  {
    uint64_t v8 = [(PUTransparentViewAccessibility *)self _accessibilityDescendantOfType:NSClassFromString(&cfstr_Plhighfidelity.isa)];
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)PUTransparentViewAccessibility;
    uint64_t v8 = -[PUTransparentViewAccessibility hitTest:withEvent:](&v11, sel_hitTest_withEvent_, v7, x, y);
  }
  v9 = (void *)v8;

  return v9;
}

@end