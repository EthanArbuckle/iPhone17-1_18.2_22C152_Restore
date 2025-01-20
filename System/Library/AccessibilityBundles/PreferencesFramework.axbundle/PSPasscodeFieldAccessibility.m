@interface PSPasscodeFieldAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
@end

@implementation PSPasscodeFieldAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PSPasscodeField";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PSPasscodeField", @"numberOfEntryFields", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PSPasscodeField", @"stringValue", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)PSPasscodeFieldAccessibility;
  return *MEMORY[0x263F813D8] | [(PSPasscodeFieldAccessibility *)&v3 accessibilityTraits] | *MEMORY[0x263F81408];
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(@"passcode.display");
}

- (id)accessibilityValue
{
  objc_super v3 = [(PSPasscodeFieldAccessibility *)self safeValueForKey:@"numberOfEntryFields"];
  uint64_t v4 = [v3 integerValue];

  v5 = [(PSPasscodeFieldAccessibility *)self safeValueForKey:@"stringValue"];
  uint64_t v6 = [v5 length];

  v7 = NSString;
  v8 = accessibilityLocalizedString(@"passcode.values.entered");
  v9 = objc_msgSend(v7, "localizedStringWithFormat:", v8, v6, v4);

  return v9;
}

@end