@interface OBWelcomeControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation OBWelcomeControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"OBWelcomeController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"OBWelcomeController", @"viewDidAppear:", "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"OBWelcomeController", @"headerView", "@", 0);
}

- (void)viewDidAppear:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)OBWelcomeControllerAccessibility;
  [(OBWelcomeControllerAccessibility *)&v8 viewDidAppear:a3];
  UIAccessibilityNotifications v4 = *MEMORY[0x263F1CE68];
  v5 = [(OBWelcomeControllerAccessibility *)self safeValueForKey:@"headerView"];
  UIAccessibilityPostNotification(v4, v5);

  UIAccessibilityNotifications v6 = *MEMORY[0x263F812F8];
  v7 = [(OBWelcomeControllerAccessibility *)self safeValueForKey:@"headerView"];
  UIAccessibilityPostNotification(v6, v7);
}

@end