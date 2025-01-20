@interface MapsAppDelegateAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_accessibilityLoadAccessibilityInformationWithKeyPath:(id)a3 retries:(unint64_t)a4;
@end

@implementation MapsAppDelegateAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MapsAppDelegate";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v3.receiver = self;
  v3.super_class = (Class)MapsAppDelegateAccessibility;
  [(MapsAppDelegateAccessibility *)&v3 _accessibilityLoadAccessibilityInformation];
  [(MapsAppDelegateAccessibility *)self _accessibilityLoadAccessibilityInformationWithKeyPath:@"chromeViewController.mapView.mapLayer" retries:8];
}

- (void)_accessibilityLoadAccessibilityInformationWithKeyPath:(id)a3 retries:(unint64_t)a4
{
  id v6 = a3;
  v7 = [(MapsAppDelegateAccessibility *)self safeValueForKeyPath:v6];
  v8 = v7;
  if (v7)
  {
    [v7 _accessibilityLoadAccessibilityInformation];
  }
  else if (a4)
  {
    id v9 = v6;
    AXPerformBlockOnMainThreadAfterDelay();
  }
}

uint64_t __94__MapsAppDelegateAccessibility__accessibilityLoadAccessibilityInformationWithKeyPath_retries___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _accessibilityLoadAccessibilityInformationWithKeyPath:*(void *)(a1 + 40) retries:*(void *)(a1 + 48) - 1];
}

@end