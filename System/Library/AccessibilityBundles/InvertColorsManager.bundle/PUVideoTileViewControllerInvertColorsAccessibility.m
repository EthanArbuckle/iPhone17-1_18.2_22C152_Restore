@interface PUVideoTileViewControllerInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)loadView;
@end

@implementation PUVideoTileViewControllerInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PUVideoTileViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)loadView
{
  v6.receiver = self;
  v6.super_class = (Class)PUVideoTileViewControllerInvertColorsAccessibility;
  v3 = [(PUVideoTileViewControllerInvertColorsAccessibility *)&v6 loadView];
  v4 = [(PUVideoTileViewControllerInvertColorsAccessibility *)self safeUIViewForKey:@"_placeholderImageView"];
  [v4 setAccessibilityIgnoresInvertColors:1];

  return v3;
}

@end