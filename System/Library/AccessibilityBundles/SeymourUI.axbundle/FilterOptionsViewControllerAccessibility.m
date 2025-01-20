@interface FilterOptionsViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)updateTitleView;
@end

@implementation FilterOptionsViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SeymourUI.FilterOptionsViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SeymourUI.FilterOptionsViewController", @"updateTitleView", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SeymourUI.FilterOptionsViewController", @"subtitleLabel", "@", 0);
}

- (void)updateTitleView
{
  id v3 = [(FilterOptionsViewControllerAccessibility *)self safeValueForKey:@"subtitleLabel"];
  char v13 = 0;
  objc_opt_class();
  v4 = __UIAccessibilityCastAsClass();
  v12.receiver = self;
  v12.super_class = (Class)FilterOptionsViewControllerAccessibility;
  [(FilterOptionsViewControllerAccessibility *)&v12 updateTitleView];
  v5 = [(FilterOptionsViewControllerAccessibility *)self safeValueForKey:@"subtitleLabel"];

  char v13 = 0;
  objc_opt_class();
  v6 = __UIAccessibilityCastAsClass();
  if (v13) {
    abort();
  }
  v7 = v6;
  if (v4)
  {
    v8 = [v6 text];
    uint64_t v9 = [v8 length];

    if (v9)
    {
      UIAccessibilityNotifications v10 = *MEMORY[0x263F1CDC8];
      v11 = [v7 text];
      UIAccessibilityPostNotification(v10, v11);
    }
  }
}

@end