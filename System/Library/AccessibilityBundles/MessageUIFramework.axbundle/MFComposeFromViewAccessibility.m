@interface MFComposeFromViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)accessibilityRespondsToUserInteraction;
- (BOOL)isAccessibilityElement;
- (id)accessibilityIdentifier;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
@end

@implementation MFComposeFromViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MFComposeFromView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MFComposeFromView", @"popupButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MFPopupButton", @"label", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CEE8];
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(@"from.text");
}

- (id)accessibilityValue
{
  v2 = [(MFComposeFromViewAccessibility *)self safeValueForKeyPath:@"popupButton.label"];
  id v3 = [v2 accessibilityLabel];

  return v3;
}

- (id)accessibilityIdentifier
{
  return @"fromField";
}

- (BOOL)accessibilityRespondsToUserInteraction
{
  return 1;
}

@end