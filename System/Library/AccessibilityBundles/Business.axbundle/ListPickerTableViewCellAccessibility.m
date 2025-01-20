@interface ListPickerTableViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)accessibilityRowSelected;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
- (void)setAccessibilityRowSelected:(BOOL)a3;
@end

@implementation ListPickerTableViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"Business.ListPickerTableViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"Business.ListPickerTableViewCell", @"titleLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"Business.ListPickerTableViewCell", @"subtitleLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"Business.ListPickerTableViewCell", @"accessibilitySelected", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"Business.ListPickerTableViewCell", @"iconImageView", "@", 0);
}

- (id)accessibilityLabel
{
  return (id)[(ListPickerTableViewCellAccessibility *)self _accessibilityStringForLabelKeyValues:@"titleLabel, subtitleLabel"];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  v12.receiver = self;
  v12.super_class = (Class)ListPickerTableViewCellAccessibility;
  unint64_t v3 = [(ListPickerTableViewCellAccessibility *)&v12 accessibilityTraits];
  v4 = [(ListPickerTableViewCellAccessibility *)self safeUIViewForKey:@"contentView"];
  [v4 alpha];
  double v6 = v5;
  objc_opt_class();
  v7 = [(ListPickerTableViewCellAccessibility *)self safeValueForKey:@"iconImageView"];
  v8 = __UIAccessibilityCastAsClass();

  v9 = [v8 image];

  if ([(ListPickerTableViewCellAccessibility *)self safeBoolForKey:@"accessibilitySelected"])
  {
    if (v9)
    {
      uint64_t v10 = *MEMORY[0x263F1CF38] | *MEMORY[0x263F1CEE8];
LABEL_6:
      v3 |= v10;
    }
  }
  else
  {
    if (v6 < 1.0)
    {
      uint64_t v10 = *MEMORY[0x263F1CF20];
      goto LABEL_6;
    }
    if (v9) {
      unint64_t v3 = v3 & ~*MEMORY[0x263F1CF38] | *MEMORY[0x263F1CEE8];
    }
  }

  return v3;
}

- (BOOL)accessibilityRowSelected
{
  return self->_accessibilityRowSelected;
}

- (void)setAccessibilityRowSelected:(BOOL)a3
{
  self->_accessibilityRowSelected = a3;
}

@end