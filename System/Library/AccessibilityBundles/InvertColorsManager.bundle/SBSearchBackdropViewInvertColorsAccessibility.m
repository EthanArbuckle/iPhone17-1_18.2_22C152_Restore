@interface SBSearchBackdropViewInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (void)_accessibilityLoadInvertColors;
- (void)layoutSubviews;
@end

@implementation SBSearchBackdropViewInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SBSearchBackdropView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)_accessibilityLoadInvertColors
{
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)SBSearchBackdropViewInvertColorsAccessibility;
  [(SBSearchBackdropViewInvertColorsAccessibility *)&v3 layoutSubviews];
  [(SBSearchBackdropViewInvertColorsAccessibility *)self _accessibilityLoadInvertColors];
}

@end