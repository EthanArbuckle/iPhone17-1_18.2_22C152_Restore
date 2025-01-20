@interface STCustomizeDaysListControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_accessibilityMarkSelectedSpecifier;
- (void)_showOrHidePickerSpecifierForSpecifier:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation STCustomizeDaysListControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"STCustomizeDaysListController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"STCustomizeDaysListController", @"selectedDaySpecifier", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"STCustomizeDaysListController", @"timePickerSpecifier", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"STCustomizeDaysListController", @"_showOrHidePickerSpecifierForSpecifier:", "v", "@", 0);
}

- (void)_accessibilityMarkSelectedSpecifier
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  objc_opt_class();
  id v3 = __UIAccessibilityCastAsClass();
  v4 = [v3 specifiers];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_opt_class();
        v9 = __UIAccessibilityCastAsSafeCategory();
        [v9 _accessibilitySetIsExpandedSTUICell:0];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  objc_opt_class();
  v10 = [(STCustomizeDaysListControllerAccessibility *)self safeValueForKey:@"selectedDaySpecifier"];
  v11 = __UIAccessibilityCastAsSafeCategory();

  [v11 _accessibilitySetIsExpandedSTUICell:1];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  v19.receiver = self;
  v19.super_class = (Class)STCustomizeDaysListControllerAccessibility;
  [(STCustomizeDaysListControllerAccessibility *)&v19 _accessibilityLoadAccessibilityInformation];
  char v18 = 0;
  objc_opt_class();
  id v3 = [(STCustomizeDaysListControllerAccessibility *)self safeValueForKey:@"timePickerSpecifier"];
  v4 = __UIAccessibilityCastAsClass();

  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  char v18 = 0;
  objc_opt_class();
  uint64_t v5 = __UIAccessibilityCastAsClass();
  uint64_t v6 = v5;
  uint64_t v7 = objc_msgSend(v5, "specifiers", (void)v14);

  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        if (*(void **)(*((void *)&v14 + 1) + 8 * i) != v4)
        {
          char v18 = 0;
          objc_opt_class();
          long long v12 = __UIAccessibilityCastAsSafeCategory();
          if (v18) {
            abort();
          }
          long long v13 = v12;
          [v12 _accessibilitySetIsExpandableSTUICell:1];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v20 count:16];
    }
    while (v9);
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)STCustomizeDaysListControllerAccessibility;
  [(STCustomizeDaysListControllerAccessibility *)&v4 viewDidAppear:a3];
  [(STCustomizeDaysListControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (void)_showOrHidePickerSpecifierForSpecifier:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)STCustomizeDaysListControllerAccessibility;
  [(STCustomizeDaysListControllerAccessibility *)&v4 _showOrHidePickerSpecifierForSpecifier:a3];
  [(STCustomizeDaysListControllerAccessibility *)self _accessibilityMarkSelectedSpecifier];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
}

@end