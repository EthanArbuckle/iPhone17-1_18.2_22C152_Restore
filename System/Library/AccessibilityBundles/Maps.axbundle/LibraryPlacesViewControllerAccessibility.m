@interface LibraryPlacesViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)viewDidLoad;
@end

@implementation LibraryPlacesViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"Maps.LibraryPlacesViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"Maps.LibraryPlacesViewController", @"viewDidLoad", "v", 0);
  [v3 validateClass:@"Maps.LibraryPlacesViewController" hasSwiftField:@"$__lazy_storage_$_titleLabelButton" withSwiftType:"Optional<UIBarButtonItem>"];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  id v3 = [(LibraryPlacesViewControllerAccessibility *)self safeSwiftValueForKey:@"$__lazy_storage_$_titleLabelButton"];
  [v3 setAccessibilityTraits:*MEMORY[0x263F1CEF8]];
  v4.receiver = self;
  v4.super_class = (Class)LibraryPlacesViewControllerAccessibility;
  [(LibraryPlacesViewControllerAccessibility *)&v4 _accessibilityLoadAccessibilityInformation];
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)LibraryPlacesViewControllerAccessibility;
  [(LibraryPlacesViewControllerAccessibility *)&v3 viewDidLoad];
  [(LibraryPlacesViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end