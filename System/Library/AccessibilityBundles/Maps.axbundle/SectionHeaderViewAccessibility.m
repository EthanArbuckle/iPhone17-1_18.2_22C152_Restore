@interface SectionHeaderViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation SectionHeaderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SectionHeaderView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SectionHeaderView", @"label", "@", 0);
  [v3 validateClass:@"MKVibrantLabel" hasInstanceVariable:@"_label" withType:"UILabel"];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v5.receiver = self;
  v5.super_class = (Class)SectionHeaderViewAccessibility;
  [(SectionHeaderViewAccessibility *)&v5 _accessibilityLoadAccessibilityInformation];
  id v3 = [(SectionHeaderViewAccessibility *)self safeUIViewForKey:@"label"];
  v4 = [v3 safeUIViewForKey:@"_label"];

  [v4 setAccessibilityTraits:*MEMORY[0x263F1CEF8] | *MEMORY[0x263F1CF48]];
}

@end