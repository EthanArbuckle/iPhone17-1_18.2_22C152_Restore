@interface HULocationTableViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
@end

@implementation HULocationTableViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HULocationTableViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HULocationTableViewCell", @"titleLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HULocationTableViewCell", @"locationIcon", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  objc_opt_class();
  id v3 = [(HULocationTableViewCellAccessibility *)self safeValueForKey:@"locationIcon"];
  v4 = __UIAccessibilityCastAsClass();

  v5 = [v4 superview];
  if (v5)
  {
    v6 = accessibilityLocalizedString(@"home.locations.current");
  }
  else
  {
    v6 = 0;
  }

  v7 = [(HULocationTableViewCellAccessibility *)self safeValueForKey:@"titleLabel"];
  v10 = [v7 accessibilityLabel];
  v8 = __AXStringForVariables();

  return v8;
}

@end