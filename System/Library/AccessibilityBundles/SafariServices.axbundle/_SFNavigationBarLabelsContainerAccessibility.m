@interface _SFNavigationBarLabelsContainerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
@end

@implementation _SFNavigationBarLabelsContainerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_SFNavigationBarLabelsContainer";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  v2 = [(_SFNavigationBarLabelsContainerAccessibility *)self _accessibleSubviews:0];
  v3 = MEMORY[0x24565E560]();

  return v3;
}

@end