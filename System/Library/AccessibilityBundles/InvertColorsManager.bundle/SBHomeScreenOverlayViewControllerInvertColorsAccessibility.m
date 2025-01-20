@interface SBHomeScreenOverlayViewControllerInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (void)_accessibilityLoadInvertColors;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation SBHomeScreenOverlayViewControllerInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SBHomeScreenOverlayViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SBHomeScreenOverlayViewControllerInvertColorsAccessibility;
  [(SBHomeScreenOverlayViewControllerInvertColorsAccessibility *)&v4 viewWillAppear:a3];
  [(SBHomeScreenOverlayViewControllerInvertColorsAccessibility *)self _accessibilityLoadInvertColors];
}

- (void)_accessibilityLoadInvertColors
{
  id v3 = [(SBHomeScreenOverlayViewControllerInvertColorsAccessibility *)self safeUIViewForKey:@"backgroundView"];
  if (UIAccessibilityIsInvertColorsEnabled())
  {
    [v3 setAccessibilityMaterialViewMimicsReduceTransparency:1];
    if (AXInvertColorsIsSystemWideDarkModeEnabled()) {
      +[UIColor darkGrayColor];
    }
    else {
    v2 = +[UIColor lightGrayColor];
    }
    [v3 setBackgroundColor:v2];
  }
  else
  {
    [v3 setBackgroundColor:0];
  }
}

@end