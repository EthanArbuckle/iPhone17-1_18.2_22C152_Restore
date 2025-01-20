@interface GuidedSearchTokenPaletteViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityElements;
@end

@implementation GuidedSearchTokenPaletteViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"ASMessagesProvider.GuidedSearchTokenPaletteView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"ASMessagesProvider.GuidedSearchTokenPaletteView" hasSwiftField:@"tokens" withSwiftType:"Array<Token>"];
  [v3 validateClass:@"ASMessagesProvider.GuidedSearchTokenPaletteView" hasSwiftField:@"collectionView" withSwiftType:"Optional<UICollectionView>"];
}

- (id)accessibilityElements
{
  id v3 = [MEMORY[0x263EFF980] array];
  v4 = [(GuidedSearchTokenPaletteViewAccessibility *)self safeSwiftArrayForKey:@"tokens"];
  uint64_t v5 = [v4 count];
  objc_opt_class();
  v6 = [(GuidedSearchTokenPaletteViewAccessibility *)self safeSwiftValueForKey:@"collectionView"];
  v7 = __UIAccessibilityCastAsClass();

  if (v5)
  {
    for (uint64_t i = 0; i != v5; ++i)
    {
      v9 = [MEMORY[0x263F088C8] indexPathForRow:i inSection:0];
      v10 = [v7 cellForItemAtIndexPath:v9];

      [v3 axSafelyAddObject:v10];
    }
  }

  return v3;
}

@end