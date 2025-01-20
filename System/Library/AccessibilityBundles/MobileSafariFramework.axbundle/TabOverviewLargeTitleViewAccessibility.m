@interface TabOverviewLargeTitleViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation TabOverviewLargeTitleViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SFTabOverviewLargeTitleView";
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
  v5.receiver = self;
  v5.super_class = (Class)TabOverviewLargeTitleViewAccessibility;
  [(TabOverviewLargeTitleViewAccessibility *)&v5 _accessibilityLoadAccessibilityInformation];
  v3 = [(TabOverviewLargeTitleViewAccessibility *)self safeSwiftValueForKey:@"collaborationButtonWrapper"];
  v4 = accessibilityMobileSafariLocalizedString(@"collaborate");
  [v3 setAccessibilityLabel:v4];

  [v3 setAccessibilityIdentifier:@"Collaborate"];
}

@end