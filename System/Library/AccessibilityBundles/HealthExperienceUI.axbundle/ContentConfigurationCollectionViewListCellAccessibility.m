@interface ContentConfigurationCollectionViewListCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (unint64_t)accessibilityTraits;
@end

@implementation ContentConfigurationCollectionViewListCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HealthExperienceUI.ContentConfigurationCollectionViewListCell";
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
  uint64_t v2 = *MEMORY[0x263F1CEE8];
  v3 = [(ContentConfigurationCollectionViewListCellAccessibility *)self safeValueForKey:@"userInteractionEnabled"];

  uint64_t v4 = *MEMORY[0x263F81390];
  if (v3) {
    uint64_t v4 = 0;
  }
  return v4 | v2;
}

@end