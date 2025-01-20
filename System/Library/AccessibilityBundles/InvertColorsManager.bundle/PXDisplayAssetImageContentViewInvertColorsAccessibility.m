@interface PXDisplayAssetImageContentViewInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)accessibilityIgnoresInvertColors;
@end

@implementation PXDisplayAssetImageContentViewInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PXDisplayAssetImageContentView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)accessibilityIgnoresInvertColors
{
  if ([(PXDisplayAssetImageContentViewInvertColorsAccessibility *)self _accessibilityAncestorMatchesBlock:&stru_44A78])return 0; {
  v4.receiver = self;
  }
  v4.super_class = (Class)PXDisplayAssetImageContentViewInvertColorsAccessibility;
  return [(PXDisplayAssetImageContentViewInvertColorsAccessibility *)&v4 accessibilityIgnoresInvertColors];
}

@end