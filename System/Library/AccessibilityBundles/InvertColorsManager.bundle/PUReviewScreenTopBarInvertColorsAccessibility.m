@interface PUReviewScreenTopBarInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)accessibilityIgnoresInvertColors;
@end

@implementation PUReviewScreenTopBarInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PUReviewScreenTopBar";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)accessibilityIgnoresInvertColors
{
  v2 = [(PUReviewScreenTopBarInvertColorsAccessibility *)self backgroundColor];
  AXColorGetLuma();
  BOOL v4 = v3 < 0.5;

  return v4;
}

@end