@interface ParagraphViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
@end

@implementation ParagraphViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HealthArticlesUI.ParagraphView";
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
  v2 = [(ParagraphViewAccessibility *)self _accessibilityFindSubviewDescendant:&__block_literal_global];
  v3 = [v2 accessibilityValue];

  return v3;
}

uint64_t __48__ParagraphViewAccessibility_accessibilityLabel__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

@end