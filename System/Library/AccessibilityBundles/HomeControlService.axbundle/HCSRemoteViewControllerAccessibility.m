@interface HCSRemoteViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)willBeginTransition:(BOOL)a3 forCompactModule:(BOOL)a4;
@end

@implementation HCSRemoteViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HCSRemoteViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HCSRemoteViewController", @"willBeginTransition:forCompactModule:", "v", "B", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HCSRemoteViewController", @"dashboardNavigationView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HUDashboardNavigationView", @"headerTitleLabel", "@", 0);
}

- (void)willBeginTransition:(BOOL)a3 forCompactModule:(BOOL)a4
{
  BOOL v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HCSRemoteViewControllerAccessibility;
  [(HCSRemoteViewControllerAccessibility *)&v9 willBeginTransition:a3 forCompactModule:a4];
  if (v4)
  {
    v6 = [(HCSRemoteViewControllerAccessibility *)self safeValueForKey:@"dashboardNavigationView"];
    v7 = [v6 safeValueForKey:@"headerTitleLabel"];

    id v8 = v7;
    AXPerformBlockOnMainThreadAfterDelay();
  }
}

void __77__HCSRemoteViewControllerAccessibility_willBeginTransition_forCompactModule___block_invoke(uint64_t a1)
{
}

@end