@interface CPSInlineCardViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation CPSInlineCardViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CPSInlineCardViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CPSInlineCardViewController", @"viewWillAppear:", "v", "B", 0);
  [v3 validateClass:@"CPSInlineCardViewController" isKindOfClass:@"UIViewController"];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v4.receiver = self;
  v4.super_class = (Class)CPSInlineCardViewControllerAccessibility;
  [(CPSInlineCardViewControllerAccessibility *)&v4 _accessibilityLoadAccessibilityInformation];
  id v3 = [(CPSInlineCardViewControllerAccessibility *)self safeUIViewForKey:@"view"];
  [v3 setAccessibilityViewIsModal:1];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CPSInlineCardViewControllerAccessibility;
  [(CPSInlineCardViewControllerAccessibility *)&v4 viewWillAppear:a3];
  [(CPSInlineCardViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE68], 0);
}

@end