@interface HUQuickControlPushButtonViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_axIsOn;
- (BOOL)_axIsRotationDirectionToggle;
- (BOOL)isAccessibilityElement;
- (id)_axIconIdentifier;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
@end

@implementation HUQuickControlPushButtonViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HUQuickControlPushButtonView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HUQuickControlPushButtonView", @"controlState", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HUQuickControlPushButtonView", @"profile", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HUQuickControlViewProfile", @"decorationIconDescriptor", "@", 0);
  [v3 validateProtocol:@"HFIconDescriptor" hasRequiredInstanceMethod:@"identifier"];
}

- (BOOL)_axIsOn
{
  return [(HUQuickControlPushButtonViewAccessibility *)self safeUnsignedIntegerForKey:@"controlState"] == 1;
}

- (id)_axIconIdentifier
{
  v2 = [(HUQuickControlPushButtonViewAccessibility *)self safeValueForKeyPath:@"profile.decorationIconDescriptor"];
  id v3 = [v2 safeStringForKey:@"identifier"];

  return v3;
}

- (BOOL)_axIsRotationDirectionToggle
{
  v2 = [(HUQuickControlPushButtonViewAccessibility *)self _axIconIdentifier];
  char v3 = [v2 axContainsString:@"HFImageIconIdentifierDecorationRotationDirection"];

  return v3;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  char v3 = [(HUQuickControlPushButtonViewAccessibility *)self _axIconIdentifier];
  v4 = accessibilityLabelForIconIdentifier((uint64_t)v3);
  v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)HUQuickControlPushButtonViewAccessibility;
    id v6 = [(HUQuickControlPushButtonViewAccessibility *)&v9 accessibilityLabel];
  }
  v7 = v6;

  return v7;
}

- (id)accessibilityValue
{
  if ([(HUQuickControlPushButtonViewAccessibility *)self _axIsRotationDirectionToggle])
  {
    char v3 = 0;
  }
  else if ([(HUQuickControlPushButtonViewAccessibility *)self _axIsOn])
  {
    char v3 = @"1";
  }
  else
  {
    char v3 = @"0";
  }

  return v3;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)HUQuickControlPushButtonViewAccessibility;
  return *MEMORY[0x263F1CF60] | [(HUQuickControlPushButtonViewAccessibility *)&v3 accessibilityTraits] | *MEMORY[0x263F1CEE8];
}

@end