@interface CCUIContentModuleContainerViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_accessibilityLoadAccessibilityInformationSupplementaryItems;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation CCUIContentModuleContainerViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CCUIContentModuleContainerViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CCUIContentModuleContainerViewController", @"contentViewController", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CCUIContentModuleContainerViewController", @"contentModule", "@", 0);
}

- (id)_accessibilityLoadAccessibilityInformationSupplementaryItems
{
  v2 = (void *)MEMORY[0x263EFF8C0];
  id v3 = [(CCUIContentModuleContainerViewControllerAccessibility *)self safeValueForKey:@"contentViewController"];
  v4 = objc_msgSend(v2, "axArrayByIgnoringNilElementsWithCount:", 1, v3);

  return v4;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v5.receiver = self;
  v5.super_class = (Class)CCUIContentModuleContainerViewControllerAccessibility;
  [(CCUIContentModuleContainerViewControllerAccessibility *)&v5 _accessibilityLoadAccessibilityInformation];
  id v3 = [(CCUIContentModuleContainerViewControllerAccessibility *)self safeValueForKey:@"view"];
  [v3 setAccessibilityShouldGroupAccessibilityChildrenBlock:&__block_literal_global_1];

  v4 = [(CCUIContentModuleContainerViewControllerAccessibility *)self safeValueForKey:@"contentModule"];
  [v4 _accessibilityLoadAccessibilityInformation];
}

uint64_t __99__CCUIContentModuleContainerViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke()
{
  return 1;
}

@end