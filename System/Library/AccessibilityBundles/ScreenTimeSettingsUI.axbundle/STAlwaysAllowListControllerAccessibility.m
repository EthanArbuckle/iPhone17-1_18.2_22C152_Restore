@interface STAlwaysAllowListControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)specifiers;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation STAlwaysAllowListControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"STAlwaysAllowListController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (id)specifiers
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v13.receiver = self;
  v13.super_class = (Class)STAlwaysAllowListControllerAccessibility;
  v2 = [(STAlwaysAllowListControllerAccessibility *)&v13 specifiers];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  objc_opt_class();
  v3 = __UIAccessibilityCastAsClass();
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * i) accessibilitySetIdentification:@"AXAlwaysAllowSpecifierIdentification"];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v14 count:16];
    }
    while (v5);
  }

  return v2;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v4.receiver = self;
  v4.super_class = (Class)STAlwaysAllowListControllerAccessibility;
  [(STAlwaysAllowListControllerAccessibility *)&v4 _accessibilityLoadAccessibilityInformation];
  id v3 = (id)[(STAlwaysAllowListControllerAccessibility *)self safeValueForKey:@"specifiers"];
}

@end