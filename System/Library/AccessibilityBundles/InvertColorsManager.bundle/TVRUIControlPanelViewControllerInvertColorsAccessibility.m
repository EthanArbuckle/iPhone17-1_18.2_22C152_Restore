@interface TVRUIControlPanelViewControllerInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (void)_accessibilityLoadInvertColors;
- (void)viewDidLoad;
@end

@implementation TVRUIControlPanelViewControllerInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"TVRUIControlPanelViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)TVRUIControlPanelViewControllerInvertColorsAccessibility;
  [(TVRUIControlPanelViewControllerInvertColorsAccessibility *)&v3 viewDidLoad];
  [(TVRUIControlPanelViewControllerInvertColorsAccessibility *)self _accessibilityLoadInvertColors];
}

- (void)_accessibilityLoadInvertColors
{
  id v2 = [(TVRUIControlPanelViewControllerInvertColorsAccessibility *)self safeUIViewForKey:@"view"];
  [v2 setAccessibilityIgnoresInvertColors:1];
}

@end