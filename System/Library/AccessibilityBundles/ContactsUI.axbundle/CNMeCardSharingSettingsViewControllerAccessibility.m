@interface CNMeCardSharingSettingsViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)viewDidLoad;
@end

@implementation CNMeCardSharingSettingsViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CNMeCardSharingSettingsViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"CNMeCardSharingSettingsViewController" hasInstanceVariable:@"_givenNameField" withType:"UITextField"];
  [v3 validateClass:@"CNMeCardSharingSettingsViewController" hasInstanceVariable:@"_familyNameField" withType:"UITextField"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CNMeCardSharingSettingsViewController", @"viewDidLoad", "v", 0);
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)CNMeCardSharingSettingsViewControllerAccessibility;
  [(CNMeCardSharingSettingsViewControllerAccessibility *)&v3 viewDidLoad];
  [(CNMeCardSharingSettingsViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v13.receiver = self;
  v13.super_class = (Class)CNMeCardSharingSettingsViewControllerAccessibility;
  [(CNMeCardSharingSettingsViewControllerAccessibility *)&v13 _accessibilityLoadAccessibilityInformation];
  objc_super v3 = [(CNMeCardSharingSettingsViewControllerAccessibility *)self safeUIViewForKey:@"_givenNameField"];
  objc_initWeak(&location, v3);

  id v4 = objc_loadWeakRetained(&location);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __96__CNMeCardSharingSettingsViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v10[3] = &unk_265118138;
  objc_copyWeak(&v11, &location);
  [v4 _setAccessibilityFrameBlock:v10];

  v5 = [(CNMeCardSharingSettingsViewControllerAccessibility *)self safeUIViewForKey:@"_familyNameField"];
  objc_initWeak(&from, v5);

  id v6 = objc_loadWeakRetained(&from);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __96__CNMeCardSharingSettingsViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2;
  v7[3] = &unk_265118138;
  objc_copyWeak(&v8, &from);
  [v6 _setAccessibilityFrameBlock:v7];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&from);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

double __96__CNMeCardSharingSettingsViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  id v11 = (UIView *)objc_loadWeakRetained(v1);
  v26.origin.CGFloat x = v4;
  v26.origin.CGFloat y = v6;
  v26.size.CGFloat width = v8;
  v26.size.CGFloat height = v10;
  CGRect v27 = UIAccessibilityConvertFrameToScreenCoordinates(v26, v11);
  CGFloat x = v27.origin.x;
  CGFloat y = v27.origin.y;
  CGFloat width = v27.size.width;
  CGFloat height = v27.size.height;

  AXDeviceGetMainScreenBounds();
  CGFloat v20 = x;
  CGFloat v21 = y;
  CGFloat v22 = width;
  CGFloat v23 = height;

  *(void *)&double result = (unint64_t)CGRectIntersection(*(CGRect *)&v16, *(CGRect *)&v20);
  return result;
}

double __96__CNMeCardSharingSettingsViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  id v11 = (UIView *)objc_loadWeakRetained(v1);
  v26.origin.CGFloat x = v4;
  v26.origin.CGFloat y = v6;
  v26.size.CGFloat width = v8;
  v26.size.CGFloat height = v10;
  CGRect v27 = UIAccessibilityConvertFrameToScreenCoordinates(v26, v11);
  CGFloat x = v27.origin.x;
  CGFloat y = v27.origin.y;
  CGFloat width = v27.size.width;
  CGFloat height = v27.size.height;

  AXDeviceGetMainScreenBounds();
  CGFloat v20 = x;
  CGFloat v21 = y;
  CGFloat v22 = width;
  CGFloat v23 = height;

  *(void *)&double result = (unint64_t)CGRectIntersection(*(CGRect *)&v16, *(CGRect *)&v20);
  return result;
}

@end