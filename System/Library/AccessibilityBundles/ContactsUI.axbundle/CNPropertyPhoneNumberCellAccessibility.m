@interface CNPropertyPhoneNumberCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation CNPropertyPhoneNumberCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CNPropertyPhoneNumberCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v5.receiver = self;
  v5.super_class = (Class)CNPropertyPhoneNumberCellAccessibility;
  [(CNPropertyPhoneNumberCellAccessibility *)&v5 _accessibilityLoadAccessibilityInformation];
  v3 = [(CNPropertyPhoneNumberCellAccessibility *)self safeValueForKey:@"emergencyImageView"];
  v4 = accessibilityLocalizedString(@"contact.cell.emergency");
  [v3 setAccessibilityLabel:v4];
}

- (id)accessibilityLabel
{
  v9.receiver = self;
  v9.super_class = (Class)CNPropertyPhoneNumberCellAccessibility;
  v3 = [(CNPropertyPhoneNumberCellAccessibility *)&v9 accessibilityLabel];
  v4 = [(CNPropertyPhoneNumberCellAccessibility *)self safeValueForKey:@"emergencyImageView"];
  objc_super v5 = v4;
  if (v4)
  {
    v8 = [v4 accessibilityLabel];
    __UIAXStringForVariables();
    id v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v6 = v3;
  }

  return v6;
}

- (id)accessibilityValue
{
  v5.receiver = self;
  v5.super_class = (Class)CNPropertyPhoneNumberCellAccessibility;
  v2 = [(CNPropertyPhoneNumberCellAccessibility *)&v5 accessibilityValue];
  v3 = [MEMORY[0x263F21660] axAttributedStringWithString:v2];
  [v3 setAttribute:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F21818]];

  return v3;
}

@end