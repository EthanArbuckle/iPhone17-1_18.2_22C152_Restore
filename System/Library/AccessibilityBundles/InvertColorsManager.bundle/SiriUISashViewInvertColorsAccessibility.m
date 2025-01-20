@interface SiriUISashViewInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (void)_accessibilityLoadInvertColors;
- (void)layoutSubviews;
@end

@implementation SiriUISashViewInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SiriUISashView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)SiriUISashViewInvertColorsAccessibility;
  [(SiriUISashViewInvertColorsAccessibility *)&v3 layoutSubviews];
  [(SiriUISashViewInvertColorsAccessibility *)self _accessibilityLoadInvertColors];
}

- (void)_accessibilityLoadInvertColors
{
  id v2 = [(SiriUISashViewInvertColorsAccessibility *)self safeUIViewForKey:@"_imageView"];
  [v2 setAccessibilityIgnoresInvertColors:1];
}

@end