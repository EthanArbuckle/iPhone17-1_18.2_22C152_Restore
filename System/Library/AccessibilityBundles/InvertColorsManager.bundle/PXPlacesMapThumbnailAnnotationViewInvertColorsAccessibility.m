@interface PXPlacesMapThumbnailAnnotationViewInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)accessibilityIgnoresInvertColors;
@end

@implementation PXPlacesMapThumbnailAnnotationViewInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PXPlacesMapThumbnailAnnotationView";
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