@interface HUSceneTileCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (unint64_t)accessibilityTraits;
@end

@implementation HUSceneTileCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HUSceneTileCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"HUSceneTileCell" isKindOfClass:@"UICollectionViewCell"];
  [v3 validateClass:@"HUSceneTileCell" isKindOfClass:@"HUTileCell"];
}

- (unint64_t)accessibilityTraits
{
  v11.receiver = self;
  v11.super_class = (Class)HUSceneTileCellAccessibility;
  unint64_t v2 = [(HUSceneTileCellAccessibility *)&v11 accessibilityTraits];
  objc_opt_class();
  id v3 = __UIAccessibilityCastAsClass();
  v4 = [v3 configurationState];

  objc_opt_class();
  v5 = [v4 customStateForKey:@"com.apple.Home.isActive"];
  v6 = __UIAccessibilityCastAsClass();

  int v7 = [v6 BOOLValue];
  uint64_t v8 = *MEMORY[0x263F1CF38];
  if (!v7) {
    uint64_t v8 = 0;
  }
  unint64_t v9 = v8 | v2;

  return v9;
}

@end