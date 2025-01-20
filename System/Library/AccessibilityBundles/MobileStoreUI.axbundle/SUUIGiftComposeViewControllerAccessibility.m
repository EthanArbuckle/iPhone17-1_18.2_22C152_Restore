@interface SUUIGiftComposeViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)loadView;
@end

@implementation SUUIGiftComposeViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SUUIGiftComposeViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SUUIGiftComposeViewController", @"loadView", "v", 0);
  [v3 validateClass:@"SUUIGiftComposeViewController" hasInstanceVariable:@"_tableView" withType:"UITableView"];
}

- (void)loadView
{
  v4.receiver = self;
  v4.super_class = (Class)SUUIGiftComposeViewControllerAccessibility;
  [(SUUIGiftComposeViewControllerAccessibility *)&v4 loadView];
  id v3 = [(SUUIGiftComposeViewControllerAccessibility *)self safeValueForKey:@"_tableView"];
  [v3 setAccessibilityIdentifier:@"GiftTableView"];
}

@end