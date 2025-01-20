@interface SearchButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation SearchButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"Arcade.SearchButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)SearchButtonAccessibility;
  return *MEMORY[0x263F1CEE8] | [(SearchButtonAccessibility *)&v3 accessibilityTraits];
}

- (id)accessibilityLabel
{
  return accessibilityAppStoreLocalizedString(@"search.button");
}

@end