@interface TabControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_axTabBarItemViewForTabDocument:(id)a3;
- (void)moveTab:(id)a3 overTab:(id)a4;
@end

@implementation TabControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"TabController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"TabController", @"currentTabs", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"TabController", @"setActiveTabDocument:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"TabController", @"activeTabDocument", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"TabController", @"moveTab:overTab:", "v", "@", "@", 0);
  [v3 validateClass:@"TabDocument" hasInstanceVariable:@"_tabBarItem" withType:"TabBarItem"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"TabBarItem", @"layoutInfo", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"TabBarItemLayoutInfo", @"tabBarItemView", "@", 0);
}

- (void)moveTab:(id)a3 overTab:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(TabControllerAccessibility *)self safeArrayForKey:@"currentTabs"];
  unint64_t v9 = [v8 indexOfObject:v6];
  unint64_t v10 = [v8 indexOfObject:v7];
  v24.receiver = self;
  v24.super_class = (Class)TabControllerAccessibility;
  [(TabControllerAccessibility *)&v24 moveTab:v6 overTab:v7];
  if (v10 != 0x7FFFFFFFFFFFFFFFLL && v9 != 0x7FFFFFFFFFFFFFFFLL && v9 != v10)
  {
    v13 = @"moved.after.tab";
    if (v9 > v10) {
      v13 = @"moved.before.tab";
    }
    v14 = v13;
    v15 = [v6 safeValueForKey:@"title"];
    v16 = [v7 safeValueForKey:@"title"];
    if (![v16 length])
    {
      v17 = (void *)MEMORY[0x263F08A30];
      v18 = [NSNumber numberWithUnsignedInteger:v10 + 1];
      v19 = [v17 localizedStringFromNumber:v18 numberStyle:6];

      v20 = accessibilityLocalizedString(@"tab.position");
      uint64_t v21 = AXCFormattedString();

      v16 = (void *)v21;
    }
    v22 = accessibilityLocalizedString(v14);
    v23 = AXCFormattedString();

    LODWORD(v22) = *MEMORY[0x263F1CDC8];
    UIAccessibilityPostNotification(*MEMORY[0x263F1CDC8], v23);
    UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
    UIAccessibilityPostNotification((UIAccessibilityNotifications)v22, (id)*MEMORY[0x263F21980]);
  }
}

- (id)_axTabBarItemViewForTabDocument:(id)a3
{
  if (a3)
  {
    id v3 = [a3 safeValueForKey:@"_tabBarItem"];
    v4 = [v3 safeValueForKey:@"layoutInfo"];
    v5 = [v4 safeValueForKey:@"tabBarItemView"];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

@end