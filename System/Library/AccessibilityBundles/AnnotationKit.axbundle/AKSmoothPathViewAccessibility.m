@interface AKSmoothPathViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)terminateStroke;
@end

@implementation AKSmoothPathViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"AKSmoothPathView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (void)terminateStroke
{
  v4.receiver = self;
  v4.super_class = (Class)AKSmoothPathViewAccessibility;
  [(AKSmoothPathViewAccessibility *)&v4 terminateStroke];
  UIAccessibilityNotifications v2 = *MEMORY[0x263F1CDC8];
  v3 = accessibilityLocalizedString(@"sketch.drawing.ended");
  UIAccessibilityPostNotification(v2, v3);
}

@end