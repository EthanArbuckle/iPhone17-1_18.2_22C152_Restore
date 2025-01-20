@interface NCNotificationAppSectionListHeaderViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation NCNotificationAppSectionListHeaderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"NCNotificationAppSectionListHeaderView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v4.receiver = self;
  v4.super_class = (Class)NCNotificationAppSectionListHeaderViewAccessibility;
  [(NCNotificationAppSectionListHeaderViewAccessibility *)&v4 _accessibilityLoadAccessibilityInformation];
  v3 = [(NCNotificationAppSectionListHeaderViewAccessibility *)self safeValueForKey:@"_titleLabel"];
  [v3 setAccessibilityTraits:*MEMORY[0x263F1CEF8]];
}

@end