@interface AAUIAppleAccountHeaderViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (AAUIAppleAccountHeaderViewAccessibility)initWithLabelInsets:(UIEdgeInsets)a3;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation AAUIAppleAccountHeaderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"AAUIAppleAccountHeaderView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AAUIAppleAccountHeaderView", @"initWithLabelInsets:", "@", "{UIEdgeInsets=dddd}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AAUIAppleAccountHeaderView", @"imageControl", "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v8.receiver = self;
  v8.super_class = (Class)AAUIAppleAccountHeaderViewAccessibility;
  [(AAUIAppleAccountHeaderViewAccessibility *)&v8 _accessibilityLoadAccessibilityInformation];
  id v3 = [(AAUIAppleAccountHeaderViewAccessibility *)self safeValueForKey:@"imageControl"];
  [v3 setIsAccessibilityElement:1];
  v4 = accessibilityLocalizedString(@"AccountImage");
  [v3 setAccessibilityLabel:v4];

  objc_opt_class();
  v5 = [v3 safeValueForKey:@"_label"];
  v6 = __UIAccessibilityCastAsClass();

  v7 = [v6 text];
  [v3 setAccessibilityValue:v7];

  [v3 setAccessibilityRespondsToUserInteraction:1];
}

- (AAUIAppleAccountHeaderViewAccessibility)initWithLabelInsets:(UIEdgeInsets)a3
{
  v6.receiver = self;
  v6.super_class = (Class)AAUIAppleAccountHeaderViewAccessibility;
  id v3 = -[AAUIAppleAccountHeaderViewAccessibility initWithLabelInsets:](&v6, sel_initWithLabelInsets_, a3.top, a3.left, a3.bottom, a3.right);
  v4 = v3;
  if (v3) {
    [(AAUIAppleAccountHeaderViewAccessibility *)v3 _accessibilityLoadAccessibilityInformation];
  }
  return v4;
}

@end