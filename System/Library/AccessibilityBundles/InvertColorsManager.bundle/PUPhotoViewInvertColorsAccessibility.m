@interface PUPhotoViewInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)accessibilityIgnoresInvertColors;
- (void)_accessibilityLoadInvertColors;
- (void)layoutSubviews;
@end

@implementation PUPhotoViewInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PUPhotoView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)accessibilityIgnoresInvertColors
{
  return 1;
}

- (void)_accessibilityLoadInvertColors
{
  v2 = [(PUPhotoViewInvertColorsAccessibility *)self safeValueForKey:@"_contentHelper"];
  if (UIAccessibilityIsInvertColorsEnabled()) {
    +[UIColor blackColor];
  }
  else {
    +[UIColor safeValueForKey:@"_systemBackgroundColor"];
  }
  v6 = v5 = v2;
  id v3 = v6;
  id v4 = v2;
  AXPerformSafeBlock();
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)PUPhotoViewInvertColorsAccessibility;
  [(PUPhotoViewInvertColorsAccessibility *)&v3 layoutSubviews];
  [(PUPhotoViewInvertColorsAccessibility *)self _accessibilityLoadInvertColors];
}

@end