@interface SKStoreProductViewControllerInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (void)_accessibilityLoadInvertColors;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation SKStoreProductViewControllerInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SKStoreProductViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SKStoreProductViewControllerInvertColorsAccessibility;
  [(SKStoreProductViewControllerInvertColorsAccessibility *)&v4 viewWillAppear:a3];
  [(SKStoreProductViewControllerInvertColorsAccessibility *)self _accessibilityLoadInvertColors];
}

- (void)_accessibilityLoadInvertColors
{
  if (AXProcessIsSpringBoard())
  {
    id v4 = [(SKStoreProductViewControllerInvertColorsAccessibility *)self safeUIViewForKey:@"view"];
    v3 = [v4 layer];
    +[AXInvertColorsAppHelper toggleInvertColors:v3];
  }
}

@end