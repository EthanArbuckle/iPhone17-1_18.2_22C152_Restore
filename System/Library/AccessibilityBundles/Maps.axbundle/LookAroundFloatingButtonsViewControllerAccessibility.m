@interface LookAroundFloatingButtonsViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_axUpdateButtonsLabel;
- (void)setShowsMinimizedButton:(BOOL)a3;
@end

@implementation LookAroundFloatingButtonsViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"LookAroundFloatingButtonsViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"LookAroundFloatingButtonsViewController", @"setShowsMinimizedButton:", "v", "B", 0);
  [v3 validateClass:@"LookAroundFloatingButtonsViewController" hasInstanceVariable:@"_alternateButton" withType:"UIButton"];
  [v3 validateClass:@"LookAroundFloatingButtonsViewController" hasInstanceVariable:@"_menuButton" withType:"UIButton"];
  [v3 validateClass:@"LookAroundFloatingButtonsViewController" hasInstanceVariable:@"_showsMinimizedButton" withType:"B"];
}

- (void)_axUpdateButtonsLabel
{
  id v3 = [(LookAroundFloatingButtonsViewControllerAccessibility *)self safeValueForKey:@"_alternateButton"];
  if ([(LookAroundFloatingButtonsViewControllerAccessibility *)self safeBoolForKey:@"_showsMinimizedButton"])v4 = @"LOOK_AROUND_MINIMIZE"; {
  else
  }
    v4 = @"LOOK_AROUND_MAXIMIZE";
  v5 = AXMapsLocString(v4);
  [v3 setAccessibilityLabel:v5];

  id v7 = [(LookAroundFloatingButtonsViewControllerAccessibility *)self safeValueForKey:@"_menuButton"];
  v6 = AXMapsLocString(@"LOOK_AROUND_OPTIONS");
  [v7 setAccessibilityLabel:v6];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v3.receiver = self;
  v3.super_class = (Class)LookAroundFloatingButtonsViewControllerAccessibility;
  [(LookAroundFloatingButtonsViewControllerAccessibility *)&v3 _accessibilityLoadAccessibilityInformation];
  [(LookAroundFloatingButtonsViewControllerAccessibility *)self _axUpdateButtonsLabel];
}

- (void)setShowsMinimizedButton:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)LookAroundFloatingButtonsViewControllerAccessibility;
  [(LookAroundFloatingButtonsViewControllerAccessibility *)&v4 setShowsMinimizedButton:a3];
  [(LookAroundFloatingButtonsViewControllerAccessibility *)self _axUpdateButtonsLabel];
}

@end