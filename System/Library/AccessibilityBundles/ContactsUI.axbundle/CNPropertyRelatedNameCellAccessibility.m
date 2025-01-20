@interface CNPropertyRelatedNameCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation CNPropertyRelatedNameCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CNPropertyRelatedNameCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CNPropertyCell", @"copy:", "v", "@", 0);
  [v3 validateClass:@"CNPropertyRelatedNameCell" isKindOfClass:@"CNPropertyCell"];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v14[1] = *MEMORY[0x263EF8340];
  v13.receiver = self;
  v13.super_class = (Class)CNPropertyRelatedNameCellAccessibility;
  [(CNPropertyRelatedNameCellAccessibility *)&v13 _accessibilityLoadAccessibilityInformation];
  objc_initWeak(&location, self);
  id v3 = objc_alloc(MEMORY[0x263F1C390]);
  v4 = accessibilityLocalizedString(@"copy.name.action");
  uint64_t v7 = MEMORY[0x263EF8330];
  uint64_t v8 = 3221225472;
  v9 = __84__CNPropertyRelatedNameCellAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v10 = &unk_2651180E8;
  objc_copyWeak(&v11, &location);
  v5 = (void *)[v3 initWithName:v4 actionHandler:&v7];

  v14[0] = v5;
  v6 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v14, 1, v7, v8, v9, v10);
  [(CNPropertyRelatedNameCellAccessibility *)self setAccessibilityCustomActions:v6];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

uint64_t __84__CNPropertyRelatedNameCellAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_copyWeak(&v5, (id *)(a1 + 32));
  AXPerformSafeBlock();
  objc_destroyWeak(&v5);

  return 1;
}

void __84__CNPropertyRelatedNameCellAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained copy:0];
}

@end