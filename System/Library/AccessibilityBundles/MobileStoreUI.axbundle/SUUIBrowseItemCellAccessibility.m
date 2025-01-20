@interface SUUIBrowseItemCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation SUUIBrowseItemCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SUUIBrowseItemCell";
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
  v2 = [(SUUIBrowseItemCellAccessibility *)self safeValueForKey:@"_titleLabel"];
  v3 = [v2 accessibilityLabel];

  return v3;
}

- (id)accessibilityHint
{
  if ([(SUUIBrowseItemCellAccessibility *)self isSelected]) {
    char v3 = 1;
  }
  else {
    char v3 = [(SUUIBrowseItemCellAccessibility *)self isHighlighted];
  }
  v4 = [(SUUIBrowseItemCellAccessibility *)self safeValueForKey:@"decorationImage"];
  v5 = [v4 accessibilityIdentifier];
  int v6 = [v5 isEqualToString:@"AppStoreBrowseCategoryDownChevron"];

  v7 = 0;
  if ((v3 & 1) == 0 && v6)
  {
    v7 = accessibilityLocalizedString(@"explore.category.expand");
  }

  return v7;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)SUUIBrowseItemCellAccessibility;
  return *MEMORY[0x263F1CEE8] | [(SUUIBrowseItemCellAccessibility *)&v3 accessibilityTraits];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

@end