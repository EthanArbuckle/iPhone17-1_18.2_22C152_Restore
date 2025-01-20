@interface PKMultilineKeyValueTableViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (id)accessibilityValue;
@end

@implementation PKMultilineKeyValueTableViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PKMultilineKeyValueTableViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"PKMultilineKeyValueTableViewCell" hasInstanceVariable:@"_keyLabel" withType:"UILabel"];
  [v3 validateClass:@"PKMultilineKeyValueTableViewCell" hasInstanceVariable:@"_valueLabel" withType:"UILabel"];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return (id)[(PKMultilineKeyValueTableViewCellAccessibility *)self _accessibilityStringForLabelKeyValues:@"_keyLabel"];
}

- (id)accessibilityValue
{
  v2 = [(PKMultilineKeyValueTableViewCellAccessibility *)self _accessibilityStringForLabelKeyValues:@"_valueLabel"];
  id v3 = [MEMORY[0x263F08708] controlCharacterSet];
  v4 = [v2 stringByTrimmingCharactersInSet:v3];

  v5 = PKPANMask();
  LODWORD(v3) = [v4 hasPrefix:v5];

  if (v3)
  {
    v6 = (void *)MEMORY[0x263F21660];
    v7 = NSString;
    v8 = accessibilityLocalizedString(@"ends.with");
    v9 = objc_msgSend(v7, "stringWithFormat:", v8, v4);
    id v10 = [v6 axAttributedStringWithString:v9];

    [v10 setAttribute:*MEMORY[0x263EFFB40] forKey:*MEMORY[0x263F21888]];
  }
  else
  {
    id v10 = v4;
  }

  return v10;
}

@end