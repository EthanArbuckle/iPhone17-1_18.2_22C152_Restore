@interface MTMaterialViewInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (void)_accessibilityLoadInvertColors;
- (void)layoutSubviews;
- (void)setAccessibilityMaterialViewMimicsReduceTransparency:(BOOL)a3;
- (void)setContentReplacedWithSnapshot:(BOOL)a3;
@end

@implementation MTMaterialViewInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MTMaterialView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)_accessibilityLoadInvertColors
{
  unsigned int v3 = 1;
  [(MTMaterialViewInvertColorsAccessibility *)self _accessibilitySetBoolValue:1 forKey:@"LoadingInvertColors"];
  BOOL IsInvertColorsEnabled = UIAccessibilityIsInvertColorsEnabled();
  if (!UIAccessibilityIsReduceTransparencyEnabled()) {
    unsigned int v3 = [(MTMaterialViewInvertColorsAccessibility *)self accessibilityMaterialViewMimicsReduceTransparency] & IsInvertColorsEnabled;
  }
  v5 = [(MTMaterialViewInvertColorsAccessibility *)self safeValueForKey:@"_materialLayer"];
  unsigned int v6 = [v5 safeBoolForKey:@"isReduceTransparencyEnabled"];

  if (v3 != v6)
  {
    LOBYTE(v7) = v3;
    BYTE1(v7) = IsInvertColorsEnabled;
    AXPerformSafeBlock();
    [(MTMaterialViewInvertColorsAccessibility *)self _accessibilitySetBoolValue:0, @"LoadingInvertColors", _NSConcreteStackBlock, 3221225472, sub_12AB0, &unk_447E8, self, v7 forKey];
  }
}

- (void)setAccessibilityMaterialViewMimicsReduceTransparency:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MTMaterialViewInvertColorsAccessibility;
  [(MTMaterialViewInvertColorsAccessibility *)&v4 setAccessibilityMaterialViewMimicsReduceTransparency:a3];
  [(MTMaterialViewInvertColorsAccessibility *)self _accessibilityLoadInvertColors];
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)MTMaterialViewInvertColorsAccessibility;
  [(MTMaterialViewInvertColorsAccessibility *)&v3 layoutSubviews];
  if (([(MTMaterialViewInvertColorsAccessibility *)self _accessibilityBoolValueForKey:@"LoadingInvertColors"] & 1) == 0)[(MTMaterialViewInvertColorsAccessibility *)self _accessibilityLoadInvertColors]; {
}
  }

- (void)setContentReplacedWithSnapshot:(BOOL)a3
{
  BOOL v3 = a3;
  char v14 = 0;
  objc_opt_class();
  v5 = __UIAccessibilityCastAsClass();
  if (AXProcessIsSpringBoard()
    && ([v5 superview],
        unsigned int v6 = objc_claimAutoreleasedReturnValue(),
        AXSafeClassFromString(),
        char isKindOfClass = objc_opt_isKindOfClass(),
        v6,
        (isKindOfClass & 1) != 0))
  {
    char v14 = 0;
    objc_opt_class();
    v8 = [v5 safeValueForKey:@"_materialLayer"];
    v9 = __UIAccessibilityCastAsClass();

    v10 = [v9 valueForKeyPath:@"filters.InvertColorsDoubleInvert"];
    BOOL v11 = v10 == 0;
  }
  else
  {
    v9 = 0;
    BOOL v11 = 1;
  }
  v13.receiver = self;
  v13.super_class = (Class)MTMaterialViewInvertColorsAccessibility;
  [(MTMaterialViewInvertColorsAccessibility *)&v13 setContentReplacedWithSnapshot:v3];
  if (!_AXSInvertColorsEnabledGlobalCached() && !v11)
  {
    v12 = [v9 filters];

    if (!v12) {
      +[AXInvertColorsAppHelper toggleInvertColors:v9 moveFilterToFront:1];
    }
  }
}

@end