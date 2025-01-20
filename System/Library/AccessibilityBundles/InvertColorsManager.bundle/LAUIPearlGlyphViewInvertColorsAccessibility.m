@interface LAUIPearlGlyphViewInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)accessibilityIgnoresInvertColors;
@end

@implementation LAUIPearlGlyphViewInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"LAUIPearlGlyphView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)accessibilityIgnoresInvertColors
{
  return 1;
}

@end