@interface MobilePhoneUILabelAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)_accessibilityAlwaysOrderedFirst;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
@end

@implementation MobilePhoneUILabelAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UILabel";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityValue
{
  v3 = [(MobilePhoneUILabelAccessibility *)self accessibilityIdentifier];
  int v4 = [v3 isEqualToString:@"PhoneNumberLabel"];

  if (v4)
  {
    v5 = [(MobilePhoneUILabelAccessibility *)self safeValueForKey:@"text"];
    v6 = [MEMORY[0x263F21660] axAttributedStringWithString:v5];
    uint64_t v7 = *MEMORY[0x263EFFB40];
    [v6 setAttribute:*MEMORY[0x263EFFB40] forKey:*MEMORY[0x263F21818]];
    [v6 setAttribute:v7 forKey:*MEMORY[0x263F21810]];
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)MobilePhoneUILabelAccessibility;
    v6 = [(MobilePhoneUILabelAccessibility *)&v9 accessibilityValue];
  }

  return v6;
}

- (id)accessibilityLabel
{
  v3 = [(MobilePhoneUILabelAccessibility *)self accessibilityIdentifier];
  int v4 = [v3 isEqualToString:@"PhoneNumberLabel"];

  if (v4)
  {
    v5 = [(MobilePhoneUILabelAccessibility *)self safeValueForKey:@"text"];
    if ([v5 length]) {
      v6 = @"phone.display";
    }
    else {
      v6 = @"empty.phone.display";
    }
    uint64_t v7 = accessibilityLocalizedString(v6);
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)MobilePhoneUILabelAccessibility;
    uint64_t v7 = [(MobilePhoneUILabelAccessibility *)&v9 accessibilityLabel];
  }

  return v7;
}

- (unint64_t)accessibilityTraits
{
  v3 = [(MobilePhoneUILabelAccessibility *)self accessibilityIdentifier];
  int v4 = [v3 isEqualToString:@"PhoneNumberLabel"];

  if (v4) {
    return *MEMORY[0x263F1CF48] | *MEMORY[0x263F1CF50] | *MEMORY[0x263F1CF68];
  }
  v6.receiver = self;
  v6.super_class = (Class)MobilePhoneUILabelAccessibility;
  return [(MobilePhoneUILabelAccessibility *)&v6 accessibilityTraits];
}

- (BOOL)_accessibilityAlwaysOrderedFirst
{
  v3 = [(MobilePhoneUILabelAccessibility *)self accessibilityIdentifier];
  char v4 = [v3 isEqualToString:@"PhoneNumberLabel"];

  if (v4) {
    return 1;
  }
  v6.receiver = self;
  v6.super_class = (Class)MobilePhoneUILabelAccessibility;
  return [(MobilePhoneUILabelAccessibility *)&v6 _accessibilityAlwaysOrderedFirst];
}

@end