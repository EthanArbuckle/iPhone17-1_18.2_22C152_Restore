@interface PINEntryViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityServesAsFirstResponder;
- (BOOL)isAccessibilityElement;
- (_NSRange)_accessibilitySelectedTextRange;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
- (void)_updateLabels;
@end

@implementation PINEntryViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PINEntryView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"PINEntryView" hasInstanceVariable:@"_text" withType:"NSMutableString"];
  [v3 validateClass:@"PINEntryView" hasInstanceVariable:@"_digits" withType:"NSArray"];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (BOOL)_accessibilityServesAsFirstResponder
{
  return 1;
}

- (_NSRange)_accessibilitySelectedTextRange
{
  v2 = [(PINEntryViewAccessibility *)self safeValueForKey:@"_text"];
  id v3 = __UIAccessibilitySafeClass();

  uint64_t v4 = [v3 length];
  NSUInteger v5 = v4;
  NSUInteger v6 = 0;
  result.length = v6;
  result.location = v5;
  return result;
}

- (id)accessibilityLabel
{
  id v3 = [(PINEntryViewAccessibility *)self safeValueForKey:@"_text"];
  uint64_t v4 = __UIAccessibilitySafeClass();

  NSUInteger v5 = [(PINEntryViewAccessibility *)self safeValueForKey:@"_digits"];
  NSUInteger v6 = __UIAccessibilitySafeClass();

  uint64_t v7 = [v6 count];
  uint64_t v8 = v7 - [v4 length];

  v9 = NSString;
  v10 = accessibilityLocalizedString(@"pin.values");
  v11 = objc_msgSend(v9, "localizedStringWithFormat:", v10, v8);

  v12 = accessibilityLocalizedString(@"pin.code");
  v13 = __UIAXStringForVariables();

  return v13;
}

- (id)accessibilityValue
{
  v2 = [(PINEntryViewAccessibility *)self safeValueForKey:@"_text"];
  id v3 = __UIAccessibilitySafeClass();

  uint64_t v4 = [v3 stringByReplacingOccurrencesOfString:@"-" withString:&stru_26F7C05E8];

  return v4;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F81398] | *MEMORY[0x263F81408];
}

- (void)_updateLabels
{
  v7.receiver = self;
  v7.super_class = (Class)PINEntryViewAccessibility;
  [(PINEntryViewAccessibility *)&v7 _updateLabels];
  id v3 = [(PINEntryViewAccessibility *)self _accessibilityValueForKey:@"AXLastSentValue"];
  uint64_t v4 = [(PINEntryViewAccessibility *)self safeValueForKey:@"_text"];
  char v5 = [v3 isEqualToString:v4];

  if ((v5 & 1) == 0)
  {
    UIAccessibilityPostNotification(*MEMORY[0x263F81438], 0);
    NSUInteger v6 = [(PINEntryViewAccessibility *)self safeValueForKey:@"_text"];
    [(PINEntryViewAccessibility *)self _accessibilitySetRetainedValue:v6 forKey:@"AXLastSentValue"];
  }
}

@end