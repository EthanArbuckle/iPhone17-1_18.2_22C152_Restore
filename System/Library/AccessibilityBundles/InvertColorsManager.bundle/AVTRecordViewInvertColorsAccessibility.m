@interface AVTRecordViewInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)accessibilityIgnoresInvertColors;
- (id)_axGetOriginalColor;
- (void)_accessibilityLoadInvertColors;
- (void)_axSetOriginalColor:(id)a3;
@end

@implementation AVTRecordViewInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"AVTRecordView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_axGetOriginalColor
{
  return (id)___UIAccessibilityGetAssociatedObject(self, &unk_83610);
}

- (void)_axSetOriginalColor:(id)a3
{
}

- (BOOL)accessibilityIgnoresInvertColors
{
  return 1;
}

- (void)_accessibilityLoadInvertColors
{
  objc_opt_class();
  v3 = __UIAccessibilityCastAsClass();
  v4 = [v3 backgroundColor];
  v5 = +[UIColor clearColor];

  if (v4 != v5) {
    [(AVTRecordViewInvertColorsAccessibility *)self _axSetOriginalColor:v4];
  }
  if (UIAccessibilityIsInvertColorsEnabled())
  {
    uint64_t v6 = +[UIColor clearColor];
LABEL_7:
    v8 = (void *)v6;
    [v3 setBackgroundColor:v6];

    goto LABEL_8;
  }
  v7 = [(AVTRecordViewInvertColorsAccessibility *)self _axGetOriginalColor];

  if (v7)
  {
    uint64_t v6 = [(AVTRecordViewInvertColorsAccessibility *)self _axGetOriginalColor];
    goto LABEL_7;
  }
LABEL_8:
}

@end