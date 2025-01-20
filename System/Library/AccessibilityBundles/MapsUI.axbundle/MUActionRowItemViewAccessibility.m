@interface MUActionRowItemViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)_axNavigationDirectionsLabelHelper;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation MUActionRowItemViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MUActionRowItemView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MUActionRowItemView", @"titleText", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MUActionRowItemView", @"glyphName", "@", 0);
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
  id v3 = [(MUActionRowItemViewAccessibility *)self accessibilityIdentifier];
  if ([v3 isEqualToString:@"ActionRowItemTypeDirections"]) {
    [(MUActionRowItemViewAccessibility *)self _axNavigationDirectionsLabelHelper];
  }
  else {
  v4 = [(MUActionRowItemViewAccessibility *)self safeStringForKey:@"titleText"];
  }

  return v4;
}

- (id)_axNavigationDirectionsLabelHelper
{
  id v3 = [(MUActionRowItemViewAccessibility *)self safeStringForKey:@"glyphName"];
  v4 = [(MUActionRowItemViewAccessibility *)self safeStringForKey:@"titleText"];
  if ([v3 isEqualToString:@"car.fill"])
  {
    v5 = @"travel.time.driving";
  }
  else if ([v3 isEqualToString:@"figure.walk"])
  {
    v5 = @"travel.time.walking";
  }
  else if ([v3 isEqualToString:@"tram.fill"])
  {
    v5 = @"travel.time.transit";
  }
  else if ([v3 isEqualToString:@"bicycle"])
  {
    v5 = @"travel.time.bike";
  }
  else
  {
    v5 = &stru_26F6F4CD0;
  }
  if ([(__CFString *)v5 isEqualToString:&stru_26F6F4CD0])
  {
    id v6 = v4;
  }
  else
  {
    v7 = NSString;
    v8 = accessibilityLocalizedString(v5);
    objc_msgSend(v7, "localizedStringWithFormat:", v8, v4);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

@end