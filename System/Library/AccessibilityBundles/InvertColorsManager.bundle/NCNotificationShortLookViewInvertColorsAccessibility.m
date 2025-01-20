@interface NCNotificationShortLookViewInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)accessibilityIgnoresInvertColors;
- (void)_configureNotificationContentViewIfNecessary;
@end

@implementation NCNotificationShortLookViewInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"NCNotificationShortLookView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)_configureNotificationContentViewIfNecessary
{
  v3.receiver = self;
  v3.super_class = (Class)NCNotificationShortLookViewInvertColorsAccessibility;
  [(NCNotificationShortLookViewInvertColorsAccessibility *)&v3 _configureNotificationContentViewIfNecessary];
  +[AXInvertColorsAppHelper toggleInvertColors:self];
}

- (BOOL)accessibilityIgnoresInvertColors
{
  v2 = [(NCNotificationShortLookViewInvertColorsAccessibility *)self safeValueForKey:@"_platterView"];
  objc_super v3 = (char *)[v2 safeIntegerForKey:@"_materialRecipe"];

  return v3 == (unsigned char *)&stru_20.flags + 1;
}

@end