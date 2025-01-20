@interface SBRemoteTransientOverlayHostViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (SBRemoteTransientOverlayHostViewControllerAccessibility)initWithNibName:(id)a3 bundle:(id)a4;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)viewWillLayoutSubviews;
@end

@implementation SBRemoteTransientOverlayHostViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SBRemoteTransientOverlayHostViewController";
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
  v5.receiver = self;
  v5.super_class = (Class)SBRemoteTransientOverlayHostViewControllerAccessibility;
  [(SBRemoteTransientOverlayHostViewControllerAccessibility *)&v5 _accessibilityLoadAccessibilityInformation];
  v3 = [(SBRemoteTransientOverlayHostViewControllerAccessibility *)self safeUIViewForKey:@"viewIfLoaded"];
  v4 = [v3 window];
  [v4 setAccessibilityViewIsModal:1];
}

- (SBRemoteTransientOverlayHostViewControllerAccessibility)initWithNibName:(id)a3 bundle:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)SBRemoteTransientOverlayHostViewControllerAccessibility;
  v4 = [(SBRemoteTransientOverlayHostViewControllerAccessibility *)&v6 initWithNibName:a3 bundle:a4];
  [(SBRemoteTransientOverlayHostViewControllerAccessibility *)v4 _accessibilityLoadAccessibilityInformation];

  return v4;
}

- (void)viewWillLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)SBRemoteTransientOverlayHostViewControllerAccessibility;
  [(SBRemoteTransientOverlayHostViewControllerAccessibility *)&v3 viewWillLayoutSubviews];
  [(SBRemoteTransientOverlayHostViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end