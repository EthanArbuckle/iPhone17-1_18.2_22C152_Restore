@interface NCNotificationListHeaderTitleViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_configureTitleLabelIfNecessary;
@end

@implementation NCNotificationListHeaderTitleViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"NCNotificationListHeaderTitleView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NCNotificationListHeaderTitleView", @"titleLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NCNotificationListHeaderTitleView", @"_configureTitleLabelIfNecessary", "v", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v4.receiver = self;
  v4.super_class = (Class)NCNotificationListHeaderTitleViewAccessibility;
  [(NCNotificationListHeaderTitleViewAccessibility *)&v4 _accessibilityLoadAccessibilityInformation];
  id v3 = [(NCNotificationListHeaderTitleViewAccessibility *)self safeValueForKey:@"titleLabel"];
  [v3 _accessibilityAddTrait:*MEMORY[0x263F1CEF8]];
}

- (void)_configureTitleLabelIfNecessary
{
  v3.receiver = self;
  v3.super_class = (Class)NCNotificationListHeaderTitleViewAccessibility;
  [(NCNotificationListHeaderTitleViewAccessibility *)&v3 _configureTitleLabelIfNecessary];
  [(NCNotificationListHeaderTitleViewAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end