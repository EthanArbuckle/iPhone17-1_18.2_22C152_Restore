@interface HUGridServiceCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_asIsSensor;
- (id)_axComposedString;
- (id)_axServiceIconDescription;
- (id)_axServiceNameComponents;
- (id)accessibilityIdentifier;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
@end

@implementation HUGridServiceCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HUGridServiceCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"HFSensorServiceItem"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HUGridServiceCell", @"serviceItem", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HUGridServiceCell", @"serviceTextView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HUGridServiceCell", @"coloredDescriptionLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HUGridServiceCellTextView", @"serviceNameComponents", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HFServiceNameComponents", @"composedString", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HFServiceNameComponents", @"serviceName", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HFServiceNameComponents", @"roomName", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HUGridServiceCell", @"accessoryView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HUGridServiceCell", @"iconView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HUCheckmarkAccessoryView", @"checked", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HUGridServiceCell", @"showingProgressIndicator", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HUGridServiceCellTextView", @"_combinedAttributedString", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HUGridServiceCellTextView", @"descriptionText", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HUIconView", @"iconDescriptor", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HUGridServiceCell", @"_textConfiguration", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HUGridServiceCell", @"accessoryView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HUGridServiceCell", @"exclamationView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HUIconView", @"displayStyle", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HUGridServiceCellTextConfiguration", @"nameComponents", "@", 0);
}

- (id)_axServiceNameComponents
{
  v2 = [(HUGridServiceCellAccessibility *)self safeValueForKey:@"serviceTextView"];
  id v3 = [v2 safeValueForKey:@"serviceNameComponents"];

  return v3;
}

- (id)_axServiceIconDescription
{
  v2 = [(HUGridServiceCellAccessibility *)self safeValueForKey:@"iconView"];
  id v3 = [v2 safeValueForKey:@"iconDescriptor"];
  v4 = [v3 accessibilityValue];

  return v4;
}

- (id)_axComposedString
{
  objc_opt_class();
  id v3 = [(HUGridServiceCellAccessibility *)self _axServiceNameComponents];
  v4 = [v3 safeValueForKey:@"composedString"];
  v5 = __UIAccessibilityCastAsClass();

  return v5;
}

- (BOOL)_asIsSensor
{
  v2 = [(HUGridServiceCellAccessibility *)self safeValueForKey:@"serviceItem"];
  MEMORY[0x2456509F0](@"HFSensorServiceItem");
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)accessibilityIdentifier
{
  id v3 = [(HUGridServiceCellAccessibility *)self safeValueForKey:@"iconView"];
  uint64_t v4 = [v3 safeIntegerForKey:@"displayStyle"];

  v5 = [(HUGridServiceCellAccessibility *)self safeValueForKey:@"_textConfiguration"];
  v6 = NSString;
  v7 = [v5 safeValueForKeyPath:@"nameComponents.serviceName"];
  v8 = [v5 safeValueForKeyPath:@"nameComponents.roomName"];
  v9 = [(HUGridServiceCellAccessibility *)self safeValueForKeyPath:@"iconView.iconDescriptor.identifier"];
  v10 = [v6 stringWithFormat:@"%@, %@, %@, %ld", v7, v8, v9, v4];

  return v10;
}

- (id)accessibilityValue
{
  id v3 = [(HUGridServiceCellAccessibility *)self _axServiceIconDescription];
  uint64_t v4 = [(HUGridServiceCellAccessibility *)self _axComposedString];
  if ([(HUGridServiceCellAccessibility *)self safeBoolForKey:@"showingProgressIndicator"])
  {
    v5 = accessibilityHomeUILocalizedString(@"in.progress");
  }
  else
  {
    v5 = 0;
  }
  v6 = [(HUGridServiceCellAccessibility *)self safeValueForKey:@"accessoryView"];
  v7 = [(HUGridServiceCellAccessibility *)self safeValueForKey:@"exclamationView"];
  if (v6 != v7)
  {

LABEL_8:
    v10 = 0;
    goto LABEL_9;
  }
  v8 = [(HUGridServiceCellAccessibility *)self safeValueForKey:@"accessoryView"];
  int v9 = [v8 _accessibilityViewIsVisible];

  if (!v9) {
    goto LABEL_8;
  }
  v10 = accessibilityHomeUILocalizedString(@"attention.icon");
LABEL_9:
  v11 = [(HUGridServiceCellAccessibility *)self safeValueForKey:@"coloredDescriptionLabel"];
  v12 = [v11 accessibilityLabel];
  if ([v11 _accessibilityViewIsVisible] && objc_msgSend(v12, "length"))
  {
    v13 = __UIAXStringForVariables();
  }
  else if ([(HUGridServiceCellAccessibility *)self _asIsSensor])
  {
    v13 = 0;
  }
  else
  {
    v14 = [(HUGridServiceCellAccessibility *)self safeValueForKey:@"serviceTextView"];
    v15 = [v14 safeValueForKey:@"descriptionText"];
    if ([v15 length] && (objc_msgSend(v15, "isEqualToString:", v4) & 1) == 0)
    {
      v13 = __UIAXStringForVariables();
      v18 = v15;
    }
    else
    {
      v22 = v4;
      char v24 = 0;
      objc_opt_class();
      v16 = [v14 safeValueForKey:@"_combinedAttributedString"];
      v17 = __UIAccessibilityCastAsClass();

      v21 = v17;
      v18 = [v17 string];

      uint64_t v4 = v22;
      if ([v18 length] && (objc_msgSend(v18, "isEqualToString:", v22) & 1) == 0)
      {
        v13 = __UIAXStringForVariables();
      }
      else
      {
        v23.receiver = self;
        v23.super_class = (Class)HUGridServiceCellAccessibility;
        v19 = [(HUGridServiceCellAccessibility *)&v23 accessibilityValue];
        v13 = __UIAXStringForVariables();

        uint64_t v4 = v22;
      }
    }
  }

  return v13;
}

- (unint64_t)accessibilityTraits
{
  v2 = [(HUGridServiceCellAccessibility *)self safeValueForKey:@"accessoryView"];
  MEMORY[0x2456509F0](@"HUCheckmarkAccessoryView");
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v2 safeBoolForKey:@"checked"]) {
    unint64_t v3 = *MEMORY[0x263F1CF38] | *MEMORY[0x263F1CEE8];
  }
  else {
    unint64_t v3 = *MEMORY[0x263F1CEE8];
  }

  return v3;
}

@end