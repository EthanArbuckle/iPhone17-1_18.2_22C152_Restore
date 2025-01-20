@interface HUQuickControlSummaryViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
- (void)setPrimaryText:(id)a3;
- (void)setSecondaryText:(id)a3;
@end

@implementation HUQuickControlSummaryViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HUQuickControlSummaryView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HUQuickControlSummaryView", @"primaryLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HUQuickControlSummaryView", @"secondaryLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HUQuickControlSummaryView", @"iconView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HUQuickControlSummaryView", @"setPrimaryText:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HUQuickControlSummaryView", @"setSecondaryText:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HUIconView", @"iconDescriptor", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HUQuickControlSummaryView", @"primaryText", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HUQuickControlSummaryView", @"secondaryText", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  id v3 = [(HUQuickControlSummaryViewAccessibility *)self safeValueForKey:@"iconView"];
  v4 = [v3 accessibilityLabel];

  v5 = [(HUQuickControlSummaryViewAccessibility *)self safeValueForKey:@"primaryLabel"];
  v6 = [v5 accessibilityLabel];

  v7 = [v4 lowercaseString];
  v8 = [v6 lowercaseString];
  int v9 = [v7 isEqualToString:v8];

  if (v9)
  {
    id v10 = v4;
  }
  else
  {
    __UIAXStringForVariables();
    id v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11 = v10;

  return v11;
}

- (id)accessibilityValue
{
  v2 = [(HUQuickControlSummaryViewAccessibility *)self safeValueForKey:@"secondaryLabel"];
  id v3 = [v2 accessibilityLabel];

  return v3;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)HUQuickControlSummaryViewAccessibility;
  return *MEMORY[0x263F1CEF8] | [(HUQuickControlSummaryViewAccessibility *)&v3 accessibilityTraits];
}

- (void)setPrimaryText:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)HUQuickControlSummaryViewAccessibility;
  [(HUQuickControlSummaryViewAccessibility *)&v9 setPrimaryText:a3];
  v4 = NSString;
  v5 = [(HUQuickControlSummaryViewAccessibility *)self safeValueForKeyPath:@"iconView.iconDescriptor.identifier"];
  v6 = [(HUQuickControlSummaryViewAccessibility *)self safeValueForKeyPath:@"primaryText"];
  v7 = [(HUQuickControlSummaryViewAccessibility *)self safeValueForKeyPath:@"secondaryText"];
  v8 = [v4 stringWithFormat:@"%@, %@, %@", v5, v6, v7];
  [(HUQuickControlSummaryViewAccessibility *)self setAccessibilityIdentifier:v8];
}

- (void)setSecondaryText:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)HUQuickControlSummaryViewAccessibility;
  [(HUQuickControlSummaryViewAccessibility *)&v9 setSecondaryText:a3];
  v4 = NSString;
  v5 = [(HUQuickControlSummaryViewAccessibility *)self safeValueForKeyPath:@"iconView.iconDescriptor.identifier"];
  v6 = [(HUQuickControlSummaryViewAccessibility *)self safeValueForKeyPath:@"primaryText"];
  v7 = [(HUQuickControlSummaryViewAccessibility *)self safeValueForKeyPath:@"secondaryText"];
  v8 = [v4 stringWithFormat:@"%@, %@, %@", v5, v6, v7];
  [(HUQuickControlSummaryViewAccessibility *)self setAccessibilityIdentifier:v8];
}

@end