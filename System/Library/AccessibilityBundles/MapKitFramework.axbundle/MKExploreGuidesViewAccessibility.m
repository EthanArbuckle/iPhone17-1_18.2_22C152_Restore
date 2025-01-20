@interface MKExploreGuidesViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityElements;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation MKExploreGuidesViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MKExploreGuidesView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MKExploreGuidesView", @"titleLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MKExploreGuidesView", @"subtitleLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MKExploreGuidesView", @"button", "@", 0);
}

- (id)accessibilityElements
{
  v2 = (void *)MEMORY[0x263EFF8C0];
  id v3 = [(MKExploreGuidesViewAccessibility *)self safeValueForKey:@"button"];
  v4 = objc_msgSend(v2, "axArrayByIgnoringNilElementsWithCount:", 1, v3);

  return v4;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v9.receiver = self;
  v9.super_class = (Class)MKExploreGuidesViewAccessibility;
  [(MKExploreGuidesViewAccessibility *)&v9 _accessibilityLoadAccessibilityInformation];
  id v3 = [(MKExploreGuidesViewAccessibility *)self safeValueForKey:@"button"];
  v4 = [(MKExploreGuidesViewAccessibility *)self safeValueForKey:@"titleLabel"];
  v5 = [v4 accessibilityLabel];

  v6 = [(MKExploreGuidesViewAccessibility *)self safeValueForKey:@"subtitleLabel"];
  v7 = [v6 accessibilityLabel];

  v8 = __AXStringForVariables();
  objc_msgSend(v3, "setAccessibilityLabel:", v8, v7, @"__AXStringForVariablesSentinel");
}

@end