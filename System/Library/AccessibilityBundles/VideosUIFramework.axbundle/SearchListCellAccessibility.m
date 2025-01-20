@interface SearchListCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityCustomActions;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation SearchListCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"VideosUI.SearchListCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"VideosUI.SearchListCell", @"titleLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"VideosUI.SearchListCell", @"subtitleLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"VideosUI.SearchListCell", @"buttonView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"VUIButton", @"selectActionHandler", "@?", 0);
  [v3 validateClass:@"VideosUI.SearchListCell" hasSwiftField:@"resultsContextLabel" withSwiftType:"Optional<VUILabel>"];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  id v3 = [(SearchListCellAccessibility *)self safeValueForKey:@"titleLabel"];
  objc_opt_class();
  v4 = [(SearchListCellAccessibility *)self safeSwiftValueForKey:@"resultsContextLabel"];
  v5 = __UIAccessibilityCastAsClass();

  v6 = [(SearchListCellAccessibility *)self safeValueForKey:@"subtitleLabel"];
  char v19 = 0;
  objc_opt_class();
  v7 = [(SearchListCellAccessibility *)self safeSwiftValueForKey:@"badgeView"];
  v8 = __UIAccessibilityCastAsClass();

  v18.receiver = self;
  v18.super_class = (Class)SearchListCellAccessibility;
  v9 = [(SearchListCellAccessibility *)&v18 accessibilityLabel];
  v10 = [v3 accessibilityLabel];
  uint64_t v11 = [v10 length];

  if (v11)
  {
    uint64_t v12 = [v3 accessibilityLabel];

    v9 = (void *)v12;
  }
  v13 = [v5 accessibilityLabel];
  v14 = [v6 accessibilityLabel];
  v17 = [v8 accessibilityLabel];
  v15 = __UIAXStringForVariables();

  return v15;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)SearchListCellAccessibility;
  return *MEMORY[0x263F1CEE8] | [(SearchListCellAccessibility *)&v3 accessibilityTraits];
}

- (id)accessibilityCustomActions
{
  objc_super v3 = [MEMORY[0x263EFF980] array];
  v16.receiver = self;
  v16.super_class = (Class)SearchListCellAccessibility;
  v4 = [(SearchListCellAccessibility *)&v16 accessibilityCustomActions];
  [v3 axSafelyAddObjectsFromArray:v4];

  v5 = [(SearchListCellAccessibility *)self safeValueForKey:@"buttonView"];
  objc_initWeak(&location, v5);
  id v6 = objc_alloc(MEMORY[0x263F1C390]);
  v7 = accessibilityLocalizedString(@"search.cell.button.more.action");
  uint64_t v10 = MEMORY[0x263EF8330];
  uint64_t v11 = 3221225472;
  uint64_t v12 = __57__SearchListCellAccessibility_accessibilityCustomActions__block_invoke;
  v13 = &unk_2651660B8;
  objc_copyWeak(&v14, &location);
  v8 = (void *)[v6 initWithName:v7 actionHandler:&v10];

  objc_msgSend(v3, "axSafelyAddObject:", v8, v10, v11, v12, v13);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

  return v3;
}

BOOL __57__SearchListCellAccessibility_accessibilityCustomActions__block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_super v3 = [WeakRetained safeValueForKey:@"selectActionHandler"];

  if (v3)
  {
    id v4 = objc_loadWeakRetained(v1);
    ((void (**)(void, id))v3)[2](v3, v4);
  }
  return v3 != 0;
}

@end