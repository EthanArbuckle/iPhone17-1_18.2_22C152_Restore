@interface PUBrowsingBackgroundTileViewControllerInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)backgroundColorOverride;
- (void)_accessibilityLoadInvertColors;
@end

@implementation PUBrowsingBackgroundTileViewControllerInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PUBrowsingBackgroundTileViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)_accessibilityLoadInvertColors
{
}

- (id)backgroundColorOverride
{
  v12.receiver = self;
  v12.super_class = (Class)PUBrowsingBackgroundTileViewControllerInvertColorsAccessibility;
  v2 = [(PUBrowsingBackgroundTileViewControllerInvertColorsAccessibility *)&v12 backgroundColorOverride];
  if (!UIAccessibilityIsInvertColorsEnabled()) {
    goto LABEL_5;
  }
  if (v2)
  {
    AXColorGetLuma();
    if (v3 >= 0.5) {
      goto LABEL_5;
    }
  }
  v4 = __UIAccessibilitySafeClass();
  v5 = [v4 view];
  v6 = [v5 window];
  v7 = [v6 traitCollection];
  v8 = (char *)[v7 userInterfaceStyle];

  if (v8 == (unsigned char *)&dword_0 + 2)
  {
LABEL_5:
    id v9 = v2;
  }
  else
  {
    id v9 = +[UIColor whiteColor];
  }
  v10 = v9;

  return v10;
}

@end