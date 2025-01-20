@interface UIColorPickerViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)viewWillLayoutSubviews;
@end

@implementation UIColorPickerViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIColorPickerViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  v6 = location;
  id obj = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = @"UITransitionView";
  objc_msgSend(location[0], "validateClass:");
  [location[0] validateClass:@"UITransitionView" isKindOfClass:@"UIView"];
  v4 = @"UIColorPickerViewController";
  objc_msgSend(location[0], "validateClass:isKindOfClass:");
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"UIColorPickerViewController", @"viewWillLayoutSubviews", "v", 0);
  objc_storeStrong(v6, obj);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v7 = self;
  SEL v6 = a2;
  v5.receiver = self;
  v5.super_class = (Class)UIColorPickerViewControllerAccessibility;
  [(UIColorPickerViewControllerAccessibility *)&v5 _accessibilityLoadAccessibilityInformation];
  Class v4 = NSClassFromString(&cfstr_Uitransitionvi.isa);
  id v2 = (id)[(UIColorPickerViewControllerAccessibility *)v7 safeUIViewForKey:@"view"];
  id v3 = (id)[v2 _accessibilityAncestorIsKindOf:v4];

  [v3 setAccessibilityIdentifier:@"UIColorPickerView"];
  objc_storeStrong(&v3, 0);
}

- (void)viewWillLayoutSubviews
{
  Class v4 = self;
  SEL v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)UIColorPickerViewControllerAccessibility;
  [(UIColorPickerViewControllerAccessibility *)&v2 viewWillLayoutSubviews];
  [(UIColorPickerViewControllerAccessibility *)v4 _accessibilityLoadAccessibilityInformation];
}

@end