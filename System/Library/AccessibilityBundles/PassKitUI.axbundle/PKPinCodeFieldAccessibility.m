@interface PKPinCodeFieldAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityServesAsFirstResponder;
- (BOOL)isAccessibilityElement;
- (_NSRange)_accessibilitySelectedTextRange;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
@end

@implementation PKPinCodeFieldAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PKPinCodeField";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"PKPinCodeField" hasInstanceVariable:@"_pinCode" withType:"NSMutableString"];
  [v3 validateClass:@"PKPinCodeField" hasInstanceVariable:@"_pinCodeLength" withType:"Q"];
}

- (_NSRange)_accessibilitySelectedTextRange
{
  id v3 = [(PKPinCodeFieldAccessibility *)self safeStringForKey:@"_pinCode"];
  uint64_t v4 = [v3 length];
  uint64_t v5 = [(PKPinCodeFieldAccessibility *)self safeUnsignedIntegerForKey:@"_pinCodeLength"];

  NSUInteger v6 = v4;
  NSUInteger v7 = v5;
  result.length = v7;
  result.location = v6;
  return result;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  id v3 = accessibilityLocalizedString(@"pin.code.label");
  uint64_t v4 = NSString;
  uint64_t v5 = accessibilityLocalizedString(@"pin.code.values");
  NSUInteger v6 = [(PKPinCodeFieldAccessibility *)self safeStringForKey:@"_pinCode"];
  v9 = objc_msgSend(v4, "localizedStringWithFormat:", v5, objc_msgSend(v6, "length"), -[PKPinCodeFieldAccessibility safeUnsignedIntegerForKey:](self, "safeUnsignedIntegerForKey:", @"_pinCodeLength"));
  NSUInteger v7 = __UIAXStringForVariables();

  return v7;
}

- (id)accessibilityValue
{
  v2 = (void *)MEMORY[0x263F21660];
  id v3 = [(PKPinCodeFieldAccessibility *)self safeStringForKey:@"_pinCode"];
  uint64_t v4 = [v2 axAttributedStringWithString:v3];

  [v4 setAttribute:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F1CEB0]];

  return v4;
}

- (BOOL)_accessibilityServesAsFirstResponder
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F81398] | *MEMORY[0x263F81408];
}

@end