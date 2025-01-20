@interface HintListCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation HintListCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"VideosUI.HintListCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"VideosUI.HintListCell" hasSwiftField:@"titleLabel" withSwiftType:"Optional<VUILabel>"];
  [v3 validateClass:@"VUILabel" isKindOfClass:@"UILabel"];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)HintListCellAccessibility;
  return *MEMORY[0x263F1CEE8] | [(HintListCellAccessibility *)&v3 accessibilityTraits];
}

- (id)accessibilityLabel
{
  objc_opt_class();
  objc_super v3 = [(HintListCellAccessibility *)self safeSwiftValueForKey:@"titleLabel"];
  v4 = __UIAccessibilityCastAsClass();

  v5 = [v4 accessibilityLabel];

  return v5;
}

@end