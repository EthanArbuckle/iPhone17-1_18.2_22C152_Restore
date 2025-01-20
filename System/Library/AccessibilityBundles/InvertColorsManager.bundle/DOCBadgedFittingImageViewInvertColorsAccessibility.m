@interface DOCBadgedFittingImageViewInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)accessibilityIgnoresInvertColors;
@end

@implementation DOCBadgedFittingImageViewInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"Files.DOCBadgedFittingImageView";
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