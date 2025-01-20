@interface PBFPosterGalleryPreviewViewInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)accessibilityIgnoresInvertColors;
@end

@implementation PBFPosterGalleryPreviewViewInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PBFPosterGalleryPreviewView";
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