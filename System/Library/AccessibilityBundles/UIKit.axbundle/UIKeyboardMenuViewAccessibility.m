@interface UIKeyboardMenuViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)removeFromSuperview;
@end

@implementation UIKeyboardMenuViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIKeyboardMenuView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  [location[0] validateClass:@"UIKeyboardMenuView" isKindOfClass:@"UIView"];
  objc_storeStrong(location, 0);
}

- (void)removeFromSuperview
{
  v4 = self;
  SEL v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)UIKeyboardMenuViewAccessibility;
  [(UIKeyboardMenuViewAccessibility *)&v2 removeFromSuperview];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
}

@end