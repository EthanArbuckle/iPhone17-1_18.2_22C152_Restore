@interface BaseLockupViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
- (id)_accessibilityAdvertisementElement;
- (id)_accessibilitySupplementaryFooterViews;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation BaseLockupViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"Arcade.BaseLockupView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)_accessibilityAdvertisementElement
{
  return (id)[(BaseLockupViewAccessibility *)self _accessibilityFindSubviewDescendant:&__block_literal_global_2];
}

uint64_t __65__BaseLockupViewAccessibility__accessibilityAdvertisementElement__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  MEMORY[0x2456419D0](@"Arcade.SearchAdTransparencyLabel");
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)accessibilityLabel
{
  v3 = [MEMORY[0x263EFF980] array];
  v4 = [(BaseLockupViewAccessibility *)self _accessibilityAdvertisementElement];
  v5 = v4;
  if (v4 && [v4 _accessibilityViewIsVisible]) {
    [v3 axSafelyAddObject:v5];
  }
  v6 = [(BaseLockupViewAccessibility *)self safeValueForKey:@"accessibilityHeadingLabel"];
  if ([v6 _accessibilityViewIsVisible]) {
    [v3 axSafelyAddObject:v6];
  }
  v7 = [(BaseLockupViewAccessibility *)self safeValueForKey:@"accessibilityOrdinalLabel"];
  if ([v7 _accessibilityViewIsVisible]) {
    [v3 axSafelyAddObject:v7];
  }
  v8 = [(BaseLockupViewAccessibility *)self safeValueForKey:@"accessibilityTitleLabel"];
  if ([v8 _accessibilityViewIsVisible]) {
    [v3 axSafelyAddObject:v8];
  }
  v9 = [(BaseLockupViewAccessibility *)self safeValueForKey:@"accessibilitySubtitleLabel"];
  if ([v9 _accessibilityViewIsVisible]) {
    [v3 axSafelyAddObject:v9];
  }
  v10 = [(BaseLockupViewAccessibility *)self safeValueForKey:@"accessibilityTertiaryTitleLabel"];
  if ([v10 _accessibilityViewIsVisible]) {
    [v3 axSafelyAddObject:v10];
  }
  v11 = AXLabelForElements();

  return v11;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CEE8];
}

- (id)_accessibilitySupplementaryFooterViews
{
  v3 = [MEMORY[0x263EFF980] array];
  v9.receiver = self;
  v9.super_class = (Class)BaseLockupViewAccessibility;
  v4 = [(BaseLockupViewAccessibility *)&v9 _accessibilitySupplementaryFooterViews];
  [v3 axSafelyAddObjectsFromArray:v4];

  v5 = [(BaseLockupViewAccessibility *)self _accessibilityAdvertisementElement];
  [v3 axSafelyAddObject:v5];
  v6 = [(BaseLockupViewAccessibility *)self safeValueForKey:@"accessibilityOfferButton"];
  [v3 axSafelyAddObject:v6];
  v7 = [(BaseLockupViewAccessibility *)self safeValueForKey:@"accessibilityOfferLabel"];
  [v3 axSafelyAddObject:v7];

  return v3;
}

@end