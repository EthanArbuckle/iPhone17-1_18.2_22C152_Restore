@interface MPAVRoutingViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation MPAVRoutingViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MPAVRoutingViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (void)viewDidAppear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)MPAVRoutingViewControllerAccessibility;
  [(MPAVRoutingViewControllerAccessibility *)&v3 viewDidAppear:a3];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE68], 0);
}

@end