@interface CAMFullscreenViewfinderInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)accessibilityIgnoresInvertColors;
@end

@implementation CAMFullscreenViewfinderInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CAMFullscreenViewfinder";
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