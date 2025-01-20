@interface _UINavigationControllerPaletteAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)shouldGroupAccessibilityChildren;
@end

@implementation _UINavigationControllerPaletteAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_UINavigationControllerPalette";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)shouldGroupAccessibilityChildren
{
  return 1;
}

@end