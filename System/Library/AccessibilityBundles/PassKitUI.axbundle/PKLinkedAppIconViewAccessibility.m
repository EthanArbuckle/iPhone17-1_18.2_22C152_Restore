@interface PKLinkedAppIconViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)didMoveToWindow;
- (void)linkedApplicationDidChangeState:(id)a3;
@end

@implementation PKLinkedAppIconViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PKLinkedAppIconView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"PKLinkedAppIconView" hasInstanceVariable:@"_iconButton" withType:"WLEasyToHitCustomButton"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PKLinkedAppIconView", @"linkedApplication", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PKLinkedAppIconView", @"linkedApplicationDidChangeState:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PKLinkedApplication", @"displayName", "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v9.receiver = self;
  v9.super_class = (Class)PKLinkedAppIconViewAccessibility;
  [(PKLinkedAppIconViewAccessibility *)&v9 _accessibilityLoadAccessibilityInformation];
  id v3 = [(PKLinkedAppIconViewAccessibility *)self safeValueForKey:@"_iconButton"];
  v4 = [(PKLinkedAppIconViewAccessibility *)self safeValueForKey:@"linkedApplication"];
  v5 = __UIAccessibilitySafeClass();

  objc_opt_class();
  v6 = [v5 safeValueForKey:@"displayName"];
  v7 = __UIAccessibilityCastAsClass();

  [v3 setAccessibilityLabel:v7];
  v8 = accessibilityLocalizedString(@"passbook.app.hint.open");
  [v3 setAccessibilityHint:v8];
}

- (void)linkedApplicationDidChangeState:(id)a3
{
  id v4 = a3;
  [(PKLinkedAppIconViewAccessibility *)self _accessibilityLoadAccessibilityInformation];
  v5.receiver = self;
  v5.super_class = (Class)PKLinkedAppIconViewAccessibility;
  [(PKLinkedAppIconViewAccessibility *)&v5 linkedApplicationDidChangeState:v4];
}

- (void)didMoveToWindow
{
  [(PKLinkedAppIconViewAccessibility *)self _accessibilityLoadAccessibilityInformation];
  v3.receiver = self;
  v3.super_class = (Class)PKLinkedAppIconViewAccessibility;
  [(PKLinkedAppIconViewAccessibility *)&v3 didMoveToWindow];
}

@end