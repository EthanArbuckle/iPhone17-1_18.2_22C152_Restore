@interface CFXFilterPickerCollectionViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityHint;
- (unint64_t)accessibilityTraits;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)configureCellAppearence;
@end

@implementation CFXFilterPickerCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CFXFilterPickerCollectionViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CFXFilterPickerCollectionViewCell", @"titleView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CFXEffectPickerCollectionViewCell", @"effect", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CFXEffect", @"identifier", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CFXFilterPickerCollectionViewCell", @"isInCompactMode", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CFXFilterPickerCollectionViewCell", @"configureCellAppearence", "v", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v4.receiver = self;
  v4.super_class = (Class)CFXFilterPickerCollectionViewCellAccessibility;
  [(CFXFilterPickerCollectionViewCellAccessibility *)&v4 _accessibilityLoadAccessibilityInformation];
  id v3 = [(CFXFilterPickerCollectionViewCellAccessibility *)self safeValueForKey:@"titleView"];
  [v3 setIsAccessibilityElement:0];
}

- (BOOL)isAccessibilityElement
{
  return [(CFXFilterPickerCollectionViewCellAccessibility *)self safeBoolForKey:@"isInCompactMode"] ^ 1;
}

- (unint64_t)accessibilityTraits
{
  if ([(CFXFilterPickerCollectionViewCellAccessibility *)self safeBoolForKey:@"selected"])
  {
    v5.receiver = self;
    v5.super_class = (Class)CFXFilterPickerCollectionViewCellAccessibility;
    return *MEMORY[0x263F1CF38] | [(CFXFilterPickerCollectionViewCellAccessibility *)&v5 accessibilityTraits];
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)CFXFilterPickerCollectionViewCellAccessibility;
    return [(CFXFilterPickerCollectionViewCellAccessibility *)&v4 accessibilityTraits];
  }
}

- (id)accessibilityHint
{
  char v10 = 0;
  objc_opt_class();
  id v3 = [(CFXFilterPickerCollectionViewCellAccessibility *)self safeValueForKey:@"effect"];
  objc_super v4 = [v3 safeValueForKey:@"identifier"];
  objc_super v5 = __UIAccessibilityCastAsClass();

  if ([v5 isEqualToString:@"737C8717-70E0-4CCE-8F19-17A0532E836F"])
  {
    v9.receiver = self;
    v9.super_class = (Class)CFXFilterPickerCollectionViewCellAccessibility;
    v6 = [(CFXFilterPickerCollectionViewCellAccessibility *)&v9 accessibilityHint];
  }
  else
  {
    v7 = [NSString localizedStringWithFormat:@"filter.hint-%@", v5];
    v6 = accessibilityLocalizedString(v7);
  }

  return v6;
}

- (void)configureCellAppearence
{
  v3.receiver = self;
  v3.super_class = (Class)CFXFilterPickerCollectionViewCellAccessibility;
  [(CFXFilterPickerCollectionViewCellAccessibility *)&v3 configureCellAppearence];
  [(CFXFilterPickerCollectionViewCellAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end