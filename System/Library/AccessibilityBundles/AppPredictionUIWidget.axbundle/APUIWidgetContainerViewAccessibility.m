@interface APUIWidgetContainerViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
@end

@implementation APUIWidgetContainerViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"APUIWidgetContainerView";
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
  return 1;
}

- (id)accessibilityLabel
{
  objc_opt_class();
  v3 = [(APUIWidgetContainerViewAccessibility *)self safeUIViewForKey:@"_stackView"];
  v4 = __UIAccessibilityCastAsClass();

  v5 = [v4 _accessibilityFindSubviewDescendantsPassingTest:&__block_literal_global_0];
  v6 = AXLabelForElements();

  return v6;
}

uint64_t __58__APUIWidgetContainerViewAccessibility_accessibilityLabel__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

@end