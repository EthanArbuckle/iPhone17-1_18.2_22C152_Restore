@interface PBFAmbientEditingCollectionViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation PBFAmbientEditingCollectionViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PBFAmbientEditingCollectionViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"PBFAmbientEditingCollectionViewController" isKindOfClass:@"UIViewController"];
  [v3 validateClass:@"PBFAmbientEditingCollectionViewController" hasSwiftField:@"editingSceneViewController" withSwiftType:"Optional<PREditingSceneViewController>"];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v5.receiver = self;
  v5.super_class = (Class)PBFAmbientEditingCollectionViewControllerAccessibility;
  [(PBFAmbientEditingCollectionViewControllerAccessibility *)&v5 _accessibilityLoadAccessibilityInformation];
  id v3 = [(PBFAmbientEditingCollectionViewControllerAccessibility *)self safeUIViewForKey:@"view"];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __100__PBFAmbientEditingCollectionViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v4[3] = &unk_265145500;
  v4[4] = self;
  [v3 setAccessibilityElementsHiddenBlock:v4];
}

BOOL __100__PBFAmbientEditingCollectionViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) safeSwiftValueForKey:@"editingSceneViewController"];
  BOOL v2 = v1 != 0;

  return v2;
}

@end