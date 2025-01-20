@interface NCWidgetViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_setActiveDisplayMode:(int64_t)a3 unconditionallyNotifyingContentProvidingViewController:(BOOL)a4;
@end

@implementation NCWidgetViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_NCWidgetViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"_NCWidgetViewController", @"_setActiveDisplayMode: unconditionallyNotifyingContentProvidingViewController:", "v", "q", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"_NCWidgetViewController", @"_widgetExtensionContext", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"_NCWidgetExtensionContext", @"_activeDisplayMode", "q", 0);
}

- (void)_setActiveDisplayMode:(int64_t)a3 unconditionallyNotifyingContentProvidingViewController:(BOOL)a4
{
  BOOL v4 = a4;
  v7 = [(NCWidgetViewControllerAccessibility *)self safeValueForKey:@"_widgetExtensionContext"];
  uint64_t v8 = [v7 safeIntegerForKey:@"_activeDisplayMode"];
  v9.receiver = self;
  v9.super_class = (Class)NCWidgetViewControllerAccessibility;
  [(NCWidgetViewControllerAccessibility *)&v9 _setActiveDisplayMode:a3 unconditionallyNotifyingContentProvidingViewController:v4];
  if (v4 || v8 != a3) {
    UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
  }
}

@end