@interface UIMenuControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (void)setMenuItems:(id)a3;
@end

@implementation UIMenuControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIMenuController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)setMenuItems:(id)a3
{
  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3.receiver = v5;
  v3.super_class = (Class)UIMenuControllerAccessibility;
  [(UIMenuControllerAccessibility *)&v3 setMenuItems:location[0]];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
  objc_storeStrong(location, 0);
}

@end