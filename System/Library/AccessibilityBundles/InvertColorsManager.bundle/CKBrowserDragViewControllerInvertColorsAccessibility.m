@interface CKBrowserDragViewControllerInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (void)_accessibilityLoadInvertColors;
- (void)viewDidLoad;
@end

@implementation CKBrowserDragViewControllerInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CKBrowserDragViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)CKBrowserDragViewControllerInvertColorsAccessibility;
  [(CKBrowserDragViewControllerInvertColorsAccessibility *)&v3 viewDidLoad];
  [(CKBrowserDragViewControllerInvertColorsAccessibility *)self _accessibilityLoadInvertColors];
}

- (void)_accessibilityLoadInvertColors
{
  objc_super v3 = [(CKBrowserDragViewControllerInvertColorsAccessibility *)self safeUIViewForKey:@"normalDragView"];
  [v3 setAccessibilityIgnoresInvertColors:1];

  id v4 = [(CKBrowserDragViewControllerInvertColorsAccessibility *)self safeUIViewForKey:@"keyboardDragView"];
  [v4 setAccessibilityIgnoresInvertColors:1];
}

@end