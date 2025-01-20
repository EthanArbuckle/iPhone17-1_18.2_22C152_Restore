@interface _TVSeparatorViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)layoutSubviews;
@end

@implementation _TVSeparatorViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_TVSeparatorView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v4.receiver = self;
  v4.super_class = (Class)_TVSeparatorViewAccessibility;
  [(_TVSeparatorViewAccessibility *)&v4 _accessibilityLoadAccessibilityInformation];
  v3 = [(_TVSeparatorViewAccessibility *)self _accessibilityAncestorIsKindOf:NSClassFromString(&cfstr_Tvlistviewcell_0.isa)];
  [v3 setAccessibilityIdentifier:0];
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)_TVSeparatorViewAccessibility;
  [(_TVSeparatorViewAccessibility *)&v3 layoutSubviews];
  [(_TVSeparatorViewAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end