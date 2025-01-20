@interface SUUISwooshViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)shouldGroupAccessibilityChildren;
- (double)_accessibilityAllowedGeometryOverlap;
- (void)setTitle:(id)a3;
@end

@implementation SUUISwooshViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SUUISwooshView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)setTitle:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SUUISwooshViewAccessibility;
  [(SUUISwooshViewAccessibility *)&v5 setTitle:a3];
  v4 = [(SUUISwooshViewAccessibility *)self safeValueForKey:@"_titleLabel"];
  [v4 setAccessibilityTraits:*MEMORY[0x263F1CF48] | *MEMORY[0x263F1CEF8]];
}

- (BOOL)shouldGroupAccessibilityChildren
{
  return 1;
}

- (double)_accessibilityAllowedGeometryOverlap
{
  return 0.0;
}

@end