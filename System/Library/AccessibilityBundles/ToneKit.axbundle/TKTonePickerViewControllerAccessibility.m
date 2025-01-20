@interface TKTonePickerViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_axUpdateCell:(id)a3;
- (void)_configureTextColorOfLabelInCell:(id)a3 shouldTintText:(BOOL)a4 checked:(BOOL)a5;
@end

@implementation TKTonePickerViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"TKTonePickerViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"TKTonePickerViewController" isKindOfClass:@"UITableViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"TKTonePickerViewController", @"_configureTextColorOfLabelInCell:shouldTintText:checked:", "v", "@", "B", "B", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v15.receiver = self;
  v15.super_class = (Class)TKTonePickerViewControllerAccessibility;
  [(TKTonePickerViewControllerAccessibility *)&v15 _accessibilityLoadAccessibilityInformation];
  char v14 = 0;
  objc_opt_class();
  id v3 = __UIAccessibilityCastAsClass();
  v4 = [v3 tableView];

  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v5 = objc_msgSend(v4, "visibleCells", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [(TKTonePickerViewControllerAccessibility *)self _axUpdateCell:*(void *)(*((void *)&v10 + 1) + 8 * i)];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v16 count:16];
    }
    while (v7);
  }
}

- (void)_configureTextColorOfLabelInCell:(id)a3 shouldTintText:(BOOL)a4 checked:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  v9.receiver = self;
  v9.super_class = (Class)TKTonePickerViewControllerAccessibility;
  id v8 = a3;
  [(TKTonePickerViewControllerAccessibility *)&v9 _configureTextColorOfLabelInCell:v8 shouldTintText:v6 checked:v5];
  -[TKTonePickerViewControllerAccessibility _axUpdateCell:](self, "_axUpdateCell:", v8, v9.receiver, v9.super_class);
}

- (void)_axUpdateCell:(id)a3
{
  id v7 = a3;
  uint64_t v3 = [v7 accessibilityTraits];
  v4 = [v7 imageView];
  BOOL v5 = [v4 image];

  if (v5) {
    uint64_t v6 = *MEMORY[0x263F1CF38] | v3;
  }
  else {
    uint64_t v6 = v3 & ~*MEMORY[0x263F1CF38];
  }
  [v7 setAccessibilityTraits:v6];
}

@end