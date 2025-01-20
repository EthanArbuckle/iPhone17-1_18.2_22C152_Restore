@interface HUEditLocationViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)setupCell:(id)a3 forItem:(id)a4 indexPath:(id)a5;
@end

@implementation HUEditLocationViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HUEditLocationViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HUEditLocationViewController", @"setupCell:forItem:indexPath:", "v", "@", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HUEditLocationViewController", @"homeItemManager", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HUEditLocationItemManager", @"inviteUsersItem", "@", 0);
}

- (void)setupCell:(id)a3 forItem:(id)a4 indexPath:(id)a5
{
  id v8 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HUEditLocationViewControllerAccessibility;
  id v9 = a4;
  [(HUEditLocationViewControllerAccessibility *)&v11 setupCell:v8 forItem:v9 indexPath:a5];
  v10 = [(HUEditLocationViewControllerAccessibility *)self safeValueForKeyPath:@"homeItemManager.inviteUsersItem", v11.receiver, v11.super_class];
  LODWORD(self) = [v10 isEqual:v9];

  if (self) {
    [v8 setAccessibilityTraits:*MEMORY[0x263F1CEE8]];
  }
}

@end