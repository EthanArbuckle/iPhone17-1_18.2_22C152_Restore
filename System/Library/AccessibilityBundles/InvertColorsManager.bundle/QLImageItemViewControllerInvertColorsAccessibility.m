@interface QLImageItemViewControllerInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (void)_accessibilityLoadInvertColors;
- (void)loadPreviewControllerWithContents:(id)a3 context:(id)a4 completionHandler:(id)a5;
- (void)previewDidAppear:(BOOL)a3;
@end

@implementation QLImageItemViewControllerInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"QLImageItemViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)loadPreviewControllerWithContents:(id)a3 context:(id)a4 completionHandler:(id)a5
{
  v6.receiver = self;
  v6.super_class = (Class)QLImageItemViewControllerInvertColorsAccessibility;
  [(QLImageItemViewControllerInvertColorsAccessibility *)&v6 loadPreviewControllerWithContents:a3 context:a4 completionHandler:a5];
  [(QLImageItemViewControllerInvertColorsAccessibility *)self _accessibilityLoadInvertColors];
}

- (void)previewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)QLImageItemViewControllerInvertColorsAccessibility;
  [(QLImageItemViewControllerInvertColorsAccessibility *)&v4 previewDidAppear:a3];
  [(QLImageItemViewControllerInvertColorsAccessibility *)self _accessibilityLoadInvertColors];
}

- (void)_accessibilityLoadInvertColors
{
  objc_opt_class();
  v3 = [(QLImageItemViewControllerInvertColorsAccessibility *)self safeValueForKey:@"_imageView"];
  objc_super v4 = __UIAccessibilityCastAsClass();

  [v4 setAccessibilityIgnoresInvertColors:1];
}

@end