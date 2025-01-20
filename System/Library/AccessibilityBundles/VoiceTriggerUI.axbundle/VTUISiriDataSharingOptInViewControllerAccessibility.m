@interface VTUISiriDataSharingOptInViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation VTUISiriDataSharingOptInViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"VTUISiriDataSharingOptInViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v4.receiver = self;
  v4.super_class = (Class)VTUISiriDataSharingOptInViewControllerAccessibility;
  [(VTUISiriDataSharingOptInViewControllerAccessibility *)&v4 _accessibilityLoadAccessibilityInformation];
  v3 = [(VTUISiriDataSharingOptInViewControllerAccessibility *)self safeUIViewForKey:@"view"];
  [v3 setAccessibilityViewIsModal:1];
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)VTUISiriDataSharingOptInViewControllerAccessibility;
  [(VTUISiriDataSharingOptInViewControllerAccessibility *)&v5 viewWillAppear:a3];
  objc_super v4 = [(VTUISiriDataSharingOptInViewControllerAccessibility *)self safeUIViewForKey:@"view"];
  [v4 setAccessibilityViewIsModal:1];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)VTUISiriDataSharingOptInViewControllerAccessibility;
  [(VTUISiriDataSharingOptInViewControllerAccessibility *)&v5 viewWillAppear:a3];
  objc_super v4 = [(VTUISiriDataSharingOptInViewControllerAccessibility *)self safeUIViewForKey:@"view"];
  [v4 setAccessibilityViewIsModal:0];
}

@end