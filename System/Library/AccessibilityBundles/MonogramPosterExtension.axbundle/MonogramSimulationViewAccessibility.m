@interface MonogramSimulationViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (CGRect)accessibilityFrame;
- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)accessibilityHint;
@end

@implementation MonogramSimulationViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MonogramPosterExtension.MonogramSimulationView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (id)accessibilityHint
{
  return accessibilityLocalizedString(@"monogram.description");
}

- (CGRect)accessibilityFrame
{
  objc_opt_class();
  v2 = __UIAccessibilityCastAsClass();
  [v2 frame];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  [v2 frame];
  CGFloat v12 = v11 * 0.25;
  v21.origin.CGFloat x = v4;
  v21.origin.CGFloat y = v6;
  v21.size.CGFloat width = v8;
  v21.size.CGFloat height = v10;
  CGRect v22 = CGRectInset(v21, 0.0, v12);
  CGFloat x = v22.origin.x;
  CGFloat y = v22.origin.y;
  CGFloat width = v22.size.width;
  CGFloat height = v22.size.height;

  double v17 = x;
  double v18 = y;
  double v19 = width;
  double v20 = height;
  result.size.CGFloat height = v20;
  result.size.CGFloat width = v19;
  result.origin.CGFloat y = v18;
  result.origin.CGFloat x = v17;
  return result;
}

- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  id v6 = a4;
  objc_opt_class();
  double v7 = __UIAccessibilityCastAsClass();
  CGFloat v8 = v7;
  if (v7 && ([v7 accessibilityFrame], v12.CGFloat x = x, v12.y = y, CGRectContainsPoint(v13, v12))) {
    id v9 = v8;
  }
  else {
    id v9 = 0;
  }

  return v9;
}

@end