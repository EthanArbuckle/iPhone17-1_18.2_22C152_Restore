@interface UIViewInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)_ancestorHasInvertFilterApplied;
- (BOOL)accessibilityIgnoreInvertIfDarkBackgroundColor;
- (BOOL)accessibilityIgnoresInvertColors;
- (BOOL)accessibilityInvertColorsIsolatedTree;
- (BOOL)accessibilityMaterialViewMimicsReduceTransparency;
- (BOOL)accessibilityVisualEffectHandleBackdrop;
- (void)setAccessibilityIgnoreInvertIfDarkBackgroundColor:(BOOL)a3;
- (void)setAccessibilityIgnoresInvertColors:(BOOL)a3;
- (void)setAccessibilityInvertColorsIsolatedTree:(BOOL)a3;
- (void)setAccessibilityMaterialViewMimicsReduceTransparency:(BOOL)a3;
- (void)setAccessibilityVisualEffectHandleBackdrop:(BOOL)a3;
- (void)setBackgroundColor:(id)a3;
@end

@implementation UIViewInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)accessibilityInvertColorsIsolatedTree
{
  return ___UIAccessibilityGetAssociatedBool(self, &unk_8365A);
}

- (void)setAccessibilityInvertColorsIsolatedTree:(BOOL)a3
{
}

- (BOOL)accessibilityMaterialViewMimicsReduceTransparency
{
  return ___UIAccessibilityGetAssociatedBool(self, &unk_8365B);
}

- (void)setAccessibilityMaterialViewMimicsReduceTransparency:(BOOL)a3
{
}

- (BOOL)accessibilityVisualEffectHandleBackdrop
{
  return ___UIAccessibilityGetAssociatedBool(self, &unk_8365C);
}

- (void)setAccessibilityVisualEffectHandleBackdrop:(BOOL)a3
{
}

- (BOOL)accessibilityIgnoreInvertIfDarkBackgroundColor
{
  return ___UIAccessibilityGetAssociatedBool(self, &unk_8365D);
}

- (void)setAccessibilityIgnoreInvertIfDarkBackgroundColor:(BOOL)a3
{
}

- (BOOL)accessibilityIgnoresInvertColors
{
  if ([(UIViewInvertColorsAccessibility *)self accessibilityIgnoreInvertIfDarkBackgroundColor])
  {
    v3 = [(UIViewInvertColorsAccessibility *)self backgroundColor];
    AXColorGetLuma();
    BOOL v5 = v4 < 0.5;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)UIViewInvertColorsAccessibility;
    return [(UIViewInvertColorsAccessibility *)&v7 accessibilityIgnoresInvertColors];
  }
  return v5;
}

- (BOOL)_ancestorHasInvertFilterApplied
{
  uint64_t v2 = [(UIViewInvertColorsAccessibility *)self superview];
  if (v2)
  {
    v3 = (void *)v2;
    while (1)
    {
      if ([v3 accessibilityInvertColorsIsolatedTree])
      {
        LOBYTE(v4) = 0;
        goto LABEL_10;
      }
      if ([v3 accessibilityIgnoresInvertColors]) {
        break;
      }
      uint64_t v4 = [v3 superview];

      v3 = (void *)v4;
      if (!v4) {
        goto LABEL_10;
      }
    }
    LOBYTE(v4) = 1;
LABEL_10:
  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return v4;
}

- (void)setAccessibilityIgnoresInvertColors:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)UIViewInvertColorsAccessibility;
  [(UIViewInvertColorsAccessibility *)&v4 setAccessibilityIgnoresInvertColors:a3];
  +[AXInvertColorsAppHelper toggleInvertColors:self];
}

- (void)setBackgroundColor:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)UIViewInvertColorsAccessibility;
  [(UIViewInvertColorsAccessibility *)&v4 setBackgroundColor:a3];
  +[AXInvertColorsAppHelper toggleInvertColors:self];
}

@end