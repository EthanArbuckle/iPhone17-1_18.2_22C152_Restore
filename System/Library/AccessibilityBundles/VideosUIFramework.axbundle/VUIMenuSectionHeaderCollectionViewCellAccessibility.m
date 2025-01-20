@interface VUIMenuSectionHeaderCollectionViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation VUIMenuSectionHeaderCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"VUIMenuSectionHeaderCollectionViewCell";
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
  v2 = [(VUIMenuSectionHeaderCollectionViewCellAccessibility *)self safeValueForKey:@"titleLabel"];
  v3 = [v2 accessibilityLabel];

  return v3;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)VUIMenuSectionHeaderCollectionViewCellAccessibility;
  return *MEMORY[0x263F1CEF8] | [(VUIMenuSectionHeaderCollectionViewCellAccessibility *)&v3 accessibilityTraits];
}

@end