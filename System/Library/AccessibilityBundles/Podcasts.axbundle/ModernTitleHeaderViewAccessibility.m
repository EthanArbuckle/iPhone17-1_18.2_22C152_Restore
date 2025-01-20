@interface ModernTitleHeaderViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)_accessibilitySupplementaryFooterViews;
- (id)_axFavoriteHeaderButton;
- (id)_axSuggestLessButton;
- (id)accessibilityElements;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
@end

@implementation ModernTitleHeaderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"ShelfKitCollectionViews.ModernTitleHeaderView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ShelfKitCollectionViews.ModernTitleHeaderView", @"accessibilityTitleLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ShelfKitCollectionViews.ModernTitleHeaderView", @"accessibilitySubtitleLabel", "@", 0);
  [v3 validateClass:@"ShelfKitCollectionViews.ModernTitleHeaderView" hasSwiftField:@"accessibilityHasContextAction" withSwiftType:"Bool"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ShelfKitCollectionViews.ModernTitleHeaderView", @"accessibilityHeaderButtons", "@", 0);
  [v3 validateClass:@"ShelfKitCollectionViews.ModernTitleHeaderView" hasSwiftField:@"titleButton" withSwiftType:"UIButton"];
}

- (BOOL)isAccessibilityElement
{
  return [(ModernTitleHeaderViewAccessibility *)self safeSwiftBoolForKey:@"accessibilityHasContextAction"] ^ 1;
}

- (unint64_t)accessibilityTraits
{
  id v3 = [(ModernTitleHeaderViewAccessibility *)self safeSwiftValueForKey:@"titleButton"];
  v4 = v3;
  if (v3 && ([v3 isHidden] & 1) == 0)
  {
    v10.receiver = self;
    v10.super_class = (Class)ModernTitleHeaderViewAccessibility;
    unint64_t v6 = *MEMORY[0x263F1CEF8] | [(ModernTitleHeaderViewAccessibility *)&v10 accessibilityTraits];
    unint64_t v5 = *MEMORY[0x263F1CEE8];
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)ModernTitleHeaderViewAccessibility;
    unint64_t v5 = [(ModernTitleHeaderViewAccessibility *)&v9 accessibilityTraits];
    unint64_t v6 = *MEMORY[0x263F1CEF8];
  }
  unint64_t v7 = v6 | v5;

  return v7;
}

- (id)accessibilityLabel
{
  objc_opt_class();
  id v3 = [(ModernTitleHeaderViewAccessibility *)self safeValueForKey:@"accessibilityTitleLabel"];
  v4 = __UIAccessibilityCastAsClass();

  unint64_t v5 = [(ModernTitleHeaderViewAccessibility *)self safeValueForKey:@"accessibilitySubtitleLabel"];
  unint64_t v6 = [v4 text];
  objc_super v9 = [v5 accessibilityLabel];
  unint64_t v7 = __UIAXStringForVariables();

  return v7;
}

- (id)accessibilityValue
{
  if ([(ModernTitleHeaderViewAccessibility *)self safeSwiftBoolForKey:@"accessibilityHasContextAction"])
  {
    id v3 = accessibilityLocalizedString(@"filter");
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)ModernTitleHeaderViewAccessibility;
    id v3 = [(ModernTitleHeaderViewAccessibility *)&v5 accessibilityValue];
  }

  return v3;
}

- (id)accessibilityElements
{
  if ([(ModernTitleHeaderViewAccessibility *)self safeSwiftBoolForKey:@"accessibilityHasContextAction"])
  {
    id v3 = [MEMORY[0x263EFF980] array];
    char v11 = 0;
    objc_opt_class();
    v4 = [(ModernTitleHeaderViewAccessibility *)self safeValueForKey:@"accessibilityTitleLabel"];
    objc_super v5 = __UIAccessibilityCastAsClass();

    unint64_t v6 = [v5 text];
    [v5 setAccessibilityLabel:v6];

    unint64_t v7 = accessibilityLocalizedString(@"filter");
    [v5 setAccessibilityValue:v7];

    [v5 setAccessibilityTraits:*MEMORY[0x263F1CEE8] | *MEMORY[0x263F1CEF8]];
    [v3 axSafelyAddObject:v5];
    v8 = [(ModernTitleHeaderViewAccessibility *)self safeArrayForKey:@"accessibilityHeaderButtons"];
    [v3 axSafelyAddObjectsFromArray:v8];
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)ModernTitleHeaderViewAccessibility;
    id v3 = [(ModernTitleHeaderViewAccessibility *)&v10 accessibilityElements];
  }

  return v3;
}

- (id)_accessibilitySupplementaryFooterViews
{
  id v3 = [MEMORY[0x263EFF980] array];
  v8.receiver = self;
  v8.super_class = (Class)ModernTitleHeaderViewAccessibility;
  v4 = [(ModernTitleHeaderViewAccessibility *)&v8 _accessibilitySupplementaryFooterViews];
  [v3 axSafelyAddObjectsFromArray:v4];

  objc_super v5 = [(ModernTitleHeaderViewAccessibility *)self _axFavoriteHeaderButton];
  [v3 axSafelyAddObject:v5];
  unint64_t v6 = [(ModernTitleHeaderViewAccessibility *)self _axSuggestLessButton];
  [v3 axSafelyAddObject:v6];

  return v3;
}

- (id)_axFavoriteHeaderButton
{
  uint64_t v3 = MEMORY[0x24565B6C0](@"ShelfKitCollectionViews.FavoriteHeaderButton", a2);

  return (id)[(ModernTitleHeaderViewAccessibility *)self _accessibilityDescendantOfType:v3];
}

- (id)_axSuggestLessButton
{
  uint64_t v3 = MEMORY[0x24565B6C0](@"ShelfKitCollectionViews.SuggestLessButton", a2);

  return (id)[(ModernTitleHeaderViewAccessibility *)self _accessibilityDescendantOfType:v3];
}

@end