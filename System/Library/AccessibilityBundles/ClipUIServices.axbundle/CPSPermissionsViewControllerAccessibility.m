@interface CPSPermissionsViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_axVisualEffectContentView;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)viewDidLoad;
@end

@implementation CPSPermissionsViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CPSPermissionsViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"CPSPermissionsViewController" isKindOfClass:@"UIViewController"];
  [v3 validateClass:@"CPSPermissionsViewController" hasInstanceVariable:@"_notificationItemView" withType:"CPSPermissionItemView"];
  [v3 validateClass:@"CPSPermissionsViewController" hasInstanceVariable:@"_locationConfirmationItemView" withType:"CPSPermissionItemView"];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v9.receiver = self;
  v9.super_class = (Class)CPSPermissionsViewControllerAccessibility;
  [(CPSPermissionsViewControllerAccessibility *)&v9 _accessibilityLoadAccessibilityInformation];
  id v3 = [(CPSPermissionsViewControllerAccessibility *)self safeUIViewForKey:@"view"];
  v4 = [(CPSPermissionsViewControllerAccessibility *)self safeValueForKey:@"_notificationItemView"];
  v5 = [(CPSPermissionsViewControllerAccessibility *)self safeValueForKey:@"_locationConfirmationItemView"];
  v6 = [(CPSPermissionsViewControllerAccessibility *)self _axVisualEffectContentView];
  v7 = [v6 subviews];
  v8 = (void *)[v7 mutableCopy];

  [v8 axSafelyAddObject:v5];
  [v8 axSafelyAddObject:v4];
  [v3 setAccessibilityElements:v8];
}

- (id)_axVisualEffectContentView
{
  v2 = [(CPSPermissionsViewControllerAccessibility *)self safeUIViewForKey:@"view"];
  id v3 = [v2 _accessibilityFindSubviewDescendant:&__block_literal_global_0];

  v4 = [v3 contentView];

  return v4;
}

uint64_t __71__CPSPermissionsViewControllerAccessibility__axVisualEffectContentView__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)CPSPermissionsViewControllerAccessibility;
  [(CPSPermissionsViewControllerAccessibility *)&v3 viewDidLoad];
  [(CPSPermissionsViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end