@interface LargeYearMonthViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4;
@end

@implementation LargeYearMonthViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"LargeYearMonthView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  [(LargeYearMonthViewAccessibility *)self _accessibilityVisibleFrame];
  if (CGRectIsEmpty(v12))
  {
    v8 = 0;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)LargeYearMonthViewAccessibility;
    v8 = -[LargeYearMonthViewAccessibility _accessibilityHitTest:withEvent:](&v10, sel__accessibilityHitTest_withEvent_, v7, x, y);
  }

  return v8;
}

@end