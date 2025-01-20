@interface VUIAccessView_tvOSAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityHeaderElements;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)layoutSubviews;
@end

@implementation VUIAccessView_tvOSAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"VUIAccessView_tvOS";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"VUIAccessView_tvOS" hasInstanceVariable:@"_titleLabel" withType:"UILabel"];
  [v3 validateClass:@"VUIAccessView_tvOS" hasInstanceVariable:@"_bodyLabel" withType:"UILabel"];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v9.receiver = self;
  v9.super_class = (Class)VUIAccessView_tvOSAccessibility;
  [(VUIAccessView_tvOSAccessibility *)&v9 _accessibilityLoadAccessibilityInformation];
  objc_opt_class();
  id v3 = [(VUIAccessView_tvOSAccessibility *)self safeValueForKey:@"_titleLabel"];
  v4 = __UIAccessibilityCastAsClass();

  uint64_t v5 = [v4 accessibilityTraits];
  uint64_t v6 = *MEMORY[0x263F1CEF8];
  [v4 setAccessibilityTraits:*MEMORY[0x263F1CEF8] | v5];
  objc_opt_class();
  v7 = [(VUIAccessView_tvOSAccessibility *)self safeValueForKey:@"_bodyLabel"];
  v8 = __UIAccessibilityCastAsClass();

  objc_msgSend(v8, "setAccessibilityTraits:", objc_msgSend(v8, "accessibilityTraits") | v6);
}

- (id)accessibilityHeaderElements
{
  id v3 = (void *)MEMORY[0x263EFF8C0];
  v4 = [(VUIAccessView_tvOSAccessibility *)self safeValueForKey:@"_titleLabel"];
  uint64_t v5 = [(VUIAccessView_tvOSAccessibility *)self safeValueForKey:@"_bodyLabel"];
  uint64_t v6 = objc_msgSend(v3, "axArrayByIgnoringNilElementsWithCount:", 2, v4, v5);

  return v6;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)VUIAccessView_tvOSAccessibility;
  [(VUIAccessView_tvOSAccessibility *)&v3 layoutSubviews];
  [(VUIAccessView_tvOSAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end