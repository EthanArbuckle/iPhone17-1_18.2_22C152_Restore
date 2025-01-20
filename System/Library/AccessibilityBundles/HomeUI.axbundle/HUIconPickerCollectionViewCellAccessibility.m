@interface HUIconPickerCollectionViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation HUIconPickerCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HUIconPickerCollectionViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HUIconPickerCollectionViewCell", @"iconButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HUIconPickerCollectionViewCell", @"iconDescriptor", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  objc_opt_class();
  id v3 = [(HUIconPickerCollectionViewCellAccessibility *)self safeValueForKey:@"iconDescriptor"];
  v4 = [v3 safeValueForKey:@"identifier"];
  v5 = __UIAccessibilityCastAsClass();

  v6 = accessibilityLabelForIconIdentifier((uint64_t)v5);

  return v6;
}

- (unint64_t)accessibilityTraits
{
  objc_opt_class();
  id v3 = [(HUIconPickerCollectionViewCellAccessibility *)self safeValueForKey:@"iconButton"];
  v4 = __UIAccessibilityCastAsClass();

  int v5 = [v4 isSelected];
  uint64_t v6 = *MEMORY[0x263F1CF38];
  if (!v5) {
    uint64_t v6 = 0;
  }
  unint64_t v7 = v6 | *MEMORY[0x263F1CEE8];

  return v7;
}

@end