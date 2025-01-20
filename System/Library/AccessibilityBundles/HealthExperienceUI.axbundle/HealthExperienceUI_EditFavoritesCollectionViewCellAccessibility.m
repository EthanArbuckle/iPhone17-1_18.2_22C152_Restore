@interface HealthExperienceUI_EditFavoritesCollectionViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (unint64_t)accessibilityTraits;
@end

@implementation HealthExperienceUI_EditFavoritesCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HealthExperienceUI.EditFavoritesCollectionViewCell";
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
  v7.receiver = self;
  v7.super_class = (Class)HealthExperienceUI_EditFavoritesCollectionViewCellAccessibility;
  unint64_t v3 = *MEMORY[0x263F1CEE8] | [(HealthExperienceUI_EditFavoritesCollectionViewCellAccessibility *)&v7 accessibilityTraits];
  int v4 = [(HealthExperienceUI_EditFavoritesCollectionViewCellAccessibility *)self safeBoolForKey:@"axItemIsFavorited"];
  uint64_t v5 = *MEMORY[0x263F1CF38];
  if (!v4) {
    uint64_t v5 = 0;
  }
  return v3 | v5;
}

@end