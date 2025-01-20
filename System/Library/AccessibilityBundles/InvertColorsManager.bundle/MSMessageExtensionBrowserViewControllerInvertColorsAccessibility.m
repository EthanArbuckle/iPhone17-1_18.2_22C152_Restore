@interface MSMessageExtensionBrowserViewControllerInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (void)_accessibilityLoadInvertColors;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation MSMessageExtensionBrowserViewControllerInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MSMessageExtensionBrowserViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)_accessibilityLoadInvertColors
{
  v3 = +[UIColor whiteColor];
  v4 = [(MSMessageExtensionBrowserViewControllerInvertColorsAccessibility *)self safeUIViewForKey:@"view"];
  BOOL IsInvertColorsEnabled = UIAccessibilityIsInvertColorsEnabled();
  v6 = [v4 backgroundColor];
  int v7 = AXColorsProbablyEqual();

  if (IsInvertColorsEnabled)
  {
    if ((v7 & 1) == 0)
    {
      v8 = [v4 backgroundColor];
      [v4 _accessibilitySetRetainedValue:v8 forKey:@"SavedColor"];
    }
    v11 = _NSConcreteStackBlock;
    uint64_t v12 = 3221225472;
    v13 = sub_1EE9C;
    v14 = &unk_447A0;
    id v9 = v4;
    id v15 = v9;
    id v16 = v3;
    +[UIView animateWithDuration:&v11 animations:0.1];
    objc_msgSend(v9, "setAccessibilityIgnoresInvertColors:", 0, v11, v12, v13, v14);
  }
  else if (v7)
  {
    v10 = [v4 _accessibilityValueForKey:@"SavedColor"];
    [v4 setBackgroundColor:v10];
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MSMessageExtensionBrowserViewControllerInvertColorsAccessibility;
  [(MSMessageExtensionBrowserViewControllerInvertColorsAccessibility *)&v4 viewWillAppear:a3];
  [(MSMessageExtensionBrowserViewControllerInvertColorsAccessibility *)self _accessibilityLoadInvertColors];
}

@end