@interface DocumentManagerService_DOCBadgedFittingImageViewInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)accessibilityIgnoresInvertColors;
@end

@implementation DocumentManagerService_DOCBadgedFittingImageViewInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"com_apple_DocumentManager_Service.DOCBadgedFittingImageView";
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