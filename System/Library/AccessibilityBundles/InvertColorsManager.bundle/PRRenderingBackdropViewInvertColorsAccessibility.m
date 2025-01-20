@interface PRRenderingBackdropViewInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)accessibilityIgnoresInvertColors;
@end

@implementation PRRenderingBackdropViewInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PRRenderingBackdropView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)accessibilityIgnoresInvertColors
{
  return 1;
}

@end