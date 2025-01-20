@interface PXGPageControlAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)_axPageControl;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (int64_t)_accessibilityPageCount;
- (int64_t)_accessibilityPageIndex;
- (unint64_t)accessibilityTraits;
- (void)accessibilityDecrement;
- (void)accessibilityIncrement;
@end

@implementation PXGPageControlAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PXGPageControl";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (id)_axPageControl
{
  return (id)[(PXGPageControlAccessibility *)self safeValueForKey:@"_pageControl"];
}

- (unint64_t)accessibilityTraits
{
  v2 = [(PXGPageControlAccessibility *)self _axPageControl];
  unint64_t v3 = [v2 accessibilityTraits];

  return v3;
}

- (int64_t)_accessibilityPageCount
{
  v2 = [(PXGPageControlAccessibility *)self _axPageControl];
  int64_t v3 = [v2 _accessibilityPageCount];

  return v3;
}

- (int64_t)_accessibilityPageIndex
{
  v2 = [(PXGPageControlAccessibility *)self _axPageControl];
  int64_t v3 = [v2 _accessibilityPageIndex];

  return v3;
}

- (BOOL)isAccessibilityElement
{
  v2 = [(PXGPageControlAccessibility *)self _axPageControl];
  char v3 = [v2 isAccessibilityElement];

  return v3;
}

- (id)accessibilityLabel
{
  v2 = [(PXGPageControlAccessibility *)self _axPageControl];
  char v3 = [v2 accessibilityLabel];

  return v3;
}

- (id)accessibilityValue
{
  v2 = [(PXGPageControlAccessibility *)self _axPageControl];
  char v3 = [v2 accessibilityValue];

  return v3;
}

- (void)accessibilityIncrement
{
  id v2 = [(PXGPageControlAccessibility *)self _axPageControl];
  [v2 accessibilityIncrement];
}

- (void)accessibilityDecrement
{
  id v2 = [(PXGPageControlAccessibility *)self _axPageControl];
  [v2 accessibilityDecrement];
}

@end