@interface LargeTextLargeMonthWeekViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4;
@end

@implementation LargeTextLargeMonthWeekViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"LargeTextLargeMonthWeekView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)LargeTextLargeMonthWeekViewAccessibility;
  v4 = -[LargeTextLargeMonthWeekViewAccessibility _accessibilityHitTest:withEvent:](&v7, sel__accessibilityHitTest_withEvent_, a4, a3.x, a3.y);
  [v4 _accessibilityVisibleFrame];
  if (CGRectIsEmpty(v9)) {
    id v5 = 0;
  }
  else {
    id v5 = v4;
  }

  return v5;
}

@end