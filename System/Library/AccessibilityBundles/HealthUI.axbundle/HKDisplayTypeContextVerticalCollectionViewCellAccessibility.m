@interface HKDisplayTypeContextVerticalCollectionViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityCustomActions;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation HKDisplayTypeContextVerticalCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HKDisplayTypeContextVerticalCollectionViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"HKDisplayTypeContextVerticalCollectionViewCell" isKindOfClass:@"UICollectionViewCell"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UICollectionViewCell", @"isSelected", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HKDisplayTypeContextVerticalCollectionViewCell", @"infoButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HKDisplayTypeContextVerticalCollectionViewCell", @"infoButtonTapped:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HKDisplayTypeContextVerticalCollectionViewCell", @"titleLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HKDisplayTypeContextVerticalCollectionViewCell", @"valueAndUnitLabel", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  id v3 = [(HKDisplayTypeContextVerticalCollectionViewCellAccessibility *)self safeUIViewForKey:@"titleLabel"];
  v4 = [v3 accessibilityLabel];

  v5 = [(HKDisplayTypeContextVerticalCollectionViewCellAccessibility *)self safeUIViewForKey:@"valueAndUnitLabel"];
  v6 = [v5 accessibilityLabel];

  v7 = __UIAXStringForVariables();

  return v7;
}

- (unint64_t)accessibilityTraits
{
  v7.receiver = self;
  v7.super_class = (Class)HKDisplayTypeContextVerticalCollectionViewCellAccessibility;
  unint64_t v3 = *MEMORY[0x263F1CEE8] | [(HKDisplayTypeContextVerticalCollectionViewCellAccessibility *)&v7 accessibilityTraits];
  int v4 = [(HKDisplayTypeContextVerticalCollectionViewCellAccessibility *)self safeBoolForKey:@"selected"];
  uint64_t v5 = *MEMORY[0x263F1CF38];
  if (!v4) {
    uint64_t v5 = 0;
  }
  return v3 | v5;
}

- (id)accessibilityCustomActions
{
  unint64_t v3 = objc_opt_new();
  int v4 = [(HKDisplayTypeContextVerticalCollectionViewCellAccessibility *)self safeUIViewForKey:@"infoButton"];
  char v13 = 0;
  objc_opt_class();
  uint64_t v5 = __UIAccessibilityCastAsClass();
  id v6 = objc_alloc(MEMORY[0x263F1C390]);
  objc_super v7 = accessibilityLocalizedString(@"more.info");
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __89__HKDisplayTypeContextVerticalCollectionViewCellAccessibility_accessibilityCustomActions__block_invoke;
  v11[3] = &unk_265125F10;
  v11[4] = self;
  id v12 = v5;
  id v8 = v5;
  v9 = (void *)[v6 initWithName:v7 actionHandler:v11];
  [v3 addObject:v9];

  return v3;
}

uint64_t __89__HKDisplayTypeContextVerticalCollectionViewCellAccessibility_accessibilityCustomActions__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_initWeak(&location, *(id *)(a1 + 32));
  objc_copyWeak(&v6, &location);
  id v5 = *(id *)(a1 + 40);
  AXPerformSafeBlock();

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);

  return 1;
}

void __89__HKDisplayTypeContextVerticalCollectionViewCellAccessibility_accessibilityCustomActions__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained infoButtonTapped:*(void *)(a1 + 32)];
}

@end