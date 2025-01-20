@interface SKUIGiftComposeViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)loadView;
@end

@implementation SKUIGiftComposeViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SKUIGiftComposeViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SKUIGiftComposeViewController", @"loadView", "v", 0);
  [v3 validateClass:@"SKUIGiftComposeViewController" hasInstanceVariable:@"_tableView" withType:"UITableView"];
}

- (void)loadView
{
  v4.receiver = self;
  v4.super_class = (Class)SKUIGiftComposeViewControllerAccessibility;
  [(SKUIGiftComposeViewControllerAccessibility *)&v4 loadView];
  id v3 = [(SKUIGiftComposeViewControllerAccessibility *)self safeValueForKey:@"_tableView"];
  [v3 setAccessibilityIdentifier:@"GiftTableView"];
}

@end