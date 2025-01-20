@interface RouteStepManeuverViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
@end

@implementation RouteStepManeuverViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"RouteStepManeuverView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"RouteStepManeuverView", @"primaryTextLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"RouteStepManeuverView", @"secondaryTextLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"RouteStepManeuverView", @"tertiaryTextLabel", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  id v3 = [(RouteStepManeuverViewAccessibility *)self safeUIViewForKey:@"primaryTextLabel"];
  v4 = [v3 accessibilityLabel];

  v5 = [(RouteStepManeuverViewAccessibility *)self safeUIViewForKey:@"secondaryTextLabel"];
  v6 = [v5 accessibilityLabel];

  v7 = [(RouteStepManeuverViewAccessibility *)self safeUIViewForKey:@"tertiaryTextLabel"];
  v8 = [v7 accessibilityLabel];

  v9 = __UIAXStringForVariables();

  return v9;
}

@end