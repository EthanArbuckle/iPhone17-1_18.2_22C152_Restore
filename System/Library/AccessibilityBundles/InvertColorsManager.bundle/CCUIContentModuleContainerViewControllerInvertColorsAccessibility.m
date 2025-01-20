@interface CCUIContentModuleContainerViewControllerInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)clickPresentationInteractionShouldBegin:(id)a3;
- (void)_accessibilityLoadInvertColors;
- (void)viewWillLayoutSubviews;
@end

@implementation CCUIContentModuleContainerViewControllerInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CCUIContentModuleContainerViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)_accessibilityLoadInvertColors
{
  BOOL v3 = _AXSInvertColorsEnabledGlobalCached() != 0;
  v4 = [(CCUIContentModuleContainerViewControllerInvertColorsAccessibility *)self safeValueForKey:@"view"];
  [v4 setAccessibilityIgnoresInvertColors:v3];

  v5 = [(CCUIContentModuleContainerViewControllerInvertColorsAccessibility *)self safeValueForKey:@"_contentView"];
  [v5 setAccessibilityIgnoresInvertColors:v3];

  id v6 = [(CCUIContentModuleContainerViewControllerInvertColorsAccessibility *)self safeValueForKey:@"_contentContainerView"];
  [v6 setAccessibilityIgnoresInvertColors:v3];
}

- (void)viewWillLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)CCUIContentModuleContainerViewControllerInvertColorsAccessibility;
  [(CCUIContentModuleContainerViewControllerInvertColorsAccessibility *)&v3 viewWillLayoutSubviews];
  [(CCUIContentModuleContainerViewControllerInvertColorsAccessibility *)self _accessibilityLoadInvertColors];
}

- (BOOL)clickPresentationInteractionShouldBegin:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CCUIContentModuleContainerViewControllerInvertColorsAccessibility;
  BOOL v4 = [(CCUIContentModuleContainerViewControllerInvertColorsAccessibility *)&v6 clickPresentationInteractionShouldBegin:a3];
  [(CCUIContentModuleContainerViewControllerInvertColorsAccessibility *)self _accessibilityLoadInvertColors];
  return v4;
}

@end