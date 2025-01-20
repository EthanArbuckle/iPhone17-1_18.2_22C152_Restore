@interface PXFilterFooterViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)_accessibilitySupplementaryFooterViews;
- (id)accessibilityLabel;
@end

@implementation PXFilterFooterViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PXFilterFooterView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"PXFilterFooterView" hasInstanceVariable:@"_captionLabel" withType:"UILabel"];
  [v3 validateClass:@"PXFilterFooterView" hasInstanceVariable:@"_filterButton" withType:"UIButton"];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return (id)[(PXFilterFooterViewAccessibility *)self _accessibilityStringForLabelKeyValues:@"_captionLabel, _filterButton"];
}

- (id)_accessibilitySupplementaryFooterViews
{
  id v3 = [(PXFilterFooterViewAccessibility *)self safeValueForKey:@"_filterButton"];
  v4 = (void *)MEMORY[0x263EFF980];
  v11.receiver = self;
  v11.super_class = (Class)PXFilterFooterViewAccessibility;
  v5 = [(PXFilterFooterViewAccessibility *)&v11 _accessibilitySupplementaryFooterViews];
  v6 = objc_msgSend(v4, "axArrayWithPossiblyNilArrays:", 1, v5);
  v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    id v8 = [MEMORY[0x263EFF980] array];
  }
  v9 = v8;

  if ([v3 _accessibilityViewIsVisible]) {
    [v9 axSafelyAddObject:v3];
  }

  return v9;
}

@end