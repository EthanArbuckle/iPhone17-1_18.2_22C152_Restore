@interface _UIContextMenuUIControllerInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (void)_accessibilityLoadInvertColors;
@end

@implementation _UIContextMenuUIControllerInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_UIContextMenuUIController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)_accessibilityLoadInvertColors
{
  id v2 = [(_UIContextMenuUIControllerInvertColorsAccessibility *)self safeUIViewForKey:@"_backgroundEffectView"];
  [v2 setAccessibilityIgnoresInvertColors:1];
}

@end