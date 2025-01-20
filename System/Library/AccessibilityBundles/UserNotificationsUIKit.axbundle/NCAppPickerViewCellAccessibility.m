@interface NCAppPickerViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
@end

@implementation NCAppPickerViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"NCAppPickerViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"NCAppPickerViewCell" hasInstanceVariable:@"_titleLabel" withType:"UILabel"];
  [v3 validateClass:@"NCAppPickerViewCell" hasInstanceVariable:@"_frequencyLabel" withType:"UILabel"];
  [v3 validateClass:@"NCAppPickerViewCell" hasInstanceVariable:@"_checkmarkButton" withType:"NCCheckmarkButton"];
  [v3 validateClass:@"NCCheckmarkButton" isKindOfClass:@"UIControl"];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return (id)[(NCAppPickerViewCellAccessibility *)self _accessibilityStringForLabelKeyValues:@"_titleLabel"];
}

- (id)accessibilityValue
{
  id v3 = NSString;
  v4 = accessibilityLocalizedString(@"digest.daily.notification.average");
  v5 = [(NCAppPickerViewCellAccessibility *)self _accessibilityStringForLabelKeyValues:@"_frequencyLabel"];
  v6 = objc_msgSend(v3, "stringWithFormat:", v4, v5);

  return v6;
}

- (unint64_t)accessibilityTraits
{
  v2 = [(NCAppPickerViewCellAccessibility *)self safeValueForKey:@"_checkmarkButton"];
  int v3 = [v2 safeBoolForKey:@"isSelected"];

  uint64_t v4 = *MEMORY[0x263F1CF38];
  if (!v3) {
    uint64_t v4 = 0;
  }
  return v4 | *MEMORY[0x263F1CEE8];
}

@end