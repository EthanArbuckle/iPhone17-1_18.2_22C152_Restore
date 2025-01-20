@interface NCNotificationSummaryExpandedHeaderViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_configureControlsViewIfNecessary;
@end

@implementation NCNotificationSummaryExpandedHeaderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"NCNotificationSummaryExpandedHeaderView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"NCNotificationSummaryExpandedHeaderView" hasInstanceVariable:@"_collapseControl" withType:"PLGlyphControl"];
  [v3 validateClass:@"NCNotificationSummaryExpandedHeaderView" hasInstanceVariable:@"_titleLabel" withType:"UILabel"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NCNotificationSummaryExpandedHeaderView", @"_configureControlsViewIfNecessary", "v", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v6.receiver = self;
  v6.super_class = (Class)NCNotificationSummaryExpandedHeaderViewAccessibility;
  [(NCNotificationSummaryExpandedHeaderViewAccessibility *)&v6 _accessibilityLoadAccessibilityInformation];
  id v3 = [(NCNotificationSummaryExpandedHeaderViewAccessibility *)self safeValueForKey:@"_collapseControl"];
  v4 = accessibilityLocalizedString(@"collapse.button");
  [v3 setAccessibilityLabel:v4];

  v5 = [(NCNotificationSummaryExpandedHeaderViewAccessibility *)self safeValueForKey:@"_titleLabel"];
  [v5 setAccessibilityTraits:*MEMORY[0x263F1CEF8]];
}

- (void)_configureControlsViewIfNecessary
{
  v3.receiver = self;
  v3.super_class = (Class)NCNotificationSummaryExpandedHeaderViewAccessibility;
  [(NCNotificationSummaryExpandedHeaderViewAccessibility *)&v3 _configureControlsViewIfNecessary];
  [(NCNotificationSummaryExpandedHeaderViewAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end