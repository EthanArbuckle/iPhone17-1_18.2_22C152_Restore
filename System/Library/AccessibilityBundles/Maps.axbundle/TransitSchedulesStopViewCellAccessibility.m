@interface TransitSchedulesStopViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
@end

@implementation TransitSchedulesStopViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"TransitSchedulesStopViewCell";
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

- (id)accessibilityLabel
{
  v3 = [(TransitSchedulesStopViewCellAccessibility *)self safeValueForKey:@"departureTimeColor"];
  v4 = [(TransitSchedulesStopViewCellAccessibility *)self _accessibilityTextForSubhierarchyIncludingHeaders:0 focusableItems:1 exclusions:0];
  v5 = [MEMORY[0x263F1C550] systemRedColor];

  if (v3 == v5)
  {
    v8 = AXMapKitLocString(@"DELAYED_TRANSIT");
    __UIAXStringForVariables();
    id v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v6 = v4;
  }

  return v6;
}

@end