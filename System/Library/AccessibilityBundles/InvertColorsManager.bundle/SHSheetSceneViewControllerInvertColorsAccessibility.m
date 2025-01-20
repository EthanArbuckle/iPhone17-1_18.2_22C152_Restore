@interface SHSheetSceneViewControllerInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (void)viewWillLayoutSubviews;
@end

@implementation SHSheetSceneViewControllerInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SHSheetSceneViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)viewWillLayoutSubviews
{
  v10.receiver = self;
  v10.super_class = (Class)SHSheetSceneViewControllerInvertColorsAccessibility;
  [(SHSheetSceneViewControllerInvertColorsAccessibility *)&v10 viewWillLayoutSubviews];
  v3 = [(SHSheetSceneViewControllerInvertColorsAccessibility *)self view];
  v4 = [v3 window];
  unsigned int v5 = +[AXInvertColorsAppHelper hasInvertFilter:v4];

  if (v5)
  {
    v6 = [v3 traitCollection];
    v7 = (char *)[v6 userInterfaceStyle];

    if (v7 == (unsigned char *)&dword_0 + 1)
    {
      [v3 setAccessibilityInvertColorsIsolatedTree:1];
      int v8 = _AXSInvertColorsEnabled();
      v9 = [v3 layer];
      if (v8)
      {
        +[AXInvertColorsAppHelper applyInvertFilterToLayer:v9];
LABEL_7:

        goto LABEL_8;
      }
    }
    else
    {
      [v3 setAccessibilityInvertColorsIsolatedTree:0];
      v9 = [v3 layer];
    }
    +[AXInvertColorsAppHelper unapplyInvertFilterToLayer:v9];
    goto LABEL_7;
  }
LABEL_8:
}

@end