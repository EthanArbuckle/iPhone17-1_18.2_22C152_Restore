@interface CCUIContentModuleContentContainerViewInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (void)_accessibilityLoadInvertColors;
- (void)_configureModuleMaterialViewIfNecessary;
@end

@implementation CCUIContentModuleContentContainerViewInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CCUIContentModuleContentContainerView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)_configureModuleMaterialViewIfNecessary
{
  v3.receiver = self;
  v3.super_class = (Class)CCUIContentModuleContentContainerViewInvertColorsAccessibility;
  [(CCUIContentModuleContentContainerViewInvertColorsAccessibility *)&v3 _configureModuleMaterialViewIfNecessary];
  [(CCUIContentModuleContentContainerViewInvertColorsAccessibility *)self _accessibilityLoadInvertColors];
}

- (void)_accessibilityLoadInvertColors
{
  if (([(CCUIContentModuleContentContainerViewInvertColorsAccessibility *)self safeBoolForKey:@"moduleProvidesOwnPlatter"] & 1) == 0)
  {
    objc_opt_class();
    objc_super v3 = [(CCUIContentModuleContentContainerViewInvertColorsAccessibility *)self safeValueForKeyPath:@"_moduleMaterialView"];
    v4 = __UIAccessibilityCastAsClass();

    [v4 setAccessibilityMaterialViewMimicsReduceTransparency:_AXSInvertColorsEnabledGlobalCached() != 0];
  }
}

@end