@interface TPSViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)setLoading:(BOOL)a3;
@end

@implementation TPSViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"TPSViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"TPSViewController", @"setLoading:", "v", "B", 0);
  [v3 validateClass:@"TPSViewController" hasInstanceVariable:@"_loading" withType:"B"];
}

- (void)setLoading:(BOOL)a3
{
  BOOL v3 = a3;
  int v5 = [(TPSViewControllerAccessibility *)self safeBoolForKey:@"_loading"];
  v6.receiver = self;
  v6.super_class = (Class)TPSViewControllerAccessibility;
  [(TPSViewControllerAccessibility *)&v6 setLoading:v3];
  if (v5 != v3) {
    UIAccessibilityPostNotification(*MEMORY[0x263F1CE68], 0);
  }
}

@end