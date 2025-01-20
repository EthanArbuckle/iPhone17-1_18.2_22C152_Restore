@interface AKCodeEntryViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)_axVerificationCodeString;
- (id)accessibilityAttributedValue;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation AKCodeEntryViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"AKCodeEntryView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)AKCodeEntryViewAccessibility;
  return *MEMORY[0x263F81408] | [(AKCodeEntryViewAccessibility *)&v3 accessibilityTraits] | *MEMORY[0x263F81398];
}

- (id)accessibilityLabel
{
  v2 = [(AKCodeEntryViewAccessibility *)self _axVerificationCodeString];
  uint64_t v3 = [v2 length];

  v4 = accessibilityLocalizedString(@"verification.code");
  v5 = NSString;
  v6 = accessibilityLocalizedString(@"verificarion.code.values.entered");
  v9 = objc_msgSend(v5, "localizedStringWithFormat:", v6, v3, 6);
  v7 = __UIAXStringForVariables();

  return v7;
}

- (id)accessibilityAttributedValue
{
  v2 = [(AKCodeEntryViewAccessibility *)self _axVerificationCodeString];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263F21660] axAttributedStringWithString:v2];
    [v3 setAttribute:*MEMORY[0x263EFFB40] forKey:*MEMORY[0x263F21888]];
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

- (id)_axVerificationCodeString
{
  return (id)[(AKCodeEntryViewAccessibility *)self safeStringForKey:@"_stringValue"];
}

@end