@interface VUICollectionViewFeaturedCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (CGRect)accessibilityFrame;
@end

@implementation VUICollectionViewFeaturedCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"VUICollectionViewFeaturedCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (CGRect)accessibilityFrame
{
  v2 = [(VUICollectionViewFeaturedCellAccessibility *)self safeUIViewForKey:@"featuredView"];
  v3 = [v2 safeUIViewForKey:@"overlayView"];

  [v3 accessibilityFrame];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v12 = v5;
  double v13 = v7;
  double v14 = v9;
  double v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

@end