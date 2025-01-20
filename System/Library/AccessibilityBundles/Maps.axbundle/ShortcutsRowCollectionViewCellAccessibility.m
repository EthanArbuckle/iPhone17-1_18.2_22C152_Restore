@interface ShortcutsRowCollectionViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
@end

@implementation ShortcutsRowCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"ShortcutsRowCollectionViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"ShortcutsRowCollectionViewCell" hasInstanceVariable:@"_titleLabel" withType:"UILabel"];
  [v3 validateClass:@"ShortcutsRowCollectionViewCell" hasInstanceVariable:@"_subtitleLabel" withType:"UILabel"];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CEE8];
}

- (id)accessibilityLabel
{
  v2 = [(ShortcutsRowCollectionViewCellAccessibility *)self safeValueForKey:@"_titleLabel"];
  id v3 = [v2 accessibilityLabel];

  return v3;
}

- (id)accessibilityValue
{
  v2 = [(ShortcutsRowCollectionViewCellAccessibility *)self safeValueForKey:@"_subtitleLabel"];
  id v3 = [v2 accessibilityLabel];

  return v3;
}

@end