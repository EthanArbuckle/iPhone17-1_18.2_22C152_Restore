@interface BFFPaneHeaderViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BFFPaneHeaderViewAccessibility)initWithFrame:(CGRect)a3;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation BFFPaneHeaderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"BFFPaneHeaderView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"BFFPaneHeaderView" hasInstanceVariable:@"_textLabel" withType:"UILabel"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"BFFPaneHeaderView", @"initWithFrame:", "@", "{CGRect={CGPoint=dd}{CGSize=dd}}", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v6.receiver = self;
  v6.super_class = (Class)BFFPaneHeaderViewAccessibility;
  [(BFFPaneHeaderViewAccessibility *)&v6 _accessibilityLoadAccessibilityInformation];
  id v3 = [(BFFPaneHeaderViewAccessibility *)self safeValueForKey:@"_textLabel"];
  v4 = [(BFFPaneHeaderViewAccessibility *)self safeValueForKey:@"_textLabel"];
  uint64_t v5 = [v4 accessibilityTraits];
  [v3 setAccessibilityTraits:*MEMORY[0x263F1CEF8] | v5];
}

- (BFFPaneHeaderViewAccessibility)initWithFrame:(CGRect)a3
{
  v5.receiver = self;
  v5.super_class = (Class)BFFPaneHeaderViewAccessibility;
  id v3 = -[BFFPaneHeaderViewAccessibility initWithFrame:](&v5, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(BFFPaneHeaderViewAccessibility *)v3 _accessibilityLoadAccessibilityInformation];

  return v3;
}

@end