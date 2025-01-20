@interface PLGlyphControlAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (CGPoint)accessibilityActivationPoint;
- (id)accessibilityPath;
- (unint64_t)accessibilityTraits;
@end

@implementation PLGlyphControlAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PLGlyphControl";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PLGlyphControl", @"_backgroundMaterialView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PLGlyphControl", @"_cornerRadius", "d", 0);
}

- (id)accessibilityPath
{
  id v3 = [(PLGlyphControlAccessibility *)self safeValueForKey:@"_backgroundMaterialView"];
  [v3 _accessibilityBounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  v12 = (void *)MEMORY[0x263F1C478];
  [(PLGlyphControlAccessibility *)self safeCGFloatForKey:@"_cornerRadius"];
  objc_msgSend(v12, "bezierPathWithRoundedRect:cornerRadius:", v5, v7, v9, v11, v13);
  v14 = (UIBezierPath *)objc_claimAutoreleasedReturnValue();
  v15 = [(PLGlyphControlAccessibility *)self safeValueForKey:@"_backgroundMaterialView"];
  v16 = UIAccessibilityConvertPathToScreenCoordinates(v14, v15);

  return v16;
}

- (CGPoint)accessibilityActivationPoint
{
  v2 = [(PLGlyphControlAccessibility *)self safeValueForKey:@"_backgroundMaterialView"];
  [v2 accessibilityActivationPoint];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.y = v8;
  result.x = v7;
  return result;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CEE8];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

@end