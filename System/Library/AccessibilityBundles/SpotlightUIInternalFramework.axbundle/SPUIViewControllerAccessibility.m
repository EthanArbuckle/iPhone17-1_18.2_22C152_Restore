@interface SPUIViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)activateViewController:(id)a3 animate:(BOOL)a4;
@end

@implementation SPUIViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SPUIViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"SPUIViewController" isKindOfClass:@"UIViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SPUIViewController", @"activateViewController: animate:", "v", "@", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SPUIViewController", @"activeViewController", "@", 0);
}

- (void)activateViewController:(id)a3 animate:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(SPUIViewControllerAccessibility *)self safeValueForKey:@"activeViewController"];
  v8.receiver = self;
  v8.super_class = (Class)SPUIViewControllerAccessibility;
  [(SPUIViewControllerAccessibility *)&v8 activateViewController:v6 animate:v4];

  if (v7 != v6) {
    UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
  }
}

@end