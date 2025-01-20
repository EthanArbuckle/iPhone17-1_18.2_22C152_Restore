@interface EKUIEventInviteesViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)loadView;
@end

@implementation EKUIEventInviteesViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"EKUIEventInviteesViewController";
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
  v6.receiver = self;
  v6.super_class = (Class)EKUIEventInviteesViewControllerAccessibility;
  [(EKUIEventInviteesViewControllerAccessibility *)&v6 _accessibilityLoadAccessibilityInformation];
  v3 = [(EKUIEventInviteesViewControllerAccessibility *)self safeValueForKey:@"navigationItem"];
  v4 = [v3 safeValueForKey:@"rightBarButtonItem"];
  v5 = accessibilityLocalizedString(@"email.invitees");
  [v4 setAccessibilityLabel:v5];
}

- (void)loadView
{
  v3.receiver = self;
  v3.super_class = (Class)EKUIEventInviteesViewControllerAccessibility;
  [(EKUIEventInviteesViewControllerAccessibility *)&v3 loadView];
  [(EKUIEventInviteesViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end