@interface ModalCardHeaderViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_customInit;
@end

@implementation ModalCardHeaderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"ModalCardHeaderView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ModalCardHeaderView", @"_customInit", "v", 0);
  [v3 validateClass:@"ModalCardHeaderView" hasInstanceVariable:@"_titleLabel" withType:"UILabel"];
}

- (void)_customInit
{
  v3.receiver = self;
  v3.super_class = (Class)ModalCardHeaderViewAccessibility;
  [(ModalCardHeaderViewAccessibility *)&v3 _customInit];
  [(ModalCardHeaderViewAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v4.receiver = self;
  v4.super_class = (Class)ModalCardHeaderViewAccessibility;
  [(ModalCardHeaderViewAccessibility *)&v4 _accessibilityLoadAccessibilityInformation];
  objc_super v3 = [(ModalCardHeaderViewAccessibility *)self safeValueForKey:@"_titleLabel"];
  [v3 setAccessibilityTraits:*MEMORY[0x263F1CEF8]];
}

@end