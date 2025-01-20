@interface HUIconButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityIdentifier;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation HUIconButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HUIconButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HUIconButton", @"iconDescriptor", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HUNameAndIconEditorCell", @"delegate", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HUNameItemModuleController", @"supportsCustomIconEditing", "B", 0);
}

- (id)accessibilityLabel
{
  objc_opt_class();
  id v3 = [(HUIconButtonAccessibility *)self safeValueForKey:@"iconDescriptor"];
  v4 = [v3 safeValueForKey:@"identifier"];
  v5 = __UIAccessibilityCastAsClass();

  v6 = accessibilityHomeLocalizedString(@"icon.button.label");
  v9 = accessibilityLabelForIconIdentifier((uint64_t)v5);
  v7 = AXCFormattedString();

  return v7;
}

- (id)accessibilityIdentifier
{
  v2 = NSString;
  id v3 = [(HUIconButtonAccessibility *)self safeValueForKeyPath:@"iconDescriptor.identifier"];
  v4 = [v2 stringWithFormat:@"IconButton: %@", v3];

  return v4;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)HUIconButtonAccessibility;
  return *MEMORY[0x263F1CEE8] | [(HUIconButtonAccessibility *)&v3 accessibilityTraits] | *MEMORY[0x263F1CF00];
}

@end