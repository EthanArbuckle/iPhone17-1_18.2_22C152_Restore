@interface PRXCardBottomTrayInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (void)_accessibilityLoadInvertColors;
- (void)setImageView:(id)a3;
@end

@implementation PRXCardBottomTrayInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PRXCardBottomTray";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)_accessibilityLoadInvertColors
{
  id v2 = [(PRXCardBottomTrayInvertColorsAccessibility *)self safeUIViewForKey:@"imageView"];
  [v2 setAccessibilityIgnoresInvertColors:1];
}

- (void)setImageView:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PRXCardBottomTrayInvertColorsAccessibility;
  [(PRXCardBottomTrayInvertColorsAccessibility *)&v4 setImageView:a3];
  [(PRXCardBottomTrayInvertColorsAccessibility *)self _accessibilityLoadInvertColors];
}

@end