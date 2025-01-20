@interface SiriUIContentLabelInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)accessibilityIgnoresInvertColors;
@end

@implementation SiriUIContentLabelInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SiriUIContentLabel";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)accessibilityIgnoresInvertColors
{
  objc_opt_class();
  v2 = __UIAccessibilityCastAsClass();
  v3 = [v2 textColor];

  AXColorGetLuma();
  LOBYTE(v2) = v4 > 0.5;

  return (char)v2;
}

@end