@interface ASCredentialProviderViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation ASCredentialProviderViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"ASCredentialProviderViewController";
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
  v7.receiver = self;
  v7.super_class = (Class)ASCredentialProviderViewControllerAccessibility;
  [(ASCredentialProviderViewControllerAccessibility *)&v7 viewDidAppear:a3];
  UIAccessibilityNotifications v4 = *MEMORY[0x263F1CE68];
  v5 = [(ASCredentialProviderViewControllerAccessibility *)self safeUIViewForKey:@"view"];
  UIAccessibilityPostNotification(v4, v5);

  v6 = [(ASCredentialProviderViewControllerAccessibility *)self safeUIViewForKey:@"view"];
  [v6 setAccessibilityViewIsModal:1];
}

@end