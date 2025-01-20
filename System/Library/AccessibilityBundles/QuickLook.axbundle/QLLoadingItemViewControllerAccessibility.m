@interface QLLoadingItemViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)loadViewIfNeeded;
@end

@implementation QLLoadingItemViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"QLLoadingItemViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"QLLoadingItemViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIViewController", @"loadViewIfNeeded", "v", 0);
  [v3 validateClass:@"QLLoadingItemViewController" isKindOfClass:@"UIViewController"];
  [v3 validateClass:@"QLLoadingItemViewController" hasInstanceVariable:@"_spinner" withType:"UIActivityIndicatorView"];
  [v3 validateClass:@"QLLoadingItemViewController" hasInstanceVariable:@"_loadingLabel" withType:"UILabel"];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  v2 = [(QLLoadingItemViewControllerAccessibility *)self safeValueForKey:@"_loadingLabel"];
  id v3 = [v2 accessibilityLabel];

  return v3;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v5.receiver = self;
  v5.super_class = (Class)QLLoadingItemViewControllerAccessibility;
  [(QLLoadingItemViewControllerAccessibility *)&v5 _accessibilityLoadAccessibilityInformation];
  id v3 = [(QLLoadingItemViewControllerAccessibility *)self safeValueForKey:@"_spinner"];
  [v3 setIsAccessibilityElement:0];

  v4 = [(QLLoadingItemViewControllerAccessibility *)self safeValueForKey:@"_loadingLabel"];
  [v4 setIsAccessibilityElement:0];
}

- (void)loadViewIfNeeded
{
  v3.receiver = self;
  v3.super_class = (Class)QLLoadingItemViewControllerAccessibility;
  [(QLLoadingItemViewControllerAccessibility *)&v3 loadViewIfNeeded];
  [(QLLoadingItemViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end