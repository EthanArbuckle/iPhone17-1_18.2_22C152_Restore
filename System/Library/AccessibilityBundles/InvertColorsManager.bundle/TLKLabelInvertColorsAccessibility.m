@interface TLKLabelInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (TLKLabelInvertColorsAccessibility)initWithProminence:(unint64_t)a3;
- (void)_accessibilityLoadInvertColors;
@end

@implementation TLKLabelInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"TLKLabel";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)_accessibilityLoadInvertColors
{
  if (_AXSInvertColorsEnabledGlobalCached()) {
    AXPerformSafeBlock();
  }
}

- (TLKLabelInvertColorsAccessibility)initWithProminence:(unint64_t)a3
{
  v6.receiver = self;
  v6.super_class = (Class)TLKLabelInvertColorsAccessibility;
  v3 = [(TLKLabelInvertColorsAccessibility *)&v6 initWithProminence:a3];
  v4 = v3;
  if (v3) {
    [(TLKLabelInvertColorsAccessibility *)v3 _accessibilityLoadInvertColors];
  }

  return v4;
}

@end