@interface HUWallpaperEditingViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)viewDidLoad;
@end

@implementation HUWallpaperEditingViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HUWallpaperEditingViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HUWallpaperEditingViewController", @"scrollView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HUWallpaperEditingViewController", @"viewDidLoad", "v", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v4.receiver = self;
  v4.super_class = (Class)HUWallpaperEditingViewControllerAccessibility;
  [(HUWallpaperEditingViewControllerAccessibility *)&v4 _accessibilityLoadAccessibilityInformation];
  id v3 = [(HUWallpaperEditingViewControllerAccessibility *)self safeValueForKey:@"scrollView"];
  [v3 setAccessibilityIdentifier:AXWallpaperScrollViewIdentifier];
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)HUWallpaperEditingViewControllerAccessibility;
  [(HUWallpaperEditingViewControllerAccessibility *)&v3 viewDidLoad];
  [(HUWallpaperEditingViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end