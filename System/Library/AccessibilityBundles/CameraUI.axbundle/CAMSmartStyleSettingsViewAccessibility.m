@interface CAMSmartStyleSettingsViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation CAMSmartStyleSettingsViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CAMSmartStyleSettingsView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMSmartStyleSettingsView", @"_selectAssetsButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMSmartStyleSettingsView", @"_showGridButton", "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v5.receiver = self;
  v5.super_class = (Class)CAMSmartStyleSettingsViewAccessibility;
  [(CAMSmartStyleSettingsViewAccessibility *)&v5 _accessibilityLoadAccessibilityInformation];
  id v3 = [(CAMSmartStyleSettingsViewAccessibility *)self safeValueForKey:@"_selectAssetsButton"];
  [v3 _setAccessibilityLabelBlock:&__block_literal_global_1];
  v4 = [(CAMSmartStyleSettingsViewAccessibility *)self safeValueForKey:@"_showGridButton"];
  [v4 _setAccessibilityLabelBlock:&__block_literal_global_314];
}

id __84__CAMSmartStyleSettingsViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke()
{
  return accessibilityCameraUI3LocalizedString(@"select.assets");
}

id __84__CAMSmartStyleSettingsViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2()
{
  return accessibilityCameraUI3LocalizedString(@"show.grid");
}

@end