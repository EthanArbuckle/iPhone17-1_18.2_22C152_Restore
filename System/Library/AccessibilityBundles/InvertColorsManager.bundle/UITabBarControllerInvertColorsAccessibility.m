@interface UITabBarControllerInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (void)transitionFromViewController:(id)a3 toViewController:(id)a4;
@end

@implementation UITabBarControllerInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UITabBarController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)transitionFromViewController:(id)a3 toViewController:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)UITabBarControllerInvertColorsAccessibility;
  [(UITabBarControllerInvertColorsAccessibility *)&v7 transitionFromViewController:a3 toViewController:a4];
  v5 = AXLogInvertColors();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_21A28((uint64_t)self, v5);
  }

  LocalCenter = CFNotificationCenterGetLocalCenter();
  CFNotificationCenterPostNotification(LocalCenter, (CFNotificationName)UIAccessibilityInvertColorsStatusDidChangeNotification, 0, 0, 1u);
}

@end