@interface TVRUIRemoteViewControllerInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (void)_accessibilityLoadInvertColors;
- (void)viewDidLoad;
@end

@implementation TVRUIRemoteViewControllerInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"TVRUIRemoteViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)TVRUIRemoteViewControllerInvertColorsAccessibility;
  [(TVRUIRemoteViewControllerInvertColorsAccessibility *)&v3 viewDidLoad];
  [(TVRUIRemoteViewControllerInvertColorsAccessibility *)self _accessibilityLoadInvertColors];
}

- (void)_accessibilityLoadInvertColors
{
  id v2 = [(TVRUIRemoteViewControllerInvertColorsAccessibility *)self safeUIViewForKey:@"view"];
  [v2 setAccessibilityIgnoresInvertColors:1];
}

@end