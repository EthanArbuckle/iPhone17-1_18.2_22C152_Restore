@interface PUOneUpSelectionIndicatorTileViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_updateIfNeeded;
@end

@implementation PUOneUpSelectionIndicatorTileViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PUOneUpSelectionIndicatorTileViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUOneUpSelectionIndicatorTileViewController", @"_button", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUOneUpSelectionIndicatorTileViewController", @"_updateIfNeeded", "v", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v6.receiver = self;
  v6.super_class = (Class)PUOneUpSelectionIndicatorTileViewControllerAccessibility;
  [(PUOneUpSelectionIndicatorTileViewControllerAccessibility *)&v6 _accessibilityLoadAccessibilityInformation];
  objc_opt_class();
  id v3 = [(PUOneUpSelectionIndicatorTileViewControllerAccessibility *)self safeValueForKey:@"_button"];
  v4 = __UIAccessibilityCastAsClass();

  v5 = accessibilityPULocalizedString(@"use.photo.checkmark");
  [v4 setAccessibilityLabel:v5];
}

- (void)_updateIfNeeded
{
  v3.receiver = self;
  v3.super_class = (Class)PUOneUpSelectionIndicatorTileViewControllerAccessibility;
  [(PUOneUpSelectionIndicatorTileViewControllerAccessibility *)&v3 _updateIfNeeded];
  [(PUOneUpSelectionIndicatorTileViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end