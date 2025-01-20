@interface _TVListSectionViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilitySupportsSemanticContext;
- (BOOL)isAccessibilityElement;
- (unint64_t)accessibilityTraits;
@end

@implementation _TVListSectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_TVListSectionViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (BOOL)isAccessibilityElement
{
  v2 = [(_TVListSectionViewCellAccessibility *)self _accessibilityFindSubviewDescendant:&__block_literal_global_5];
  BOOL v3 = v2 == 0;

  return v3;
}

- (BOOL)_accessibilitySupportsSemanticContext
{
  return 0;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)_TVListSectionViewCellAccessibility;
  return *MEMORY[0x263F1CEF8] | [(_TVListSectionViewCellAccessibility *)&v3 accessibilityTraits];
}

@end