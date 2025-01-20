@interface UIActivityViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)accessibilityPerformEscape;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation UIActivityViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIActivityViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIViewController", @"viewDidAppear:", "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIViewController", @"viewWillDisappear:", "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIActivityViewController", @"_cancel", "v", 0);
  [v3 validateClass:@"UIActivityViewController" isKindOfClass:@"UIViewController"];
}

- (void)viewDidAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)UIActivityViewControllerAccessibility;
  [(UIActivityViewControllerAccessibility *)&v5 viewDidAppear:a3];
  v4 = [(UIActivityViewControllerAccessibility *)self safeValueForKey:@"view"];
  [v4 setAccessibilityIdentifier:@"ActivityListView"];

  UIAccessibilityPostNotification(*MEMORY[0x263F1CE68], 0);
}

- (BOOL)accessibilityPerformEscape
{
  return 1;
}

uint64_t __67__UIActivityViewControllerAccessibility_accessibilityPerformEscape__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _cancel];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)UIActivityViewControllerAccessibility;
  [(UIActivityViewControllerAccessibility *)&v3 viewWillDisappear:a3];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE68], 0);
}

@end