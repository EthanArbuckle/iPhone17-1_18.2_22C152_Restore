@interface SFPersonCollectionViewCellInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (void)_accessibilityLoadInvertColors;
- (void)layoutSubviews;
@end

@implementation SFPersonCollectionViewCellInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SFPersonCollectionViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)SFPersonCollectionViewCellInvertColorsAccessibility;
  [(SFPersonCollectionViewCellInvertColorsAccessibility *)&v3 layoutSubviews];
  [(SFPersonCollectionViewCellInvertColorsAccessibility *)self _accessibilityLoadInvertColors];
}

- (void)_accessibilityLoadInvertColors
{
  v2 = [(SFPersonCollectionViewCellInvertColorsAccessibility *)self safeValueForKey:@"imageView"];
  objc_super v3 = __UIAccessibilitySafeClass();

  objc_opt_class();
  v4 = __UIAccessibilityCastAsClass();
  [v4 setAccessibilityIgnoresInvertColors:1];
}

@end