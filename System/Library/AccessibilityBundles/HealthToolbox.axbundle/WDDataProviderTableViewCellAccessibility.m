@interface WDDataProviderTableViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
- (void)_setupUI;
@end

@implementation WDDataProviderTableViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"WDDataProviderTableViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"WDDataProviderTableViewCell" hasInstanceVariable:@"_checkmarkButton" withType:"UIButton"];
  [v3 validateClass:@"WDDataProviderTableViewCell" hasInstanceVariable:@"_inactiveLabel" withType:"UILabel"];
  [v3 validateClass:@"WDDataProviderTableViewCell" isKindOfClass:@"UITableViewCell"];
}

- (id)accessibilityLabel
{
  [(WDDataProviderTableViewCellAccessibility *)self safeValueForKey:@"_checkmarkButton"];
  uint64_t v16 = 0;
  v17 = (double *)&v16;
  uint64_t v18 = 0x4010000000;
  v19 = &unk_24219A796;
  long long v20 = 0u;
  long long v21 = 0u;
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  AXPerformSafeBlock();
  double v4 = v17[6];

  _Block_object_dispose(&v16, 8);
  if (v4 <= 0.0)
  {
    v5 = 0;
  }
  else
  {
    v5 = [v3 safeValueForKey:@"currentTitle"];
  }
  v6 = [(WDDataProviderTableViewCellAccessibility *)self safeValueForKey:@"_inactiveLabel"];
  char v7 = [v6 safeBoolForKey:@"hidden"];

  if (v7)
  {
    v8 = 0;
  }
  else
  {
    v9 = [(WDDataProviderTableViewCellAccessibility *)self safeValueForKey:@"_inactiveLabel"];
    v8 = [v9 accessibilityLabel];
  }
  LOBYTE(v16) = 0;
  objc_opt_class();
  v10 = __UIAccessibilityCastAsClass();
  if ((_BYTE)v16) {
    abort();
  }
  v11 = v10;
  v12 = [v10 textLabel];
  v13 = [v12 text];
  v14 = __UIAXStringForVariables();

  return v14;
}

uint64_t __62__WDDataProviderTableViewCellAccessibility_accessibilityLabel__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) frame];
  id v3 = *(void **)(*(void *)(a1 + 40) + 8);
  v3[4] = v4;
  v3[5] = v5;
  v3[6] = v6;
  v3[7] = v7;
  return result;
}

- (void)_setupUI
{
  v6.receiver = self;
  v6.super_class = (Class)WDDataProviderTableViewCellAccessibility;
  [(WDDataProviderTableViewCellAccessibility *)&v6 _setupUI];
  id v3 = [(WDDataProviderTableViewCellAccessibility *)self safeValueForKey:@"_inactiveLabel"];
  [v3 setIsAccessibilityElement:0];

  uint64_t v4 = [(WDDataProviderTableViewCellAccessibility *)self safeValueForKey:@"textLabel"];
  [v4 setIsAccessibilityElement:0];

  uint64_t v5 = [(WDDataProviderTableViewCellAccessibility *)self safeValueForKey:@"_checkmarkButton"];
  [v5 setIsAccessibilityElement:0];
}

@end