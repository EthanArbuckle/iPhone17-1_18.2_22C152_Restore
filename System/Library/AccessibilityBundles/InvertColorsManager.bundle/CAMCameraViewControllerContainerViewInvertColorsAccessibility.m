@interface CAMCameraViewControllerContainerViewInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)accessibilityIgnoresInvertColors;
@end

@implementation CAMCameraViewControllerContainerViewInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CAMCameraViewControllerContainerView";
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