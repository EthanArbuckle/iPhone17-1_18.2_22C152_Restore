@interface PUReviewScreenControlBarInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)accessibilityIgnoresInvertColors;
@end

@implementation PUReviewScreenControlBarInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PUReviewScreenControlBar";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)accessibilityIgnoresInvertColors
{
  v2 = [(PUReviewScreenControlBarInvertColorsAccessibility *)self backgroundColor];
  AXColorGetLuma();
  BOOL v4 = v3 < 0.5;

  return v4;
}

@end