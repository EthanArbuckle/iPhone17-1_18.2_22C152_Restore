@interface SmallSearchLockupViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_accessibilityAdvertisement;
- (id)_accessibilitySupplementaryFooterViews;
- (id)accessibilityLabel;
- (id)accessibilityUserInputLabels;
- (unint64_t)accessibilityTraits;
@end

@implementation SmallSearchLockupViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"ProductPageExtension.SmallSearchLockupView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ProductPageExtension.SmallSearchLockupView", @"accessibilitytUserRatingView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ProductPageExtension.SmallSearchLockupView", @"accessibilityRatingCountLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ProductPageExtension.SmallSearchLockupView", @"accessibilityIsAd", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ProductPageExtension.SmallSearchLockupView", @"accessibilityAdButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ProductPageExtension.SmallSearchLockupView", @"accessibilityDescriptionLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ProductPageExtension.SmallSearchLockupView", @"accessibilitySearchTagsRibbonView", "@", 0);
  [v3 validateClass:@"ProductPageExtension.SmallSearchLockupView" isKindOfClass:@"ProductPageExtension.BaseLockupView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ProductPageExtension.BaseLockupView", @"accessibilityTitleLabel", "@", 0);
}

- (id)_accessibilityAdvertisement
{
  return accessibilityAppStoreLocalizedString(@"advertisement.button");
}

- (id)accessibilityLabel
{
  int v3 = [(SmallSearchLockupViewAccessibility *)self safeBoolForKey:@"accessibilityIsAd"];
  v4 = [(SmallSearchLockupViewAccessibility *)self safeValueForKey:@"accessibilityRatingCountLabel"];
  v5 = [(SmallSearchLockupViewAccessibility *)self safeValueForKey:@"accessibilitytUserRatingView"];
  v6 = [(SmallSearchLockupViewAccessibility *)self safeValueForKey:@"accessibilityDescriptionLabel"];
  v29.receiver = self;
  v29.super_class = (Class)SmallSearchLockupViewAccessibility;
  v7 = [(SmallSearchLockupViewAccessibility *)&v29 accessibilityLabel];
  v8 = [v4 accessibilityLabel];

  if (v8)
  {
    v9 = NSString;
    v10 = accessibilityAppStoreLocalizedString(@"user.ratings");
    v11 = [v4 accessibilityLabel];
    v12 = objc_msgSend(v9, "stringWithFormat:", v10, v11);

    v22 = v6;
    v23 = @"__AXStringForVariablesSentinel";
    v19 = v5;
    v21 = v12;
    uint64_t v13 = __UIAXStringForVariables();

    v7 = (void *)v13;
  }
  v14 = [(SmallSearchLockupViewAccessibility *)self subviews];
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x2020000000;
  char v28 = 0;
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __56__SmallSearchLockupViewAccessibility_accessibilityLabel__block_invoke;
  v24[3] = &unk_2651485F8;
  v24[4] = &v25;
  [v14 enumerateObjectsUsingBlock:v24];
  if (*((unsigned char *)v26 + 24))
  {
    v20 = accessibilityAppStoreLocalizedString(@"editors.choice");
    uint64_t v15 = __UIAXStringForVariables();

    v7 = (void *)v15;
  }
  if (v3)
  {
    v16 = [(SmallSearchLockupViewAccessibility *)self _accessibilityAdvertisement];
    uint64_t v17 = __UIAXStringForVariables();

    v7 = (void *)v17;
  }
  _Block_object_dispose(&v25, 8);

  return v7;
}

void __56__SmallSearchLockupViewAccessibility_accessibilityLabel__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  MEMORY[0x24565D250](@"AppStore.EditorsChoiceView");
  char isKindOfClass = objc_opt_isKindOfClass();

  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = isKindOfClass & 1;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    *a4 = 1;
  }
}

- (id)_accessibilitySupplementaryFooterViews
{
  int v3 = [MEMORY[0x263EFF980] array];
  v10.receiver = self;
  v10.super_class = (Class)SmallSearchLockupViewAccessibility;
  v4 = [(SmallSearchLockupViewAccessibility *)&v10 _accessibilitySupplementaryFooterViews];
  [v3 axSafelyAddObjectsFromArray:v4];

  v5 = [(SmallSearchLockupViewAccessibility *)self safeValueForKey:@"accessibilityAdButton"];
  id v6 = [(SmallSearchLockupViewAccessibility *)self _accessibilityAdvertisement];
  [v5 setAccessibilityLabel:v6];

  [v5 setAccessibilityTraits:*MEMORY[0x263F1CEE8]];
  [v3 axSafelyAddObject:v5];
  v7 = [(SmallSearchLockupViewAccessibility *)self safeValueForKey:@"accessibilityMetadataRibbonView"];
  [v7 setIsAccessibilityElement:0];
  [v3 axSafelyAddObject:v7];
  v8 = [(SmallSearchLockupViewAccessibility *)self safeValueForKey:@"accessibilitySearchTagsRibbonView"];
  [v8 setIsAccessibilityElement:0];
  [v3 axSafelyAddObject:v8];

  return v3;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)SmallSearchLockupViewAccessibility;
  return *MEMORY[0x263F1CEE8] | [(SmallSearchLockupViewAccessibility *)&v3 accessibilityTraits];
}

- (id)accessibilityUserInputLabels
{
  objc_opt_class();
  objc_super v3 = [(SmallSearchLockupViewAccessibility *)self safeValueForKey:@"accessibilityTitleLabel"];
  v4 = __UIAccessibilityCastAsClass();

  v5 = __UIAXStringForVariables();
  id v6 = MEMORY[0x24565D260](v5);

  return v6;
}

@end