@interface MKPlacePhotosViewControllerInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (void)_accessibilityLoadInvertColors;
- (void)_createImageViews;
@end

@implementation MKPlacePhotosViewControllerInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MKPlacePhotosViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)_accessibilityLoadInvertColors
{
  id v2 = [(MKPlacePhotosViewControllerInvertColorsAccessibility *)self safeArrayForKey:@"_photoViews"];
  [v2 enumerateObjectsUsingBlock:&stru_44750];
}

- (void)_createImageViews
{
  v3.receiver = self;
  v3.super_class = (Class)MKPlacePhotosViewControllerInvertColorsAccessibility;
  [(MKPlacePhotosViewControllerInvertColorsAccessibility *)&v3 _createImageViews];
  [(MKPlacePhotosViewControllerInvertColorsAccessibility *)self _accessibilityLoadInvertColors];
}

@end