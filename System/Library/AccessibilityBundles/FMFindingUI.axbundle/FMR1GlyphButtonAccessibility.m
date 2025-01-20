@interface FMR1GlyphButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityPath;
- (unint64_t)accessibilityTraits;
@end

@implementation FMR1GlyphButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"FMFindingUI.FMR1GlyphButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (id)accessibilityPath
{
  [(FMR1GlyphButtonAccessibility *)self safeCGRectForKey:@"bounds"];
  objc_msgSend(MEMORY[0x263F1C478], "bezierPathWithOvalInRect:", 0.0, 0.0, v3, v3);
  v4 = (UIBezierPath *)objc_claimAutoreleasedReturnValue();
  v5 = UIAccessibilityConvertPathToScreenCoordinates(v4, (UIView *)self);

  return v5;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)FMR1GlyphButtonAccessibility;
  return *MEMORY[0x263F1CEE8] | [(FMR1GlyphButtonAccessibility *)&v3 accessibilityTraits];
}

@end