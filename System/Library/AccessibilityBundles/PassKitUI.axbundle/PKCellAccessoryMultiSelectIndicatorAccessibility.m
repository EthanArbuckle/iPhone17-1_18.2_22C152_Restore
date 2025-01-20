@interface PKCellAccessoryMultiSelectIndicatorAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (unint64_t)accessibilityTraits;
@end

@implementation PKCellAccessoryMultiSelectIndicatorAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PKCellAccessoryMultiSelectIndicator";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (unint64_t)accessibilityTraits
{
  objc_opt_class();
  v3 = [(PKCellAccessoryMultiSelectIndicatorAccessibility *)self safeValueForKey:@"_imageView"];
  v4 = __UIAccessibilityCastAsClass();

  v5 = [v4 image];
  v6 = [v5 accessibilityIdentifier];

  int v7 = [v6 isEqualToString:@"checkmark.circle.fill"];
  uint64_t v8 = *MEMORY[0x263F1CF38];
  if (!v7) {
    uint64_t v8 = 0;
  }
  unint64_t v9 = *MEMORY[0x263F1CEE8] | v8;

  return v9;
}

@end