@interface PUGridRenderedStripInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)accessibilityIgnoresInvertColors;
@end

@implementation PUGridRenderedStripInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PUGridRenderedStrip";
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