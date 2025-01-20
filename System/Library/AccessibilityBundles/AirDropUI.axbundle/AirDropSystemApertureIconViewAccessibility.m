@interface AirDropSystemApertureIconViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)accessibilityElementsHidden;
- (BOOL)isAccessibilityElement;
@end

@implementation AirDropSystemApertureIconViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"AirDropUI.AirDropSystemApertureIconView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (BOOL)accessibilityElementsHidden
{
  return 1;
}

@end