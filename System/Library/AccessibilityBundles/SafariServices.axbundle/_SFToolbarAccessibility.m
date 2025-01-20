@interface _SFToolbarAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityHitTestShouldFallbackToNearestChild;
- (BOOL)shouldGroupAccessibilityChildren;
- (unint64_t)accessibilityTraits;
@end

@implementation _SFToolbarAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_SFToolbar";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (BOOL)shouldGroupAccessibilityChildren
{
  v3 = [(_SFToolbarAccessibility *)self _accessibilityAncestorIsKindOf:MEMORY[0x24565E530](@"_SFNavigationBar", a2)];

  if (v3) {
    return 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)_SFToolbarAccessibility;
  return [(_SFToolbarAccessibility *)&v5 shouldGroupAccessibilityChildren];
}

- (BOOL)_accessibilityHitTestShouldFallbackToNearestChild
{
  v3 = [(_SFToolbarAccessibility *)self _accessibilityAncestorIsKindOf:MEMORY[0x24565E530](@"_SFNavigationBar", a2)];

  if (v3) {
    return 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)_SFToolbarAccessibility;
  return [(_SFToolbarAccessibility *)&v5 _accessibilityHitTestShouldFallbackToNearestChild];
}

- (unint64_t)accessibilityTraits
{
  v3 = [(_SFToolbarAccessibility *)self _accessibilityAncestorIsKindOf:MEMORY[0x24565E530](@"_SFNavigationBar", a2)];

  if (v3) {
    return *MEMORY[0x263F1CF18];
  }
  v5.receiver = self;
  v5.super_class = (Class)_SFToolbarAccessibility;
  return [(_SFToolbarAccessibility *)&v5 accessibilityTraits];
}

@end