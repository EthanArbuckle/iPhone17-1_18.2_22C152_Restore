@interface MediaControlsHeaderViewInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (MediaControlsHeaderViewInvertColorsAccessibility)initWithFrame:(CGRect)a3;
- (void)_accessibilityLoadInvertColors;
@end

@implementation MediaControlsHeaderViewInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MediaControlsHeaderView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (MediaControlsHeaderViewInvertColorsAccessibility)initWithFrame:(CGRect)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MediaControlsHeaderViewInvertColorsAccessibility;
  v3 = -[MediaControlsHeaderViewInvertColorsAccessibility initWithFrame:](&v5, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(MediaControlsHeaderViewInvertColorsAccessibility *)v3 _accessibilityLoadInvertColors];

  return v3;
}

- (void)_accessibilityLoadInvertColors
{
  id v2 = [(MediaControlsHeaderViewInvertColorsAccessibility *)self safeUIViewForKey:@"_artworkView"];
  [v2 setAccessibilityIgnoresInvertColors:1];
}

@end