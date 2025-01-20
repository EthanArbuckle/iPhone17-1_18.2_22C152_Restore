@interface SBFullscreenZoomViewInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (void)_accessibilityLoadInvertColors;
- (void)layoutSubviews;
@end

@implementation SBFullscreenZoomViewInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SBFullscreenZoomView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)_accessibilityLoadInvertColors
{
  if (_AXSInvertColorsEnabled())
  {
    v3 = +[UIColor whiteColor];
    [(SBFullscreenZoomViewInvertColorsAccessibility *)self setBackgroundColor:v3];

    v4 = [(SBFullscreenZoomViewInvertColorsAccessibility *)self safeUIViewForKey:@"_contentView"];
    id v6 = v4;
    uint64_t v5 = 1;
  }
  else
  {
    v4 = [(SBFullscreenZoomViewInvertColorsAccessibility *)self safeUIViewForKey:@"_contentView"];
    id v6 = v4;
    uint64_t v5 = 0;
  }
  [v4 setHidden:v5];
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)SBFullscreenZoomViewInvertColorsAccessibility;
  [(SBFullscreenZoomViewInvertColorsAccessibility *)&v3 layoutSubviews];
  [(SBFullscreenZoomViewInvertColorsAccessibility *)self _accessibilityLoadInvertColors];
}

@end