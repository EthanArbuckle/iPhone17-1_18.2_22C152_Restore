@interface PKCompactNavigationContainerControllerInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)dimmingColor;
+ (id)safeCategoryTargetClassName;
@end

@implementation PKCompactNavigationContainerControllerInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PKCompactNavigationContainerController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (id)dimmingColor
{
  v10.receiver = a1;
  v10.super_class = (Class)&OBJC_METACLASS___PKCompactNavigationContainerControllerInvertColorsAccessibility;
  v2 = objc_msgSendSuper2(&v10, "dimmingColor");
  if (!UIAccessibilityIsInvertColorsEnabled()) {
    goto LABEL_4;
  }
  v3 = AXUIApplicationWindows();
  v4 = [v3 firstObject];
  v5 = [v4 traitCollection];
  v6 = (char *)[v5 userInterfaceStyle];

  if (v6 == (unsigned char *)&dword_0 + 2)
  {
    v7 = +[UIColor whiteColor];
    id v8 = [v7 colorWithAlphaComponent:0.75];
  }
  else
  {
LABEL_4:
    id v8 = v2;
  }

  return v8;
}

@end