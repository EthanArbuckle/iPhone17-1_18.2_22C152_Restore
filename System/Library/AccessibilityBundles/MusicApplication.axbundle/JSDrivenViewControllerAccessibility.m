@interface JSDrivenViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)accessibilityUpdateForHeaderItemChange;
- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidLoad;
@end

@implementation JSDrivenViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MusicApplication.JSDrivenViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MusicApplication.JSDrivenViewController", @"accessibilityContextBarButtonItem", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MusicApplication.JSDrivenViewController", @"viewDidLoad", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MusicApplication.JSDrivenViewController", @"accessibilityUpdateForHeaderItemChange", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MusicApplication.JSDrivenViewController", @"traitCollectionDidChange:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MusicApplication.JSDrivenViewController", @"preferredContentSizeDidChangeForChildContentContainer:", "v", "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v4.receiver = self;
  v4.super_class = (Class)JSDrivenViewControllerAccessibility;
  [(JSDrivenViewControllerAccessibility *)&v4 _accessibilityLoadAccessibilityInformation];
  id v3 = [(JSDrivenViewControllerAccessibility *)self safeValueForKey:@"accessibilityContextBarButtonItem"];
  [v3 _setAccessibilityLabelBlock:&__block_literal_global_9];
  [v3 _setAccessibilityTraitsBlock:&__block_literal_global_295];
}

id __81__JSDrivenViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke()
{
  return accessibilityMusicLocalizedString(@"more.button");
}

uint64_t __81__JSDrivenViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2()
{
  return *MEMORY[0x263F1CEE8];
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)JSDrivenViewControllerAccessibility;
  [(JSDrivenViewControllerAccessibility *)&v3 viewDidLoad];
  [(JSDrivenViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (void)accessibilityUpdateForHeaderItemChange
{
  v3.receiver = self;
  v3.super_class = (Class)JSDrivenViewControllerAccessibility;
  [(JSDrivenViewControllerAccessibility *)&v3 accessibilityUpdateForHeaderItemChange];
  [(JSDrivenViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (void)traitCollectionDidChange:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)JSDrivenViewControllerAccessibility;
  [(JSDrivenViewControllerAccessibility *)&v4 traitCollectionDidChange:a3];
  [(JSDrivenViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)JSDrivenViewControllerAccessibility;
  [(JSDrivenViewControllerAccessibility *)&v4 preferredContentSizeDidChangeForChildContentContainer:a3];
  [(JSDrivenViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end