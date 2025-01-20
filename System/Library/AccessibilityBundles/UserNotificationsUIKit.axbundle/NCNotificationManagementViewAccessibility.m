@interface NCNotificationManagementViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_configureTitleIfNeccessary:(id)a3;
@end

@implementation NCNotificationManagementViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"NCNotificationManagementView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"NCNotificationManagementView" hasInstanceVariable:@"_titleLabel" withType:"UILabel"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NCNotificationManagementView", @"_configureTitleIfNeccessary:", "v", "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v4.receiver = self;
  v4.super_class = (Class)NCNotificationManagementViewAccessibility;
  [(NCNotificationManagementViewAccessibility *)&v4 _accessibilityLoadAccessibilityInformation];
  id v3 = [(NCNotificationManagementViewAccessibility *)self safeValueForKey:@"_titleLabel"];
  [v3 _accessibilityAddTrait:*MEMORY[0x263F1CEF8]];
}

- (void)_configureTitleIfNeccessary:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)NCNotificationManagementViewAccessibility;
  [(NCNotificationManagementViewAccessibility *)&v4 _configureTitleIfNeccessary:a3];
  [(NCNotificationManagementViewAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end