@interface _TVLabelAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
- (unint64_t)_accessibilityExplorerElementReadPriority;
- (unint64_t)accessibilityTraits;
@end

@implementation _TVLabelAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_TVLabel";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (id)accessibilityLabel
{
  v3 = [(_TVLabelAccessibility *)self accessibilityUserDefinedLabel];
  v7.receiver = self;
  v7.super_class = (Class)_TVLabelAccessibility;
  v4 = [(_TVLabelAccessibility *)&v7 accessibilityLabel];
  v5 = [MEMORY[0x263F22278] textByReconcilingClientText:v3 withServerText:v4];

  return v5;
}

- (unint64_t)_accessibilityExplorerElementReadPriority
{
  v3 = [(_TVLabelAccessibility *)self _atvaccessibilityITMLClass];
  char v4 = [v3 isEqualToString:@"banner-product-availability-title"];

  if (v4) {
    return 1;
  }
  v6.receiver = self;
  v6.super_class = (Class)_TVLabelAccessibility;
  return [(_TVLabelAccessibility *)&v6 _accessibilityExplorerElementReadPriority];
}

- (unint64_t)accessibilityTraits
{
  v7.receiver = self;
  v7.super_class = (Class)_TVLabelAccessibility;
  unint64_t v3 = [(_TVLabelAccessibility *)&v7 accessibilityTraits];
  char v4 = [(_TVLabelAccessibility *)self _accessibilityFindAncestor:&__block_literal_global_4 startWithSelf:0];

  uint64_t v5 = *MEMORY[0x263F1CEF8];
  if (!v4) {
    uint64_t v5 = 0;
  }
  return v5 | v3;
}

@end