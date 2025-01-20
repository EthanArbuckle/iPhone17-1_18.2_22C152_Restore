@interface SBFolderControllerBackgroundViewInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)_tintColorForEffect:(unint64_t)a3;
+ (id)safeCategoryTargetClassName;
- (void)_accessibilityLoadInvertColors;
@end

@implementation SBFolderControllerBackgroundViewInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SBFolderControllerBackgroundView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)_accessibilityLoadInvertColors
{
}

+ (id)_tintColorForEffect:(unint64_t)a3
{
  v10.receiver = a1;
  v10.super_class = (Class)&OBJC_METACLASS___SBFolderControllerBackgroundViewInvertColorsAccessibility;
  v4 = objc_msgSendSuper2(&v10, "_tintColorForEffect:");
  if (UIAccessibilityIsInvertColorsEnabled())
  {
    if (a3 == 4
      && (+[AXSpringBoardServer server],
          v5 = objc_claimAutoreleasedReturnValue(),
          unsigned int v6 = [v5 isDarkModeActive],
          v5,
          v6))
    {
      uint64_t v7 = +[UIColor colorWithWhite:0.0 alpha:0.8];
    }
    else
    {
      if (!UIAccessibilityIsReduceTransparencyEnabled()) {
        goto LABEL_8;
      }
      uint64_t v7 = AXInvertColorForColorPreservingAlpha();
    }
    v8 = (void *)v7;

    v4 = v8;
  }
LABEL_8:

  return v4;
}

@end