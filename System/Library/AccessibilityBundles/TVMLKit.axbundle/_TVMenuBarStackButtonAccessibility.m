@interface _TVMenuBarStackButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (_NSRange)accessibilityRowRange;
- (unint64_t)accessibilityTraits;
@end

@implementation _TVMenuBarStackButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_TVMenuBarStackButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (_NSRange)accessibilityRowRange
{
  objc_opt_class();
  v3 = [(_TVMenuBarStackButtonAccessibility *)self _accessibilityAncestorIsKindOf:NSClassFromString(&cfstr_Tvmenubarstack_1.isa)];
  v4 = __UIAccessibilityCastAsClass();

  v5 = [v4 subviews];
  uint64_t v6 = [v5 indexOfObject:self];
  v7 = [v4 subviews];
  uint64_t v8 = [v7 count];

  NSUInteger v9 = v6;
  NSUInteger v10 = v8;
  result.length = v10;
  result.location = v9;
  return result;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)_TVMenuBarStackButtonAccessibility;
  return *MEMORY[0x263F813F8] | [(_TVMenuBarStackButtonAccessibility *)&v3 accessibilityTraits];
}

@end