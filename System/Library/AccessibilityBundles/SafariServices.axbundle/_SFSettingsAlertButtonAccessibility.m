@interface _SFSettingsAlertButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation _SFSettingsAlertButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_SFSettingsAlertButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"_SFSettingsAlertButton", @"text", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIControl", @"isEnabled", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"_SFSettingsAlertButton", @"image", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"_SFSettingsAlertButton", @"imageView", "@", 0);
  [v3 validateClass:@"_SFSettingsAlertButton" isKindOfClass:@"UIControl"];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  uint64_t v3 = *MEMORY[0x263F1CEE8];
  int v4 = [(_SFSettingsAlertButtonAccessibility *)self safeBoolForKey:@"isEnabled"];
  uint64_t v5 = *MEMORY[0x263F1CF20];
  if (v4) {
    uint64_t v5 = 0;
  }
  unint64_t v6 = v5 | v3;
  v7 = [(_SFSettingsAlertButtonAccessibility *)self safeValueForKey:@"image"];
  v8 = [v7 accessibilityIdentifier];
  if ([v8 isEqualToString:@"checkmark"])
  {
    v9 = [(_SFSettingsAlertButtonAccessibility *)self safeUIViewForKey:@"imageView"];
    int v10 = [v9 _accessibilityViewIsVisible];

    uint64_t v11 = *MEMORY[0x263F1CF38];
    if (!v10) {
      uint64_t v11 = 0;
    }
    v6 |= v11;
  }
  else
  {
  }
  return v6;
}

- (id)accessibilityLabel
{
  uint64_t v3 = [(_SFSettingsAlertButtonAccessibility *)self accessibilityUserDefinedLabel];

  if (v3) {
    [(_SFSettingsAlertButtonAccessibility *)self accessibilityUserDefinedLabel];
  }
  else {
  int v4 = [(_SFSettingsAlertButtonAccessibility *)self safeStringForKey:@"text"];
  }

  return v4;
}

@end