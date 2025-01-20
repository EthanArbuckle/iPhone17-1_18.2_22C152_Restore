@interface SBAppSwitcherPeopleViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)tappedExpandCollapseForItem:(id)a3;
@end

@implementation SBAppSwitcherPeopleViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SBAppSwitcherPeopleViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBAppSwitcherPeopleViewController", @"tappedExpandCollapseForItem:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBAppSwitcherPeopleScrollView", @"expandedItemWrapper", "@", 0);
  [v3 validateClass:@"SBAppSwitcherPeopleViewController" hasInstanceVariable:@"_peopleScrollView" withType:"SBAppSwitcherPeopleScrollView"];
  [v3 validateClass:@"SBAppSwitcherPeopleScrollView" hasInstanceVariable:@"_wrappersToViews" withType:"NSDictionary"];
}

- (void)tappedExpandCollapseForItem:(id)a3
{
  id v4 = a3;
  char v16 = 0;
  v5 = [(SBAppSwitcherPeopleViewControllerAccessibility *)self safeValueForKey:@"_peopleScrollView"];
  v6 = __UIAccessibilitySafeClass();

  v7 = [v6 safeValueForKey:@"expandedItemWrapper"];
  int v8 = [v4 isEqual:v7];

  if (v8)
  {
    UIAccessibilityNotifications v9 = *MEMORY[0x263F1CDC8];
    v10 = accessibilityLocalizedString(@"people.picker.items.collapsed");
    UIAccessibilityPostNotification(v9, v10);
  }
  else
  {
    objc_opt_class();
    v11 = [(SBAppSwitcherPeopleViewControllerAccessibility *)self safeValueForKey:@"_peopleScrollView"];
    v12 = [v11 safeValueForKey:@"_wrappersToViews"];
    v13 = __UIAccessibilityCastAsClass();
    v10 = [v13 objectForKey:v4];

    v14 = [v10 _accessibilityDescendantOfType:NSClassFromString(&cfstr_Sbappswitcherp_7.isa)];
    UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], v14);
  }
  v15.receiver = self;
  v15.super_class = (Class)SBAppSwitcherPeopleViewControllerAccessibility;
  [(SBAppSwitcherPeopleViewControllerAccessibility *)&v15 tappedExpandCollapseForItem:v4];
}

@end