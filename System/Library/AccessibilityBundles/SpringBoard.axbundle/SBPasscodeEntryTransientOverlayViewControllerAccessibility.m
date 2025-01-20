@interface SBPasscodeEntryTransientOverlayViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_axAnnotateView;
- (void)viewDidLoad;
@end

@implementation SBPasscodeEntryTransientOverlayViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SBPasscodeEntryTransientOverlayViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (void)_axAnnotateView
{
  objc_opt_class();
  v2 = __UIAccessibilityCastAsClass();
  v3 = [v2 view];
  [v3 setAccessibilityViewIsModal:1];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v3.receiver = self;
  v3.super_class = (Class)SBPasscodeEntryTransientOverlayViewControllerAccessibility;
  [(SBPasscodeEntryTransientOverlayViewControllerAccessibility *)&v3 _accessibilityLoadAccessibilityInformation];
  [(SBPasscodeEntryTransientOverlayViewControllerAccessibility *)self _axAnnotateView];
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)SBPasscodeEntryTransientOverlayViewControllerAccessibility;
  [(SBPasscodeEntryTransientOverlayViewControllerAccessibility *)&v3 viewDidLoad];
  [(SBPasscodeEntryTransientOverlayViewControllerAccessibility *)self _axAnnotateView];
}

@end