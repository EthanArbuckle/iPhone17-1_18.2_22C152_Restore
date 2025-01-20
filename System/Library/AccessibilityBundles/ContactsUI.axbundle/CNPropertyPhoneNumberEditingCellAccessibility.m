@interface CNPropertyPhoneNumberEditingCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)accessibilityValue;
@end

@implementation CNPropertyPhoneNumberEditingCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CNPropertyPhoneNumberEditingCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityValue
{
  v5.receiver = self;
  v5.super_class = (Class)CNPropertyPhoneNumberEditingCellAccessibility;
  v2 = [(CNPropertyPhoneNumberEditingCellAccessibility *)&v5 accessibilityValue];
  v3 = [MEMORY[0x263F21660] axAttributedStringWithString:v2];
  [v3 setAttribute:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F21818]];

  return v3;
}

@end