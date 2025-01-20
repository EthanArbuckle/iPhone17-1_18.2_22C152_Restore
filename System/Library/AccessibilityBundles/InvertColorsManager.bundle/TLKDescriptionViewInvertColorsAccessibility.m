@interface TLKDescriptionViewInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (TLKDescriptionViewInvertColorsAccessibility)init;
- (void)_accessibilityLoadInvertColors;
@end

@implementation TLKDescriptionViewInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"TLKDescriptionView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)_accessibilityLoadInvertColors
{
  id v2 = [(TLKDescriptionViewInvertColorsAccessibility *)self safeUIViewForKey:@"imageView"];
  [v2 setAccessibilityIgnoresInvertColors:_AXSInvertColorsEnabledGlobalCached() != 0];
}

- (TLKDescriptionViewInvertColorsAccessibility)init
{
  v4.receiver = self;
  v4.super_class = (Class)TLKDescriptionViewInvertColorsAccessibility;
  id v2 = [(TLKDescriptionViewInvertColorsAccessibility *)&v4 init];
  [(TLKDescriptionViewInvertColorsAccessibility *)v2 _accessibilityLoadInvertColors];

  return v2;
}

@end