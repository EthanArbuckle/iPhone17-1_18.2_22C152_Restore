@interface FMPlatterImageAndButtonGroupViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)setupSubviews;
@end

@implementation FMPlatterImageAndButtonGroupViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"FindMy.FMPlatterImageAndButtonGroupView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"FindMy.FMPlatterImageAndButtonGroupView", @"setupSubviews", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"FindMy.FMPlatterImageAndButtonGroupView", @"titleLabel", "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v4.receiver = self;
  v4.super_class = (Class)FMPlatterImageAndButtonGroupViewAccessibility;
  [(FMPlatterImageAndButtonGroupViewAccessibility *)&v4 _accessibilityLoadAccessibilityInformation];
  id v3 = [(FMPlatterImageAndButtonGroupViewAccessibility *)self safeValueForKey:@"titleLabel"];
  [v3 setAccessibilityTraits:*MEMORY[0x263F1CEF8]];
}

- (void)setupSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)FMPlatterImageAndButtonGroupViewAccessibility;
  [(FMPlatterImageAndButtonGroupViewAccessibility *)&v3 setupSubviews];
  [(FMPlatterImageAndButtonGroupViewAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end