@interface VTUIEnrollmentSetupIntroViewControllerOrbAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation VTUIEnrollmentSetupIntroViewControllerOrbAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"VTUIEnrollmentSetupIntroViewControllerOrb";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)VTUIEnrollmentSetupIntroViewControllerOrbAccessibility;
  [(VTUIEnrollmentSetupIntroViewControllerOrbAccessibility *)&v5 viewWillAppear:a3];
  v4 = [(VTUIEnrollmentSetupIntroViewControllerOrbAccessibility *)self safeUIViewForKey:@"view"];
  [v4 setAccessibilityViewIsModal:1];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)VTUIEnrollmentSetupIntroViewControllerOrbAccessibility;
  [(VTUIEnrollmentSetupIntroViewControllerOrbAccessibility *)&v5 viewWillAppear:a3];
  v4 = [(VTUIEnrollmentSetupIntroViewControllerOrbAccessibility *)self safeUIViewForKey:@"view"];
  [v4 setAccessibilityViewIsModal:0];
}

@end