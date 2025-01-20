@interface UIAccessibilityElementKBKeyChatKitAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_axKeyName;
- (id)accessibilityCustomRotors;
- (id)accessibilityHint;
- (id)accessibilityLabel;
@end

@implementation UIAccessibilityElementKBKeyChatKitAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIAccessibilityElementKBKey";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"UIAccessibilityElementKBKey" hasInstanceVariable:@"_key" withType:"UIKBTree"];
  [v3 validateClass:@"UIKBTree"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIKBTree", @"name", "@", 0);
}

- (id)accessibilityLabel
{
  id v3 = [(UIAccessibilityElementKBKeyChatKitAccessibility *)self _axKeyName];
  if ((AXDeviceIsPad() & 1) != 0 || ![v3 isEqualToString:@"Dismiss-Key"])
  {
    v7.receiver = self;
    v7.super_class = (Class)UIAccessibilityElementKBKeyChatKitAccessibility;
    uint64_t v4 = [(UIAccessibilityElementKBKeyChatKitAccessibility *)&v7 accessibilityLabel];
  }
  else
  {
    uint64_t v4 = accessibilityLocalizedString(@"handwriting.key.name");
  }
  v5 = (void *)v4;

  return v5;
}

- (id)accessibilityHint
{
  id v3 = [(UIAccessibilityElementKBKeyChatKitAccessibility *)self _axKeyName];
  if ((AXDeviceIsPad() & 1) != 0 || ([v3 isEqualToString:@"Dismiss-Key"] & 1) == 0)
  {
    v6.receiver = self;
    v6.super_class = (Class)UIAccessibilityElementKBKeyChatKitAccessibility;
    uint64_t v4 = [(UIAccessibilityElementKBKeyChatKitAccessibility *)&v6 accessibilityHint];
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

- (id)accessibilityCustomRotors
{
  v5.receiver = self;
  v5.super_class = (Class)UIAccessibilityElementKBKeyChatKitAccessibility;
  v2 = [(UIAccessibilityElementKBKeyChatKitAccessibility *)&v5 accessibilityCustomRotors];
  id v3 = addFirstResponderRotorsToRotorArray(v2);

  return v3;
}

- (id)_axKeyName
{
  objc_opt_class();
  id v3 = [(UIAccessibilityElementKBKeyChatKitAccessibility *)self safeValueForKey:@"_key"];
  uint64_t v4 = [v3 safeValueForKey:@"name"];
  objc_super v5 = __UIAccessibilityCastAsClass();

  return v5;
}

@end