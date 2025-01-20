@interface SBCloseBoxViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (CGPoint)_accessibilityVisiblePoint;
@end

@implementation SBCloseBoxViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SBCloseBoxView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (CGPoint)_accessibilityVisiblePoint
{
  v5.receiver = self;
  v5.super_class = (Class)SBCloseBoxViewAccessibility;
  [(SBCloseBoxViewAccessibility *)&v5 _accessibilityVisiblePoint];
  double v4 = fmax(v3, 0.0);
  result.y = v2;
  result.x = v4;
  return result;
}

@end